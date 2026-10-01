package sentinel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import sentinel.dto.Incident;
import sentinel.dto.IncidentHistory;

public class IncidentManagementDAO {
    private DataSource source() throws NamingException {
        return (DataSource) new InitialContext().lookup("java:comp/env/jdbc/jspdb");
    }

    public int countByStatus(String status) throws SQLException, NamingException {
        return count("status", status);
    }

    public int countBySeverity(String severity) throws SQLException, NamingException {
        return count("severity", severity);
    }

    public int countAll() throws SQLException, NamingException {
        try (Connection connection=source().getConnection();
             PreparedStatement statement=connection.prepareStatement("SELECT COUNT(*) FROM incident WHERE is_deleted=0");
             ResultSet rows=statement.executeQuery()) { rows.next(); return rows.getInt(1); }
    }

    public Map<String,Integer> countByDay(int days) throws SQLException, NamingException {
        Map<String,Integer> counts=new LinkedHashMap<String,Integer>();
        String sql="SELECT DATE_FORMAT(occurred_at,'%Y-%m-%d') AS incident_day,COUNT(*) AS incident_count FROM incident WHERE is_deleted=0 AND occurred_at >= CURRENT_DATE - INTERVAL ? DAY GROUP BY DATE(occurred_at)";
        try(Connection connection=source().getConnection();PreparedStatement statement=connection.prepareStatement(sql)){
            statement.setInt(1,Math.max(0,days-1));try(ResultSet rows=statement.executeQuery()){while(rows.next())counts.put(rows.getString("incident_day"),Integer.valueOf(rows.getInt("incident_count")));}
        }
        return counts;
    }

    private int count(String column, String value) throws SQLException, NamingException {
        if (!"status".equals(column) && !"severity".equals(column)) throw new IllegalArgumentException("Unsupported incident count field");
        try (Connection connection=source().getConnection();
             PreparedStatement statement=connection.prepareStatement("SELECT COUNT(*) FROM incident WHERE is_deleted=0 AND " + column + "=?")) {
            statement.setString(1,value);try(ResultSet rows=statement.executeQuery()){rows.next();return rows.getInt(1);}
        }
    }

    public List<Incident> findIncidentList() throws SQLException, NamingException {
        String sql = "SELECT incident_id, service_name, error_type, error_message, stack_trace, " +
            "severity, status, request_uri, http_method, occurred_at FROM incident " +
            "WHERE is_deleted = 0 ORDER BY occurred_at DESC, incident_id DESC LIMIT 50";
        List<Incident> incidents = new ArrayList<>();
        try (Connection connection = source().getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet rows = statement.executeQuery()) {
            while (rows.next()) incidents.add(readIncident(rows));
        }
        return incidents;
    }

    public Incident findIncidentById(long id) throws SQLException, NamingException {
        String sql = "SELECT incident_id, service_name, error_type, error_message, stack_trace, " +
            "severity, status, request_uri, http_method, occurred_at FROM incident " +
            "WHERE incident_id = ? AND is_deleted = 0";
        try (Connection connection = source().getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, id);
            try (ResultSet rows = statement.executeQuery()) {
                return rows.next() ? readIncident(rows) : null;
            }
        }
    }

    public List<IncidentHistory> findIncidentHistoryList(long id) throws SQLException, NamingException {
        String sql = "SELECT previous_status, new_status, changed_by, note, changed_at " +
                     "FROM incident_history WHERE incident_id = ? ORDER BY history_id DESC";
        List<IncidentHistory> history = new ArrayList<>();
        try (Connection connection = source().getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, id);
            try (ResultSet rows = statement.executeQuery()) {
                while (rows.next()) {
                    IncidentHistory entry = new IncidentHistory();
                    entry.setPreviousStatus(rows.getString("previous_status"));
                    entry.setNewStatus(rows.getString("new_status"));
                    long actor = rows.getLong("changed_by");
                    entry.setChangedBy(rows.wasNull() ? null : actor);
                    entry.setNote(rows.getString("note"));
                    entry.setChangedAt(rows.getTimestamp("changed_at"));
                    history.add(entry);
                }
            }
        }
        return history;
    }

    public boolean updateIncidentStatus(long id, long actor, String expected, String next)
            throws SQLException, NamingException {
        try (Connection connection = source().getConnection()) {
            connection.setAutoCommit(false);
            try {
                int updated;
                try (PreparedStatement statement = connection.prepareStatement(
                    "UPDATE incident SET status = ?, " +
                    "acknowledged_at = CASE WHEN ? = 'ACKNOWLEDGED' THEN CURRENT_TIMESTAMP ELSE acknowledged_at END, " +
                    "resolved_at = CASE WHEN ? = 'RESOLVED' THEN CURRENT_TIMESTAMP ELSE resolved_at END " +
                    "WHERE incident_id = ? AND status = ? AND is_deleted = 0")) {
                    statement.setString(1, next);
                    statement.setString(2, next);
                    statement.setString(3, next);
                    statement.setLong(4, id);
                    statement.setString(5, expected);
                    updated = statement.executeUpdate();
                }
                if (updated != 1) { connection.rollback(); return false; }
                try (PreparedStatement statement = connection.prepareStatement(
                    "INSERT INTO incident_history (incident_id, changed_by, previous_status, new_status) " +
                    "VALUES (?, ?, ?, ?)")) {
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

    private Incident readIncident(ResultSet rows) throws SQLException {
        Incident incident = new Incident();
        incident.setIncidentId(rows.getLong("incident_id"));
        incident.setServiceName(rows.getString("service_name"));
        incident.setErrorType(rows.getString("error_type"));
        incident.setErrorMessage(rows.getString("error_message"));
        incident.setStackTrace(rows.getString("stack_trace"));
        incident.setSeverity(rows.getString("severity"));
        incident.setStatus(rows.getString("status"));
        incident.setRequestUri(rows.getString("request_uri"));
        incident.setHttpMethod(rows.getString("http_method"));
        incident.setOccurredAt(rows.getTimestamp("occurred_at"));
        return incident;
    }
}
