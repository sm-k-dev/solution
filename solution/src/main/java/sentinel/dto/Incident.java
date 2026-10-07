package sentinel.dto;

import java.sql.Timestamp;

public class Incident {
    private long incidentId;
    private String serviceName, errorType, errorMessage, stackTrace, severity, status;
    private String requestUri, httpMethod;
    private Timestamp occurredAt;

    public long getIncidentId() {
        return incidentId;
    }

    public void setIncidentId(long value) {
        incidentId = value;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String value) {
        serviceName = value;
    }

    public String getErrorType() {
        return errorType;
    }

    public void setErrorType(String value) {
        errorType = value;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String value) {
        errorMessage = value;
    }

    public String getStackTrace() {
        return stackTrace;
    }

    public void setStackTrace(String value) {
        stackTrace = value;
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

    public Timestamp getOccurredAt() {
        return occurredAt;
    }

    public void setOccurredAt(Timestamp value) {
        occurredAt = value;
    }
}
