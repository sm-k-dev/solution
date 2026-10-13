package common.api;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import javax.servlet.http.HttpServletRequest;

/** 공통 서버 간 API Key 인증 처리입니다. */
public final class ApiKeyAuthenticator {
    private static final String ENVIRONMENT_KEY = "NEXORA_API_KEY";
    private static final String HEADER_NAME = "X-API-Key";

    private ApiKeyAuthenticator() {
    }

    public static boolean isConfigured() {
        String expected = System.getenv(ENVIRONMENT_KEY);
        return expected != null && !expected.trim().isEmpty();
    }

    public static boolean isAuthorized(HttpServletRequest request) {
        String expected = System.getenv(ENVIRONMENT_KEY);
        String supplied = request.getHeader(HEADER_NAME);
        if (expected == null || expected.trim().isEmpty() || supplied == null || supplied.isEmpty()) {
            return false;
        }
        return MessageDigest.isEqual(
            expected.getBytes(StandardCharsets.UTF_8),
            supplied.getBytes(StandardCharsets.UTF_8));
    }
}
