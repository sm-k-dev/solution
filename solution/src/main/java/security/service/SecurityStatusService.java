package security.service;

import java.sql.SQLException;
import javax.naming.NamingException;
import security.dao.SecurityEventDAO;

public class SecurityStatusService {
    private final SecurityEventDAO dao = new SecurityEventDAO();

    public boolean isAllowedTransition(String expected, String next) {
        return ("OPEN".equals(expected) && "ACKNOWLEDGED".equals(next)) ||
               ("ACKNOWLEDGED".equals(expected) && "RESOLVED".equals(next));
    }

    public boolean update(long id, long actor, String expected, String next)
            throws SQLException, NamingException {
        return isAllowedTransition(expected, next) && dao.updateStatus(id, actor, expected, next);
    }
}
