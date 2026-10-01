package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import board.dto.BoardCommentDTO;
import board.dto.BoardDTO;
import board.dto.BoardFileDTO;

public class BoardDAO {
    private final DataSource dataSource;
    public BoardDAO() throws NamingException {
        Context env = (Context) new InitialContext().lookup("java:/comp/env");
        dataSource = (DataSource) env.lookup("jdbc/jspdb");
    }

    public List<BoardDTO> findPage(String category, String query, int offset, int pageSize) throws Exception {
        String sql = "SELECT b.board_id,b.member_id,b.category,b.title,b.content,b.tags,b.view_count,b.created_at,b.updated_at,m.name "
                + "FROM board b JOIN member m ON m.member_id=b.member_id WHERE b.is_deleted=FALSE AND b.category=? "
                + "AND (?='' OR b.title LIKE ? OR b.content LIKE ? OR b.tags LIKE ? OR m.name LIKE ?) "
                + "ORDER BY b.created_at DESC,b.board_id DESC LIMIT ? OFFSET ?";
        List<BoardDTO> rows = new ArrayList<BoardDTO>();
        try (Connection c=dataSource.getConnection(); PreparedStatement p=c.prepareStatement(sql)) {
            String term = query == null ? "" : query.trim();
            p.setString(1, category); p.setString(2, term);
            String like = "%" + term + "%";
            p.setString(3, like); p.setString(4, like); p.setString(5, like); p.setString(6, like);
            p.setInt(7, pageSize); p.setInt(8, offset);
            try (ResultSet r=p.executeQuery()) { while(r.next()) rows.add(mapBoard(r)); }
        }
        return rows;
    }

    public int count(String category, String query) throws Exception {
        String sql = "SELECT COUNT(*) FROM board b JOIN member m ON m.member_id=b.member_id WHERE b.is_deleted=FALSE AND b.category=? "
                + "AND (?='' OR b.title LIKE ? OR b.content LIKE ? OR b.tags LIKE ? OR m.name LIKE ?)";
        try (Connection c=dataSource.getConnection(); PreparedStatement p=c.prepareStatement(sql)) {
            String term=query==null?"":query.trim(); String like="%"+term+"%";
            p.setString(1,category); p.setString(2,term); p.setString(3,like); p.setString(4,like); p.setString(5,like); p.setString(6,like);
            try(ResultSet r=p.executeQuery()){ r.next(); return r.getInt(1); }
        }
    }

    public BoardDTO findById(long id, boolean includeDeleted) throws Exception {
        String sql="SELECT b.board_id,b.member_id,b.category,b.title,b.content,b.tags,b.view_count,b.created_at,b.updated_at,m.name FROM board b JOIN member m ON m.member_id=b.member_id WHERE b.board_id=?"+(includeDeleted?"":" AND b.is_deleted=FALSE");
        try(Connection c=dataSource.getConnection();PreparedStatement p=c.prepareStatement(sql)){
            p.setLong(1,id);try(ResultSet r=p.executeQuery()){return r.next()?mapBoard(r):null;}
        }
    }

