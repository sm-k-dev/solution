package member.dto;

import java.sql.Date;

public class MemberDTO {

    private String loginId, pass, name, role, status, email, phone, postcode, address, addressDetail;
    private int memberId;
    private Date createdAt, updatedAt, withdrawnAt;

    public MemberDTO() {
    }

    public MemberDTO(String loginId, String pass, String name, String role, String status, String email, String phone,
        String address, String addressDetail, int memberId, String postcode, Date createdAt, Date updatedAt,
        Date withdrawnAt) {
        this.loginId = loginId;
        this.pass = pass;
        this.name = name;
        this.role = role;
        this.status = status;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.addressDetail = addressDetail;
        this.memberId = memberId;
        this.postcode = postcode;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.withdrawnAt = withdrawnAt;
    }

    public String getLoginId() {
        return loginId;
    }

    public void setLoginId(String loginId) {
        this.loginId = loginId;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Date getWithdrawnAt() {
        return withdrawnAt;
    }

    public void setWithdrawnAt(Date withdrawnAt) {
        this.withdrawnAt = withdrawnAt;
    }
}
