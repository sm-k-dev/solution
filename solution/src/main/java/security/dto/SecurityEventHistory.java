package security.dto;

import java.sql.Timestamp;

public class SecurityEventHistory {
    private String previousStatus;
    private String newStatus;
    private Long changedBy;
    private Timestamp changedAt;

    public String getPreviousStatus() {
        return previousStatus;
    }

    public void setPreviousStatus(String value) {
        previousStatus = value;
    }

    public String getNewStatus() {
        return newStatus;
    }

    public void setNewStatus(String value) {
        newStatus = value;
    }

    public Long getChangedBy() {
        return changedBy;
    }

    public void setChangedBy(Long value) {
        changedBy = value;
    }

    public Timestamp getChangedAt() {
        return changedAt;
    }

    public void setChangedAt(Timestamp value) {
        changedAt = value;
    }
}
