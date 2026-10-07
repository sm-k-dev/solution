package admin.dto;

import java.sql.Timestamp;

public class AdminMemberDTO {
    private long memberId;
    private String loginId, name, email, phone, postcode, address, addressDetail, role, status;
    private Timestamp createdAt, updatedAt, withdrawnAt;
    private int boardCount, commentCount, inquiryCount;

    public long getMemberId() {
        return memberId;
    }

    public void setMemberId(long v) {
        memberId = v;
    }

    public String getLoginId() {
        return loginId;
    }

    public void setLoginId(String v) {
        loginId = v;
    }

    public String getName() {
        return name;
    }

    public void setName(String v) {
        name = v;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String v) {
        email = v;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String v) {
        phone = v;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String v) {
        postcode = v;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String v) {
        address = v;
    }

    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String v) {
        addressDetail = v;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String v) {
        role = v;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String v) {
        status = v;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp v) {
        createdAt = v;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp v) {
        updatedAt = v;
    }

    public Timestamp getWithdrawnAt() {
        return withdrawnAt;
    }

    public void setWithdrawnAt(Timestamp v) {
        withdrawnAt = v;
    }

    public int getBoardCount() {
        return boardCount;
    }

    public void setBoardCount(int v) {
        boardCount = v;
    }

    public int getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(int v) {
        commentCount = v;
    }

    public int getInquiryCount() {
        return inquiryCount;
    }

    public void setInquiryCount(int v) {
        inquiryCount = v;
    }
}
