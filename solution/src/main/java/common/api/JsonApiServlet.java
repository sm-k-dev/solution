package common.api;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/** 서버 간 JSON API 서블릿의 공통 응답·인증·오류 처리입니다. */
public abstract class JsonApiServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /** IncidentFilter가 장애로 기록하지 않아야 하는 예상된 API 응답에 붙이는 request 속성입니다. */
    public static final String SKIP_INCIDENT_ATTRIBUTE = "nexora.api.skipIncident";

    protected static final int MAX_BODY_BYTES = 64 * 1024;

    /** 이 서블릿이 허용하는 HTTP 메서드 목록입니다. 예: "GET" 또는 "POST". */
    protected abstract String allowedMethods();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        prepareJsonResponse(response);
        String method = request.getMethod();
        if (!isAllowed(method)) {
            response.setHeader("Allow", allowedMethods());
            writeError(response, HttpServletResponse.SC_METHOD_NOT_ALLOWED,
                "METHOD_NOT_ALLOWED", "Only " + allowedMethods() + " is supported by this API.");
            return;
        }
        try {
            super.service(request, response);
        } catch (RuntimeException error) {
            getServletContext().log("API request failed: " + request.getRequestURI(), error);
            if (!response.isCommitted()) {
                response.resetBuffer();
                writeError(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "INTERNAL_ERROR", "The request could not be completed.");
            }
        }
    }

    private boolean isAllowed(String method) {
        if (method == null) {
            return false;
        }
        for (String allowed : allowedMethods().split(",")) {
            if (allowed.trim().equalsIgnoreCase(method)) {
                return true;
            }
        }
        return false;
    }

    /** API Key 설정·검증을 수행하고 실패하면 오류 응답을 작성한 뒤 false를 반환합니다. */
    protected boolean authorize(HttpServletRequest request, HttpServletResponse response)
    throws IOException {
        if (!ApiKeyAuthenticator.isConfigured()) {
            getServletContext().log("NEXORA_API_KEY is not configured");
            skipIncident(request);
            writeError(response, HttpServletResponse.SC_SERVICE_UNAVAILABLE,
                "API_NOT_CONFIGURED", "API authentication is not configured.");
            return false;
        }
        if (!ApiKeyAuthenticator.isAuthorized(request)) {
            writeError(response, HttpServletResponse.SC_UNAUTHORIZED,
                "UNAUTHORIZED", "A valid API key is required.");
            return false;
        }
        return true;
    }

    /** limit 쿼리 파라미터를 검증합니다. 오류이면 응답을 작성하고 -1을 반환합니다. */
    protected int parseLimit(HttpServletRequest request, HttpServletResponse response,
        int defaultLimit, int maxLimit) throws IOException {
        String rawLimit = request.getParameter("limit");
        if (rawLimit == null || rawLimit.trim().isEmpty()) {
            return defaultLimit;
        }
        int limit;
        try {
            limit = Integer.parseInt(rawLimit.trim());
        } catch (NumberFormatException error) {
            limit = -1;
        }
        if (limit < 1 || limit > maxLimit) {
            writeError(response, HttpServletResponse.SC_BAD_REQUEST,
                "INVALID_LIMIT", "limit must be an integer between 1 and " + maxLimit + ".");
            return -1;
        }
        return limit;
    }

    /** "/{id}" 형태의 pathInfo에서 양의 정수 ID를 읽습니다. 오류이면 응답을 작성하고 -1을 반환합니다. */
    protected long parseIdPath(String pathInfo, HttpServletResponse response, String usage, String label)
    throws IOException {
        if (pathInfo.length() < 2 || pathInfo.charAt(0) != '/' || pathInfo.indexOf('/', 1) >= 0) {
            writeError(response, HttpServletResponse.SC_BAD_REQUEST, "INVALID_PATH", usage);
            return -1;
        }
        String idText = pathInfo.substring(1);
        if (!idText.matches("[1-9][0-9]{0,18}")) {
            writeError(response, HttpServletResponse.SC_BAD_REQUEST,
                "INVALID_ID", label + " id must be a positive integer.");
            return -1;
        }
        try {
            return Long.parseLong(idText);
        } catch (NumberFormatException error) {
            writeError(response, HttpServletResponse.SC_BAD_REQUEST,
                "INVALID_ID", label + " id is outside the supported range.");
            return -1;
        }
    }

    /** application/json 본문을 최대 64KB까지 읽어 JSON 객체로 반환합니다. 오류이면 응답을 작성하고 null을 반환합니다. */
    protected JSONObject readJsonBody(HttpServletRequest request, HttpServletResponse response)
    throws IOException {
        String contentType = request.getContentType();
        if (contentType == null ||
            !contentType.toLowerCase(Locale.ROOT).startsWith("application/json")) {
            writeError(response, HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE,
                "UNSUPPORTED_MEDIA_TYPE", "Content-Type must be application/json.");
            return null;
        }
        if (request.getContentLength() > MAX_BODY_BYTES) {
            writeError(response, HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE,
                "PAYLOAD_TOO_LARGE", "Request body must be 64KB or smaller.");
            return null;
        }
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        byte[] chunk = new byte[4096];
        try (InputStream input = request.getInputStream()) {
            int read;
            while ((read = input.read(chunk)) != -1) {
                buffer.write(chunk, 0, read);
                if (buffer.size() > MAX_BODY_BYTES) {
                    writeError(response, HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE,
                        "PAYLOAD_TOO_LARGE", "Request body must be 64KB or smaller.");
                    return null;
                }
            }
        }
        Object parsed;
        try {
            parsed = new JSONParser().parse(new String(buffer.toByteArray(), StandardCharsets.UTF_8));
        } catch (ParseException | RuntimeException error) {
            parsed = null;
        }
        if (!(parsed instanceof JSONObject)) {
            writeError(response, HttpServletResponse.SC_BAD_REQUEST,
                "INVALID_JSON", "Request body must be a JSON object.");
            return null;
        }
        return (JSONObject) parsed;
    }

    protected void skipIncident(HttpServletRequest request) {
        request.setAttribute(SKIP_INCIDENT_ATTRIBUTE, Boolean.TRUE);
    }

    protected void prepareJsonResponse(HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("X-Content-Type-Options", "nosniff");
    }

    protected void writeError(HttpServletResponse response, int status, String code, String message)
    throws IOException {
        JSONObject error = new JSONObject();
        error.put("code", code);
        error.put("message", message);
        JSONObject body = new JSONObject();
        body.put("error", error);
        writeJson(response, status, body);
    }

    /** 필드 단위 입력 검증 오류를 422 대신 400 INVALID_FIELD로 통일해 반환합니다. */
    protected void writeFieldError(HttpServletResponse response, String field, String message)
    throws IOException {
        JSONObject error = new JSONObject();
        error.put("code", "INVALID_FIELD");
        error.put("field", field);
        error.put("message", message);
        JSONObject body = new JSONObject();
        body.put("error", error);
        writeJson(response, HttpServletResponse.SC_BAD_REQUEST, body);
    }

    protected void writeJson(HttpServletResponse response, int status, JSONObject body)
    throws IOException {
        response.setStatus(status);
        prepareJsonResponse(response);
        response.getWriter().write(body.toJSONString());
    }
}
