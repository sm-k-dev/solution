package admin.controller;

import common.web.SessionUser;
import common.web.CacheControlSupport;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminAccessFilter implements Filter {

    @Override
    public void init(FilterConfig config) throws ServletException {
    }

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
    throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        CacheControlSupport.preventCaching(httpResponse);
        if (!SessionUser.isLoggedIn(httpRequest)) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/member/login.do");
            return;
        }
        if (!SessionUser.isAdmin(httpRequest)) {
            httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "관리자 권한이 필요합니다.");
            return;
        }
        chain.doFilter(request, response);
    }
}
