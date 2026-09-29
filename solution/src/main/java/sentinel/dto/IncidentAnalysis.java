package sentinel.dto;

import java.sql.Timestamp;

public class IncidentAnalysis {
    private String summary, possibleCause, suggestedAction, modelName;
    private Timestamp createdAt;
    public String getSummary() { return summary; }
    public void setSummary(String value) { summary = value; }
    public String getPossibleCause() { return possibleCause; }
    public void setPossibleCause(String value) { possibleCause = value; }
    public String getSuggestedAction() { return suggestedAction; }
    public void setSuggestedAction(String value) { suggestedAction = value; }
    public String getModelName() { return modelName; }
    public void setModelName(String value) { modelName = value; }
    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp value) { createdAt = value; }
}
