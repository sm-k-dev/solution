package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import common.db.DataSourceProvider;
import member.dto.MemberDTO;

public class MemberDAO {

    private DataSource dataSource;

    public MemberDAO() {
        try {
            dataSource = DataSourceProvider.get();
        } catch (Exception e) {
            throw new IllegalStateException("Member DB 자원을 찾지 못했습니다.", e);
        }
    }

    public boolean existsLoginId(String loginId) {

        boolean exists = false;

        String sql = "SELECT member_id FROM member WHERE login_id = ?";

        try (Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, loginId);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {

                    exists = true;
                }
            }

        } catch (Exception e) {

            System.out.println("[MemberDAO] 아이디 중복 확인 오류");
            e.printStackTrace();
        }

        return exists;
    }
    // 아이디 중복 확인

    public boolean existsEmail(String email) {

        boolean exists = false;

        String sql = "SELECT member_id FROM member WHERE email = ?";

        try (Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);

            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {

                    exists = true;
                }
            }

        } catch (Exception e) {

            System.out.println("[MemberDAO] 이메일 중복 확인 오류");
            e.printStackTrace();
        }

        return exists;
    }
    // 이메일 중복 확인

    public boolean existsEmailExceptLoginId(String email, String loginId) {

        String sql = "SELECT member_id FROM member WHERE email = ? AND login_id <> ?";

        try (Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, email);
            pstmt.setString(2, loginId);

            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        } catch (Exception e) {
            System.out.println("[MemberDAO] 회원정보 수정 이메일 중복 확인 오류");
            e.printStackTrace();
            return true;
        }
    }
    public int insertMember(String loginId, String password, String name,
        String email, String phone, String postcode,
        String address, String addressDetail) {

        int result = 0;

        String sql = "INSERT INTO member "
             + "(login_id, password_hash, name, email, phone, postcode, address, address_detail) "
             + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, loginId);
            pstmt.setString(2, password);
            pstmt.setString(3, name);
            pstmt.setString(4, email);
            pstmt.setString(5, phone);
            pstmt.setString(6, postcode);
            pstmt.setString(7, address);
            pstmt.setString(8, addressDetail);

            result = pstmt.executeUpdate();

        } catch (Exception e) {

            System.out.println("[MemberDAO] 회원가입 오류");
            e.printStackTrace();
        }

        return result;
    }
    // 회원가입

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
                    member.setPostcode(rs.getString("postcode"));
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

    public int updateMember(String loginId, String name, String email, String phone, String postcode, String address, String addressDetail) {

        int result = 0;

        String sql = "UPDATE member SET name = ?, email = ?, phone = ?, postcode = ?, address = ?, address_detail = ?, updated_at = NOW() WHERE login_id = ? AND status = 'ACTIVE'";

        try (Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, phone);
            pstmt.setString(4, postcode);
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

    public int withdrawMember(String loginId) {

        int result = 0;

        String sql = "UPDATE member "
             + "SET status = 'WITHDRAWN', "
             + "withdrawn_at = NOW(), "
             + "updated_at = NOW() "
             + "WHERE login_id = ? "
             + "AND status = 'ACTIVE'";

        try (Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, loginId);

            result = pstmt.executeUpdate();

        } catch (Exception e) {

            System.out.println("[MemberDAO] 회원 탈퇴 오류");
            e.printStackTrace();
        }

        return result;
    }
    // 회원 상태 변경(탈퇴)
}
