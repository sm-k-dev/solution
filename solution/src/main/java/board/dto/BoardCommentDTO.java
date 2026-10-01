package board.dto;

import java.sql.Timestamp;

public class BoardCommentDTO {
    private long commentId;
    private long memberId;
    private Long parentCommentId;
    private String content;
    private String authorName;
    private Timestamp createdAt;

    public long getCommentId() { return commentId; }
    public void setCommentId(long commentId) { this.commentId = commentId; }
    public long getMemberId() { return memberId; }
    public void setMemberId(long memberId) { this.memberId = memberId; }
    public Long getParentCommentId() { return parentCommentId; }
    public void setParentCommentId(Long parentCommentId) { this.parentCommentId = parentCommentId; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public String getAuthorName() { return authorName; }
    public void setAuthorName(String authorName) { this.authorName = authorName; }
    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}
