package common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/** Reads the authenticated identity consistently across application modules. */
public final class SessionUser {

    private SessionUser() {
    }

    public static boolean isLoggedIn(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null && session.getAttribute("memberId") instanceof Number
        && session.getAttribute("loginId") != null;
    }

    public static Long getMemberId(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Object value = session == null ? null : session.getAttribute("memberId");
        return value instanceof Number ? Long.valueOf(((Number) value).longValue()) : null;
    }

    public static boolean isAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null && "ADMIN".equals(session.getAttribute("role"))
        && session.getAttribute("memberId") instanceof Number;
    }
}
