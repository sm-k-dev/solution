package inquiry.dao;

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
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import inquiry.dto.InquiryDTO;

public class InquiryDAO {
    private final DataSource dataSource;

    public InquiryDAO() throws NamingException {
        Context initialContext = new InitialContext();
        Context environmentContext = (Context) initialContext.lookup("java:/comp/env");
        dataSource = (DataSource) environmentContext.lookup("jdbc/jspdb");
    }

    public long insertInquiry(InquiryDTO inquiry) throws SQLException {
        String sql = "INSERT INTO inquiry (member_id, contact_name, contact_email, company_name, category, title, content) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            if (inquiry.getMemberId() == null) statement.setNull(1, Types.BIGINT);
            else statement.setLong(1, inquiry.getMemberId());
            statement.setString(2, inquiry.getContactName());
            statement.setString(3, inquiry.getContactEmail());
            statement.setString(4, inquiry.getCompanyName());
            statement.setString(5, inquiry.getCategory());
            statement.setString(6, inquiry.getTitle());
            statement.setString(7, inquiry.getContent());
            statement.executeUpdate();
            try (ResultSet keys = statement.getGeneratedKeys()) {
                if (keys.next()) return keys.getLong(1);
            }
        }
        throw new SQLException("문의 등록 후 생성된 번호를 확인하지 못했습니다.");
    }

    public List<InquiryDTO> findAllInquiries() throws SQLException {
        String sql = "SELECT inquiry_id, member_id, assigned_admin_id, contact_name, contact_email, company_name, "
                + "category, title, content, status, admin_answer, created_at, updated_at, answered_at "
                + "FROM inquiry WHERE is_deleted = FALSE ORDER BY created_at DESC, inquiry_id DESC";
        List<InquiryDTO> inquiries = new ArrayList<InquiryDTO>();
        try (Connection connection = dataSource.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet result = statement.executeQuery()) {
            while (result.next()) inquiries.add(mapInquiry(result));
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
                while (result.next()) inquiries.add(mapInquiry(result));
            }
        }
        return inquiries;
    }

    public List<InquiryDTO> findRecentInquirySummaries(int limit) throws SQLException {
        String sql = "SELECT inquiry_id, contact_name, title, status, created_at FROM inquiry "
                + "WHERE is_deleted=FALSE ORDER BY created_at DESC,inquiry_id DESC LIMIT ?";
        List<InquiryDTO> rows = new ArrayList<InquiryDTO>();
        try (Connection connection=dataSource.getConnection(); PreparedStatement statement=connection.prepareStatement(sql)) {
            statement.setInt(1, Math.max(1, limit));
            try (ResultSet result=statement.executeQuery()) {
                while (result.next()) {
                    InquiryDTO item = new InquiryDTO();
                    item.setInquiryId(result.getLong("inquiry_id")); item.setContactName(result.getString("contact_name"));
                    item.setTitle(result.getString("title")); item.setStatus(result.getString("status"));
                    item.setCreatedAt(result.getTimestamp("created_at")); rows.add(item);
                }
            }
        }
        return rows;
    }

    public Map<String, Integer> countDashboardStatuses() throws SQLException {
        Map<String, Integer> counts = new LinkedHashMap<String, Integer>();
        String sql = "SELECT status,COUNT(*) AS status_count FROM inquiry WHERE is_deleted=FALSE GROUP BY status";
        try (Connection connection=dataSource.getConnection(); PreparedStatement statement=connection.prepareStatement(sql);
             ResultSet result=statement.executeQuery()) {
            while (result.next()) counts.put(result.getString("status"), Integer.valueOf(result.getInt("status_count")));
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

    public List<InquiryDTO> findInquiriesByMember(long memberId) throws SQLException {
        String sql = "SELECT inquiry_id, member_id, assigned_admin_id, contact_name, contact_email, company_name, "
                + "category, title, content, status, admin_answer, created_at, updated_at, answered_at "
                + "FROM inquiry WHERE is_deleted = FALSE AND member_id = ? ORDER BY created_at DESC, inquiry_id DESC";
        List<InquiryDTO> inquiries = new ArrayList<InquiryDTO>();
        try (Connection connection = dataSource.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, memberId);
            try (ResultSet result = statement.executeQuery()) {
                while (result.next()) inquiries.add(mapInquiry(result));
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
