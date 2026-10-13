package sentinel.api;

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
import common.api.JsonApiServlet;
import sentinel.dao.IncidentManagementDAO;
import sentinel.dto.Incident;

/** 인증된 서버 간 호출을 위한 읽기 전용 인시던트 JSON API입니다. */
public class IncidentApiServlet extends JsonApiServlet {
    private static final long serialVersionUID = 1L;
    private static final int DEFAULT_LIMIT = 50;
    private static final int MAX_LIMIT = 100;

    private final IncidentManagementDAO incidentDao = new IncidentManagementDAO();

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
                writeIncidentList(request, response);
                return;
            }

            long id = parseIdPath(pathInfo, response,
                "Use /api/v1/incidents or /api/v1/incidents/{id}.", "Incident");
            if (id < 0) {
                return;
            }

            Incident incident = incidentDao.findIncidentById(id);
            if (incident == null) {
                writeError(response, HttpServletResponse.SC_NOT_FOUND,
                    "INCIDENT_NOT_FOUND", "The requested incident was not found.");
                return;
            }

            JSONObject body = new JSONObject();
            body.put("data", toJson(incident));
            writeJson(response, HttpServletResponse.SC_OK, body);
        } catch (SQLException | NamingException error) {
            getServletContext().log("Incident API lookup failed", error);
            writeError(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                "INTERNAL_ERROR", "The incident lookup could not be completed.");
        }
    }

    private void writeIncidentList(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, NamingException, IOException {
        int limit = parseLimit(request, response, DEFAULT_LIMIT, MAX_LIMIT);
        if (limit < 0) {
            return;
        }

        List<Incident> incidents = incidentDao.findRecentIncidentSummaries(limit);
        JSONArray rows = new JSONArray();
        for (Incident incident : incidents) {
            rows.add(toJson(incident));
        }

        JSONObject meta = new JSONObject();
        meta.put("count", Integer.valueOf(rows.size()));
        meta.put("limit", Integer.valueOf(limit));
        JSONObject body = new JSONObject();
        body.put("data", rows);
        body.put("meta", meta);
        writeJson(response, HttpServletResponse.SC_OK, body);
    }

    private JSONObject toJson(Incident incident) {
        JSONObject json = new JSONObject();
        json.put("id", Long.valueOf(incident.getIncidentId()));
        json.put("service", incident.getServiceName());
        json.put("type", incident.getErrorType());
        json.put("severity", incident.getSeverity());
        json.put("status", incident.getStatus());
        json.put("path", incident.getRequestUri());
        json.put("method", incident.getHttpMethod());
        json.put("occurredAt", timestamp(incident.getOccurredAt()));
        // error message and stack trace are intentionally excluded.
        return json;
    }

    private String timestamp(Timestamp value) {
        return value == null ? null : value.toInstant().toString();
    }
}
