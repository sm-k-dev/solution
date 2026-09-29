package sentinel.dto;

import java.sql.Timestamp;

public class IncidentInquiry {
    private long inquiryId;
    private String title;
    private String status;
    private String linkReason;
    private Long linkedBy;
    private Timestamp linkedAt;

    public long getInquiryId() { return inquiryId; }
    public void setInquiryId(long value) { inquiryId = value; }
    public String getTitle() { return title; }
    public void setTitle(String value) { title = value; }
    public String getStatus() { return status; }
    public void setStatus(String value) { status = value; }
    public String getLinkReason() { return linkReason; }
    public void setLinkReason(String value) { linkReason = value; }
    public Long getLinkedBy() { return linkedBy; }
    public void setLinkedBy(Long value) { linkedBy = value; }
    public Timestamp getLinkedAt() { return linkedAt; }
    public void setLinkedAt(Timestamp value) { linkedAt = value; }
}
