package sentinel.api;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import common.api.JsonApiServlet;
import security.dto.SecurityEvent;
import security.service.SecurityEventRecorder;
import security.service.SecuritySeverityClassifier;
import sentinel.dao.IncidentDAO;
import sentinel.service.IncidentAlertService;
import sentinel.service.SeverityClassifier;

/**
 * 외부 서비스(SwitchBase 등)가 오류(ERROR) 또는 보안(SECURITY) 이벤트를 보고하는 수신 API입니다.
 * ERROR는 SentinelOps 인시던트로, SECURITY는 Security 위협 이벤트로 저장합니다.
 */
public class EventIngestApiServlet extends JsonApiServlet {
    private static final long serialVersionUID = 1L;

    private static final List<String> SEVERITIES = Arrays.asList("LOW", "MEDIUM", "HIGH", "CRITICAL");
    private static final List<String> HTTP_METHODS =
        Arrays.asList("GET", "POST", "PUT", "PATCH", "DELETE", "HEAD", "OPTIONS");
    private static final List<String> SECURITY_CATEGORIES = Arrays.asList("WEB", "AI");
    private static final String SERVICE_PATTERN = "[A-Za-z0-9][A-Za-z0-9_.-]{0,49}";
    private static final String THREAT_TYPE_PATTERN = "[A-Z][A-Z0-9_]{1,59}";
    private static final String RULE_CODE_PATTERN = "[A-Za-z0-9][A-Za-z0-9_.:-]{0,79}";
    private static final String IP_PATTERN = "[0-9a-fA-F:.]{2,45}";

    private final IncidentDAO incidentDao = new IncidentDAO();
    private final SeverityClassifier incidentClassifier = new SeverityClassifier();
    private final IncidentAlertService incidentAlerts = new IncidentAlertService();
    private final SecurityEventRecorder securityRecorder = new SecurityEventRecorder();
    private final SecuritySeverityClassifier securityClassifier = new SecuritySeverityClassifier();

    @Override
    protected String allowedMethods() {
        return "POST";
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        if (!authorize(request, response)) {
            return;
        }
        String pathInfo = request.getPathInfo();
        if (pathInfo != null && !pathInfo.isEmpty() && !"/".equals(pathInfo)) {
            writeError(response, HttpServletResponse.SC_NOT_FOUND,
                "NOT_FOUND", "Use POST /api/v1/events.");
            return;
        }
        JSONObject body = readJsonBody(request, response);
        if (body == null) {
            return;
        }

        try {
            String type = text(body, "type", response, true, 20);
            if (type == null) {
                return;
            }
            type = type.toUpperCase(Locale.ROOT);
            if ("ERROR".equals(type)) {
                ingestError(body, request, response);
            } else if ("SECURITY".equals(type)) {
                ingestSecurity(body, response);
            } else {
                writeFieldError(response, "type", "type must be ERROR or SECURITY.");
            }
        } catch (SQLException | NamingException error) {
            getServletContext().log("Event ingest API failed", error);
            writeError(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                "INTERNAL_ERROR", "The event could not be stored.");
        }
    }

