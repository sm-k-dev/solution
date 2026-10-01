package admin.dto;

import java.sql.Timestamp;

public class AdminMemberDTO {
    private long memberId;
    private String loginId,name,email,phone,role,status;
    private Timestamp createdAt;
    public long getMemberId(){return memberId;} public void setMemberId(long v){memberId=v;}
    public String getLoginId(){return loginId;} public void setLoginId(String v){loginId=v;}
    public String getName(){return name;} public void setName(String v){name=v;}
    public String getEmail(){return email;} public void setEmail(String v){email=v;}
    public String getPhone(){return phone;} public void setPhone(String v){phone=v;}
    public String getRole(){return role;} public void setRole(String v){role=v;}
    public String getStatus(){return status;} public void setStatus(String v){status=v;}
    public Timestamp getCreatedAt(){return createdAt;} public void setCreatedAt(Timestamp v){createdAt=v;}
}
