package sentinel.service;

import java.sql.SQLException;
import javax.naming.NamingException;
import sentinel.dao.IncidentAlertDAO;

public class IncidentAlertService {
    private final IncidentAlertDAO dao = new IncidentAlertDAO();
    private final SlackWebhookClient slack = new SlackWebhookClient();

    public void sendCriticalAlert(long incidentId, String errorType, String uri)
            throws SQLException, NamingException {
        String webhook = System.getenv("SLACK_WEBHOOK_URL");
        if (webhook == null || webhook.trim().isEmpty()) return;
        String message = "[NEXORA] CRITICAL Incident #" + incidentId +
            " | " + bounded(errorType, 100) + " | " + bounded(uri, 200);
        sendAndRecord(incidentId, "CRITICAL_ALERT", message, webhook);
    }

    public synchronized boolean sendPreviousDaySummary()
            throws SQLException, NamingException {
        String webhook = System.getenv("SLACK_WEBHOOK_URL");
        if (webhook == null || webhook.trim().isEmpty()) return false;
        if (dao.hasSuccessfulSummaryToday()) return false;
        int[] counts = dao.countPreviousDayIncidents();
        String message = "[NEXORA] 어제 오류 요약 | 전체 " + counts[0] +
            "건, CRITICAL " + counts[1] + "건, HIGH " + counts[2] + "건";
        return sendAndRecord(null, "DAILY_SUMMARY", message, webhook);
    }

    private boolean sendAndRecord(Long incidentId, String type, String message, String webhook)
            throws SQLException, NamingException {
        long alertId = dao.insertAlert(incidentId, type, message);
        try {
            slack.send(webhook, message);
            dao.updateAlertStatus(alertId, true, null);
            return true;
        } catch (java.io.IOException error) {
            dao.updateAlertStatus(alertId, false, error.getMessage());
            return false;
        }
    }

    private String bounded(String value, int max) {
        if (value == null) return "unknown";
        return value.length() <= max ? value : value.substring(0, max);
    }
}
