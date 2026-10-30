package security.service;

/** Severity is decided by stable rules. AI analysis never changes this result. */
public class SecuritySeverityClassifier {

    public String classify(String threatType) {
        if ("COMMAND_INJECTION".equals(threatType) ||
        "SSRF_METADATA_ACCESS".equals(threatType) ||
        "SENSITIVE_DATA_IN_PROMPT".equals(threatType)) return "CRITICAL";
        if ("SQL_INJECTION".equals(threatType) ||
        "XSS".equals(threatType) ||
        "PATH_TRAVERSAL".equals(threatType) ||
        "PROMPT_INJECTION".equals(threatType) ||
        "SYSTEM_PROMPT_EXTRACTION".equals(threatType) ||
        "AI_TOOL_ABUSE".equals(threatType)) return "HIGH";
        return "MEDIUM";
    }
}
