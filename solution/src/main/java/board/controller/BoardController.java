package board.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;
import java.net.URLEncoder;
import java.util.List;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import board.dao.BoardDAO;
import board.dto.BoardDTO;
import board.dto.BoardFileDTO;
import board.service.BoardService;
import common.security.CsrfTokenManager;
import common.web.SessionUser;

@MultipartConfig(maxFileSize = 10485760L, maxRequestSize = 41943040L)
public class BoardController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Set<String> ALLOWED_EXTENSIONS = new HashSet<String>(Arrays.asList("pdf", "png", "jpg", "jpeg", "gif", "txt", "csv", "doc", "docx", "xls", "xlsx", "ppt", "pptx", "zip"));
    private BoardDAO dao;
    private BoardService service;

    @Override
    public void init() throws ServletException {
        try {
            dao = new BoardDAO();
            service = new BoardService(dao);
        } catch (NamingException e) {
            throw new ServletException("게시판 DB 자원을 찾지 못했습니다.", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String path = req.getServletPath();
        try {
            if ("/board".equals(path) || "/board/list".equals(path)) {
                showList(req, resp);
            } else if ("/board/write".equals(path)) {
                showWrite(req, resp, null);
            } else if ("/board/detail".equals(path)) {
                showDetail(req, resp);
            } else if ("/board/edit".equals(path)) {
                showEdit(req, resp);
            } else if ("/board/file".equals(path)) {
                downloadFile(req, resp);
            } else resp.sendError(404);
        } catch (IllegalArgumentException e) {
            resp.sendError(400, e.getMessage());
        } catch (Exception e) {
            throw new ServletException("게시판 화면을 불러오지 못했습니다.", e);
        }
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String category = BoardService.clean(req.getParameter("category"));
        if (!BoardService.isCategory(category)) {
            category = "FREE";
        }
        String query = BoardService.clean(req.getParameter("q"));
        int page = parsePage(req.getParameter("page"));
        int total = service.count(category, query);
        page = Math.min(page, service.pageCount(total));
        req.setAttribute("boardList", service.findPage(category, query, page));
        req.setAttribute("category", category);
        req.setAttribute("searchQuery", query);
        req.setAttribute("currentPage", page);
        req.setAttribute("pageCount", service.pageCount(total));
        req.setAttribute("totalCount", total);
        String selectedId = req.getParameter("id");
        if (selectedId != null && !selectedId.trim().isEmpty()) {
            long id = parseId(selectedId);
            dao.incrementViewCount(id);
            BoardDTO selected = dao.findById(id, false);
            if (selected == null) {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
            if (!category.equals(selected.getCategory())) {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
            req.setAttribute("selectedBoard", selected);
            req.setAttribute("selectedComments", dao.findComments(id));
            req.setAttribute("selectedFiles", dao.findFiles(id));
            req.setAttribute("csrfToken", CsrfTokenManager.getOrCreate(req));
        }
        req.getRequestDispatcher("/board/board.jsp").forward(req, resp);
    }

    private void showWrite(HttpServletRequest req, HttpServletResponse resp, BoardDTO board) throws Exception {
        if (!SessionUser.isLoggedIn(req)) {
            resp.sendRedirect(req.getContextPath() + "/member/login.do");
            return;
        }
        String category = board == null?BoardService.clean(req.getParameter("category")):board.getCategory();
        if (!BoardService.isCategory(category)) {
            category = "FREE";
        }
        req.setAttribute("board", board);
        req.setAttribute("writeCategory", category);
        req.setAttribute("editMode", Boolean.valueOf(board != null));
        req.setAttribute("inlineDetail", Boolean.valueOf("true".equals(req.getParameter("inlineDetail"))));
        req.setAttribute("csrfToken", CsrfTokenManager.getOrCreate(req));
        req.getRequestDispatcher("/board/write.jsp").forward(req, resp);
    }

    private void showEdit(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        BoardDTO board = dao.findById(parseId(req.getParameter("id")), false);
        if (board == null) {
            resp.sendError(404);
            return;
        }
        if (!canEdit(req, board)) {
            resp.sendError(403);
            return;
        }
        showWrite(req, resp, board);
    }

    private void showDetail(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        long id = parseId(req.getParameter("id"));
        dao.incrementViewCount(id);
        BoardDTO board = dao.findById(id, false);
        if (board == null) {
            resp.sendError(404);
            return;
        }
        req.setAttribute("board", board);
        req.setAttribute("comments", dao.findComments(id));
        req.setAttribute("boardFiles", dao.findFiles(id));
        req.setAttribute("csrfToken", CsrfTokenManager.getOrCreate(req));
        req.getRequestDispatcher("/board/detail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String path = req.getServletPath();
        try {
            if (!CsrfTokenManager.isValid(req, req.getParameter("csrfToken"))) {
                resp.sendError(403, "요청 토큰이 만료되었습니다.");
                return;
            }
            if ("/board/create".equals(path)) {
                create(req, resp);
            } else if ("/board/update".equals(path)) {
                update(req, resp);
            } else if ("/board/delete".equals(path)) {
                delete(req, resp);
            } else if ("/board/comment".equals(path)) {
                comment(req, resp);
            } else if ("/board/comment/delete".equals(path)) {
                deleteComment(req, resp);
            } else resp.sendError(404);
        } catch (IllegalArgumentException e) {
            resp.sendError(400, e.getMessage());
        } catch (Exception e) {
            throw new ServletException("게시판 요청 처리 중 오류가 발생했습니다.", e);
        }
    }

    private void create(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        long memberId = requireActiveMember(req, resp);
        if (memberId < 1) {
            return;
        }
        BoardDTO b = readForm(req);
        if ("NOTICE".equals(b.getCategory()) && !SessionUser.isAdmin(req)) {
            resp.sendError(403);
            return;
        }
        validate(b);
        List<Part> uploads = collectUploads(req);
        b.setMemberId(memberId);
        long id = dao.insert(b);
        saveUploads(id, uploads);
        resp.sendRedirect(detailUrl(req, id, false, true, b.getCategory()));
    }

    private void update(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        long memberId = requireActiveMember(req, resp);
        if (memberId < 1) {
            return;
        }
        long id = parseId(req.getParameter("boardId"));
        BoardDTO old = dao.findById(id, false);
        if (old == null) {
            resp.sendError(404);
            return;
        }
        if (!canEdit(req, old)) {
            resp.sendError(403);
            return;
        }
        BoardDTO b = readForm(req);
        validate(b);
        List<Part> uploads = collectUploads(req);
        b.setBoardId(id);
        b.setMemberId(old.getMemberId());
        if ("NOTICE".equals(b.getCategory()) && !SessionUser.isAdmin(req)) {
            resp.sendError(403);
            return;
        }
        if (!SessionUser.isAdmin(req)) {
            dao.update(b);
        } else updateAsAdmin(b, old);
        saveUploads(id, uploads);
        resp.sendRedirect(detailUrl(req, id, false, "true".equals(req.getParameter("inlineDetail")), old.getCategory()));
    }

    private void updateAsAdmin(BoardDTO b, BoardDTO old) throws Exception {
        // Keep ownership intact; admin moderation updates through the same DAO with the original owner id.
        b.setMemberId(old.getMemberId());
        if (!dao.update(b)) {
            throw new IllegalArgumentException("게시글이 변경되어 저장하지 못했습니다.");
        }
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        long memberId = requireActiveMember(req, resp);
        if (memberId < 1) {
            return;
        }
        long id = parseId(req.getParameter("boardId"));
        BoardDTO board = dao.findById(id, false);
        if (board == null) {
            resp.sendError(404);
            return;
        }
        if (!canEdit(req, board)) {
            resp.sendError(403);
            return;
        }
        if (SessionUser.isAdmin(req)) {
            dao.softDelete(id);
        } else dao.softDelete(id, memberId);
        resp.sendRedirect(req.getContextPath() + "/board/list?category=" + board.getCategory() + "#board-list");
    }

    private void comment(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        long memberId = requireActiveMember(req, resp);
        if (memberId < 1) {
            return;
        }
        long boardId = parseId(req.getParameter("boardId"));
        String content = BoardService.clean(req.getParameter("content"));
        if (content.isEmpty() || content.length() > 2000) {
            throw new IllegalArgumentException("댓글은 1~2000자로 입력해주세요.");
        }
        String parent = req.getParameter("parentCommentId");
        Long parentId = parent == null || parent.trim().isEmpty() ? null : Long.valueOf(parseId(parent));
        BoardDTO board = dao.findById(boardId, false);
        if (board == null) {
            resp.sendError(404);
            return;
        }
        if (parentId != null && !dao.isCommentInBoard(parentId.longValue(), boardId)) {
            resp.sendError(400, "답글 대상 댓글이 게시글에 없습니다.");
            return;
        }
        dao.addComment(boardId, memberId, parentId, content);
        resp.sendRedirect(detailUrl(req, boardId, true, "true".equals(req.getParameter("inlineDetail")), board.getCategory()));
    }

    private void deleteComment(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        long memberId = requireActiveMember(req, resp);
        if (memberId < 1) {
            return;
        }
        long commentId = parseId(req.getParameter("commentId"));
        long boardId = parseId(req.getParameter("boardId"));
        BoardDTO board = dao.findById(boardId, false);
        if (board == null) {
            resp.sendError(404);
            return;
        }
        if (!dao.softDeleteComment(commentId, memberId, SessionUser.isAdmin(req))) {
            resp.sendError(403);
            return;
        }
        resp.sendRedirect(detailUrl(req, boardId, true, "true".equals(req.getParameter("inlineDetail")), board.getCategory()));
    }

    private List<Part> collectUploads(HttpServletRequest req) throws Exception {
        java.util.List<Part> result = new java.util.ArrayList<Part>();
        for (Part part : req.getParts()) {
            if (!"files".equals(part.getName()) || part.getSize() == 0) {
                continue;
            }
            if (part.getSize() > 10485760L) {
                throw new IllegalArgumentException("파일 하나의 크기는 10MB 이하여야 합니다.");
            }
            String name = submittedFileName(part);
            int dot = name == null ? -1 : name.lastIndexOf('.');
            String ext = dot < 0?"":name.substring(dot + 1).toLowerCase(java.util.Locale.ROOT);
            if (!ALLOWED_EXTENSIONS.contains(ext)) {
                throw new IllegalArgumentException("허용되지 않는 파일 형식입니다.");
            }
            result.add(part);
        }
        if (result.size() > 5) {
            throw new IllegalArgumentException("첨부파일은 최대 5개까지 등록할 수 있습니다.");
        }
        return result;
    }

    private void saveUploads(long boardId, List<Part> uploads) throws Exception {
        if (uploads.isEmpty()) {
            return;
        }
        String root = getServletContext().getRealPath("/WEB-INF/uploads/board");
        if (root == null) {
            throw new IOException("첨부파일 저장 경로를 확인할 수 없습니다.");
        }
        File directory = new File(root);
        if (!directory.exists() && !directory.mkdirs()) {
            throw new IOException("첨부파일 저장 폴더를 만들지 못했습니다.");
        }
        for (Part part : uploads) {
            String original = safeFileName(submittedFileName(part));
            int dot = original.lastIndexOf('.');
            String ext = original.substring(dot + 1).toLowerCase(java.util.Locale.ROOT);
            String saved = UUID.randomUUID().toString() + "." + ext;
            File destination = new File(directory, saved);
            part.write(destination.getAbsolutePath());
            BoardFileDTO file = new BoardFileDTO();
            file.setOriginalName(original);
            file.setSavedName(saved);
            file.setFilePath("/WEB-INF/uploads/board/" + saved);
            file.setFileSize(part.getSize());
            file.setFileType(getServletContext().getMimeType(original));
            dao.addFile(boardId, file);
        }
    }

    private String safeFileName(String value) {
        String name = value == null?"file":value.replace('\\', '/');
        name = name.substring(name.lastIndexOf('/') + 1).replaceAll("[\\r\\n\\p{Cntrl}]", "_");
        if (name.length() > 250) {
            name = name.substring(name.length()-250);
        }
        return name;
    }

    private String submittedFileName(Part part) {
        String header = part.getHeader("content-disposition");
        if (header == null) {
            return null;
        }
        for (String token:header.split(";")) {
            String value = token.trim();
            if (value.startsWith("filename=")) {
                String name = value.substring("filename=".length()).trim();
                if (name.startsWith("\"") && name.endsWith("\"") && name.length() > 1) {
                    name = name.substring(1, name.length()-1);
                }
                return name;
            }
        }
        return null;
    }

    private void downloadFile(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        long id = parseId(req.getParameter("id"));
        BoardFileDTO file = dao.findFile(id);
        if (file == null) {
            resp.sendError(404);
            return;
        }
        String root = getServletContext().getRealPath("/WEB-INF/uploads/board");
        if (root == null) {
            resp.sendError(404);
            return;
        }
        File base = new File(root).getCanonicalFile();
        File target = new File(base, file.getSavedName()).getCanonicalFile();
        if (!target.getPath().startsWith(base.getPath() + File.separator) || !target.isFile()) {
            resp.sendError(404);
            return;
        }
        String encoded = URLEncoder.encode(file.getOriginalName(), "UTF-8").replace("+", "%20");
        resp.setContentType(file.getFileType() == null?"application/octet-stream":file.getFileType());
        resp.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + encoded);
        resp.setContentLength((int) target.length());
        try (InputStream in = new FileInputStream(target);OutputStream out = resp.getOutputStream()) {
            byte[] buffer = new byte[8192];
            int length;
            while ((length = in.read(buffer)) != -1) {
                out.write(buffer, 0, length);
            }
        }
    }

    private BoardDTO readForm(HttpServletRequest req) {
        BoardDTO b = new BoardDTO();
        b.setCategory(BoardService.clean(req.getParameter("category")));
        b.setTitle(BoardService.clean(req.getParameter("title")));
        b.setContent(BoardService.clean(req.getParameter("content")));
        b.setTags(BoardService.clean(req.getParameter("tags")));
        return b;
    }

    private void validate(BoardDTO b) {
        if (!BoardService.isCategory(b.getCategory())) {
            throw new IllegalArgumentException("게시판 분류가 올바르지 않습니다.");
        }
        if (b.getTitle().isEmpty() || b.getTitle().length() > 200) {
            throw new IllegalArgumentException("제목은 1~200자로 입력해주세요.");
        }
        if (b.getContent().isEmpty()) {
            throw new IllegalArgumentException("내용을 입력해주세요.");
        }
        if (b.getTags().length() > 500) {
            throw new IllegalArgumentException("태그는 500자 이하로 입력해주세요.");
        }
    }

    private long requireActiveMember(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        if (!SessionUser.isLoggedIn(req)) {
            resp.sendRedirect(req.getContextPath() + "/member/login.do");
            return -1;
        }
        Long memberId = SessionUser.memberId(req);
        if (memberId == null) {
            resp.sendError(403);
            return -1;
        }
        long value = memberId.longValue();
        if (!dao.isMemberActive(value)) {
            req.getSession(false).invalidate();
            resp.sendRedirect(req.getContextPath() + "/member/login.do?status=suspended");
            return -1;
        }
        return value;
    }

    private boolean canEdit(HttpServletRequest req, BoardDTO b) {
        Long memberId = SessionUser.memberId(req);
        return SessionUser.isAdmin(req)
            || (memberId != null && memberId.longValue() == b.getMemberId());
    }

    private String detailUrl(HttpServletRequest req, long boardId, boolean comments, boolean inline, String category) {
        String path;
        if (SessionUser.isAdmin(req)) {
            path = "/admin/boards/detail?id=" + boardId;
        } else if (inline) {
            path = "/board/list?category=" + category + "&id=" + boardId;
        } else path = "/board/detail?id=" + boardId;
        return req.getContextPath() + path + (comments?"#comments":"#detail-preview-section");
    }

    private int parsePage(String s) {
        try {
            return Math.max(1, Integer.parseInt(s));
        } catch (Exception e) {
            return 1;
        }
    }

    private long parseId(String s) {
        try {
            long id = Long.parseLong(s);
            if (id < 1) {
                throw new NumberFormatException();
            }
            return id;
        } catch (Exception e) {
            throw new IllegalArgumentException("잘못된 게시글 번호입니다.");
        }
    }
}
