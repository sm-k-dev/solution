package security.service;

import java.sql.SQLException;
import javax.naming.NamingException;
import security.dao.SecurityAlertDAO;
import sentinel.service.SlackWebhookClient;

public class SecurityAlertService {
    private final SecurityAlertDAO dao = new SecurityAlertDAO();
    private final SlackWebhookClient slack = new SlackWebhookClient();

    public void sendCriticalAlert(long eventId, String threatType, String uri)
            throws SQLException, NamingException {
        String webhook = System.getenv("SLACK_WEBHOOK_URL");
        if (webhook == null || webhook.trim().isEmpty()) return;
        if (dao.hasSuccessfulCriticalAlert(eventId)) return;
        String message = "[NEXORA Security] CRITICAL Threat #" + eventId +
            " | " + bounded(threatType, 80) + " | " + bounded(uri, 180);
        sendAndRecord(Long.valueOf(eventId), "SECURITY_CRITICAL_ALERT", message, webhook);
    }

    public synchronized boolean sendPreviousDaySummary()
            throws SQLException, NamingException {
        String webhook = System.getenv("SLACK_WEBHOOK_URL");
        if (webhook == null || webhook.trim().isEmpty()) return false;
        if (dao.hasSuccessfulSummaryToday()) return false;
        int[] counts = dao.countPreviousDayEvents();
        String message = "[NEXORA Security] 어제 위협 요약 | 전체 " + counts[0] +
            "건, CRITICAL " + counts[1] + "건, HIGH " + counts[2] +
            "건, AI 프롬프트 " + counts[3] + "건";
        return sendAndRecord(null, "SECURITY_DAILY_SUMMARY", message, webhook);
    }

    private boolean sendAndRecord(Long eventId, String type, String message, String webhook)
            throws SQLException, NamingException {
        long alertId = dao.insertAlert(eventId, type, message);
        try {
            slack.send(webhook, message);
            dao.updateStatus(alertId, true, null);
            return true;
        } catch (java.io.IOException error) {
            dao.updateStatus(alertId, false, error.getMessage());
            return false;
        }
    }

    private String bounded(String value, int max) {
        if (value == null) return "unknown";
        String singleLine = value.replace('\r', ' ').replace('\n', ' ');
        return singleLine.length() <= max ? singleLine : singleLine.substring(0, max);
    }
}
