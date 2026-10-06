package security.dto;

import java.sql.Timestamp;

public class SecurityAnalysis {
    private String summary;
    private String possibleImpact;
    private String suggestedAction;
    private String modelName;
    private Timestamp createdAt;

    public String getSummary() { return summary; }
    public void setSummary(String value) { summary = value; }
    public String getPossibleImpact() { return possibleImpact; }
    public void setPossibleImpact(String value) { possibleImpact = value; }
    public String getSuggestedAction() { return suggestedAction; }
    public void setSuggestedAction(String value) { suggestedAction = value; }
    public String getModelName() { return modelName; }
    public void setModelName(String value) { modelName = value; }
    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp value) { createdAt = value; }
}
