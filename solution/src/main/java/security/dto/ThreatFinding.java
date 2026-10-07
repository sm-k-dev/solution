package security.dto;

public class ThreatFinding {
    private String category;
    private String threatType;
    private String severity;
    private String ruleCode;
    private String evidenceExcerpt;

    public ThreatFinding(String category, String threatType, String severity,
        String ruleCode, String evidenceExcerpt) {
        this.category = category;
        this.threatType = threatType;
        this.severity = severity;
        this.ruleCode = ruleCode;
        this.evidenceExcerpt = evidenceExcerpt;
    }

    public String getCategory() {
        return category;
    }

    public String getThreatType() {
        return threatType;
    }

    public String getSeverity() {
        return severity;
    }

    public String getRuleCode() {
        return ruleCode;
    }

    public String getEvidenceExcerpt() {
        return evidenceExcerpt;
    }
}
