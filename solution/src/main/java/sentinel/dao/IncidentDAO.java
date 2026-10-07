package sentinel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.naming.NamingException;
import javax.sql.DataSource;
import common.db.DataSourceProvider;

public class IncidentDAO {
    private static final String INSERT =
    "INSERT INTO incident (service_name, error_type, error_message, stack_trace, "  +
    "severity, request_uri, http_method, ip_address) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    public long insertIncident(String type, String message, String trace, String severity,
        String uri, String method, String ip) throws SQLException, NamingException {
        DataSource source = DataSourceProvider.get();
        try (Connection connection = source.getConnection();
        PreparedStatement statement = connection.prepareStatement(INSERT, Statement.RETURN_GENERATED_KEYS)) {
            statement.setString(1, "NEXORA");
            statement.setString(2, limit(type, 150));
            statement.setString(3, message == null ? "Unknown server error" : message);
            statement.setString(4, trace);
            statement.setString(5, severity);
            statement.setString(6, limit(uri, 500));
            statement.setString(7, limit(method, 10));
            statement.setString(8, limit(ip, 45));
            statement.executeUpdate();
            try (ResultSet keys = statement.getGeneratedKeys()) {
                if (!keys.next()) {
                    throw new SQLException("Incident ID was not generated");
                }
                return keys.getLong(1);
            }
        }
    }

    private static String limit(String value, int max) {
        return value == null || value.length() <= max ? value : value.substring(0, max);
    }
}
