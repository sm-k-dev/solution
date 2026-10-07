package security.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
import security.dto.SecurityEvent;
import security.dto.SecurityEventHistory;

public class SecurityEventDAO {
    public long insertOrIncrement(SecurityEvent event, String fingerprint, long timeBucket)
    throws SQLException, NamingException {
        SecuritySchema.ensure();
        String sql = "INSERT INTO security_event "    +
        "(category,threat_type,severity,detection_source,rule_code,evidence_excerpt,"    +
        "request_uri,http_method,source_ip_hash,event_fingerprint,time_bucket) "    +
        "VALUES (?,?,?,?,?,?,?,?,?,?,?) ON DUPLICATE KEY UPDATE "    +
        "occurrence_count=occurrence_count+1,last_seen_at=CURRENT_TIMESTAMP,"    +
        "security_event_id=LAST_INSERT_ID(security_event_id)";
        try (Connection connection = SecuritySchema.source().getConnection();
        PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, limit(event.getCategory(), 20));
            statement.setString(2, limit(event.getThreatType(), 60));
            statement.setString(3, limit(event.getSeverity(), 20));
            statement.setString(4, limit(event.getDetectionSource(), 60));
            statement.setString(5, limit(event.getRuleCode(), 80));
            statement.setString(6, limit(event.getEvidenceExcerpt(), 500));
            statement.setString(7, limit(event.getRequestUri(), 500));
            statement.setString(8, limit(event.getHttpMethod(), 10));
            statement.setString(9, limit(event.getSourceIpHash(), 64));
            statement.setString(10, fingerprint);
            statement.setLong(11, timeBucket);
            statement.executeUpdate();
            try (ResultSet keys = statement.getGeneratedKeys()) {
                if (!keys.next()) {
                    throw new SQLException("Security event ID was not generated");
                }
                return keys.getLong(1);
            }
        }
    }

    public List<SecurityEvent> findRecentEvents() throws SQLException, NamingException {
        SecuritySchema.ensure();
        String sql = "SELECT security_event_id,category,threat_type,severity,status,detection_source,"    +
        "rule_code,evidence_excerpt,request_uri,http_method,source_ip_hash,occurrence_count,"    +
        "first_seen_at,last_seen_at FROM security_event WHERE is_deleted=0 "    +
        "ORDER BY last_seen_at DESC,security_event_id DESC LIMIT 100";
        List<SecurityEvent> result = new ArrayList<SecurityEvent>();
        try (Connection connection = SecuritySchema.source().getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet rows = statement.executeQuery()) {
            while (rows.next()) {
                result.add(readEvent(rows));
            }
        }
        return result;
    }

    public SecurityEvent findById(long id) throws SQLException, NamingException {
        SecuritySchema.ensure();
        String sql = "SELECT security_event_id,category,threat_type,severity,status,detection_source,"    +
        "rule_code,evidence_excerpt,request_uri,http_method,source_ip_hash,occurrence_count,"    +
        "first_seen_at,last_seen_at FROM security_event "    +
        "WHERE security_event_id=? AND is_deleted=0";
        try (Connection connection = SecuritySchema.source().getConnection();
        PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, id);
            try (ResultSet rows = statement.executeQuery()) {
                return rows.next() ? readEvent(rows) : null;
            }
        }
    }

    public List<SecurityEventHistory> findHistory(long id) throws SQLException, NamingException {
        SecuritySchema.ensure();
        String sql = "SELECT previous_status,new_status,changed_by,changed_at "    +
        "FROM security_event_history WHERE security_event_id=? ORDER BY history_id DESC";
        List<SecurityEventHistory> result = new ArrayList<SecurityEventHistory>();
        try (Connection connection = SecuritySchema.source().getConnection();
        PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, id);
            try (ResultSet rows = statement.executeQuery()) {
                while (rows.next()) {
                    SecurityEventHistory item = new SecurityEventHistory();
                    item.setPreviousStatus(rows.getString("previous_status"));
                    item.setNewStatus(rows.getString("new_status"));
                    long actor = rows.getLong("changed_by");
                    item.setChangedBy(rows.wasNull() ? null : Long.valueOf(actor));
                    item.setChangedAt(rows.getTimestamp("changed_at"));
                    result.add(item);
                }
            }
        }
        return result;
    }

    public boolean updateStatus(long id, long actor, String expected, String next)
    throws SQLException, NamingException {
        SecuritySchema.ensure();
        try (Connection connection = SecuritySchema.source().getConnection()) {
            connection.setAutoCommit(false);
            try {
                int updated;
                String sql = "UPDATE security_event SET status=?,"    +
                "acknowledged_at=CASE WHEN ?='ACKNOWLEDGED' THEN CURRENT_TIMESTAMP ELSE acknowledged_at END,"    +
                "resolved_at=CASE WHEN ?='RESOLVED' THEN CURRENT_TIMESTAMP ELSE resolved_at END "    +
                "WHERE security_event_id=? AND status=? AND is_deleted=0";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, next);
                    statement.setString(2, next);
                    statement.setString(3, next);
                    statement.setLong(4, id);
                    statement.setString(5, expected);
                    updated = statement.executeUpdate();
                }
                if (updated != 1) {
                    connection.rollback();
                    return false;
                }
                try (PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO security_event_history "    +
                "(security_event_id,changed_by,previous_status,new_status) VALUES (?,?,?,?)")) {
                    statement.setLong(1, id);
                    statement.setLong(2, actor);
                    statement.setString(3, expected);
                    statement.setString(4, next);
                    statement.executeUpdate();
                }
                connection.commit();
                return true;
            } catch (SQLException | RuntimeException error) {
                connection.rollback();
                throw error;
            }
        }
    }

    private SecurityEvent readEvent(ResultSet rows) throws SQLException {
        SecurityEvent event = new SecurityEvent();
        event.setSecurityEventId(rows.getLong("security_event_id"));
        event.setCategory(rows.getString("category"));
        event.setThreatType(rows.getString("threat_type"));
        event.setSeverity(rows.getString("severity"));
        event.setStatus(rows.getString("status"));
        event.setDetectionSource(rows.getString("detection_source"));
        event.setRuleCode(rows.getString("rule_code"));
        event.setEvidenceExcerpt(rows.getString("evidence_excerpt"));
        event.setRequestUri(rows.getString("request_uri"));
        event.setHttpMethod(rows.getString("http_method"));
        event.setSourceIpHash(rows.getString("source_ip_hash"));
        event.setOccurrenceCount(rows.getInt("occurrence_count"));
        event.setFirstSeenAt(rows.getTimestamp("first_seen_at"));
        event.setLastSeenAt(rows.getTimestamp("last_seen_at"));
        return event;
    }

    private String limit(String value, int max) {
        if (value == null) {
            return null;
        }
        return value.length() <= max ? value : value.substring(0, max);
    }
}
