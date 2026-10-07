package member.service;

import member.dao.MemberDAO;
import member.dto.MemberDTO;
import common.security.PasswordHasher;

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

        if (!PasswordHasher.matches(password, dbPassword)) {
            return null;
        }

        MemberDTO member = memberDAO.getMember(loginId);

        return member;
    }
    // === login Method

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

        if (!PasswordHasher.matches(password, dbPassword)) {
            return "INVALID_PASSWORD";
        }

        // 기존 평문 계정은 정상 인증 직후 PBKDF2 해시로 점진 전환한다.
        if (!PasswordHasher.isHashed(dbPassword)) {
            memberDAO.updatePassword(loginId, PasswordHasher.hash(password));
        }

        return "SUCCESS";
    }
    // === checkLogin Method

    public MemberDTO getMember(String loginId) {

        if (loginId == null || loginId.trim().isEmpty()) {
            return null;
        }

        return memberDAO.getMember(loginId.trim());
    }
    // === getMember Method

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

        return PasswordHasher.matches(currentPassword, dbPassword);
    }
    // 비밀번호 변경 시 조건 확인

    public String updatePassword(String loginId, String currentPassword, String newPassword, String confirmPassword) {

        if (loginId == null || loginId.trim().isEmpty()) {
            return "LOGIN_REQUIRED";
        }

        if (currentPassword == null || currentPassword.isEmpty()) {
            return "CURRENT_PASSWORD_EMPTY";
        }

        if (newPassword == null || newPassword.isEmpty()) {
            return "NEW_PASSWORD_EMPTY";
        }

        if (confirmPassword == null || confirmPassword.isEmpty()) {
            return "CONFIRM_PASSWORD_EMPTY";
        }

        String dbPassword = memberDAO.getPassword(loginId.trim());

        if (dbPassword == null) {
            return "MEMBER_NOT_FOUND";
        }

        if (!PasswordHasher.matches(currentPassword, dbPassword)) {
            return "CURRENT_PASSWORD_NOT_MATCH";
        }

        if (!newPassword.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[^A-Za-z0-9]).{8,}$")) {
            return "INVALID_PASSWORD_PATTERN";
        }

        if (currentPassword.equals(newPassword)) {
            return "SAME_AS_CURRENT_PASSWORD";
        }

        if (!newPassword.equals(confirmPassword)) {
            return "NEW_PASSWORD_NOT_MATCH";
        }

        int result = memberDAO.updatePassword(loginId.trim(), PasswordHasher.hash(newPassword));

        if (result == 1) {
            return "SUCCESS";
        }

        return "FAIL";
    }
    // 비밀번호 변경

    public String updateMember(String loginId, String name, String email, String phone, String postcode, String address, String addressDetail) {

        if (loginId == null || loginId.trim().isEmpty()) {
            return "LOGIN_REQUIRED";
        }

        if (name == null || name.trim().isEmpty()) {
            return "NAME_EMPTY";
        }

        if (email == null || email.trim().isEmpty()) {
            return "EMAIL_EMPTY";
        }

        if (!email.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")) {
            return "INVALID_EMAIL";
        }
        if (memberDAO.existsEmailExceptLoginId(email.trim(), loginId.trim())) {

            return "DUPLICATE_EMAIL";
        }

        if (phone == null || phone.trim().isEmpty()) {
            return "PHONE_EMPTY";
        }

        if (!phone.matches("^01[016789]-\\d{3,4}-\\d{4}$")) {
            return "INVALID_PHONE";
        }

        String postcodeValue = postcode == null ? null : postcode.trim();
        if (postcodeValue != null && !postcodeValue.isEmpty() && !postcodeValue.matches("^\\d{5}$")) {
            return "INVALID_POSTCODE";
        }

        name = name.trim();
        email = email.trim();
        phone = phone.trim();

        if (address != null) {
            address = address.trim();
        }

        if (addressDetail != null) {
            addressDetail = addressDetail.trim();
        }

        int result = memberDAO.updateMember(loginId.trim(), name, email, phone, postcodeValue, address, addressDetail);

        if (result == 1) {
            return "SUCCESS";
        }

        return "FAIL";
    }
    // 회원 정보 수정

    public String checkLoginId(String loginId) {

        if (loginId == null || loginId.trim().isEmpty()) {

            return "EMPTY";
        }

        loginId = loginId.trim();

        if (!loginId.matches("^(?=.*[a-z])(?=.*\\d)[a-z0-9]{6,20}$")) {

            return "INVALID";
        }

        if (memberDAO.existsLoginId(loginId)) {

            return "DUPLICATE";
        }

        return "AVAILABLE";
    }
    // 아이디 중복 확인

    public String checkEmail(String email) {

        if (email == null || email.trim().isEmpty()) {

            return "EMPTY";
        }

        email = email.trim();

        if (email.length() > 150) {

            return "INVALID_EMAIL_LENGTH";
        }
        if (!email.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")) {

            return "INVALID";
        }

        if (memberDAO.existsEmail(email)) {

            return "DUPLICATE";
        }

        return "AVAILABLE";
    }
    // 이메일 중복 확인
    public String signup(String loginId, String password, String passwordConfirm,
        String name, String phone, String email, String postcode,
        String address, String addressDetail) {

        if (loginId == null || loginId.trim().isEmpty()) {

            return "LOGIN_ID_EMPTY";
        }
        loginId = loginId.trim();

        if (!loginId.matches("^(?=.*[a-z])(?=.*\\d)[a-z0-9]{6,20}$")) {

            return "INVALID_LOGIN_ID";
        }
        if (memberDAO.existsLoginId(loginId)) {

            return "DUPLICATE_LOGIN_ID";
        }
        if (password == null || password.isEmpty()) {

            return "PASSWORD_EMPTY";
        }

        if (!password.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[^A-Za-z0-9]).{8,50}$")) {

            return "INVALID_PASSWORD_PATTERN";
        }

        if (passwordConfirm == null || passwordConfirm.isEmpty()) {

            return "PASSWORD_CONFIRM_EMPTY";
        }

        if (!password.equals(passwordConfirm)) {

            return "PASSWORD_NOT_MATCH";
        }
        if (name == null || name.trim().isEmpty()) {

            return "NAME_EMPTY";
        }

        name = name.trim();

        if (name.length() > 50) {

            return "INVALID_NAME";
        }
        if (phone == null || phone.trim().isEmpty()) {

            return "PHONE_EMPTY";
        }

        phone = phone.trim();

        if (!phone.matches("^01[016789]-\\d{3,4}-\\d{4}$")) {

            return "INVALID_PHONE";
        }
        if (email == null || email.trim().isEmpty()) {

            return "EMAIL_EMPTY";
        }

        email = email.trim();
        if (email.length() > 150) {

            return "INVALID_EMAIL_LENGTH";
        }

        if (!email.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")) {

            return "INVALID_EMAIL";
        }
        if (memberDAO.existsEmail(email)) {

            return "DUPLICATE_EMAIL";
        }
        if (postcode != null) {

            postcode = postcode.trim();
        }
        if (postcode != null && !postcode.isEmpty() && !postcode.matches("^\\d{5}$")) {

            return "INVALID_POSTCODE";
        }
        if (address != null) {

            address = address.trim();

            if (address.length() > 255) {

                return "INVALID_ADDRESS_LENGTH";
            }
        }

        if (addressDetail != null) {

            addressDetail = addressDetail.trim();

            if (addressDetail.length() > 255) {

                return "INVALID_ADDRESS_DETAIL_LENGTH";
            }
        }

        int result = memberDAO.insertMember(
            loginId,
            PasswordHasher.hash(password),
            name,
            email,
            phone,
            postcode,
            address,
            addressDetail
        );

        if (result == 1) {

            return "SUCCESS";
        }

        return "FAIL";
    }
    // 회원가입

    public String withdrawMember(String loginId) {

        if (loginId == null || loginId.trim().isEmpty()) {

            return "LOGIN_REQUIRED";
        }

        int result = memberDAO.withdrawMember(loginId.trim());

        if (result == 1) {

            return "SUCCESS";
        }

        return "FAIL";
    }
    // 회원 상태 변경(탈퇴)
}
// --- MemberService Class
