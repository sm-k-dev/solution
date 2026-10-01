package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import admin.dto.AdminMemberDTO;

public class AdminMemberDAO {
    private final DataSource dataSource;
    public AdminMemberDAO() throws NamingException { Context env=(Context)new InitialContext().lookup("java:/comp/env");dataSource=(DataSource)env.lookup("jdbc/jspdb"); }
    public List<AdminMemberDTO> findPage(String q,String status,int offset,int limit)throws Exception{
        String sql="SELECT member_id,login_id,name,email,phone,role,status,created_at FROM member WHERE (?='' OR login_id LIKE ? OR name LIKE ? OR email LIKE ?) AND (?='ALL' OR status=?) ORDER BY created_at DESC,member_id DESC LIMIT ? OFFSET ?";
        List<AdminMemberDTO> rows=new ArrayList<AdminMemberDTO>();String term=q==null?"":q.trim(),like="%"+term+"%";
        try(Connection c=dataSource.getConnection();PreparedStatement p=c.prepareStatement(sql)){p.setString(1,term);p.setString(2,like);p.setString(3,like);p.setString(4,like);p.setString(5,status);p.setString(6,status);p.setInt(7,limit);p.setInt(8,offset);try(ResultSet r=p.executeQuery()){while(r.next()){AdminMemberDTO m=new AdminMemberDTO();m.setMemberId(r.getLong("member_id"));m.setLoginId(r.getString("login_id"));m.setName(r.getString("name"));m.setEmail(r.getString("email"));m.setPhone(r.getString("phone"));m.setRole(r.getString("role"));m.setStatus(r.getString("status"));m.setCreatedAt(r.getTimestamp("created_at"));rows.add(m);}}}return rows;
    }
    public int count(String q,String status)throws Exception{
        String sql="SELECT COUNT(*) FROM member WHERE (?='' OR login_id LIKE ? OR name LIKE ? OR email LIKE ?) AND (?='ALL' OR status=?)";String term=q==null?"":q.trim(),like="%"+term+"%";
        try(Connection c=dataSource.getConnection();PreparedStatement p=c.prepareStatement(sql)){p.setString(1,term);p.setString(2,like);p.setString(3,like);p.setString(4,like);p.setString(5,status);p.setString(6,status);try(ResultSet r=p.executeQuery()){r.next();return r.getInt(1);}}
    }
    public int countByStatus(String status)throws Exception{try(Connection c=dataSource.getConnection();PreparedStatement p=c.prepareStatement("SELECT COUNT(*) FROM member WHERE status=?")){p.setString(1,status);try(ResultSet r=p.executeQuery()){r.next();return r.getInt(1);}}}
    public int countAll()throws Exception{try(Connection c=dataSource.getConnection();PreparedStatement p=c.prepareStatement("SELECT COUNT(*) FROM member");ResultSet r=p.executeQuery()){r.next();return r.getInt(1);}}
    public boolean updateUserStatus(long memberId,String status)throws Exception{
        if(!"ACTIVE".equals(status)&&!"SUSPENDED".equals(status))return false;
        try(Connection c=dataSource.getConnection();PreparedStatement p=c.prepareStatement("UPDATE member SET status=? WHERE member_id=? AND role='USER' AND status IN ('ACTIVE','SUSPENDED')")){p.setString(1,status);p.setLong(2,memberId);return p.executeUpdate()==1;}
    }
}
