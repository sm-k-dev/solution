package sentinel.controller;

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
import sentinel.dao.IncidentManagementDAO;
import sentinel.dao.IncidentAnalysisDAO;
import sentinel.dao.IncidentInquiryDAO;
import sentinel.dto.Incident;
import sentinel.service.IncidentAiService;
import sentinel.service.IncidentAlertService;
import sentinel.service.IncidentStatusService;

@WebServlet(urlPatterns = {"/sentinel/incidents", "/sentinel/incident", "/sentinel/incident/status", "/sentinel/incident/analyze", "/sentinel/daily-summary", "/sentinel/incident/inquiry/link", "/sentinel/incident/inquiry/unlink"})
public class IncidentManagementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final IncidentManagementDAO dao = new IncidentManagementDAO();
    private final IncidentAnalysisDAO analysisDao = new IncidentAnalysisDAO();
    private final IncidentInquiryDAO inquiryDao = new IncidentInquiryDAO();
    private final IncidentAiService aiService = new IncidentAiService();
    private final IncidentAlertService alertService = new IncidentAlertService();
    private final IncidentStatusService statusService = new IncidentStatusService();

    @Override protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!isAdmin(request)) { response.sendError(HttpServletResponse.SC_FORBIDDEN); return; }
        String path = request.getServletPath();
        try {
            if ("/sentinel/incidents".equals(path)) {
                request.setAttribute("csrfToken", csrfToken(request.getSession(false)));
                request.setAttribute("incidents", dao.findIncidentList());
                request.getRequestDispatcher("/admin/sentinel-incident-list.jsp")
                    .forward(request, response);
                return;
            }
            if ("/sentinel/incident".equals(path)) {
                long id = parsePositiveId(request.getParameter("id"));
                Incident incident = dao.findIncidentById(id);
                if (incident == null) { response.sendError(HttpServletResponse.SC_NOT_FOUND); return; }
                request.setAttribute("csrfToken", csrfToken(request.getSession(false)));
                request.setAttribute("incident", incident);
                request.setAttribute("history", dao.findIncidentHistoryList(id));
                request.setAttribute("analysis", analysisDao.findLatestAnalysis(id));
                request.setAttribute("linkedInquiries", inquiryDao.findLinkedInquiryList(id));
                request.getRequestDispatcher("/admin/sentinel-incident-detail.jsp")
                    .forward(request, response);
                return;
            }
            response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        } catch (NumberFormatException error) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        } catch (SQLException | NamingException error) {
            throw new ServletException("Incident lookup failed", error);
        }
    }

    @Override protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
        if (!isAdmin(request)) { response.sendError(HttpServletResponse.SC_FORBIDDEN); return; }
        String path = request.getServletPath();
        if (!"/sentinel/incident/status".equals(path) &&
            !"/sentinel/incident/analyze".equals(path) &&
            !"/sentinel/daily-summary".equals(path) &&
            !"/sentinel/incident/inquiry/link".equals(path) &&
            !"/sentinel/incident/inquiry/unlink".equals(path)) {
            response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED); return;
        }
        HttpSession session = request.getSession(false);
        Object actor = session.getAttribute("memberId");
        String token = (String) session.getAttribute("incidentCsrfToken");
        if (!(actor instanceof Number) || token == null ||
            !token.equals(request.getParameter("csrfToken"))) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN); return;
        }
        try {
            if ("/sentinel/daily-summary".equals(path)) {
                boolean sent = alertService.sendPreviousDaySummary();
                response.sendRedirect(request.getContextPath() + "/sentinel/incidents?summary=" +
                    (sent ? "sent" : "skipped"));
                return;
            }
            long id = parsePositiveId(request.getParameter("id"));
            if ("/sentinel/incident/inquiry/link".equals(path) ||
                "/sentinel/incident/inquiry/unlink".equals(path)) {
                long inquiryId = parsePositiveId(request.getParameter("inquiryId"));
                if ("/sentinel/incident/inquiry/link".equals(path)) {
                    String reason = request.getParameter("reason");
                    if (reason != null) reason = reason.trim();
                    if (reason != null && reason.length() > 500) {
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST); return;
                    }
                    int result = inquiryDao.insertIncidentInquiry(id, inquiryId,
                        ((Number) actor).longValue(), reason == null || reason.isEmpty() ? null : reason);
                    if (result == 0) { response.sendError(HttpServletResponse.SC_NOT_FOUND); return; }
                    if (result < 0) { response.sendError(HttpServletResponse.SC_CONFLICT); return; }
                } else if (!inquiryDao.softDeleteIncidentInquiry(id, inquiryId)) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND); return;
                }
                completeMutation(request, response, request.getContextPath() + "/sentinel/incident?id=" + id);
                return;
            }
            if ("/sentinel/incident/analyze".equals(path)) {
                Incident incident = dao.findIncidentById(id);
                if (incident == null) { response.sendError(HttpServletResponse.SC_NOT_FOUND); return; }
                try {
                    analysisDao.insertAnalysis(id, aiService.analyzeIncident(incident));
                    completeMutation(request, response, request.getContextPath() + "/sentinel/incident?id=" + id);
                } catch (IOException aiError) {
                    getServletContext().log("SentinelOps AI analysis unavailable", aiError);
                    if (isFetchRequest(request)) {
                        response.sendError(HttpServletResponse.SC_BAD_GATEWAY, "AI analysis unavailable");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/sentinel/incident?id=" + id + "&aiError=1");
                    }
                }
                return;
            }
            String expected = request.getParameter("expectedStatus");
            String next = request.getParameter("newStatus");
            if (!statusService.isAllowedTransition(expected, next)) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST); return;
            }
            if (!statusService.updateIncidentStatus(id, ((Number) actor).longValue(), expected, next)) {
                response.sendError(HttpServletResponse.SC_CONFLICT); return;
            }
            completeMutation(request, response, request.getContextPath() + "/sentinel/incident?id=" + id);
        } catch (NumberFormatException error) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        } catch (SQLException | NamingException error) {
            throw new ServletException("Incident status update failed", error);
        }
    }

    private boolean isFetchRequest(HttpServletRequest request) {
        return "fetch".equalsIgnoreCase(request.getHeader("X-Requested-With"));
    }

    private void completeMutation(HttpServletRequest request, HttpServletResponse response, String redirect)
            throws IOException {
        if (isFetchRequest(request)) {
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
        if (id <= 0) throw new NumberFormatException("Invalid incident id");
        return id;
    }

    private String csrfToken(HttpSession session) {
        String token = (String) session.getAttribute("incidentCsrfToken");
        if (token == null) {
            token = UUID.randomUUID().toString();
            session.setAttribute("incidentCsrfToken", token);
        }
        return token;
    }
}
