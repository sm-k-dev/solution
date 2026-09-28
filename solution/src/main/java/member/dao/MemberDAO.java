package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import member.dto.MemberDTO;

public class MemberDAO {

    private DataSource dataSource;

    public MemberDAO() {
        try {
        	
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:/comp/env");
            dataSource = (DataSource) envCtx.lookup("jdbc/jspdb");
        } catch (Exception e) {
        	
            System.out.println("[MemberDAO] DB 연결 오류");
            e.printStackTrace();
        }
    }

    public String getPassword(String loginId) {

        String dbPassword = null;
        String sql = "SELECT password_hash FROM member WHERE login_id = ?";

        try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, loginId);

            try (ResultSet rs = pstmt.executeQuery()) {
            	
                if (rs.next()) {
                    dbPassword = rs.getString("password_hash");
                }
            }

        } catch (Exception e) {
        	
            System.out.println("[MemberDAO] 비밀번호 조회 오류");
            e.printStackTrace();
        }

        return dbPassword;
    }

    public MemberDTO getMember(String loginId) {

        MemberDTO member = null;

        String sql = "SELECT member_id, login_id, name, email, phone, postcode, "
                   + "address, address_detail, role, status, created_at, updated_at, withdrawn_at "
                   + "FROM member WHERE login_id = ?";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, loginId);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                	
                    member = new MemberDTO();

                    member.setMemberId(rs.getInt("member_id"));
                    member.setLoginId(rs.getString("login_id"));
                    member.setName(rs.getString("name"));
                    member.setEmail(rs.getString("email"));
                    member.setPhone(rs.getString("phone"));
                    member.setPostcode(rs.getInt("postcode"));
                    member.setAddress(rs.getString("address"));
                    member.setAddressDetail(rs.getString("address_detail"));
                    member.setRole(rs.getString("role"));
                    member.setStatus(rs.getString("status"));
                    member.setCreatedAt(rs.getDate("created_at"));
                    member.setUpdatedAt(rs.getDate("updated_at"));
                    member.setWithdrawnAt(rs.getDate("withdrawn_at"));
                }
            }

        } catch (Exception e) {
        	
            System.out.println("[MemberDAO] 회원정보 조회 오류");
            e.printStackTrace();
        }

        return member;
    }
}