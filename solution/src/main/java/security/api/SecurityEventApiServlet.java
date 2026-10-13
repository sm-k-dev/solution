package security.api;

import common.api.JsonApiServlet;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import security.dao.SecurityEventDAO;
import security.dto.SecurityEvent;

/** 인증된 서버 간 호출을 위한 읽기 전용 Security 이벤트 JSON API입니다. */
public class SecurityEventApiServlet extends JsonApiServlet {
    private static final long serialVersionUID = 1L;
    private static final int DEFAULT_LIMIT = 50;
    private static final int MAX_LIMIT = 100;

    private final SecurityEventDAO securityEventDao = new SecurityEventDAO();

    @Override
    protected String allowedMethods() {
        return "GET";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        if (!authorize(request, response)) {
            return;
        }

        String pathInfo = request.getPathInfo();
        try {
            if (pathInfo == null || pathInfo.isEmpty() || "/".equals(pathInfo)) {
                writeEventList(request, response);
                return;
            }
            long id = parseIdPath(pathInfo, response,
                "Use /api/v1/security/events or /api/v1/security/events/{id}.", "Security event");
            if (id < 0) {
                return;
            }

            SecurityEvent event = securityEventDao.findById(id);
            if (event == null) {
                writeError(response, HttpServletResponse.SC_NOT_FOUND,
                    "SECURITY_EVENT_NOT_FOUND", "The requested Security event was not found.");
                return;
            }
            JSONObject body = new JSONObject();
            body.put("data", toJson(event));
            writeJson(response, HttpServletResponse.SC_OK, body);
        } catch (SQLException | NamingException error) {
            getServletContext().log("Security event API lookup failed", error);
            writeError(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                "INTERNAL_ERROR", "The Security event lookup could not be completed.");
        }
    }

    private void writeEventList(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, NamingException, IOException {
        int limit = parseLimit(request, response, DEFAULT_LIMIT, MAX_LIMIT);
        if (limit < 0) {
            return;
        }

        List<SecurityEvent> events = securityEventDao.findRecentEvents(limit);
        JSONArray rows = new JSONArray();
        for (SecurityEvent event : events) {
            rows.add(toJson(event));
        }
        JSONObject meta = new JSONObject();
        meta.put("count", Integer.valueOf(rows.size()));
        meta.put("limit", Integer.valueOf(limit));
        JSONObject body = new JSONObject();
        body.put("data", rows);
        body.put("meta", meta);
        writeJson(response, HttpServletResponse.SC_OK, body);
    }

    private JSONObject toJson(SecurityEvent event) {
        JSONObject json = new JSONObject();
        json.put("id", Long.valueOf(event.getSecurityEventId()));
        json.put("category", event.getCategory());
        json.put("threatType", event.getThreatType());
        json.put("severity", event.getSeverity());
        json.put("status", event.getStatus());
        json.put("detectionSource", event.getDetectionSource());
        json.put("ruleCode", event.getRuleCode());
        json.put("method", event.getHttpMethod());
        json.put("occurrenceCount", Integer.valueOf(event.getOccurrenceCount()));
        json.put("firstSeenAt", timestamp(event.getFirstSeenAt()));
        json.put("lastSeenAt", timestamp(event.getLastSeenAt()));
        // request URI, evidence excerpt, and source IP hash are intentionally excluded.
        return json;
    }

    private String timestamp(Timestamp value) {
        return value == null ? null : value.toInstant().toString();
    }
}
