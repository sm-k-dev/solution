package sentinel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import sentinel.dto.IncidentAnalysis;

public class IncidentAnalysisDAO {
    private DataSource source() throws NamingException {
        return (DataSource) new InitialContext().lookup("java:comp/env/jdbc/jspdb");
    }

    public IncidentAnalysis findLatestAnalysis(long incidentId) throws SQLException, NamingException {
        String sql = "SELECT summary, possible_cause, suggested_action, model_name, created_at " +
            "FROM incident_analysis WHERE incident_id = ? AND is_deleted = 0 " +
            "ORDER BY analysis_id DESC LIMIT 1";
        try (Connection connection = source().getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, incidentId);
            try (ResultSet rows = statement.executeQuery()) {
                if (!rows.next()) return null;
                IncidentAnalysis result = new IncidentAnalysis();
                result.setSummary(rows.getString("summary"));
                result.setPossibleCause(rows.getString("possible_cause"));
                result.setSuggestedAction(rows.getString("suggested_action"));
                result.setModelName(rows.getString("model_name"));
                result.setCreatedAt(rows.getTimestamp("created_at"));
                return result;
            }
        }
    }

    public void insertAnalysis(long incidentId, IncidentAnalysis analysis)
            throws SQLException, NamingException {
        String sql = "INSERT INTO incident_analysis " +
            "(incident_id, summary, possible_cause, suggested_action, model_name) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = source().getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, incidentId);
            statement.setString(2, analysis.getSummary());
            statement.setString(3, analysis.getPossibleCause());
            statement.setString(4, analysis.getSuggestedAction());
            statement.setString(5, analysis.getModelName());
            statement.executeUpdate();
        }
    }
}
