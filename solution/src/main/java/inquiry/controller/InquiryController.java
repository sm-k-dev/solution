package inquiry.controller;

import java.io.IOException;
import java.util.List;
import common.security.CsrfTokenManager;
import common.web.CacheControlSupport;
import common.web.FileDownloadSupport;
import common.web.SessionUser;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import inquiry.dao.InquiryDAO;
import inquiry.dto.InquiryDTO;
import inquiry.dto.InquiryFileDTO;
import inquiry.service.InquiryAttachmentService;
import inquiry.service.InquiryService;

@MultipartConfig(maxFileSize = 10485760L, maxRequestSize = 41943040L)
public class InquiryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private InquiryService inquiryService;
    private final InquiryAttachmentService attachmentService = new InquiryAttachmentService();

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
        CacheControlSupport.preventCaching(response);
        String path = request.getServletPath();
        if ("/inquiry/index".equals(path)) {
            response.sendRedirect(request.getContextPath() + "/inquiry/index.jsp");
        } else if ("/inquiry/new".equals(path)) {
            request.setAttribute("csrfToken", CsrfTokenManager.getOrCreate(request));
            request.getRequestDispatcher("/inquiry/write.jsp").forward(request, response);
        } else if ("/inquiry/success".equals(path)) {
            request.getRequestDispatcher("/inquiry/success.jsp").forward(request, response);
        } else if ("/inquiry/my".equals(path)) {
            Long memberId = SessionUser.getMemberId(request);
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
            Long memberId = SessionUser.getMemberId(request);
            if (memberId == null) {
                response.sendRedirect(request.getContextPath() + "/member/login.do");
                return;
            }
            try {
                InquiryDTO inquiry = inquiryService.findInquiryById(parseId(request.getParameter("id")));
                if (inquiry == null || inquiry.getMemberId() == null || inquiry.getMemberId().longValue() != memberId.longValue()) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    return;
                }
                request.setAttribute("inquiry", inquiry);
                request.setAttribute("inquiryFiles",
                    inquiryService.findFilesByInquiryId(inquiry.getInquiryId()));
                request.getRequestDispatcher("/inquiry/my-detail.jsp").forward(request, response);
            } catch (IllegalArgumentException error) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            } catch (Exception error) {
                throw new ServletException("문의 상세 조회 중 오류", error);
            }
        } else if ("/inquiry/file".equals(path)) {
            try {
                downloadFile(request, response);
            } catch (IllegalArgumentException error) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            } catch (Exception error) {
                throw new ServletException("문의 첨부파일 다운로드 중 오류", error);
            }
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        CacheControlSupport.preventCaching(response);
        if (!"/inquiry/create".equals(request.getServletPath())) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        List<InquiryFileDTO> storedFiles = null;
        boolean inquirySaved = false;
        try {
            if (!CsrfTokenManager.isValid(request, request.getParameter("csrfToken"))) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN,
                    "요청 토큰이 만료되었습니다. 다시 시도해 주세요.");
                return;
            }
            InquiryDTO inquiry = new InquiryDTO();
            inquiry.setContactName(request.getParameter("contactName"));
            inquiry.setContactEmail(request.getParameter("contactEmail"));
            inquiry.setCompanyName(request.getParameter("companyName"));
            inquiry.setCategory(request.getParameter("category"));
            inquiry.setTitle(request.getParameter("title"));
            inquiry.setContent(request.getParameter("content"));
            Long memberId = SessionUser.getMemberId(request);
            inquiry.setMemberId(memberId);
            inquiryService.validateInquiry(inquiry);
            storedFiles = attachmentService.store(request);
            long inquiryId = inquiryService.createInquiry(inquiry, storedFiles);
            inquirySaved = true;
            response.sendRedirect(request.getContextPath() + "/inquiry/success?id="      + inquiryId);
        } catch (IllegalArgumentException error) {
            request.setAttribute("errorMessage", error.getMessage());
            request.setAttribute("csrfToken", CsrfTokenManager.getOrCreate(request));
            request.getRequestDispatcher("/inquiry/write.jsp").forward(request, response);
        } catch (IllegalStateException tooLarge) {
            response.sendError(HttpServletResponse.SC_REQUEST_ENTITY_TOO_LARGE);
        } catch (Exception error) {
            throw new ServletException("문의 접수 중 오류", error);
        } finally {
            if (!inquirySaved && storedFiles != null) {
                attachmentService.deleteFiles(getServletContext(), storedFiles);
            }
        }
    }

    private void downloadFile(HttpServletRequest request, HttpServletResponse response)
    throws Exception {
        long fileId = parseId(request.getParameter("id"));
        InquiryFileDTO file = inquiryService.findFile(fileId);
        Long memberId = SessionUser.getMemberId(request);
        boolean admin = SessionUser.isAdmin(request);
        if (file == null || (!admin && (memberId == null || file.getMemberId() == null
         || !memberId.equals(file.getMemberId())))) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        if (!FileDownloadSupport.writeAttachment(getServletContext(), response,
            "/WEB-INF/uploads/inquiry", file.getSavedName(), file.getOriginalName())) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private long parseId(String value) {
        if (value == null || !value.matches("[0-9]{1,18}")) {
            throw new IllegalArgumentException("invalid id");
        }
        return Long.parseLong(value);
    }
}