    private void ingestError(JSONObject body, HttpServletRequest request, HttpServletResponse response)
    throws IOException, SQLException, NamingException {
        String service = pattern(body, "service", response, true, SERVICE_PATTERN,
            "service must be 1-50 characters of letters, digits, '_', '.' or '-'.");
        if (service == null) {
            return;
        }
        String errorType = text(body, "errorType", response, true, 150);
        if (errorType == null) {
            return;
        }
        String message = text(body, "message", response, true, 4000);
        if (message == null) {
            return;
        }
        Field<String> stackTrace = optionalText(body, "stackTrace", response, 16000);
        Field<String> path = optionalPath(body, response);
        Field<String> method = optionalEnum(body, "method", response, HTTP_METHODS);
        Field<String> severity = optionalEnum(body, "severity", response, SEVERITIES);
        Field<Long> httpStatus = optionalInteger(body, "httpStatus", response, 100, 599);
        Field<String> clientIp = optionalPattern(body, "clientIp", response, IP_PATTERN,
            "clientIp must be an IPv4 or IPv6 address.");
        if (!stackTrace.valid || !path.valid || !method.valid || !severity.valid ||
            !httpStatus.valid || !clientIp.valid) {
            return;
        }

        String finalSeverity = severity.value;
        if (finalSeverity == null) {
            int status = httpStatus.value == null ? 500 : httpStatus.value.intValue();
            finalSeverity = incidentClassifier.classifySeverity(status, null, path.value);
        }
        String ip = clientIp.value == null ? request.getRemoteAddr() : clientIp.value;
        long id = incidentDao.insertIncident(service, errorType, message, stackTrace.value,
            finalSeverity, path.value, method.value, ip);
        if ("CRITICAL".equals(finalSeverity)) {
            try {
                incidentAlerts.sendCriticalAlert(id, errorType, path.value);
            } catch (Exception alertError) {
                getServletContext().log("Event ingest API: incident alert failed", alertError);
            }
        }
        writeCreated(response, "ERROR", id, finalSeverity, "/api/v1/incidents/" + id);
    }

    private void ingestSecurity(JSONObject body, HttpServletResponse response)
    throws IOException, SQLException, NamingException {
        String service = pattern(body, "service", response, true, SERVICE_PATTERN,
            "service must be 1-50 characters of letters, digits, '_', '.' or '-'.");
        if (service == null) {
            return;
        }
        Field<String> category = optionalEnum(body, "category", response, SECURITY_CATEGORIES);
        if (!category.valid) {
            return;
        }
        if (category.value == null) {
            writeFieldError(response, "category", "category is required (WEB or AI).");
            return;
        }
        String threatType = pattern(body, "threatType", response, true, THREAT_TYPE_PATTERN,
            "threatType must be UPPER_SNAKE_CASE, 2-60 characters.");
        if (threatType == null) {
            return;
        }
        String ruleCode = pattern(body, "ruleCode", response, true, RULE_CODE_PATTERN,
            "ruleCode must be 1-80 characters of letters, digits, '_', '.', ':' or '-'.");
        if (ruleCode == null) {
            return;
        }
        Field<String> severity = optionalEnum(body, "severity", response, SEVERITIES);
        Field<String> evidence = optionalText(body, "evidence", response, 500);
        Field<String> path = optionalPath(body, response);
        Field<String> method = optionalEnum(body, "method", response, HTTP_METHODS);
        Field<String> sourceIp = optionalPattern(body, "sourceIp", response, IP_PATTERN,
            "sourceIp must be an IPv4 or IPv6 address.");
        if (!severity.valid || !evidence.valid || !path.valid || !method.valid || !sourceIp.valid) {
            return;
        }

        SecurityEvent event = new SecurityEvent();
        event.setCategory(category.value);
        event.setThreatType(threatType);
        event.setSeverity(severity.value == null ? securityClassifier.classify(threatType) : severity.value);
        event.setDetectionSource("API:" + service);
        event.setRuleCode(ruleCode);
        event.setEvidenceExcerpt(evidence.value);
        event.setRequestUri(path.value);
        event.setHttpMethod(method.value);
        long id = securityRecorder.recordExternal(event, sourceIp.value);
        writeCreated(response, "SECURITY", id, event.getSeverity(), "/api/v1/security/events/" + id);
    }

    private void writeCreated(HttpServletResponse response, String type,
        long id, String severity, String location) throws IOException {
        JSONObject data = new JSONObject();
        data.put("type", type);
        data.put("id", Long.valueOf(id));
        data.put("severity", severity);
        data.put("location", location);
        JSONObject body = new JSONObject();
        body.put("data", data);
        response.setHeader("Location", getServletContext().getContextPath() + location);
        writeJson(response, HttpServletResponse.SC_CREATED, body);
    }

    // ---- 입력 검증 helper ----

