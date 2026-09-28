package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dto.MemberDTO;
import member.service.MemberService;

public class MemberController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private MemberService memberService;

    @Override
    public void init() throws ServletException {
    	
        memberService = new MemberService();
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String action = request.getServletPath();

        System.out.println("[MemberController] 요청 주소 : " + action);

        HttpSession session = request.getSession(false);

        String loginId = null;

        if (session != null) {
        	
            loginId = (String) session.getAttribute("loginId");
        }

        try {

            if (loginId == null && ("/member/memberUpdate.do".equals(action) || "/member/memberUpdatePro.do".equals(action) || "/member/memberDelete.do".equals(action))) {
            	
                response.sendRedirect(request.getContextPath() + "/member/login.do");
                return;
            }

            if ("/member/login.do".equals(action)) {

                request.getRequestDispatcher("/member/login.jsp").forward(request, response);
                return;

            } else if ("/member/loginAction.do".equals(action)) {

                String loginIdParam = request.getParameter("userId");
                String password = request.getParameter("userPw");

                if (loginIdParam == null || loginIdParam.trim().isEmpty() || password == null || password.trim().isEmpty()) {
                	
                    request.setAttribute("errorMessage", "아이디와 비밀번호를 입력해주세요.");
                    request.getRequestDispatcher("/member/login.jsp").forward(request, response);
                    return;
                }

                MemberDTO member = memberService.login(loginIdParam, password);

                if (member != null) {

                    if (session != null) {
                        session.invalidate();
                    }

                    session = request.getSession(true);

                    session.setAttribute("memberId", member.getMemberId());
                    session.setAttribute("loginId", member.getLoginId());
                    session.setAttribute("name", member.getName());
                    session.setAttribute("role", member.getRole());

                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                    return;

                } else {

                    request.setAttribute("errorMessage", "아이디 또는 비밀번호가 올바르지 않습니다.");
                    request.getRequestDispatcher("/member/login.jsp").forward(request, response);
                    return;
                }

            } else if ("/member/logout.do".equals(action)) {

                if (session != null) {
                    session.invalidate();
                }

                response.sendRedirect(request.getContextPath() + "/index.jsp");
                return;

            } else {

                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

        } catch (Exception e) {

            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}