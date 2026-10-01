package sentinel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import sentinel.dto.IncidentInquiry;

public class IncidentInquiryDAO {
    private DataSource source() throws NamingException {
        return (DataSource) new InitialContext().lookup("java:comp/env/jdbc/jspdb");
    }

    public List<IncidentInquiry> findLinkedInquiryList(long incidentId)
            throws SQLException, NamingException {
        String sql = "SELECT q.inquiry_id, q.title, q.status, x.link_reason, x.linked_by, x.linked_at " +
            "FROM incident_inquiry x JOIN inquiry q ON q.inquiry_id = x.inquiry_id " +
            "WHERE x.incident_id = ? AND x.is_deleted = 0 AND q.is_deleted = 0 " +
            "ORDER BY x.linked_at DESC, x.incident_inquiry_id DESC";
        List<IncidentInquiry> result = new ArrayList<>();
        try (Connection connection = source().getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, incidentId);
            try (ResultSet rows = statement.executeQuery()) {
                while (rows.next()) {
                    IncidentInquiry item = new IncidentInquiry();
                    item.setInquiryId(rows.getLong("inquiry_id"));
                    item.setTitle(rows.getString("title"));
                    item.setStatus(rows.getString("status"));
                    item.setLinkReason(rows.getString("link_reason"));
                    long actor = rows.getLong("linked_by");
                    item.setLinkedBy(rows.wasNull() ? null : actor);
                    item.setLinkedAt(rows.getTimestamp("linked_at"));
                    result.add(item);
                }
            }
        }
        return result;
    }

    // 1: linked; 0: incident/inquiry missing; -1: already linked.
    public int insertIncidentInquiry(long incidentId, long inquiryId, long actor, String reason)
            throws SQLException, NamingException {
        try (Connection connection = source().getConnection()) {
            connection.setAutoCommit(false);
            try {
                if (!lockActiveRow(connection, "incident", "incident_id", incidentId) ||
                    !lockActiveRow(connection, "inquiry", "inquiry_id", inquiryId)) {
                    connection.rollback(); return 0;
                }
                Boolean deleted = null;
                try (PreparedStatement statement = connection.prepareStatement(
                    "SELECT is_deleted FROM incident_inquiry WHERE incident_id = ? AND inquiry_id = ? FOR UPDATE")) {
                    statement.setLong(1, incidentId);
                    statement.setLong(2, inquiryId);
                    try (ResultSet rows = statement.executeQuery()) {
                        if (rows.next()) deleted = rows.getBoolean(1);
                    }
                }
                if (Boolean.FALSE.equals(deleted)) { connection.rollback(); return -1; }
                if (Boolean.TRUE.equals(deleted)) {
                    try (PreparedStatement statement = connection.prepareStatement(
                        "UPDATE incident_inquiry SET is_deleted = 0, deleted_at = NULL, " +
                        "linked_by = ?, link_reason = ?, linked_at = CURRENT_TIMESTAMP " +
                        "WHERE incident_id = ? AND inquiry_id = ? AND is_deleted = 1")) {
                        statement.setLong(1, actor);
                        statement.setString(2, reason);
                        statement.setLong(3, incidentId);
                        statement.setLong(4, inquiryId);
                        statement.executeUpdate();
                    }
                } else {
                    try (PreparedStatement statement = connection.prepareStatement(
                        "INSERT INTO incident_inquiry (incident_id, inquiry_id, linked_by, link_reason) " +
                        "VALUES (?, ?, ?, ?)")) {
                        statement.setLong(1, incidentId);
                        statement.setLong(2, inquiryId);
                        statement.setLong(3, actor);
                        statement.setString(4, reason);
                        statement.executeUpdate();
                    }
                }
                connection.commit();
                return 1;
            } catch (SQLException | RuntimeException error) {
                connection.rollback();
                throw error;
            }
        }
    }

    public boolean softDeleteIncidentInquiry(long incidentId, long inquiryId)
            throws SQLException, NamingException {
        String sql = "UPDATE incident_inquiry SET is_deleted = 1, deleted_at = CURRENT_TIMESTAMP " +
            "WHERE incident_id = ? AND inquiry_id = ? AND is_deleted = 0";
        try (Connection connection = source().getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, incidentId);
            statement.setLong(2, inquiryId);
            return statement.executeUpdate() == 1;
        }
    }

    private boolean lockActiveRow(Connection connection, String table, String key, long id)
            throws SQLException {
        String sql = "SELECT 1 FROM " + table + " WHERE " + key + " = ? AND is_deleted = 0 FOR UPDATE";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, id);
            try (ResultSet rows = statement.executeQuery()) { return rows.next(); }
        }
    }
}
