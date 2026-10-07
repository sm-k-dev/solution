package admin.controller;

import java.io.IOException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import admin.dao.AdminMemberDAO;
import admin.dto.AdminMemberDTO;
import board.dao.BoardDAO;
import common.security.CsrfTokenManager;

public class AdminManagementController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int PAGE_SIZE = 15;
    private AdminMemberDAO memberDAO;
    private BoardDAO boardDAO;

    @Override
    public void init() throws ServletException {
        try {
            memberDAO = new AdminMemberDAO();
            boardDAO = new BoardDAO();
        } catch (NamingException e) {
            throw new ServletException("관리자 관리 기능의 DB 자원을 찾지 못했습니다.", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String path = req.getServletPath();
        String pathInfo = req.getPathInfo();
        try {
            if (path.startsWith("/admin/members") && "/detail".equals(pathInfo)) {
                showMemberDetail(req, resp);
            } else if (path.startsWith("/admin/members")) {
                showMembers(req, resp);
            } else if (path.startsWith("/admin/boards") && "/detail".equals(pathInfo)) {
                showBoardDetail(req, resp);
            } else if (path.startsWith("/admin/boards")) {
                showBoards(req, resp);
            } else resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        } catch (IllegalArgumentException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        } catch (Exception e) {
            throw new ServletException("관리자 목록을 불러오지 못했습니다.", e);
        }
    }

    private void showMemberDetail(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        long id = positive(req.getParameter("id"));
        AdminMemberDTO member = memberDAO.findById(id);
        if (member == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "회원을 찾을 수 없습니다.");
            return;
        }
        req.setAttribute("managedMember", member);
        req.setAttribute("csrfToken", CsrfTokenManager.getOrCreate(req));
        req.setAttribute("activeAdminCount", memberDAO.countByRole("ADMIN"));
        req.getRequestDispatcher("/admin/member-detail.jsp").forward(req, resp);
    }

    private void showBoardDetail(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        long id = positive(req.getParameter("id"));
        board.dto.BoardDTO board = boardDAO.findById(id, false);
        if (board == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        req.setAttribute("board", board);
        req.setAttribute("boardFiles", boardDAO.findFiles(id));
        req.setAttribute("comments", boardDAO.findComments(id));
        req.setAttribute("csrfToken", CsrfTokenManager.getOrCreate(req));
        req.getRequestDispatcher("/admin/board-detail.jsp").forward(req, resp);
    }

    private void showMembers(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String q = value(req.getParameter("q"));
        String status = value(req.getParameter("status"));
        if (!"ACTIVE".equals(status) && !"SUSPENDED".equals(status) && !"WITHDRAWN".equals(status)) {
            status = "ALL";
        }
        int page = page(req.getParameter("page"));
        int total = memberDAO.count(q, status);
        int pages = Math.max(1, (total + PAGE_SIZE - 1) / PAGE_SIZE);
        page = Math.min(page, pages);
        req.setAttribute("memberList", memberDAO.findPage(q, status, (page - 1) * PAGE_SIZE, PAGE_SIZE));
        req.setAttribute("q", q);
        req.setAttribute("statusFilter", status);
        req.setAttribute("currentPage", page);
        req.setAttribute("pageCount", pages);
        req.setAttribute("totalCount", total);
        req.setAttribute("activeMemberCount", memberDAO.countByStatus("ACTIVE"));
        req.setAttribute("suspendedMemberCount", memberDAO.countByStatus("SUSPENDED"));
        req.setAttribute("adminCount", memberDAO.countByRole("ADMIN"));
        req.setAttribute("csrfToken", CsrfTokenManager.getOrCreate(req));
        req.getRequestDispatcher("/admin/member-list.jsp").forward(req, resp);
    }

    private void showBoards(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String category = value(req.getParameter("category"));
        if (!board.service.BoardService.isCategory(category)) {
            category = "FREE";
        }
        String q = value(req.getParameter("q"));
        int page = page(req.getParameter("page"));
        int total = boardDAO.count(category, q);
        int pages = Math.max(1, (total + PAGE_SIZE - 1) / PAGE_SIZE);
        page = Math.min(page, pages);
        req.setAttribute("boardList", boardDAO.findPage(category, q, (page - 1) * PAGE_SIZE, PAGE_SIZE));
        req.setAttribute("category", category);
        req.setAttribute("q", q);
        req.setAttribute("currentPage", page);
        req.setAttribute("pageCount", pages);
        req.setAttribute("totalCount", total);
        req.setAttribute("csrfToken", CsrfTokenManager.getOrCreate(req));
        req.getRequestDispatcher("/admin/board-list.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        if (!CsrfTokenManager.isValid(req, req.getParameter("csrfToken"))) {
            sendMutationError(req, resp, HttpServletResponse.SC_FORBIDDEN,
                "요청 토큰이 만료되었습니다. 새로고침 후 다시 시도해주세요.");
            return;
        }
        try {
            String path = req.getServletPath();
            String pathInfo = req.getPathInfo();
            if (path.startsWith("/admin/members")) {
                long id = positive(req.getParameter("memberId"));
                if (isSelf(req, id)) {
                    sendMutationError(req, resp, HttpServletResponse.SC_BAD_REQUEST,
                        "현재 로그인한 관리자 계정은 직접 변경할 수 없습니다.");
                    return;
                }
                if ("/status".equals(pathInfo)) {
                    if (!memberDAO.updateUserStatus(id, value(req.getParameter("status")))) {
                        sendMutationError(req, resp, HttpServletResponse.SC_CONFLICT, "일반 회원의 상태를 변경하지 못했습니다.");
                        return;
                    }
                    sendMutationSuccess(req, resp, id, "회원 이용 상태를 변경했습니다.");
                } else if ("/role".equals(pathInfo)) {
                    if (!memberDAO.updateRole(id, value(req.getParameter("role")))) {
                        sendMutationError(req, resp, HttpServletResponse.SC_CONFLICT,
                            "권한을 변경하지 못했습니다. 최소 한 명의 활성 관리자가 필요합니다.");
                        return;
                    }
                    sendMutationSuccess(req, resp, id, "회원 권한을 변경했습니다.");
                } else {
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
            } else if (path.startsWith("/admin/boards")) {
                long id = positive(req.getParameter("boardId"));
                boardDAO.softDelete(id);
                String category = req.getParameter("category");
                if (!board.service.BoardService.isCategory(category)) {
                    category = "FREE";
                }
                resp.sendRedirect(req.getContextPath() + "/admin/boards?category="    + category + "&deleted=1");
            } else resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        } catch (IllegalArgumentException e) {
            sendMutationError(req, resp, HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
        } catch (Exception e) {
            throw new ServletException("관리자 변경을 저장하지 못했습니다.", e);
        }
    }

    private boolean isSelf(HttpServletRequest req, long memberId) {
        HttpSession session = req.getSession(false);
        Object self = session == null ? null : session.getAttribute("memberId");
        return self instanceof Number && ((Number) self).longValue() == memberId;
    }

    private boolean isAjax(HttpServletRequest req) {
        return "true".equals(req.getParameter("ajax")) || "XMLHttpRequest".equals(req.getHeader("X-Requested-With"));
    }

    private void sendMutationSuccess(HttpServletRequest req, HttpServletResponse resp, long memberId, String message) throws IOException {
        if (isAjax(req)) {
            resp.setContentType("application/json; charset=UTF-8");
            resp.getWriter().write("{\"ok\":true,\"message\":\""    + message + "\"}");
        } else resp.sendRedirect(req.getContextPath() + "/admin/members/detail?id="    + memberId + "&updated=1");
    }

    private void sendMutationError(HttpServletRequest req, HttpServletResponse resp, int status, String message) throws IOException {
        if (isAjax(req)) {
            resp.setStatus(status);
            resp.setContentType("application/json; charset=UTF-8");
            resp.getWriter().write("{\"ok\":false,\"message\":\""    + message + "\"}");
        } else resp.sendError(status, message);
    }

    private String value(String s) {
        return s == null ? "" : s.trim();
    }

    private int page(String s) {
        try {
            return Math.max(1, Integer.parseInt(s));
        } catch (Exception e) {
            return 1;
        }
    }

    private long positive(String s) {
        try {
            long v = Long.parseLong(s);
            if (v > 0) {
                return v;
            }
        } catch (Exception ignored) {
        }
        throw new IllegalArgumentException("잘못된 요청 값입니다.");
    }
}