    public long insert(BoardDTO b) throws Exception {
        String sql="INSERT INTO board(member_id,category,title,content,tags) VALUES(?,?,?,?,?)";
        try(Connection c=dataSource.getConnection();PreparedStatement p=c.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS)){
            p.setLong(1,b.getMemberId());p.setString(2,b.getCategory());p.setString(3,b.getTitle());p.setString(4,b.getContent());p.setString(5,b.getTags());
            p.executeUpdate();try(ResultSet r=p.getGeneratedKeys()){if(r.next())return r.getLong(1);}
        } return 0;
    }

    public boolean update(BoardDTO b) throws Exception {
        String sql="UPDATE board SET category=?,title=?,content=?,tags=? WHERE board_id=? AND is_deleted=FALSE AND member_id=?";
        try(Connection c=dataSource.getConnection();PreparedStatement p=c.prepareStatement(sql)){
            p.setString(1,b.getCategory());p.setString(2,b.getTitle());p.setString(3,b.getContent());p.setString(4,b.getTags());p.setLong(5,b.getBoardId());p.setLong(6,b.getMemberId());return p.executeUpdate()==1;
        }
    }

    public boolean softDelete(long id) throws Exception {
        try(Connection c=dataSource.getConnection();PreparedStatement p=c.prepareStatement("UPDATE board SET is_deleted=TRUE,deleted_at=CURRENT_TIMESTAMP WHERE board_id=? AND is_deleted=FALSE")){
            p.setLong(1,id);return p.executeUpdate()==1;
        }
    }
    public boolean softDelete(long id,long ownerId) throws Exception {
        try(Connection c=dataSource.getConnection();PreparedStatement p=c.prepareStatement("UPDATE board SET is_deleted=TRUE,deleted_at=CURRENT_TIMESTAMP WHERE board_id=? AND member_id=? AND is_deleted=FALSE")){
            p.setLong(1,id);p.setLong(2,ownerId);return p.executeUpdate()==1;
        }
    }
    public void incrementViewCount(long id) throws Exception {
        try(Connection c=dataSource.getConnection();PreparedStatement p=c.prepareStatement("UPDATE board SET view_count=view_count+1 WHERE board_id=? AND is_deleted=FALSE")){p.setLong(1,id);p.executeUpdate();}
    }
    public int countAll() throws Exception {
        try(Connection c=dataSource.getConnection();PreparedStatement p=c.prepareStatement("SELECT COUNT(*) FROM board WHERE is_deleted=FALSE");ResultSet r=p.executeQuery()){r.next();return r.getInt(1);}
    }
    public List<BoardCommentDTO> findComments(long boardId) throws Exception {
        List<BoardCommentDTO> rows=new ArrayList<BoardCommentDTO>();
        String sql="SELECT c.comment_id,c.member_id,c.parent_comment_id,c.content,c.created_at,m.name FROM board_comment c JOIN member m ON m.member_id=c.member_id WHERE c.board_id=? AND c.is_deleted=FALSE ORDER BY COALESCE(c.parent_comment_id,c.comment_id),c.parent_comment_id,c.created_at";
        try(Connection c=dataSource.getConnection();PreparedStatement p=c.prepareStatement(sql)){p.setLong(1,boardId);try(ResultSet r=p.executeQuery()){while(r.next()){BoardCommentDTO d=new BoardCommentDTO();d.setCommentId(r.getLong(1));d.setMemberId(r.getLong(2));long parent=r.getLong(3);d.setParentCommentId(r.wasNull()?null:Long.valueOf(parent));d.setContent(r.getString(4));d.setCreatedAt(r.getTimestamp(5));d.setAuthorName(r.getString(6));rows.add(d);}}}
        return rows;
    }
    public boolean addComment(long boardId,long memberId,Long parentId,String content) throws Exception {
        String sql="INSERT INTO board_comment(board_id,member_id,parent_comment_id,content) SELECT ?,?,?,? FROM board WHERE board_id=? AND is_deleted=FALSE";
        try(Connection c=dataSource.getConnection();PreparedStatement p=c.prepareStatement(sql)){p.setLong(1,boardId);p.setLong(2,memberId);if(parentId==null)p.setNull(3,java.sql.Types.BIGINT);else p.setLong(3,parentId.longValue());p.setString(4,content);p.setLong(5,boardId);return p.executeUpdate()==1;}
    }
    public boolean isCommentInBoard(long commentId,long boardId)throws Exception{
        try(Connection c=dataSource.getConnection();PreparedStatement p=c.prepareStatement("SELECT 1 FROM board_comment WHERE comment_id=? AND board_id=? AND is_deleted=FALSE")){p.setLong(1,commentId);p.setLong(2,boardId);try(ResultSet r=p.executeQuery()){return r.next();}}
    }
    public boolean softDeleteComment(long commentId,long memberId,boolean admin) throws Exception {
        String sql="UPDATE board_comment SET is_deleted=TRUE,deleted_at=CURRENT_TIMESTAMP WHERE comment_id=?"+(admin?"":" AND member_id=?");
        try(Connection c=dataSource.getConnection();PreparedStatement p=c.prepareStatement(sql)){p.setLong(1,commentId);if(!admin)p.setLong(2,memberId);return p.executeUpdate()==1;}
    }
    public boolean isMemberActive(long memberId) throws Exception {
        try(Connection c=dataSource.getConnection();PreparedStatement p=c.prepareStatement("SELECT 1 FROM member WHERE member_id=? AND status='ACTIVE'")){p.setLong(1,memberId);try(ResultSet r=p.executeQuery()){return r.next();}}
    }
    public void addFile(long boardId,BoardFileDTO file)throws Exception{
        String sql="INSERT INTO board_file(board_id,original_name,saved_name,file_path,file_size,file_type) VALUES(?,?,?,?,?,?)";
        try(Connection c=dataSource.getConnection();PreparedStatement p=c.prepareStatement(sql)){p.setLong(1,boardId);p.setString(2,file.getOriginalName());p.setString(3,file.getSavedName());p.setString(4,file.getFilePath());p.setLong(5,file.getFileSize());p.setString(6,file.getFileType());p.executeUpdate();}
    }
    public List<BoardFileDTO> findFiles(long boardId)throws Exception{
        List<BoardFileDTO> rows=new ArrayList<BoardFileDTO>();String sql="SELECT file_id,original_name,saved_name,file_path,file_size,file_type FROM board_file WHERE board_id=? AND is_deleted=FALSE ORDER BY file_id";
        try(Connection c=dataSource.getConnection();PreparedStatement p=c.prepareStatement(sql)){p.setLong(1,boardId);try(ResultSet r=p.executeQuery()){while(r.next()){BoardFileDTO f=new BoardFileDTO();f.setFileId(r.getLong(1));f.setOriginalName(r.getString(2));f.setSavedName(r.getString(3));f.setFilePath(r.getString(4));f.setFileSize(r.getLong(5));f.setFileType(r.getString(6));rows.add(f);}}}return rows;
    }
    public BoardFileDTO findFile(long fileId)throws Exception{
        String sql="SELECT f.file_id,f.board_id,f.original_name,f.saved_name,f.file_path,f.file_size,f.file_type FROM board_file f JOIN board b ON b.board_id=f.board_id WHERE f.file_id=? AND f.is_deleted=FALSE AND b.is_deleted=FALSE";
        try(Connection c=dataSource.getConnection();PreparedStatement p=c.prepareStatement(sql)){p.setLong(1,fileId);try(ResultSet r=p.executeQuery()){if(!r.next())return null;BoardFileDTO f=new BoardFileDTO();f.setFileId(r.getLong("file_id"));f.setOriginalName(r.getString("original_name"));f.setSavedName(r.getString("saved_name"));f.setFilePath(r.getString("file_path"));f.setFileSize(r.getLong("file_size"));f.setFileType(r.getString("file_type"));return f;}}
    }
    private BoardDTO mapBoard(ResultSet r) throws Exception {
        BoardDTO b=new BoardDTO();b.setBoardId(r.getLong("board_id"));b.setMemberId(r.getLong("member_id"));b.setCategory(r.getString("category"));b.setTitle(r.getString("title"));b.setContent(r.getString("content"));b.setTags(r.getString("tags"));b.setViewCount(r.getInt("view_count"));b.setCreatedAt(r.getTimestamp("created_at"));b.setUpdatedAt(r.getTimestamp("updated_at"));b.setAuthorName(r.getString("name"));return b;
    }
}
