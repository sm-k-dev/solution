package sentinel.service;

import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.http.HttpServletRequest;
import sentinel.dao.IncidentDAO;

public class IncidentRecorder {
    private final IncidentDAO dao = new IncidentDAO();
    private final SeverityClassifier classifier = new SeverityClassifier();
    private final IncidentAlertService alerts = new IncidentAlertService();

    public void record(HttpServletRequest request, Throwable error, int status) {
        String type = error == null ? "HTTP_"  + status : error.getClass().getName();
        String message = error == null ? "HTTP "  + status + " server error" : error.getMessage();
        String severity = classifier.classifySeverity(status, error, request.getRequestURI());
        String trace = null;
        if (error != null) {
            StringWriter buffer = new StringWriter();
            error.printStackTrace(new PrintWriter(buffer));
            trace = buffer.toString();
            if (trace.length() > 16000) {
                trace = trace.substring(0, 16000);
            }
        }
        long incidentId;
        try {
            incidentId = dao.insertIncident(type, message, trace, severity,
                request.getRequestURI(), request.getMethod(), request.getRemoteAddr());
        } catch (Exception saveError) {
            request.getServletContext().log("SentinelOps: incident persistence failed", saveError);
            return;
        }
        if ("CRITICAL".equals(severity)) {
            try {
                alerts.sendCriticalAlert(incidentId, type, request.getRequestURI());
            } catch (Exception alertError) {
                request.getServletContext().log("SentinelOps: alert processing failed", alertError);
            }
        }
    }

}
