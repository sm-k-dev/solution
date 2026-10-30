package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.naming.NamingException;
import javax.sql.DataSource;
import common.db.DataSourceProvider;

/**
 * 보유 기간이 끝난 탈퇴 회원과 회원이 작성한 데이터를 한 트랜잭션으로 정리합니다.
 */
public class WithdrawnMemberCleanupDAO {

    private static final int BATCH_SIZE = 100;
    private final DataSource dataSource;

    public WithdrawnMemberCleanupDAO() throws NamingException {
        dataSource = DataSourceProvider.get();
    }

    public CleanupResult purgeBatch(Timestamp cutoff) throws SQLException {
        try (Connection connection = dataSource.getConnection()) {
            connection.setAutoCommit(false);
            try {
                List<Long> memberIds = lockCleanupTargets(connection, cutoff);
                if (memberIds.isEmpty()) {
                    connection.commit();
                    return CleanupResult.empty();
                }

                List<String> boardFiles = new ArrayList<String>();
                List<String> inquiryFiles = new ArrayList<String>();

                for (Long memberId : memberIds) {
                    long id = memberId.longValue();
                    boardFiles.addAll(findBoardFileNames(connection, id));
                    inquiryFiles.addAll(findInquiryFileNames(connection, id));
                    purgeMemberData(connection, id);
                }

                connection.commit();
                return new CleanupResult(memberIds.size(), boardFiles, inquiryFiles);
            } catch (SQLException error) {
                connection.rollback();
                throw error;
            } finally {
                try {
                    connection.setAutoCommit(true);
                } catch (SQLException ignored) {
                    // 연결 반환 과정에서 원래 예외를 가리지 않습니다.
                }
            }
        }
    }

    private List<Long> lockCleanupTargets(Connection connection, Timestamp cutoff) throws SQLException {
        String sql = "SELECT member_id FROM member "
             + "WHERE status = 'WITHDRAWN' AND withdrawn_at IS NOT NULL AND withdrawn_at <= ? "
             + "ORDER BY withdrawn_at, member_id LIMIT ? FOR UPDATE SKIP LOCKED";
        List<Long> memberIds = new ArrayList<Long>();

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setTimestamp(1, cutoff);
            statement.setInt(2, BATCH_SIZE);
            try (ResultSet result = statement.executeQuery()) {
                while (result.next()) {
                    memberIds.add(Long.valueOf(result.getLong("member_id")));
                }
            }
        }
        return memberIds;
    }

    private List<String> findBoardFileNames(Connection connection, long memberId) throws SQLException {
        String sql = "SELECT bf.saved_name FROM board_file bf "
             + "JOIN board b ON b.board_id = bf.board_id WHERE b.member_id = ?";
        return findFileNames(connection, sql, memberId);
    }

    private List<String> findInquiryFileNames(Connection connection, long memberId) throws SQLException {
        String sql = "SELECT f.saved_name FROM inquiry_file f "
             + "JOIN inquiry i ON i.inquiry_id = f.inquiry_id WHERE i.member_id = ?";
        return findFileNames(connection, sql, memberId);
    }

    private List<String> findFileNames(Connection connection, String sql, long memberId) throws SQLException {
        List<String> names = new ArrayList<String>();
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, memberId);
            try (ResultSet result = statement.executeQuery()) {
                while (result.next()) {
                    String savedName = result.getString("saved_name");
                    if (savedName != null && !savedName.trim().isEmpty()) {
                        names.add(savedName);
                    }
                }
            }
        }
        return names;
    }

    private void purgeMemberData(Connection connection, long memberId) throws SQLException {
        // 다른 회원의 답글은 보존하되 삭제될 부모 댓글과의 연결만 해제합니다.
        execute(connection,
            "UPDATE board_comment child JOIN board_comment parent "
             + "ON child.parent_comment_id = parent.comment_id "
             + "SET child.parent_comment_id = NULL WHERE parent.member_id = ?",
            memberId);

        // 삭제될 게시글 내부의 자기참조를 먼저 해제해야 FK 제약 없이 댓글을 지울 수 있습니다.
        execute(connection,
            "UPDATE board_comment c JOIN board b ON b.board_id = c.board_id "
             + "SET c.parent_comment_id = NULL "
             + "WHERE b.member_id = ? AND c.parent_comment_id IS NOT NULL",
            memberId);

        execute(connection,
            "DELETE bf FROM board_file bf JOIN board b ON b.board_id = bf.board_id "
             + "WHERE b.member_id = ?",
            memberId);
        execute(connection,
            "DELETE c FROM board_comment c JOIN board b ON b.board_id = c.board_id "
             + "WHERE b.member_id = ?",
            memberId);
        execute(connection, "DELETE FROM board_comment WHERE member_id = ?", memberId);
        execute(connection, "DELETE FROM board WHERE member_id = ?", memberId);

        // 회원이 접수한 문의와 첨부파일도 개인정보 보유 기간 종료에 맞춰 제거합니다.
        execute(connection,
            "DELETE ii FROM incident_inquiry ii JOIN inquiry i ON i.inquiry_id = ii.inquiry_id "
             + "WHERE i.member_id = ?",
            memberId);
        execute(connection,
            "DELETE f FROM inquiry_file f JOIN inquiry i ON i.inquiry_id = f.inquiry_id "
             + "WHERE i.member_id = ?",
            memberId);
        execute(connection, "DELETE FROM inquiry WHERE member_id = ?", memberId);

        // 운영·보안 감사 데이터는 보존하되 삭제 회원을 식별할 수 없도록 연결만 제거합니다.
        execute(connection, "UPDATE inquiry SET assigned_admin_id = NULL WHERE assigned_admin_id = ?", memberId);
        execute(connection, "UPDATE incident SET member_id = NULL WHERE member_id = ?", memberId);
        execute(connection, "UPDATE incident_history SET changed_by = NULL WHERE changed_by = ?", memberId);
        execute(connection, "UPDATE incident_inquiry SET linked_by = NULL WHERE linked_by = ?", memberId);
        execute(connection, "UPDATE security_event_history SET changed_by = NULL WHERE changed_by = ?", memberId);

        int deleted = execute(connection,
            "DELETE FROM member WHERE member_id = ? AND status = 'WITHDRAWN'",
            memberId);
        if (deleted != 1) {
            throw new SQLException("탈퇴 회원 삭제 대상이 변경되었습니다. memberId="  + memberId);
        }
    }

    private int execute(Connection connection, String sql, long memberId) throws SQLException {
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, memberId);
            return statement.executeUpdate();
        }
    }

    public static final class CleanupResult {
        private final int deletedMemberCount;
        private final List<String> boardFileNames;
        private final List<String> inquiryFileNames;

        private CleanupResult(int deletedMemberCount, List<String> boardFileNames,
            List<String> inquiryFileNames) {
            this.deletedMemberCount = deletedMemberCount;
            this.boardFileNames = Collections.unmodifiableList(new ArrayList<String>(boardFileNames));
            this.inquiryFileNames = Collections.unmodifiableList(new ArrayList<String>(inquiryFileNames));
        }

        public static CleanupResult empty() {
            return new CleanupResult(0, Collections.<String>emptyList(),
                Collections.<String>emptyList());
        }

        public int getDeletedMemberCount() {
            return deletedMemberCount;
        }

        public List<String> getBoardFileNames() {
            return boardFileNames;
        }

        public List<String> getInquiryFileNames() {
            return inquiryFileNames;
        }
    }
}
