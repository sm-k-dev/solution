package security.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import common.security.CsrfTokenManager;
import common.web.SessionUser;
import common.web.WebRequestSupport;
import security.dao.SecurityAnalysisDAO;
import security.dao.SecurityEventDAO;
import security.dto.SecurityEvent;
import security.service.SecurityAiService;
import security.service.SecurityAlertService;
import security.service.SecurityStatusService;

@WebServlet(urlPatterns = {
    "/security/events", "/security/event", "/security/event/status",
        "/security/event/analyze", "/security/daily-summary"
})
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
        if (!SessionUser.isAdmin(request)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        String path = request.getServletPath();
        try {
            if ("/security/events".equals(path)) {
                request.setAttribute("csrfToken", CsrfTokenManager.getOrCreate(request));
                request.setAttribute("securityEvents", eventDao.findRecentEvents());
                request.getRequestDispatcher("/admin/security-event-list.jsp")
                .forward(request, response);
                return;
            }
            if ("/security/event".equals(path)) {
                long id = WebRequestSupport.parsePositiveId(request.getParameter("id"),
                    "security event id");
                SecurityEvent event = eventDao.findById(id);
                if (event == null) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    return;
                }
                request.setAttribute("csrfToken", CsrfTokenManager.getOrCreate(request));
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
        if (!SessionUser.isAdmin(request)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        String path = request.getServletPath();
        if (!"/security/event/status".equals(path) &&
        !"/security/event/analyze".equals(path) &&
        !"/security/daily-summary".equals(path)) {
            response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
            return;
        }
        Long actorId = SessionUser.memberId(request);
        if (actorId == null || !CsrfTokenManager.isValid(
            request, request.getParameter("csrfToken"))) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        try {
            if ("/security/daily-summary".equals(path)) {
                boolean sent = alertService.sendPreviousDaySummary();
                response.setHeader("X-Operation-Result", sent ? "sent" : "skipped");
                WebRequestSupport.completeMutation(request, response, request.getContextPath() +
                "/security/events?summary="  + (sent ? "sent" : "skipped"));
                return;
            }
            long id = WebRequestSupport.parsePositiveId(request.getParameter("id"),
                "security event id");
            if ("/security/event/analyze".equals(path)) {
                SecurityEvent event = eventDao.findById(id);
                if (event == null) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    return;
                }
                try {
                    analysisDao.insert(id, aiService.analyze(event));
                    WebRequestSupport.completeMutation(request, response,
                        request.getContextPath() + "/security/event?id="  + id);
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
                response.sendError(HttpServletResponse.SC_BAD_REQUEST);
                return;
            }
            if (!statusService.update(id, actorId.longValue(), expected, next)) {
                response.sendError(HttpServletResponse.SC_CONFLICT);
                return;
            }
            WebRequestSupport.completeMutation(request, response,
                request.getContextPath() + "/security/event?id="  + id);
        } catch (NumberFormatException error) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        } catch (SQLException | NamingException error) {
            throw new ServletException("Security event update failed", error);
        }
    }

}
