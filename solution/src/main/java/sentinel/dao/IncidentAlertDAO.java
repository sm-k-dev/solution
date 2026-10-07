package sentinel.dao;

import common.db.DataSourceProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.NamingException;

public class IncidentAlertDAO {

    public long insertAlert(Long incidentId, String type, String message)
    throws SQLException, NamingException {
        String sql = "INSERT INTO incident_alert (incident_id, alert_type, channel_name, message) "      +
        "VALUES (?, ?, ?, ?)";
        try (Connection connection = DataSourceProvider.getDataSource().getConnection();
        PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            if (incidentId == null) {
                statement.setNull(1, java.sql.Types.BIGINT);
            } else statement.setLong(1, incidentId);
            statement.setString(2, type);
            statement.setString(3, "Slack");
            statement.setString(4, message);
            statement.executeUpdate();
            try (ResultSet keys = statement.getGeneratedKeys()) {
                if (!keys.next()) {
                    throw new SQLException("Alert ID was not generated");
                }
                return keys.getLong(1);
            }
        }
    }

    public void updateAlertStatus(long id, boolean success, String error)
    throws SQLException, NamingException {
        String sql = "UPDATE incident_alert SET send_status = ?, error_message = ?, "      +
        "sent_at = CASE WHEN ? THEN CURRENT_TIMESTAMP ELSE NULL END WHERE alert_id = ?";
        try (Connection connection = DataSourceProvider.getDataSource().getConnection();
        PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, success ? "SUCCESS" : "FAILED");
            statement.setString(2, error == null ? null : error.substring(0, Math.min(1000, error.length())));
            statement.setBoolean(3, success);
            statement.setLong(4, id);
            statement.executeUpdate();
        }
    }

    public boolean hasSuccessfulSummaryToday() throws SQLException, NamingException {
        String sql = "SELECT 1 FROM incident_alert WHERE alert_type = 'DAILY_SUMMARY' "      +
        "AND send_status = 'SUCCESS' AND sent_at >= CURRENT_DATE() LIMIT 1";
        try (Connection connection = DataSourceProvider.getDataSource().getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet rows = statement.executeQuery()) {
            return rows.next();
        }
    }

    public int[] countPreviousDayIncidents() throws SQLException, NamingException {
        String sql = "SELECT COUNT(*) AS total, "      +
        "COALESCE(SUM(severity = 'CRITICAL'), 0) AS critical_count, "      +
        "COALESCE(SUM(severity = 'HIGH'), 0) AS high_count "      +
        "FROM incident WHERE is_deleted = 0 AND occurred_at >= CURRENT_DATE() - INTERVAL 1 DAY "      +
        "AND occurred_at < CURRENT_DATE()";
        try (Connection connection = DataSourceProvider.getDataSource().getConnection();
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet rows = statement.executeQuery()) {
            rows.next();
            return new int[] {
                rows.getInt("total"), rows.getInt("critical_count"), rows.getInt("high_count")
            };
        }
    }
}
