package security.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.NamingException;

public class SecurityAlertDAO {
    public long insertAlert(Long eventId, String type, String message)
    throws SQLException, NamingException {
        SecuritySchema.ensure();
        String sql = "INSERT INTO security_alert "  +
        "(security_event_id,alert_type,channel_name,message) VALUES (?,?,?,?)";
        try (Connection connection = SecuritySchema.source().getConnection();
        PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            if (eventId == null) {
                statement.setNull(1, java.sql.Types.BIGINT);
            } else statement.setLong(1, eventId.longValue());
            statement.setString(2, type);
            statement.setString(3, "Slack");
            statement.setString(4, message);
            statement.executeUpdate();
            try (ResultSet keys = statement.getGeneratedKeys()) {
                if (!keys.next()) {
                    throw new SQLException("Security alert ID was not generated");
                }
                return keys.getLong(1);
            }
        }
    }

    public void updateStatus(long id, boolean success, String error)
    throws SQLException, NamingException {
        SecuritySchema.ensure();
        String sql = "UPDATE security_alert SET send_status=?,error_message=?,"  +
        "sent_at=CASE WHEN ? THEN CURRENT_TIMESTAMP ELSE NULL END WHERE alert_id=?";
        try (Connection connection = SecuritySchema.source().getConnection();
        PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, success ? "SUCCESS" : "FAILED");
            statement.setString(2, limit(error, 1000));
            statement.setBoolean(3, success);
            statement.setLong(4, id);
            statement.executeUpdate();
        }
    }

    public boolean hasSuccessfulSummaryToday() throws SQLException, NamingException {
        SecuritySchema.ensure();
        String sql = "SELECT 1 FROM security_alert WHERE alert_type='SECURITY_DAILY_SUMMARY' "  +
        "AND send_status='SUCCESS' AND sent_at>=CURRENT_DATE() LIMIT 1";
        try (Connection connection = SecuritySchema.source().getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet rows = statement.executeQuery()) {
            return rows.next();
        }
    }

    public boolean hasSuccessfulCriticalAlert(long eventId) throws SQLException, NamingException {
        SecuritySchema.ensure();
        String sql = "SELECT 1 FROM security_alert WHERE security_event_id=? "  +
        "AND alert_type='SECURITY_CRITICAL_ALERT' AND send_status='SUCCESS' LIMIT 1";
        try (Connection connection = SecuritySchema.source().getConnection();
        PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, eventId);
            try (ResultSet rows = statement.executeQuery()) {
                return rows.next();
            }
        }
    }

    public int[] countPreviousDayEvents() throws SQLException, NamingException {
        SecuritySchema.ensure();
        String sql = "SELECT COALESCE(SUM(occurrence_count),0) AS total,"  +
        "COALESCE(SUM(CASE WHEN severity='CRITICAL' THEN occurrence_count ELSE 0 END),0) AS critical_count,"  +
        "COALESCE(SUM(CASE WHEN severity='HIGH' THEN occurrence_count ELSE 0 END),0) AS high_count,"  +
        "COALESCE(SUM(CASE WHEN category='AI' THEN occurrence_count ELSE 0 END),0) AS ai_count "  +
        "FROM security_event WHERE is_deleted=0 AND last_seen_at>=CURRENT_DATE()-INTERVAL 1 DAY "  +
        "AND last_seen_at<CURRENT_DATE()";
        try (Connection connection = SecuritySchema.source().getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet rows = statement.executeQuery()) {
            rows.next();
            return new int[] {
                rows.getInt("total"), rows.getInt("critical_count"),
                    rows.getInt("high_count"), rows.getInt("ai_count")
            };
        }
    }

    private String limit(String value, int max) {
        if (value == null) {
            return null;
        }
        return value.length() <= max ? value : value.substring(0, max);
    }
}