    /** 필수/선택 문자열 필드를 읽습니다. 검증 실패 시 오류 응답을 작성하고 null을 반환합니다. */
    private String text(JSONObject body, String field, HttpServletResponse response,
        boolean required, int maxLength) throws IOException {
        Object raw = body.get(field);
        if (raw == null) {
            if (required) {
                writeFieldError(response, field, field + " is required.");
            }
            return null;
        }
        if (!(raw instanceof String)) {
            writeFieldError(response, field, field + " must be a string.");
            return null;
        }
        String value = ((String) raw).trim();
        if (value.isEmpty()) {
            writeFieldError(response, field, field + " must not be empty.");
            return null;
        }
        if (value.length() > maxLength) {
            writeFieldError(response, field, field + " must be " + maxLength + " characters or fewer.");
            return null;
        }
        if (!"stackTrace".equals(field) && !"message".equals(field) && hasControlCharacter(value)) {
            writeFieldError(response, field, field + " must not contain control characters.");
            return null;
        }
        return value;
    }

    private String pattern(JSONObject body, String field, HttpServletResponse response,
        boolean required, String regex, String message) throws IOException {
        String value = text(body, field, response, required, 200);
        if (value == null) {
            return null;
        }
        if (!value.matches(regex)) {
            writeFieldError(response, field, message);
            return null;
        }
        return value;
    }

    private Field<String> optionalText(JSONObject body, String field, HttpServletResponse response,
        int maxLength) throws IOException {
        if (body.get(field) == null) {
            return Field.empty();
        }
        String value = text(body, field, response, false, maxLength);
        return value == null ? Field.<String>invalid() : Field.of(value);
    }

    private Field<String> optionalPattern(JSONObject body, String field, HttpServletResponse response,
        String regex, String message) throws IOException {
        if (body.get(field) == null) {
            return Field.empty();
        }
        String value = pattern(body, field, response, false, regex, message);
        return value == null ? Field.<String>invalid() : Field.of(value);
    }

    private Field<String> optionalPath(JSONObject body, HttpServletResponse response) throws IOException {
        Field<String> path = optionalText(body, "path", response, 500);
        if (path.valid && path.value != null && !path.value.startsWith("/")) {
            writeFieldError(response, "path", "path must start with '/'.");
            return Field.invalid();
        }
        return path;
    }

    private Field<String> optionalEnum(JSONObject body, String field, HttpServletResponse response,
        List<String> allowed) throws IOException {
        Field<String> raw = optionalText(body, field, response, 20);
        if (!raw.valid || raw.value == null) {
            return raw;
        }
        String value = raw.value.toUpperCase(Locale.ROOT);
        if (!allowed.contains(value)) {
            writeFieldError(response, field, field + " must be one of " + allowed + ".");
            return Field.invalid();
        }
        return Field.of(value);
    }

    private Field<Long> optionalInteger(JSONObject body, String field, HttpServletResponse response,
        long min, long max) throws IOException {
        Object raw = body.get(field);
        if (raw == null) {
            return Field.empty();
        }
        if (!(raw instanceof Long) || ((Long) raw).longValue() < min || ((Long) raw).longValue() > max) {
            writeFieldError(response, field, field + " must be an integer between " + min + " and " + max + ".");
            return Field.invalid();
        }
        return Field.of((Long) raw);
    }

    private boolean hasControlCharacter(String value) {
        for (int index = 0; index < value.length(); index++) {
            if (Character.isISOControl(value.charAt(index))) {
                return true;
            }
        }
        return false;
    }

    /** 선택 필드 검증 결과입니다. valid=false이면 이미 오류 응답이 작성된 상태입니다. */
    private static final class Field<T> {
        private final boolean valid;
        private final T value;

        private Field(boolean valid, T value) {
            this.valid = valid;
            this.value = value;
        }

        static <T> Field<T> of(T value) {
            return new Field<T>(true, value);
        }

        static <T> Field<T> empty() {
            return new Field<T>(true, null);
        }

        static <T> Field<T> invalid() {
            return new Field<T>(false, null);
        }
    }
}
