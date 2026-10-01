package admin.controller;

import java.io.IOException;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import admin.dao.AdminMemberDAO;
import board.dao.BoardDAO;
import common.security.CsrfTokenManager;

public class AdminManagementController extends HttpServlet {
    private static final long serialVersionUID=1L;
    private static final int PAGE_SIZE=15;
    private AdminMemberDAO memberDAO;private BoardDAO boardDAO;
    @Override public void init()throws ServletException{try{memberDAO=new AdminMemberDAO();boardDAO=new BoardDAO();}catch(NamingException e){throw new ServletException("관리자 관리 기능의 DB 자원을 찾지 못했습니다.",e);}}
    @Override protected void doGet(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        req.setCharacterEncoding("UTF-8");String path=req.getServletPath();
        try{
            if(path.startsWith("/admin/members")) showMembers(req,resp);
            else if(path.startsWith("/admin/boards") && "/detail".equals(req.getPathInfo())) showBoardDetail(req,resp);
            else if(path.startsWith("/admin/boards")) showBoards(req,resp);
            else resp.sendError(404);
        } catch(Exception e){throw new ServletException("관리자 목록을 불러오지 못했습니다.",e);}
    }
    private void showBoardDetail(HttpServletRequest req,HttpServletResponse resp)throws Exception{
        long id=positive(req.getParameter("id"));
        board.dto.BoardDTO board=boardDAO.findById(id,false);
        if(board==null){resp.sendError(HttpServletResponse.SC_NOT_FOUND);return;}
        req.setAttribute("board",board);
        req.setAttribute("boardFiles",boardDAO.findFiles(id));
        req.setAttribute("comments",boardDAO.findComments(id));
        req.setAttribute("csrfToken",CsrfTokenManager.getOrCreate(req));
        req.getRequestDispatcher("/admin/board-detail.jsp").forward(req,resp);
    }
    private void showMembers(HttpServletRequest req,HttpServletResponse resp)throws Exception{
        String q=value(req.getParameter("q"));String status=value(req.getParameter("status"));if(!"ACTIVE".equals(status)&&!"SUSPENDED".equals(status)&&!"WITHDRAWN".equals(status))status="ALL";
        int page=page(req.getParameter("page")),total=memberDAO.count(q,status),pages=Math.max(1,(total+PAGE_SIZE-1)/PAGE_SIZE);page=Math.min(page,pages);
        req.setAttribute("memberList",memberDAO.findPage(q,status,(page-1)*PAGE_SIZE,PAGE_SIZE));req.setAttribute("q",q);req.setAttribute("statusFilter",status);req.setAttribute("currentPage",page);req.setAttribute("pageCount",pages);req.setAttribute("totalCount",total);req.setAttribute("activeMemberCount",memberDAO.countByStatus("ACTIVE"));req.setAttribute("suspendedMemberCount",memberDAO.countByStatus("SUSPENDED"));req.setAttribute("csrfToken",CsrfTokenManager.getOrCreate(req));req.getRequestDispatcher("/admin/member-list.jsp").forward(req,resp);
    }
    private void showBoards(HttpServletRequest req,HttpServletResponse resp)throws Exception{
        String category=value(req.getParameter("category"));if(!board.service.BoardService.isCategory(category))category="FREE";String q=value(req.getParameter("q"));int page=page(req.getParameter("page")),total=boardDAO.count(category,q),pages=Math.max(1,(total+PAGE_SIZE-1)/PAGE_SIZE);page=Math.min(page,pages);
        req.setAttribute("boardList",boardDAO.findPage(category,q,(page-1)*PAGE_SIZE,PAGE_SIZE));req.setAttribute("category",category);req.setAttribute("q",q);req.setAttribute("currentPage",page);req.setAttribute("pageCount",pages);req.setAttribute("totalCount",total);req.setAttribute("csrfToken",CsrfTokenManager.getOrCreate(req));req.getRequestDispatcher("/admin/board-list.jsp").forward(req,resp);
    }
    @Override protected void doPost(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException{
        req.setCharacterEncoding("UTF-8");if(!CsrfTokenManager.isValid(req,req.getParameter("csrfToken"))){resp.sendError(403,"요청 토큰이 만료되었습니다.");return;}
        try{String path=req.getServletPath();if(path.startsWith("/admin/members")){long id=positive(req.getParameter("memberId"));String status=req.getParameter("status");Object self=req.getSession(false).getAttribute("memberId");if(self instanceof Number&&((Number)self).longValue()==id){resp.sendError(400,"현재 관리자 계정은 여기서 변경할 수 없습니다.");return;}if(!memberDAO.updateUserStatus(id,status)){resp.sendError(400,"일반 회원의 상태 변경에 실패했습니다.");return;}resp.sendRedirect(req.getContextPath()+"/admin/members?updated=1");}
            else if(path.startsWith("/admin/boards")){long id=positive(req.getParameter("boardId"));boardDAO.softDelete(id);String category=req.getParameter("category");if(!board.service.BoardService.isCategory(category))category="FREE";resp.sendRedirect(req.getContextPath()+"/admin/boards?category="+category+"&deleted=1");}else resp.sendError(404);
        }catch(IllegalArgumentException e){resp.sendError(400,e.getMessage());}catch(Exception e){throw new ServletException("관리자 변경을 저장하지 못했습니다.",e);}
    }
    private String value(String s){return s==null?"":s.trim();}
    private int page(String s){try{return Math.max(1,Integer.parseInt(s));}catch(Exception e){return 1;}}
    private long positive(String s){try{long v=Long.parseLong(s);if(v>0)return v;}catch(Exception ignored){}throw new IllegalArgumentException("잘못된 요청 값입니다.");}
}
