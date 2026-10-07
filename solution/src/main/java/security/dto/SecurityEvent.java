package security.dto;

import java.sql.Timestamp;

public class SecurityEvent {
    private long securityEventId;
    private String category;
    private String threatType;
    private String severity;
    private String status;
    private String detectionSource;
    private String ruleCode;
    private String evidenceExcerpt;
    private String requestUri;
    private String httpMethod;
    private String sourceIpHash;
    private int occurrenceCount;
    private Timestamp firstSeenAt;
    private Timestamp lastSeenAt;

    public long getSecurityEventId() {
        return securityEventId;
    }

    public void setSecurityEventId(long value) {
        securityEventId = value;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String value) {
        category = value;
    }

    public String getThreatType() {
        return threatType;
    }

    public void setThreatType(String value) {
        threatType = value;
    }

    public String getSeverity() {
        return severity;
    }

    public void setSeverity(String value) {
        severity = value;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String value) {
        status = value;
    }

    public String getDetectionSource() {
        return detectionSource;
    }

    public void setDetectionSource(String value) {
        detectionSource = value;
    }

    public String getRuleCode() {
        return ruleCode;
    }

    public void setRuleCode(String value) {
        ruleCode = value;
    }

    public String getEvidenceExcerpt() {
        return evidenceExcerpt;
    }

    public void setEvidenceExcerpt(String value) {
        evidenceExcerpt = value;
    }

    public String getRequestUri() {
        return requestUri;
    }

    public void setRequestUri(String value) {
        requestUri = value;
    }

    public String getHttpMethod() {
        return httpMethod;
    }

    public void setHttpMethod(String value) {
        httpMethod = value;
    }

    public String getSourceIpHash() {
        return sourceIpHash;
    }

    public void setSourceIpHash(String value) {
        sourceIpHash = value;
    }

    public int getOccurrenceCount() {
        return occurrenceCount;
    }

    public void setOccurrenceCount(int value) {
        occurrenceCount = value;
    }

    public Timestamp getFirstSeenAt() {
        return firstSeenAt;
    }

    public void setFirstSeenAt(Timestamp value) {
        firstSeenAt = value;
    }

    public Timestamp getLastSeenAt() {
        return lastSeenAt;
    }

    public void setLastSeenAt(Timestamp value) {
        lastSeenAt = value;
    }
}
