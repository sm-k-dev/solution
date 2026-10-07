package security.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import security.dto.SecurityAnalysis;

public class SecurityAnalysisDAO {

    public SecurityAnalysis findLatest(long securityEventId) throws SQLException, NamingException {
        SecuritySchema.ensure();
        String sql = "SELECT summary,possible_impact,suggested_action,model_name,created_at "    +
        "FROM security_analysis WHERE security_event_id=? AND is_deleted=0 "    +
        "ORDER BY analysis_id DESC LIMIT 1";
        try (Connection connection = SecuritySchema.source().getConnection();
        PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, securityEventId);
            try (ResultSet rows = statement.executeQuery()) {
                if (!rows.next()) {
                    return null;
                }
                SecurityAnalysis result = new SecurityAnalysis();
                result.setSummary(rows.getString("summary"));
                result.setPossibleImpact(rows.getString("possible_impact"));
                result.setSuggestedAction(rows.getString("suggested_action"));
                result.setModelName(rows.getString("model_name"));
                result.setCreatedAt(rows.getTimestamp("created_at"));
                return result;
            }
        }
    }

    public void insert(long securityEventId, SecurityAnalysis analysis)
    throws SQLException, NamingException {
        SecuritySchema.ensure();
        String sql = "INSERT INTO security_analysis "    +
        "(security_event_id,summary,possible_impact,suggested_action,model_name) VALUES (?,?,?,?,?)";
        try (Connection connection = SecuritySchema.source().getConnection();
        PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, securityEventId);
            statement.setString(2, analysis.getSummary());
            statement.setString(3, analysis.getPossibleImpact());
            statement.setString(4, analysis.getSuggestedAction());
            statement.setString(5, analysis.getModelName());
            statement.executeUpdate();
        }
    }
}
