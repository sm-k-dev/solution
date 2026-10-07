package common.db;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/** Provides the application-wide Tomcat-managed database pool. */
public final class DataSourceProvider {
    private static final String JNDI_NAME = "java:comp/env/jdbc/jspdb";

    private DataSourceProvider() {
    }

    public static DataSource getDataSource() throws NamingException {
        return (DataSource) new InitialContext().lookup(JNDI_NAME);
    }
}
