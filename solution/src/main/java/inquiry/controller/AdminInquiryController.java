package inquiry.controller;

import java.io.IOException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import inquiry.dao.InquiryDAO;
import inquiry.dto.InquiryDTO;
import inquiry.service.InquiryService;
import common.security.CsrfTokenManager;

public class AdminInquiryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private InquiryService inquiryService;

    @Override
    public void init() throws ServletException {
        try { inquiryService = new InquiryService(new InquiryDAO()); }
        catch (NamingException error) { throw new ServletException("문의 관리의 DB 자원을 찾지 못했습니다.", error); }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        request.setAttribute("csrfToken", CsrfTokenManager.getOrCreate(request));
        String path = request.getPathInfo();
        try {
            if (path == null || "/".equals(path) || "/list".equals(path)) {
                request.setAttribute("inquiryList", inquiryService.findAllInquiries());
                request.getRequestDispatcher("/admin/inquiry-list.jsp").forward(request, response);
            } else if ("/detail".equals(path)) {
                InquiryDTO inquiry = inquiryService.findInquiryById(parseId(request.getParameter("id")));
                if (inquiry == null) { response.sendError(HttpServletResponse.SC_NOT_FOUND); return; }
                request.setAttribute("inquiry", inquiry);
                request.getRequestDispatcher("/admin/inquiry-detail.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (IllegalArgumentException error) { response.sendError(HttpServletResponse.SC_BAD_REQUEST); }
        catch (Exception error) { throw new ServletException("관리자 문의 조회 중 오류", error); }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        if (!CsrfTokenManager.isValid(request, request.getParameter("csrfToken"))) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "요청 토큰이 만료되었습니다. 다시 시도해 주세요."); return;
        }
        if (!"/answer".equals(request.getPathInfo())) { response.sendError(HttpServletResponse.SC_NOT_FOUND); return; }
        long inquiryId;
        try { inquiryId = parseId(request.getParameter("inquiryId")); }
        catch (IllegalArgumentException error) { response.sendError(HttpServletResponse.SC_BAD_REQUEST); return; }
        Object value = request.getSession(false).getAttribute("memberId");
        if (!(value instanceof Number)) { response.sendError(HttpServletResponse.SC_FORBIDDEN); return; }
        long adminId = ((Number) value).longValue();
        try {
            boolean updated = inquiryService.answerInquiry(inquiryId, adminId,
                    request.getParameter("adminAnswer"), request.getParameter("status"));
            if (!updated) { response.sendError(HttpServletResponse.SC_NOT_FOUND); return; }
            response.sendRedirect(request.getContextPath() + "/admin/inquiry/detail?id=" + inquiryId + "&saved=1");
        } catch (IllegalArgumentException error) {
            request.setAttribute("errorMessage", error.getMessage());
            try {
                request.setAttribute("inquiry", inquiryService.findInquiryById(inquiryId));
                request.setAttribute("csrfToken", CsrfTokenManager.getOrCreate(request));
                request.getRequestDispatcher("/admin/inquiry-detail.jsp").forward(request, response);
            } catch (Exception reloadError) {
                throw new ServletException("답변 입력 오류 후 문의 화면을 다시 불러오지 못했습니다.", reloadError);
            }
        } catch (Exception error) {
            throw new ServletException("문의 답변 저장 중 오류", error);
        }
    }

    private long parseId(String value) {
        if (value == null || !value.matches("[0-9]{1,18}")) throw new IllegalArgumentException("invalid id");
        return Long.parseLong(value);
    }
}
