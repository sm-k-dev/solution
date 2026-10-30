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
import common.web.SessionUser;
import common.web.WebRequestSupport;

public class InquiryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private InquiryService inquiryService;

    @Override
    public void init() throws ServletException {
        try {
            inquiryService = new InquiryService(new InquiryDAO());
        } catch (NamingException error) {
            throw new ServletException("문의 기능의 DB 자원을 찾지 못했습니다.", error);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String path = request.getServletPath();
        if ("/inquiry/index".equals(path)) {
            response.sendRedirect(request.getContextPath() + "/inquiry/index.jsp");
        } else if ("/inquiry/new".equals(path)) {
            request.setAttribute("csrfToken", CsrfTokenManager.getOrCreate(request));
            request.getRequestDispatcher("/inquiry/write.jsp").forward(request, response);
        } else if ("/inquiry/success".equals(path)) {
            request.getRequestDispatcher("/inquiry/success.jsp").forward(request, response);
        } else if ("/inquiry/my".equals(path)) {
            Long memberId = SessionUser.memberId(request);
            if (memberId == null) {
                response.sendRedirect(request.getContextPath() + "/member/login.do");
                return;
            }
            try {
                request.setAttribute("inquiryList", inquiryService.findInquiriesByMember(memberId.longValue()));
                request.getRequestDispatcher("/inquiry/my-list.jsp").forward(request, response);
            } catch (Exception error) {
                throw new ServletException("내 문의 목록 조회 중 오류", error);
            }
        } else if ("/inquiry/detail".equals(path)) {
            Long memberId = SessionUser.memberId(request);
            if (memberId == null) {
                response.sendRedirect(request.getContextPath() + "/member/login.do");
                return;
            }
            try {
                InquiryDTO inquiry = inquiryService.findInquiryById(
                    WebRequestSupport.parsePositiveId(request.getParameter("id"), "inquiry id"));
                if (inquiry == null || inquiry.getMemberId() == null || inquiry.getMemberId().longValue() != memberId.longValue()) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    return;
                }
                request.setAttribute("inquiry", inquiry);
                request.getRequestDispatcher("/inquiry/my-detail.jsp").forward(request, response);
            } catch (IllegalArgumentException error) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            } catch (Exception error) {
                throw new ServletException("문의 상세 조회 중 오류", error);
            }
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        if (!CsrfTokenManager.isValid(request, request.getParameter("csrfToken"))) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "요청 토큰이 만료되었습니다. 다시 시도해 주세요.");
            return;
        }
        if (!"/inquiry/create".equals(request.getServletPath())) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        try {
            InquiryDTO inquiry = new InquiryDTO();
            inquiry.setContactName(request.getParameter("contactName"));
            inquiry.setContactEmail(request.getParameter("contactEmail"));
            inquiry.setCompanyName(request.getParameter("companyName"));
            inquiry.setCategory(request.getParameter("category"));
            inquiry.setTitle(request.getParameter("title"));
            inquiry.setContent(request.getParameter("content"));
            Long memberId = SessionUser.memberId(request);
            inquiry.setMemberId(memberId);
            long inquiryId = inquiryService.createInquiry(inquiry);
            response.sendRedirect(request.getContextPath() + "/inquiry/success?id="  + inquiryId);
        } catch (IllegalArgumentException error) {
            request.setAttribute("errorMessage", error.getMessage());
            request.setAttribute("csrfToken", CsrfTokenManager.getOrCreate(request));
            request.getRequestDispatcher("/inquiry/write.jsp").forward(request, response);
        } catch (Exception error) {
            throw new ServletException("문의 접수 중 오류", error);
        }
    }

}
