package common.web;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** Servlet 컨트롤러에서 반복되는 요청 판별과 응답 처리를 제공합니다. */
public final class WebRequestSupport {

    private WebRequestSupport() {
    }

    public static long parsePositiveId(String value, String fieldName) {
        long id = Long.parseLong(value);
        if (id <= 0) {
            throw new NumberFormatException("Invalid " + fieldName);
        }
        return id;
    }

    public static boolean isFetchRequest(HttpServletRequest request) {
        String requestedWith = request.getHeader("X-Requested-With");
        return "fetch".equalsIgnoreCase(requestedWith)
            || "XMLHttpRequest".equalsIgnoreCase(requestedWith);
    }

    public static void completeMutation(HttpServletRequest request,
        HttpServletResponse response, String redirectUrl) throws IOException {
        if (isFetchRequest(request)) {
            response.setStatus(HttpServletResponse.SC_NO_CONTENT);
        } else {
            response.sendRedirect(redirectUrl);
        }
    }
}
