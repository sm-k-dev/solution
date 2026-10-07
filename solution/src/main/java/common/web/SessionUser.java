package common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/** 세션의 로그인 회원 정보를 일관된 방식으로 조회합니다. */
public final class SessionUser {

    private SessionUser() {
    }

    public static Long memberId(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Object value = session == null ? null : session.getAttribute("memberId");
        return value instanceof Number ? Long.valueOf(((Number) value).longValue()) : null;
    }

    public static String loginId(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Object value = session == null ? null : session.getAttribute("loginId");
        return value instanceof String ? (String) value : null;
    }

    public static boolean isLoggedIn(HttpServletRequest request) {
        return loginId(request) != null && memberId(request) != null;
    }

    public static boolean isAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null && memberId(request) != null
            && "ADMIN".equals(session.getAttribute("role"));
    }
}
