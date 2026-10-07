package sentinel.service;

import java.sql.SQLException;

/** Stable severity rules. AI-generated explanations must not override this result. */
public class SeverityClassifier {

    public String classifySeverity(int status, Throwable error, String requestUri) {
        if (status == 503 || hasDatabaseConnectionFailure(error)) {
            return "CRITICAL";
        }
        if (status >= 500 && isAccountRequest(requestUri)) {
            return "CRITICAL";
        }
        if (status == 500 || status == 502 || status == 504) {
            return "HIGH";
        }
        if (status >= 500) {
            return "MEDIUM";
        }
        return "LOW";
    }

    private boolean hasDatabaseConnectionFailure(Throwable error) {
        // A servlet/JSP may wrap the original SQLException in several layers.
        for (Throwable cause = error; cause != null; cause = cause.getCause()) {
            if (cause instanceof SQLException) {
                String state = ((SQLException) cause).getSQLState();
                if (state != null && state.startsWith("08")) {
                    return true;
                }
            }
        }
        return false;
    }

    private boolean isAccountRequest(String requestUri) {
        if (requestUri == null) {
            return false;
        }
        return requestUri.contains("/member/login") || requestUri.contains("/member/signup");
    }
}
