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
    }
}