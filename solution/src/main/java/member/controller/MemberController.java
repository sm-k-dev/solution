package member.controller;

import java.io.IOException;
import java.util.List;
import inquiry.dao.InquiryDAO;
import inquiry.service.InquiryService;
import inquiry.dto.InquiryDTO;
import board.dao.BoardDAO;
import board.dto.BoardDTO;
import board.service.BoardService;
import board.dto.BoardCommentDTO;
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
    private BoardService boardService;

    @Override
    public void init() throws ServletException {

        memberService = new MemberService();
        try {

            BoardDAO boardDAO = new BoardDAO();
            
            boardService = new BoardService(boardDAO);
        } catch(Exception e) {

            throw new ServletException("게시판 DB 자원을 찾지 못했습니다.", e);
        }
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

            if (loginId == null && ("/member/member.do".equals(action) || "/member/activity.do".equals(action)
            	|| "/member/memberUpdate.do".equals(action) || "/member/memberUpdatePro.do".equals(action) || "/member/memberDelete.do".equals(action))) {
                response.sendRedirect(request.getContextPath() + "/member/login.do");
                
                return;
            }

            if ("/member/member.do".equals(action)) {

                if (loginId == null) {
                	
                    response.sendRedirect(request.getContextPath() + "/member/login.do");
                    return;
                }

                MemberDTO member = memberService.getMember(loginId);

                if (member == null) {
                	
                    response.sendRedirect(request.getContextPath() + "/member/login.do");
                    return;
                }

                long memberId = member.getMemberId();
                int boardCount = boardService.countByMemberId(memberId);
                int commentCount = boardService.countCommentsByMemberId(memberId);
                InquiryDAO inquiryDAO = new InquiryDAO();
                InquiryService inquiryService = new InquiryService(inquiryDAO);
                int inquiryCount = inquiryService.countByMemberId(memberId);
                int completedInquiryCount = inquiryService.countCompletedByMemberId(memberId);
                int inProgressInquiryCount = inquiryService.countInProgressByMemberId(memberId);
               
                request.setAttribute("boardCount", boardCount);
                request.setAttribute("commentCount", commentCount);
                request.setAttribute("inquiryCount", inquiryCount);
                request.setAttribute("completedInquiryCount", completedInquiryCount);
                request.setAttribute("inProgressInquiryCount", inProgressInquiryCount);
                request.setAttribute("member", member);
                request.getRequestDispatcher("/member/member.jsp").forward(request, response);
                
                return;
            } else if("/member/activity.do".equals(action)) {

                if(loginId == null) {
                	
                    response.sendRedirect(request.getContextPath() + "/member/login.do");
                    return;
                }

                MemberDTO member = memberService.getMember(loginId);

                if(member == null) {
                	
                    response.sendRedirect(request.getContextPath() + "/member/login.do");
                    return;
                }

                String tab = request.getParameter("tab");

                if(tab == null || tab.trim().isEmpty()) {
                	
                    tab = "posts";
                }

                if(!"posts".equals(tab)
                        && !"comments".equals(tab)
                        && !"inquiries".equals(tab)) {

                    tab = "posts";
                }

                long memberId = member.getMemberId();

                if("posts".equals(tab)) {

                    List<BoardDTO> postList = boardService.findByMemberId(memberId);

                    request.setAttribute("postList", postList);

                } else if("comments".equals(tab)) {

                    List<BoardCommentDTO> commentList = boardService.findCommentsByMemberId(memberId);

                    request.setAttribute("commentList", commentList);

                } else if("inquiries".equals(tab)) {

                    InquiryDAO inquiryDAO = new InquiryDAO();
                    InquiryService inquiryService = new InquiryService(inquiryDAO);

                    List<InquiryDTO> inquiryList = inquiryService.findInquiriesByMember(memberId);

                    request.setAttribute("inquiryList", inquiryList);
                }

                request.setAttribute("tab", tab);

                request.getRequestDispatcher("/member/memberActivity.jsp").forward(request, response);
                
                return;
            
            } else if ("/member/passwordCheck.do".equals(action)) {

                if (loginId == null) {
                	
                    response.sendRedirect(request.getContextPath() + "/member/login.do");
                    return;
                }

                String currentPassword = request.getParameter("currentPassword");

                boolean passwordMatch = memberService.checkCurrentPassword(loginId, currentPassword);

                if (passwordMatch) {
                	
                    response.getWriter().write("MATCH");
                } else {
                	
                    response.getWriter().write("NOT_MATCH");
                }

                return;
            } else if("/member/signup.do".equals(action)) {

                request.getRequestDispatcher("/member/signup.jsp").forward(request, response);
                
                return;
                
            } else if("/member/checkLoginId.do".equals(action)) {

                String loginIdParam = request.getParameter("loginId");

                String result = memberService.checkLoginId(loginIdParam);

                response.setContentType("text/plain; charset=UTF-8");
                response.getWriter().write(result);

                return;
                
            } else if("/member/checkEmail.do".equals(action)) {

                String email = request.getParameter("email");

                String result = memberService.checkEmail(email);

                response.setContentType("text/plain; charset=UTF-8");
                response.getWriter().write(result);

                return;
                
            }else if("/member/signupPro.do".equals(action)) {

                String loginIdParam = request.getParameter("loginId");
                String password = request.getParameter("password");
                String passwordConfirm = request.getParameter("passwordConfirm");
                String name = request.getParameter("name");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String postcode = request.getParameter("postcode");
                String address = request.getParameter("address");
                String addressDetail = request.getParameter("addressDetail");
                String termsService = request.getParameter("termsService");
                String termsPrivacy = request.getParameter("termsPrivacy");
                
                if(!"Y".equals(termsService) || !"Y".equals(termsPrivacy)) {

                    request.setAttribute("signupMessage", "필수 약관에 동의해주세요.");

                    request.setAttribute("loginId", loginIdParam);
                    request.setAttribute("name", name);
                    request.setAttribute("phone", phone);
                    request.setAttribute("email", email);
                    request.setAttribute("postcode", postcode);
                    request.setAttribute("address", address);
                    request.setAttribute("addressDetail", addressDetail);

                    request.getRequestDispatcher("/member/signup.jsp").forward(request, response);

                    return;
                }

                String result = memberService.signup(
                        loginIdParam,
                        password,
                        passwordConfirm,
                        name,
                        phone,
                        email,
                        postcode,
                        address,
                        addressDetail
                );

                if("SUCCESS".equals(result)) {

                    response.sendRedirect(request.getContextPath() + "/member/login.do");
                    return;
                }

                String signupMessage;

                if("LOGIN_ID_EMPTY".equals(result)) {

                    signupMessage = "아이디를 입력해주세요.";
                } else if("INVALID_LOGIN_ID".equals(result)) {

                    signupMessage = "아이디는 영문 소문자와 숫자를 조합하여 6~20자로 입력해주세요.";
                } else if("DUPLICATE_LOGIN_ID".equals(result)) {

                    signupMessage = "이미 사용 중인 아이디입니다.";
                } else if("PASSWORD_EMPTY".equals(result)) {

                    signupMessage = "비밀번호를 입력해주세요.";
                } else if("INVALID_PASSWORD_PATTERN".equals(result)) {

                    signupMessage = "비밀번호는 8자 이상 영문, 숫자, 특수문자를 포함해야 합니다.";
                } else if("PASSWORD_CONFIRM_EMPTY".equals(result)) {

                    signupMessage = "비밀번호 확인을 입력해주세요.";
                } else if("PASSWORD_NOT_MATCH".equals(result)) {

                    signupMessage = "비밀번호가 일치하지 않습니다.";
                } else if("NAME_EMPTY".equals(result)) {

                    signupMessage = "이름을 입력해주세요.";
                }else if("INVALID_NAME".equals(result)) {

                    signupMessage = "담당자 성명은 50자 이하로 입력해주세요.";
                } else if("PHONE_EMPTY".equals(result)) {

                    signupMessage = "휴대폰 번호를 입력해주세요.";
                } else if("INVALID_PHONE".equals(result)) {

                    signupMessage = "올바른 휴대폰 번호 형식으로 입력해주세요.";
                } else if("EMAIL_EMPTY".equals(result)) {

                    signupMessage = "이메일을 입력해주세요.";
                } else if("INVALID_EMAIL_LENGTH".equals(result)) {

                    signupMessage = "이메일은 150자 이하로 입력해주세요.";
                } else if("INVALID_EMAIL".equals(result)) {

                    signupMessage = "올바른 이메일 형식으로 입력해주세요.";
                } else if("DUPLICATE_EMAIL".equals(result)) {

                    signupMessage = "이미 사용 중인 이메일입니다.";
                } else if("INVALID_POSTCODE".equals(result)) {

                    signupMessage = "올바른 우편번호를 입력해주세요.";
                } else if("INVALID_ADDRESS_LENGTH".equals(result)) {

                    signupMessage = "주소는 255자 이하로 입력해주세요.";
                } else if("INVALID_ADDRESS_DETAIL_LENGTH".equals(result)) {

                    signupMessage = "상세주소는 255자 이하로 입력해주세요.";
                } else {

                    signupMessage = "회원가입 처리 중 오류가 발생했습니다.";
                }

                request.setAttribute("signupMessage", signupMessage);
                request.setAttribute("loginId", loginIdParam);
                request.setAttribute("name", name);
                request.setAttribute("phone", phone);
                request.setAttribute("email", email);
                request.setAttribute("postcode", postcode);
                request.setAttribute("address", address);
                request.setAttribute("addressDetail", addressDetail);

                request.getRequestDispatcher("/member/signup.jsp").forward(request, response);
                
                return;
            } else if ("/member/login.do".equals(action)) {

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

                String loginResult = memberService.checkLogin(loginIdParam, password);

                if ("INVALID_ID".equals(loginResult)) {
                	
                    request.setAttribute("errorMessage", "등록되지 않은 아이디 입니다.");
                    request.getRequestDispatcher("/member/login.jsp").forward(request, response);
                    return;
                }

                if ("INVALID_PASSWORD".equals(loginResult)) {
                	
                    request.setAttribute("errorMessage", "비밀번호가 일치하지 않습니다.");
                    request.getRequestDispatcher("/member/login.jsp").forward(request, response);
                    return;
                }

                MemberDTO member = memberService.login(loginIdParam, password);

                if (member == null) {
                	
                    request.setAttribute("errorMessage", "로그인 처리 중 오류가 발생했습니다.");
                    request.getRequestDispatcher("/member/login.jsp").forward(request, response);
                    return;
                }

                if (session != null) {
                	
                    session.invalidate();
                }

                session = request.getSession(true);

                session.setAttribute("memberId", member.getMemberId());
                session.setAttribute("loginId", member.getLoginId());
                session.setAttribute("name", member.getName());
                session.setAttribute("role", member.getRole());

                String destination = "ADMIN".equals(member.getRole()) ? "/admin/dashboard" : "/index.jsp";
                response.sendRedirect(request.getContextPath() + destination);
                return;
                
            } else if("/member/memberUpdate.do".equals(action)) {

                if(loginId == null) {
                    response.sendRedirect(request.getContextPath() + "/member/login.do");
                    return;
                }

                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String postcode = request.getParameter("postcode");
                String address = request.getParameter("address");
                String addressDetail = request.getParameter("addressDetail");

                String result = memberService.updateMember(loginId, name, email, phone, postcode, address, addressDetail);

                if("SUCCESS".equals(result)) {

                    request.setAttribute("memberUpdateMessage", "회원정보가 수정되었습니다.");

                    session.setAttribute("name", name.trim());
                } else if("NAME_EMPTY".equals(result)) {

                    request.setAttribute("memberUpdateMessage", "담당자 성명을 입력해주세요.");
                } else if("EMAIL_EMPTY".equals(result)) {

                    request.setAttribute("memberUpdateMessage", "기업 담당자 이메일을 입력해주세요.");
                } else if("INVALID_EMAIL".equals(result)) {

                    request.setAttribute("memberUpdateMessage", "올바른 이메일 형식으로 입력해주세요.");
                } else if("PHONE_EMPTY".equals(result)) {

                    request.setAttribute("memberUpdateMessage", "휴대폰 번호를 입력해주세요.");
                } else if("INVALID_PHONE".equals(result)) {

                    request.setAttribute("memberUpdateMessage", "올바른 휴대폰 번호 형식으로 입력해주세요.");
                } else if("INVALID_POSTCODE".equals(result)) {

                    request.setAttribute("memberUpdateMessage", "올바른 우편번호를 입력해주세요.");
                } else {

                    request.setAttribute("memberUpdateMessage", "회원정보 수정 중 오류가 발생했습니다.");
                }

                MemberDTO member = memberService.getMember(loginId);

                request.setAttribute("member", member);
                request.getRequestDispatcher("/member/member.jsp").forward(request, response);
                
                return;

            } else if("/member/passwordUpdate.do".equals(action)) {

                if(loginId == null) {
                	
                    response.sendRedirect(request.getContextPath() + "/member/login.do");
                    return;
                }

                String currentPassword = request.getParameter("currentPassword");
                String newPassword = request.getParameter("newPassword");
                String confirmPassword = request.getParameter("confirmPassword");

                String result = memberService.updatePassword(loginId, currentPassword, newPassword, confirmPassword);

                if("SUCCESS".equals(result)) {
                	
                    request.setAttribute("passwordUpdateMessage", "비밀번호가 변경되었습니다.");
                } else if("CURRENT_PASSWORD_EMPTY".equals(result)) {
                	
                    request.setAttribute("passwordUpdateMessage", "현재 비밀번호를 입력해주세요.");
                } else if("NEW_PASSWORD_EMPTY".equals(result)) {
                	
                    request.setAttribute("passwordUpdateMessage", "새 비밀번호를 입력해주세요.");
                } else if("CONFIRM_PASSWORD_EMPTY".equals(result)) {
                	
                    request.setAttribute("passwordUpdateMessage", "새 비밀번호 확인을 입력해주세요.");
                } else if("MEMBER_NOT_FOUND".equals(result)) {
                	
                    request.setAttribute("passwordUpdateMessage", "회원정보를 확인할 수 없습니다.");
                } else if("CURRENT_PASSWORD_NOT_MATCH".equals(result)) {
                	
                    request.setAttribute("passwordUpdateMessage", "현재 비밀번호가 일치하지 않습니다.");
                } else if("INVALID_PASSWORD_PATTERN".equals(result)) {
                	
                    request.setAttribute("passwordUpdateMessage", "새 비밀번호는 8자 이상 영문, 숫자, 특수문자를 포함해야 합니다.");
                } else if("SAME_AS_CURRENT_PASSWORD".equals(result)) {
                	
                    request.setAttribute("passwordUpdateMessage", "현재 비밀번호와 일치하여 변경할 수 없습니다.");
                } else if("NEW_PASSWORD_NOT_MATCH".equals(result)) {
                	
                    request.setAttribute("passwordUpdateMessage", "새 비밀번호가 일치하지 않습니다.");
                } else {
                	
                    request.setAttribute("passwordUpdateMessage", "비밀번호 변경 중 오류가 발생했습니다.");
                }

                MemberDTO member = memberService.getMember(loginId);

                request.setAttribute("member", member);
                request.getRequestDispatcher("/member/member.jsp").forward(request, response);
                
                return;
            } else if("/member/memberDelete.do".equals(action)) {

                if(!"POST".equalsIgnoreCase(request.getMethod())) {

                    response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
                    return;
                }

                if(loginId == null) {

                    response.sendRedirect(request.getContextPath() + "/member/login.do");
                    return;
                }

                String result = memberService.withdrawMember(loginId);

                if("SUCCESS".equals(result)) {

                    if(session != null) {

                        session.invalidate();
                    }

                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                    return;
                }

                request.setAttribute("memberDeleteMessage", "회원 탈퇴 중 오류가 발생했습니다.");

                MemberDTO member = memberService.getMember(loginId);

                request.setAttribute("member", member);
                request.getRequestDispatcher("/member/member.jsp").forward(request, response);

                return;
            }else if ("/member/logout.do".equals(action)) {

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