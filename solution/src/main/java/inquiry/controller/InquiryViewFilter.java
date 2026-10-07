package inquiry.controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.naming.NamingException;
import board.dao.BoardDAO;
import board.service.BoardService;

public class InquiryViewFilter implements Filter {
    private BoardService boardService;

    @Override
    public void init(FilterConfig config) throws ServletException {
        try {
            boardService = new BoardService(new BoardDAO());
        } catch (NamingException error) {
            throw new ServletException("공지사항 DB 자원을 찾지 못했습니다.", error);
        }
    }

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
    throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String path = httpRequest.getServletPath();
        if ("REQUEST".equals(httpRequest.getDispatcherType().name()) && "/inquiry/write.jsp".equals(path)) {
            ((HttpServletResponse) response).sendRedirect(httpRequest.getContextPath() + "/inquiry/new");
            return;
        }
        if ("REQUEST".equals(httpRequest.getDispatcherType().name()) && "/inquiry/index.jsp".equals(path)) {
            try {
                int noticeCount = boardService.count("NOTICE", "");
                httpRequest.setAttribute("noticeList", boardService.findPage("NOTICE", "", 1));
                httpRequest.setAttribute("noticeCount", Integer.valueOf(noticeCount));
            } catch (Exception error) {
                throw new ServletException("공지사항을 불러오는 중 오류가 발생했습니다.", error);
            }
        }
        chain.doFilter(request, response);
    }
}
