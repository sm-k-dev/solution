package common.security;

import java.security.MessageDigest;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public final class CsrfTokenManager {
    private static final String SESSION_KEY = "csrfToken";

    private CsrfTokenManager() {
    }

    public static String getOrCreate(HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        String token = (String) session.getAttribute(SESSION_KEY);
        if (token == null) {
            token = UUID.randomUUID().toString();
            session.setAttribute(SESSION_KEY, token);
        }
        return token;
    }

    public static boolean isValid(HttpServletRequest request, String submittedToken) {
        HttpSession session = request.getSession(false);
        if (session == null || submittedToken == null) {
            return false;
        }
        String expected = (String) session.getAttribute(SESSION_KEY);
        if (expected == null) {
            return false;
        }
        return MessageDigest.isEqual(expected.getBytes(java.nio.charset.StandardCharsets.UTF_8),
            submittedToken.getBytes(java.nio.charset.StandardCharsets.UTF_8));
    }
}
