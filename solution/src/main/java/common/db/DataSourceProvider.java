package common.db;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/** 애플리케이션의 공통 JNDI 데이터소스를 제공합니다. */
public final class DataSourceProvider {

    private static final String JNDI_NAME = "java:comp/env/jdbc/jspdb";

    private DataSourceProvider() {
    }

    public static DataSource get() throws NamingException {
        return (DataSource) new InitialContext().lookup(JNDI_NAME);
    }
}
