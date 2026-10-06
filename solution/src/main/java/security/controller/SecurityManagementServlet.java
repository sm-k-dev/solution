package security.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import security.dao.SecurityAnalysisDAO;
import security.dao.SecurityEventDAO;
import security.dto.SecurityEvent;
import security.service.SecurityAiService;
import security.service.SecurityAlertService;
import security.service.SecurityStatusService;

@WebServlet(urlPatterns = {"/security/events", "/security/event", "/security/event/status",
    "/security/event/analyze", "/security/daily-summary"})
public class SecurityManagementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final SecurityEventDAO eventDao = new SecurityEventDAO();
    private final SecurityAnalysisDAO analysisDao = new SecurityAnalysisDAO();
    private final SecurityAiService aiService = new SecurityAiService();
    private final SecurityAlertService alertService = new SecurityAlertService();
    private final SecurityStatusService statusService = new SecurityStatusService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!isAdmin(request)) { response.sendError(HttpServletResponse.SC_FORBIDDEN); return; }
        String path = request.getServletPath();
        try {
            if ("/security/events".equals(path)) {
                request.setAttribute("csrfToken", csrfToken(request.getSession(false)));
                request.setAttribute("securityEvents", eventDao.findRecentEvents());
                request.getRequestDispatcher("/admin/security-event-list.jsp")
                    .forward(request, response);
                return;
            }
            if ("/security/event".equals(path)) {
                long id = parsePositiveId(request.getParameter("id"));
                SecurityEvent event = eventDao.findById(id);
                if (event == null) { response.sendError(HttpServletResponse.SC_NOT_FOUND); return; }
                request.setAttribute("csrfToken", csrfToken(request.getSession(false)));
                request.setAttribute("securityEvent", event);
                request.setAttribute("history", eventDao.findHistory(id));
                request.setAttribute("analysis", analysisDao.findLatest(id));
                request.getRequestDispatcher("/admin/security-event-detail.jsp")
                    .forward(request, response);
                return;
            }
            response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        } catch (NumberFormatException error) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        } catch (SQLException | NamingException error) {
            throw new ServletException("Security event lookup failed", error);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        if (!isAdmin(request)) { response.sendError(HttpServletResponse.SC_FORBIDDEN); return; }
        String path = request.getServletPath();
        if (!"/security/event/status".equals(path) &&
            !"/security/event/analyze".equals(path) &&
            !"/security/daily-summary".equals(path)) {
            response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED); return;
        }
        HttpSession session = request.getSession(false);
        Object actor = session.getAttribute("memberId");
        String token = (String) session.getAttribute("securityCsrfToken");
        if (!(actor instanceof Number) || token == null ||
            !constantTimeEquals(token, request.getParameter("csrfToken"))) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN); return;
        }
        try {
            if ("/security/daily-summary".equals(path)) {
                boolean sent = alertService.sendPreviousDaySummary();
                response.setHeader("X-Security-Summary", sent ? "sent" : "skipped");
                complete(request, response, request.getContextPath() +
                    "/security/events?summary=" + (sent ? "sent" : "skipped"));
                return;
            }
            long id = parsePositiveId(request.getParameter("id"));
            if ("/security/event/analyze".equals(path)) {
                SecurityEvent event = eventDao.findById(id);
                if (event == null) { response.sendError(HttpServletResponse.SC_NOT_FOUND); return; }
                try {
                    analysisDao.insert(id, aiService.analyze(event));
                    complete(request, response,
                        request.getContextPath() + "/security/event?id=" + id);
                } catch (IOException aiError) {
                    getServletContext().log("Security AI analysis unavailable", aiError);
                    response.sendError(HttpServletResponse.SC_BAD_GATEWAY,
                        "AI analysis unavailable");
                }
                return;
            }
            String expected = request.getParameter("expectedStatus");
            String next = request.getParameter("newStatus");
            if (!statusService.isAllowedTransition(expected, next)) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST); return;
            }
            if (!statusService.update(id, ((Number) actor).longValue(), expected, next)) {
                response.sendError(HttpServletResponse.SC_CONFLICT); return;
            }
            complete(request, response, request.getContextPath() + "/security/event?id=" + id);
        } catch (NumberFormatException error) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        } catch (SQLException | NamingException error) {
            throw new ServletException("Security event update failed", error);
        }
    }

    private void complete(HttpServletRequest request, HttpServletResponse response, String redirect)
            throws IOException {
        if ("fetch".equalsIgnoreCase(request.getHeader("X-Requested-With"))) {
            response.setStatus(HttpServletResponse.SC_NO_CONTENT);
        } else {
            response.sendRedirect(redirect);
        }
    }

    private boolean isAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        return session != null && "ADMIN".equals(session.getAttribute("role")) &&
               session.getAttribute("memberId") instanceof Number;
    }

    private long parsePositiveId(String text) {
        long id = Long.parseLong(text);
        if (id <= 0) throw new NumberFormatException("Invalid security event id");
        return id;
    }

    private String csrfToken(HttpSession session) {
        String token = (String) session.getAttribute("securityCsrfToken");
        if (token == null) {
            token = UUID.randomUUID().toString();
            session.setAttribute("securityCsrfToken", token);
        }
        return token;
    }

    private boolean constantTimeEquals(String expected, String actual) {
        if (actual == null || expected.length() != actual.length()) return false;
        int difference = 0;
        for (int index = 0; index < expected.length(); index++) {
            difference |= expected.charAt(index) ^ actual.charAt(index);
        }
        return difference == 0;
    }
}
