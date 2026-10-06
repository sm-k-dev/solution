package security.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public final class SecuritySchema {
    private static volatile boolean initialized;

    private SecuritySchema() { }

    public static DataSource source() throws NamingException {
        return (DataSource) new InitialContext().lookup("java:comp/env/jdbc/jspdb");
    }

    public static void ensure() throws SQLException, NamingException {
        if (initialized) return;
        synchronized (SecuritySchema.class) {
            if (initialized) return;
            try (Connection connection = source().getConnection();
                 Statement statement = connection.createStatement()) {
                statement.executeUpdate("CREATE TABLE IF NOT EXISTS security_event (" +
                    "security_event_id BIGINT NOT NULL AUTO_INCREMENT," +
                    "category VARCHAR(20) NOT NULL," +
                    "threat_type VARCHAR(60) NOT NULL," +
                    "severity VARCHAR(20) NOT NULL," +
                    "status VARCHAR(20) NOT NULL DEFAULT 'OPEN'," +
                    "detection_source VARCHAR(60) NOT NULL," +
                    "rule_code VARCHAR(80) NOT NULL," +
                    "evidence_excerpt VARCHAR(500) NULL," +
                    "request_uri VARCHAR(500) NULL," +
                    "http_method VARCHAR(10) NULL," +
                    "source_ip_hash VARCHAR(64) NULL," +
                    "event_fingerprint CHAR(64) NOT NULL," +
                    "time_bucket BIGINT NOT NULL," +
                    "occurrence_count INT NOT NULL DEFAULT 1," +
                    "first_seen_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP," +
                    "last_seen_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP," +
                    "acknowledged_at TIMESTAMP NULL," +
                    "resolved_at TIMESTAMP NULL," +
                    "is_deleted TINYINT(1) NOT NULL DEFAULT 0," +
                    "PRIMARY KEY (security_event_id)," +
                    "UNIQUE KEY uk_security_event_window (event_fingerprint,time_bucket)," +
                    "KEY idx_security_event_recent (is_deleted,last_seen_at)," +
                    "KEY idx_security_event_status (status,severity)" +
                    ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");
                statement.executeUpdate("CREATE TABLE IF NOT EXISTS security_event_history (" +
                    "history_id BIGINT NOT NULL AUTO_INCREMENT," +
                    "security_event_id BIGINT NOT NULL," +
                    "changed_by BIGINT NULL," +
                    "previous_status VARCHAR(20) NOT NULL," +
                    "new_status VARCHAR(20) NOT NULL," +
                    "changed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP," +
                    "PRIMARY KEY (history_id)," +
                    "KEY idx_security_history_event (security_event_id,changed_at)" +
                    ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");
                statement.executeUpdate("CREATE TABLE IF NOT EXISTS security_analysis (" +
                    "analysis_id BIGINT NOT NULL AUTO_INCREMENT," +
                    "security_event_id BIGINT NOT NULL," +
                    "summary VARCHAR(500) NOT NULL," +
                    "possible_impact VARCHAR(500) NOT NULL," +
                    "suggested_action VARCHAR(500) NOT NULL," +
                    "model_name VARCHAR(100) NOT NULL," +
                    "created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP," +
                    "is_deleted TINYINT(1) NOT NULL DEFAULT 0," +
                    "PRIMARY KEY (analysis_id)," +
                    "KEY idx_security_analysis_event (security_event_id,created_at)" +
                    ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");
                statement.executeUpdate("CREATE TABLE IF NOT EXISTS security_alert (" +
                    "alert_id BIGINT NOT NULL AUTO_INCREMENT," +
                    "security_event_id BIGINT NULL," +
                    "alert_type VARCHAR(40) NOT NULL," +
                    "channel_name VARCHAR(30) NOT NULL," +
                    "message VARCHAR(1000) NOT NULL," +
                    "send_status VARCHAR(20) NOT NULL DEFAULT 'PENDING'," +
                    "error_message VARCHAR(1000) NULL," +
                    "created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP," +
                    "sent_at TIMESTAMP NULL," +
                    "PRIMARY KEY (alert_id)," +
                    "KEY idx_security_alert_daily (alert_type,send_status,sent_at)" +
                    ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");
            }
            initialized = true;
        }
    }
}
