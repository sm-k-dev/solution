package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import javax.sql.DataSource;
import admin.dto.AdminMemberDTO;
import common.db.DataSourceProvider;

public class AdminMemberDAO {
    private final DataSource dataSource;

    public AdminMemberDAO() throws NamingException {
        dataSource = DataSourceProvider.get();
    }

    public List<AdminMemberDTO> findPage(String q, String status, int offset, int limit) throws Exception {
        String sql = "SELECT member_id,login_id,name,email,phone,role,status,created_at FROM member WHERE (?='' OR login_id LIKE ? OR name LIKE ? OR email LIKE ?) AND (?='ALL' OR status=?) ORDER BY created_at DESC,member_id DESC LIMIT ? OFFSET ?";
        List<AdminMemberDTO> rows = new ArrayList<AdminMemberDTO>();
        String term = q == null?"":q.trim(), like = "%" + term + "%";
        try (Connection c = dataSource.getConnection();PreparedStatement p = c.prepareStatement(sql)) {
            p.setString(1, term);
            p.setString(2, like);
            p.setString(3, like);
            p.setString(4, like);
            p.setString(5, status);
            p.setString(6, status);
            p.setInt(7, limit);
            p.setInt(8, offset);
            try (ResultSet r = p.executeQuery()) {
                while (r.next()) {
                    AdminMemberDTO m = new AdminMemberDTO();
                    m.setMemberId(r.getLong("member_id"));
                    m.setLoginId(r.getString("login_id"));
                    m.setName(r.getString("name"));
                    m.setEmail(r.getString("email"));
                    m.setPhone(r.getString("phone"));
                    m.setRole(r.getString("role"));
                    m.setStatus(r.getString("status"));
                    m.setCreatedAt(r.getTimestamp("created_at"));
                    rows.add(m);
                }
            }
        }
        return rows;
    }

    public int count(String q, String status) throws Exception {
        String sql = "SELECT COUNT(*) FROM member WHERE (?='' OR login_id LIKE ? OR name LIKE ? OR email LIKE ?) AND (?='ALL' OR status=?)";
        String term = q == null?"":q.trim(), like = "%" + term + "%";
        try (Connection c = dataSource.getConnection();PreparedStatement p = c.prepareStatement(sql)) {
            p.setString(1, term);
            p.setString(2, like);
            p.setString(3, like);
            p.setString(4, like);
            p.setString(5, status);
            p.setString(6, status);
            try (ResultSet r = p.executeQuery()) {
                r.next();
                return r.getInt(1);
            }
        }
    }

    public int countByStatus(String status) throws Exception {
        try (Connection c = dataSource.getConnection();PreparedStatement p = c.prepareStatement("SELECT COUNT(*) FROM member WHERE status=?")) {
            p.setString(1, status);
            try (ResultSet r = p.executeQuery()) {
                r.next();
                return r.getInt(1);
            }
        }
    }

    public int countByRole(String role) throws Exception {
        try (Connection c = dataSource.getConnection();PreparedStatement p = c.prepareStatement("SELECT COUNT(*) FROM member WHERE role=? AND status='ACTIVE'")) {
            p.setString(1, role);
            try (ResultSet r = p.executeQuery()) {
                r.next();
                return r.getInt(1);
            }
        }
    }

    public int countAll() throws Exception {
        try (Connection c = dataSource.getConnection();PreparedStatement p = c.prepareStatement("SELECT COUNT(*) FROM member");ResultSet r = p.executeQuery()) {
            r.next();
            return r.getInt(1);
        }
    }

    public AdminMemberDTO findById(long memberId) throws Exception {
        String sql = "SELECT m.member_id,m.login_id,m.name,m.email,m.phone,m.postcode,m.address,m.address_detail,m.role,m.status,m.created_at,m.updated_at,m.withdrawn_at," +
        "(SELECT COUNT(*) FROM board b WHERE b.member_id=m.member_id AND b.is_deleted=FALSE) board_count," +
        "(SELECT COUNT(*) FROM board_comment c WHERE c.member_id=m.member_id AND c.is_deleted=FALSE) comment_count," +
        "(SELECT COUNT(*) FROM inquiry i WHERE i.member_id=m.member_id AND i.is_deleted=FALSE) inquiry_count " +
        "FROM member m WHERE m.member_id=?";
        try (Connection c = dataSource.getConnection();PreparedStatement p = c.prepareStatement(sql)) {
            p.setLong(1, memberId);
            try (ResultSet r = p.executeQuery()) {
                if (!r.next()) {
                    return null;
                }
                AdminMemberDTO m = map(r);
                m.setPostcode(r.getString("postcode"));
                m.setAddress(r.getString("address"));
                m.setAddressDetail(r.getString("address_detail"));
                m.setUpdatedAt(r.getTimestamp("updated_at"));
                m.setWithdrawnAt(r.getTimestamp("withdrawn_at"));
                m.setBoardCount(r.getInt("board_count"));
                m.setCommentCount(r.getInt("comment_count"));
                m.setInquiryCount(r.getInt("inquiry_count"));
                return m;
            }
        }
    }

    public boolean updateUserStatus(long memberId, String status) throws Exception {
        if (!"ACTIVE".equals(status) && !"SUSPENDED".equals(status)) {
            return false;
        }
        try (Connection c = dataSource.getConnection();PreparedStatement p = c.prepareStatement("UPDATE member SET status=? WHERE member_id=? AND role='USER' AND status IN ('ACTIVE','SUSPENDED')")) {
            p.setString(1, status);
            p.setLong(2, memberId);
            return p.executeUpdate() == 1;
        }
    }

    public boolean updateRole(long memberId, String role) throws Exception {
        if (!"USER".equals(role) && !"ADMIN".equals(role)) {
            return false;
        }
        try (Connection c = dataSource.getConnection()) {
            c.setAutoCommit(false);
            try {
                if ("USER".equals(role)) {
                    int activeAdmins = 0;
                    try (PreparedStatement count = c.prepareStatement("SELECT member_id FROM member WHERE role='ADMIN' AND status='ACTIVE' FOR UPDATE");ResultSet r = count.executeQuery()) {
                        while (r.next()) {
                            activeAdmins++;
                        }
                        if (activeAdmins <= 1) {
                            c.rollback();
                            return false;
                        }
                    }
                }
                try (PreparedStatement p = c.prepareStatement("UPDATE member SET role=? WHERE member_id=? AND status='ACTIVE' AND role<>?")) {
                    p.setString(1, role);
                    p.setLong(2, memberId);
                    p.setString(3, role);
                    boolean updated = p.executeUpdate() == 1;
                    if (updated) {
                        c.commit();
                    } else c.rollback();
                    return updated;
                }
            } catch (Exception e) {
                c.rollback();
                throw e;
            } finally {
                try {
                    c.setAutoCommit(true);
                } catch (SQLException ignored) {
                }
            }
        }
    }

    private AdminMemberDTO map(ResultSet r) throws SQLException {
        AdminMemberDTO m = new AdminMemberDTO();
        m.setMemberId(r.getLong("member_id"));
        m.setLoginId(r.getString("login_id"));
        m.setName(r.getString("name"));
        m.setEmail(r.getString("email"));
        m.setPhone(r.getString("phone"));
        m.setRole(r.getString("role"));
        m.setStatus(r.getString("status"));
        m.setCreatedAt(r.getTimestamp("created_at"));
        return m;
    }
}
