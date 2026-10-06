package security.service;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import security.dao.SecurityEventDAO;
import security.dto.SecurityEvent;
import security.dto.ThreatFinding;

public class SecurityEventRecorder {
    private static final long WINDOW_MILLIS = 10L * 60L * 1000L;
    private final SecurityEventDAO dao = new SecurityEventDAO();
    private final SecurityAlertService alerts = new SecurityAlertService();

    public void recordWeb(HttpServletRequest request, ThreatFinding finding, String source) {
        SecurityEvent event = new SecurityEvent();
        event.setCategory(finding.getCategory());
        event.setThreatType(finding.getThreatType());
        event.setSeverity(finding.getSeverity());
        event.setDetectionSource(source);
        event.setRuleCode(finding.getRuleCode());
        event.setEvidenceExcerpt(finding.getEvidenceExcerpt());
        event.setRequestUri(request == null ? null : request.getRequestURI());
        event.setHttpMethod(request == null ? null : request.getMethod());
        event.setSourceIpHash(request == null ? null : hash(clientAddress(request)));
        persist(event);
    }

    public void recordAi(String source, ThreatFinding finding) {
        SecurityEvent event = new SecurityEvent();
        event.setCategory("AI");
        event.setThreatType(finding.getThreatType());
        event.setSeverity(finding.getSeverity());
        event.setDetectionSource(source);
        event.setRuleCode(finding.getRuleCode());
        event.setEvidenceExcerpt(finding.getEvidenceExcerpt());
        event.setRequestUri("AI_GATEWAY");
        event.setHttpMethod("INTERNAL");
        event.setSourceIpHash(null);
        persist(event);
    }

    private void persist(SecurityEvent event) {
        try {
            String fingerprint = hash(safe(event.getCategory()) + "|" + safe(event.getThreatType()) + "|" +
                safe(event.getRuleCode()) + "|" + safe(event.getRequestUri()) + "|" +
                safe(event.getSourceIpHash()));
            long eventId = dao.insertOrIncrement(event, fingerprint,
                System.currentTimeMillis() / WINDOW_MILLIS);
            if ("CRITICAL".equals(event.getSeverity())) {
                alerts.sendCriticalAlert(eventId, event.getThreatType(), event.getRequestUri());
            }
        } catch (Exception ignored) {
            // Security telemetry failure must not take down the customer request.
        }
    }

    private String clientAddress(HttpServletRequest request) {
        String forwarded = request.getHeader("X-Forwarded-For");
        if (forwarded != null && !forwarded.trim().isEmpty()) {
            String first = forwarded.split(",", 2)[0].trim();
            if (isAddress(first)) return first;
        }
        return request.getRemoteAddr();
    }

    private boolean isAddress(String value) {
        return value != null && value.length() <= 45 && value.matches("[0-9a-fA-F:.]+" );
    }

    private String safe(String value) { return value == null ? "" : value; }

    private String hash(String value) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] bytes = digest.digest(safe(value).getBytes(StandardCharsets.UTF_8));
            StringBuilder result = new StringBuilder();
            for (byte item : bytes) result.append(String.format(Locale.ROOT, "%02x", item & 0xff));
            return result.toString();
        } catch (Exception error) {
            return "unavailable";
        }
    }
}
