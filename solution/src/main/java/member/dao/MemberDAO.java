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
        // 관리자에 의해 활동 정지된 계정은 기존 로그인 세션이 끝난 뒤 다시 로그인할 수 없다.
        String sql = "SELECT password_hash FROM member WHERE login_id = ? AND status = 'ACTIVE'";

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
                   + "FROM member WHERE login_id = ? AND status = 'ACTIVE'";

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
    
    public int updatePassword(String loginId, String newPassword) {

        int result = 0;

        String sql = "UPDATE member SET password_hash = ?, updated_at = NOW() WHERE login_id = ? AND status = 'ACTIVE'";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, newPassword);
            pstmt.setString(2, loginId);

            result = pstmt.executeUpdate();

        } catch (Exception e) {

            System.out.println("[MemberDAO] 비밀번호 변경 오류");
            e.printStackTrace();
        }

        return result;
    }
    
    public int updateMember(String loginId, String name, String email, String phone, Integer postcode, String address, String addressDetail) {

        int result = 0;

        String sql = "UPDATE member SET name = ?, email = ?, phone = ?, postcode = ?, address = ?, address_detail = ?, updated_at = NOW() WHERE login_id = ? AND status = 'ACTIVE'";

        try (Connection conn = dataSource.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, phone);
            pstmt.setObject(4, postcode);
            pstmt.setString(5, address);
            pstmt.setString(6, addressDetail);
            pstmt.setString(7, loginId);

            result = pstmt.executeUpdate();

        } catch (Exception e) {

            System.out.println("[MemberDAO] 회원정보 수정 오류");
            e.printStackTrace();
        }

        return result;
    }
    
}
