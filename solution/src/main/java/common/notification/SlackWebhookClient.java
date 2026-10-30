package common.notification;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import org.json.simple.JSONObject;

/** 기능 패키지와 무관하게 Slack Webhook 메시지를 전송합니다. */
public class SlackWebhookClient {

    @SuppressWarnings("unchecked")
    public void send(String webhookUrl, String message) throws IOException {
        URL url = new URL(webhookUrl);
        if (!"https".equalsIgnoreCase(url.getProtocol())
            || !"hooks.slack.com".equalsIgnoreCase(url.getHost())) {
            throw new IOException("Invalid Slack webhook host");
        }

        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        connection.setConnectTimeout(3000);
        connection.setReadTimeout(3000);
        connection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");

        JSONObject payload = new JSONObject();
        payload.put("text", message);
        try {
            try (OutputStream output = connection.getOutputStream()) {
                output.write(payload.toJSONString().getBytes(StandardCharsets.UTF_8));
            }
            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
                throw new IOException("Slack returned HTTP " + connection.getResponseCode());
            }
        } finally {
            connection.disconnect();
        }
    }
}
