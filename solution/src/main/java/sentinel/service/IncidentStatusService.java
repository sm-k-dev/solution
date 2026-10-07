package sentinel.service;

import java.sql.SQLException;
import javax.naming.NamingException;
import sentinel.dao.IncidentManagementDAO;

public class IncidentStatusService {
    private final IncidentManagementDAO dao = new IncidentManagementDAO();

    public boolean updateIncidentStatus(long id, long actor, String expected, String next)
    throws SQLException, NamingException {
        if (!isAllowedTransition(expected, next)) {
            return false;
        }
        return dao.updateIncidentStatus(id, actor, expected, next);
    }

    public boolean isAllowedTransition(String expected, String next) {
        return ("OPEN".equals(expected) && "ACKNOWLEDGED".equals(next)) ||
        ("ACKNOWLEDGED".equals(expected) && "RESOLVED".equals(next));
    }
}
