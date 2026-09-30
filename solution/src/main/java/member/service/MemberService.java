package member.service;

import member.dao.MemberDAO;
import member.dto.MemberDTO;

public class MemberService {

    private MemberDAO memberDAO;

    public MemberService() {
    	
        memberDAO = new MemberDAO();
    }

    public MemberDTO login(String loginId, String password) {

        if (loginId == null || loginId.trim().isEmpty()) {
        	
            return null;
        }

        if (password == null || password.trim().isEmpty()) {
        	
            return null;
        }

        loginId = loginId.trim();

        String dbPassword = memberDAO.getPassword(loginId);

        if (dbPassword == null) {
        	
            return null;
        }

        if (!password.equals(dbPassword)) {
        	
            return null;
        }

        MemberDTO member = memberDAO.getMember(loginId);

        return member;
    }// === login Method
    
    public String checkLogin(String loginId, String password) {

        if (loginId == null || loginId.trim().isEmpty()) {
        	
            return "EMPTY";
        }

        if (password == null || password.trim().isEmpty()) {
        	
            return "EMPTY";
        }

        loginId = loginId.trim();

        String dbPassword = memberDAO.getPassword(loginId);

        if (dbPassword == null) {
        	
            return "INVALID_ID";
        }

        if (!password.equals(dbPassword)) {
        	
            return "INVALID_PASSWORD";
        }

        return "SUCCESS";
    }// === checkLogin Method
    
    public MemberDTO getMember(String loginId) {

        if (loginId == null || loginId.trim().isEmpty()) {
        	
            return null;
        }

        return memberDAO.getMember(loginId.trim());
    }// === getMember Method
    
    public boolean checkCurrentPassword(String loginId, String currentPassword) {

        if (loginId == null || loginId.trim().isEmpty()) {
        	
            return false;
        }

        if (currentPassword == null || currentPassword.isEmpty()) {
        	
            return false;
        }

        String dbPassword = memberDAO.getPassword(loginId.trim());

        if (dbPassword == null) {
        	
            return false;
        }

        return currentPassword.equals(dbPassword);
    }// === checkCurrentPassword Method
    
}// --- MemberService Class