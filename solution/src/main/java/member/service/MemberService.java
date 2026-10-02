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
    }// 비밀번호 변경 시 조건 확인
    
    public String updatePassword(String loginId, String currentPassword, String newPassword, String confirmPassword) {

        if(loginId == null || loginId.trim().isEmpty()) {
        	
            return "LOGIN_REQUIRED";
        }

        if(currentPassword == null || currentPassword.isEmpty()) {
        	
            return "CURRENT_PASSWORD_EMPTY";
        }

        if(newPassword == null || newPassword.isEmpty()) {
        	
            return "NEW_PASSWORD_EMPTY";
        }

        if(confirmPassword == null || confirmPassword.isEmpty()) {
        	
            return "CONFIRM_PASSWORD_EMPTY";
        }

        String dbPassword = memberDAO.getPassword(loginId.trim());

        if(dbPassword == null) {
        	
            return "MEMBER_NOT_FOUND";
        }

        if(!currentPassword.equals(dbPassword)) {
        	
            return "CURRENT_PASSWORD_NOT_MATCH";
        }

        if(!newPassword.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[^A-Za-z0-9]).{8,}$")) {
        	
            return "INVALID_PASSWORD_PATTERN";
        }

        if(currentPassword.equals(newPassword)) {
        	
            return "SAME_AS_CURRENT_PASSWORD";
        }

        if(!newPassword.equals(confirmPassword)) {
        	
            return "NEW_PASSWORD_NOT_MATCH";
        }

        int result = memberDAO.updatePassword(loginId.trim(), newPassword);

        if(result == 1) {
        	
            return "SUCCESS";
        }

        return "FAIL";
    }// 비밀번호 변경
    
    public String updateMember(String loginId, String name, String email, String phone, String postcode, String address, String addressDetail) {

        if(loginId == null || loginId.trim().isEmpty()) {
        	
            return "LOGIN_REQUIRED";
        }

        if(name == null || name.trim().isEmpty()) {
        	
            return "NAME_EMPTY";
        }

        if(email == null || email.trim().isEmpty()) {
        	
            return "EMAIL_EMPTY";
        }

        if(!email.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")) {
        	
            return "INVALID_EMAIL";
        }

        if(phone == null || phone.trim().isEmpty()) {
        	
            return "PHONE_EMPTY";
        }

        if(!phone.matches("^01[016789]-\\d{3,4}-\\d{4}$")) {
        	
            return "INVALID_PHONE";
        }

        Integer postcodeValue = null;

        if(postcode != null && !postcode.trim().isEmpty()) {

            try {
            	
                postcodeValue = Integer.parseInt(postcode.trim());
            } catch(NumberFormatException e) {
            	
                return "INVALID_POSTCODE";
            }
        }

        name = name.trim();
        email = email.trim();
        phone = phone.trim();

        if(address != null) {
            address = address.trim();
        }

        if(addressDetail != null) {
            addressDetail = addressDetail.trim();
        }

        int result = memberDAO.updateMember(loginId.trim(), name, email, phone, postcodeValue, address, addressDetail);

        if(result == 1) {
            return "SUCCESS";
        }

        return "FAIL";
    }// 회원 정보 수정
    
    public String withdrawMember(String loginId) {

        if(loginId == null || loginId.trim().isEmpty()) {

            return "LOGIN_REQUIRED";
        }

        int result = memberDAO.withdrawMember(loginId.trim());

        if(result == 1) {

            return "SUCCESS";
        }

        return "FAIL";
    }// 회원 상태 변경(탈퇴)
    
}// --- MemberService Class