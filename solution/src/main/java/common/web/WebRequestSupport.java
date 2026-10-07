package common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/** Shared helpers for request parsing and progressive enhancement responses. */
public final class WebRequestSupport {

    private WebRequestSupport() {
    }

    public static long parsePositiveId(String value) {
        long id = Long.parseLong(value);
        if (id < 1) {
            throw new NumberFormatException("Identifier must be positive");
        }
        return id;
    }

    public static boolean isFetchRequest(HttpServletRequest request) {
        String requestedWith = request.getHeader("X-Requested-With");
        return "fetch".equalsIgnoreCase(requestedWith)
        || "XMLHttpRequest".equalsIgnoreCase(requestedWith);
    }

    public static void completeMutation(HttpServletRequest request, HttpServletResponse response,
        String redirect) throws IOException {
        if (isFetchRequest(request)) {
            response.setStatus(HttpServletResponse.SC_NO_CONTENT);
        } else {
            response.sendRedirect(redirect);
        }
    }
}
