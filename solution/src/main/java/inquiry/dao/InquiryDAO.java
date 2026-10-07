package inquiry.dao;

import common.db.DataSourceProvider;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.naming.NamingException;
import javax.sql.DataSource;
import inquiry.dto.InquiryDTO;
import inquiry.dto.InquiryFileDTO;

public class InquiryDAO {
    private final DataSource dataSource;

    public InquiryDAO() throws NamingException {
        dataSource = DataSourceProvider.getDataSource();
    }

    public long insertInquiry(InquiryDTO inquiry) throws SQLException {
        return insertInquiry(inquiry, new ArrayList<InquiryFileDTO>());
    }

    public long insertInquiry(InquiryDTO inquiry, List<InquiryFileDTO> files) throws SQLException {
        String sql = "INSERT INTO inquiry (member_id, contact_name, contact_email, company_name, category, title, content) "
             + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = dataSource.getConnection()) {
            boolean originalAutoCommit = connection.getAutoCommit();
            connection.setAutoCommit(false);
            try {
                long inquiryId;
                try (PreparedStatement statement = connection.prepareStatement(
                    sql, Statement.RETURN_GENERATED_KEYS)) {
                    if (inquiry.getMemberId() == null) {
                        statement.setNull(1, Types.BIGINT);
                    } else {
                        statement.setLong(1, inquiry.getMemberId().longValue());
                    }
                    statement.setString(2, inquiry.getContactName());
                    statement.setString(3, inquiry.getContactEmail());
                    statement.setString(4, inquiry.getCompanyName());
                    statement.setString(5, inquiry.getCategory());
                    statement.setString(6, inquiry.getTitle());
                    statement.setString(7, inquiry.getContent());
                    statement.executeUpdate();
                    try (ResultSet keys = statement.getGeneratedKeys()) {
                        if (!keys.next()) {
                            throw new SQLException("문의 등록 후 생성된 번호를 확인하지 못했습니다.");
                        }
                        inquiryId = keys.getLong(1);
                    }
                }
                insertInquiryFiles(connection, inquiryId, files);
                connection.commit();
                return inquiryId;
            } catch (SQLException error) {
                connection.rollback();
                throw error;
            } finally {
                // The connection is closed immediately after this block and returned to
                // the pool by the driver. Avoid turning a committed insert into an
                // apparent failure if restoring pooled connection state throws.
                try {
                    connection.setAutoCommit(originalAutoCommit);
                } catch (SQLException ignored) {
                    // Closing the connection lets the pool reset or discard it.
                }
            }
        }
    }

    private void insertInquiryFiles(Connection connection, long inquiryId,
        List<InquiryFileDTO> files) throws SQLException {
        if (files == null || files.isEmpty()) {
            return;
        }
        String sql = "INSERT INTO inquiry_file "
             + "(inquiry_id, original_name, saved_name, file_path, file_size, file_type) "
             + "VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            for (InquiryFileDTO file : files) {
                statement.setLong(1, inquiryId);
                statement.setString(2, file.getOriginalName());
                statement.setString(3, file.getSavedName());
                statement.setString(4, file.getFilePath());
                statement.setLong(5, file.getFileSize());
                statement.setString(6, file.getFileType());
                statement.addBatch();
            }
            statement.executeBatch();
        }
    }

    public List<InquiryFileDTO> findFilesByInquiryId(long inquiryId) throws SQLException {
        String sql = "SELECT f.file_id, f.inquiry_id, i.member_id, f.original_name, f.saved_name, "
             + "f.file_path, f.file_size, f.file_type "
             + "FROM inquiry_file f JOIN inquiry i ON i.inquiry_id=f.inquiry_id "
             + "WHERE f.inquiry_id=? AND f.is_deleted=FALSE AND i.is_deleted=FALSE ORDER BY f.file_id";
        List<InquiryFileDTO> files = new ArrayList<InquiryFileDTO>();
        try (Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, inquiryId);
            try (ResultSet result = statement.executeQuery()) {
                while (result.next()) {
                    files.add(mapInquiryFile(result));
                }
            }
        }
        return files;
    }

    public InquiryFileDTO findFile(long fileId) throws SQLException {
        String sql = "SELECT f.file_id, f.inquiry_id, i.member_id, f.original_name, f.saved_name, "
             + "f.file_path, f.file_size, f.file_type "
             + "FROM inquiry_file f JOIN inquiry i ON i.inquiry_id=f.inquiry_id "
             + "WHERE f.file_id=? AND f.is_deleted=FALSE AND i.is_deleted=FALSE";
        try (Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, fileId);
            try (ResultSet result = statement.executeQuery()) {
                return result.next() ? mapInquiryFile(result) : null;
            }
        }
    }

    private InquiryFileDTO mapInquiryFile(ResultSet result) throws SQLException {
        InquiryFileDTO file = new InquiryFileDTO();
        file.setFileId(result.getLong("file_id"));
        file.setInquiryId(result.getLong("inquiry_id"));
        long memberId = result.getLong("member_id");
        if (!result.wasNull()) {
            file.setMemberId(Long.valueOf(memberId));
        }
        file.setOriginalName(result.getString("original_name"));
        file.setSavedName(result.getString("saved_name"));
        file.setFilePath(result.getString("file_path"));
        file.setFileSize(result.getLong("file_size"));
        file.setFileType(result.getString("file_type"));
        return file;
    }

    public List<InquiryDTO> findAllInquiries() throws SQLException {
        String sql = "SELECT inquiry_id, member_id, assigned_admin_id, contact_name, contact_email, company_name, "
             + "category, title, content, status, admin_answer, created_at, updated_at, answered_at "
             + "FROM inquiry WHERE is_deleted = FALSE ORDER BY created_at DESC, inquiry_id DESC";
        List<InquiryDTO> inquiries = new ArrayList<InquiryDTO>();
        try (Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet result = statement.executeQuery()) {
            while (result.next()) {
                inquiries.add(mapInquiry(result));
            }
        }
        return inquiries;
    }

    public List<InquiryDTO> findRecentInquiries(int limit) throws SQLException {
        String sql = "SELECT inquiry_id, member_id, assigned_admin_id, contact_name, contact_email, company_name, "
             + "category, title, content, status, admin_answer, created_at, updated_at, answered_at "
             + "FROM inquiry WHERE is_deleted = FALSE ORDER BY created_at DESC, inquiry_id DESC LIMIT ?";
        List<InquiryDTO> inquiries = new ArrayList<InquiryDTO>();
        try (Connection connection = dataSource.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, limit);
            try (ResultSet result = statement.executeQuery()) {
                while (result.next()) {
                    inquiries.add(mapInquiry(result));
                }
            }
        }
        return inquiries;
    }

    public List<InquiryDTO> findRecentInquirySummaries(int limit) throws SQLException {
        String sql = "SELECT inquiry_id, contact_name, title, status, created_at FROM inquiry "
             + "WHERE is_deleted=FALSE ORDER BY created_at DESC,inquiry_id DESC LIMIT ?";
        List<InquiryDTO> rows = new ArrayList<InquiryDTO>();
        try (Connection connection = dataSource.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, Math.max(1, limit));
            try (ResultSet result = statement.executeQuery()) {
                while (result.next()) {
                    InquiryDTO item = new InquiryDTO();
                    item.setInquiryId(result.getLong("inquiry_id"));
                    item.setContactName(result.getString("contact_name"));
                    item.setTitle(result.getString("title"));
                    item.setStatus(result.getString("status"));
                    item.setCreatedAt(result.getTimestamp("created_at"));
                    rows.add(item);
                }
            }
        }
        return rows;
    }

    public Map<String, Integer> countDashboardStatuses() throws SQLException {
        Map<String, Integer> counts = new LinkedHashMap<String, Integer>();
        String sql = "SELECT status,COUNT(*) AS status_count FROM inquiry WHERE is_deleted=FALSE GROUP BY status";
        try (Connection connection = dataSource.getConnection(); PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet result = statement.executeQuery()) {
            while (result.next()) {
                counts.put(result.getString("status"), Integer.valueOf(result.getInt("status_count")));
            }
        }
        return counts;
    }

    public int countByStatus(String status) throws SQLException {
        String sql = "SELECT COUNT(*) FROM inquiry WHERE is_deleted = FALSE AND status = ?";
        try (Connection connection = dataSource.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, status);
            try (ResultSet result = statement.executeQuery()) {
                result.next();
                return result.getInt(1);
            }
        }
    }

    public int countByMemberId(long memberId) throws SQLException {

        String sql = "SELECT COUNT(*) FROM inquiry "
             + "WHERE member_id = ? "
             + "AND is_deleted = FALSE";

        try (Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setLong(1, memberId);

            try (ResultSet result = statement.executeQuery()) {

                if (result.next()) {
                    return result.getInt(1);
                }
            }
        }

        return 0;
    }
    // === countByMemberId Method

    public int countCompletedByMemberId(long memberId) throws SQLException {

        String sql = "SELECT COUNT(*) FROM inquiry "
             + "WHERE member_id = ? "
             + "AND status = 'COMPLETED' "
             + "AND is_deleted = FALSE";

        try (Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setLong(1, memberId);

            try (ResultSet result = statement.executeQuery()) {

                if (result.next()) {
                    return result.getInt(1);
                }
            }
        }

        return 0;
    }
    // === countCompletedByMemberId

    public int countInProgressByMemberId(long memberId) throws SQLException {

        String sql = "SELECT COUNT(*) FROM inquiry "
             + "WHERE member_id = ? "
             + "AND status = 'IN_PROGRESS' "
             + "AND is_deleted = FALSE";

        try (Connection connection = dataSource.getConnection();
        PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setLong(1, memberId);

            try (ResultSet result = statement.executeQuery()) {

                if (result.next()) {

                    return result.getInt(1);
                }
            }
        }

        return 0;
    }
    // === countInProgressByMemberId

    public List<InquiryDTO> findInquiriesByMember(long memberId) throws SQLException {
        String sql = "SELECT inquiry_id, member_id, assigned_admin_id, contact_name, contact_email, company_name, "
             + "category, title, content, status, admin_answer, created_at, updated_at, answered_at "
             + "FROM inquiry WHERE is_deleted = FALSE AND member_id = ? ORDER BY created_at DESC, inquiry_id DESC";
        List<InquiryDTO> inquiries = new ArrayList<InquiryDTO>();
        try (Connection connection = dataSource.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, memberId);
            try (ResultSet result = statement.executeQuery()) {
                while (result.next()) {
                    inquiries.add(mapInquiry(result));
                }
            }
        }
        return inquiries;
    }

    public InquiryDTO findInquiryById(long inquiryId) throws SQLException {
        String sql = "SELECT inquiry_id, member_id, assigned_admin_id, contact_name, contact_email, company_name, "
             + "category, title, content, status, admin_answer, created_at, updated_at, answered_at "
             + "FROM inquiry WHERE inquiry_id = ? AND is_deleted = FALSE";
        try (Connection connection = dataSource.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, inquiryId);
            try (ResultSet result = statement.executeQuery()) {
                return result.next() ? mapInquiry(result) : null;
            }
        }
    }

    public boolean updateAnswer(long inquiryId, long adminId, String answer, String status) throws SQLException {
        String sql = "UPDATE inquiry SET assigned_admin_id = ?, admin_answer = ?, status = ?, "
             + "answered_at = CASE WHEN ? = 'COMPLETED' THEN CURRENT_TIMESTAMP ELSE NULL END "
             + "WHERE inquiry_id = ? AND is_deleted = FALSE";
        try (Connection connection = dataSource.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, adminId);
            statement.setString(2, answer);
            statement.setString(3, status);
            statement.setString(4, status);
            statement.setLong(5, inquiryId);
            return statement.executeUpdate() == 1;
        }
    }

    private InquiryDTO mapInquiry(ResultSet result) throws SQLException {
        InquiryDTO inquiry = new InquiryDTO();
        inquiry.setInquiryId(result.getLong("inquiry_id"));
        long memberId = result.getLong("member_id");
        inquiry.setMemberId(result.wasNull() ? null : Long.valueOf(memberId));
        long adminId = result.getLong("assigned_admin_id");
        inquiry.setAssignedAdminId(result.wasNull() ? null : Long.valueOf(adminId));
        inquiry.setContactName(result.getString("contact_name"));
        inquiry.setContactEmail(result.getString("contact_email"));
        inquiry.setCompanyName(result.getString("company_name"));
        inquiry.setCategory(result.getString("category"));
        inquiry.setTitle(result.getString("title"));
        inquiry.setContent(result.getString("content"));
        inquiry.setStatus(result.getString("status"));
        inquiry.setAdminAnswer(result.getString("admin_answer"));
        inquiry.setCreatedAt(result.getTimestamp("created_at"));
        inquiry.setUpdatedAt(result.getTimestamp("updated_at"));
        inquiry.setAnsweredAt(result.getTimestamp("answered_at"));
        return inquiry;
    }
}
