package common.api;

import java.io.IOException;
import java.sql.Connection;
import java.time.Instant;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import common.db.DataSourceProvider;

/**
 * 연동 서버·로드밸런서용 상태 확인 API입니다.
 * 인증 없이 호출할 수 있으며 UP/DOWN 상태 외의 내부 정보는 반환하지 않습니다.
 */
public class HealthApiServlet extends JsonApiServlet {
    private static final long serialVersionUID = 1L;
    private static final int DB_TIMEOUT_SECONDS = 2;

    @Override
    protected String allowedMethods() {
        return "GET";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String database = isDatabaseUp() ? "UP" : "DOWN";
        boolean up = "UP".equals(database);

        JSONObject checks = new JSONObject();
        checks.put("database", database);
        JSONObject body = new JSONObject();
        body.put("status", up ? "UP" : "DOWN");
        body.put("checks", checks);
        body.put("timestamp", Instant.now().toString());
        if (!up) {
            // DB 장애 자체는 인시던트 저장도 실패하므로 health 응답으로 중복 기록하지 않습니다.
            skipIncident(request);
        }
        writeJson(response, up ? HttpServletResponse.SC_OK : HttpServletResponse.SC_SERVICE_UNAVAILABLE, body);
    }

    private boolean isDatabaseUp() {
        try (Connection connection = DataSourceProvider.get().getConnection()) {
            return connection.isValid(DB_TIMEOUT_SECONDS);
        } catch (Exception error) {
            getServletContext().log("Health check: database unavailable", error);
            return false;
        }
    }
}
