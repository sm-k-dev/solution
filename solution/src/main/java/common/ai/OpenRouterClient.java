package common.ai;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/** SentinelOps와 Security가 공유하는 OpenRouter JSON 요청 클라이언트입니다. */
public class OpenRouterClient {

    private static final String API_URL = "https://openrouter.ai/api/v1/chat/completions";
    private static final int MAX_RESPONSE_LENGTH = 30000;

    public Completion requestJson(String systemPrompt, String userPrompt, int maxTokens)
        throws IOException {
        String apiKey = requiredEnvironment("OPENROUTER_API_KEY");
        String model = requiredEnvironment("OPENROUTER_MODEL");

        JSONObject body = new JSONObject();
        body.put("model", model);
        body.put("temperature", Integer.valueOf(0));
        body.put("max_tokens", Integer.valueOf(maxTokens));

        JSONArray messages = new JSONArray();
        messages.add(message("system", systemPrompt));
        messages.add(message("user", userPrompt));
        body.put("messages", messages);

        String response = execute(apiKey, body.toJSONString());
        return new Completion(parseJsonFields(response), model);
    }

    public JSONObject parseJsonFields(String response) throws IOException {
        try {
            JSONObject root = (JSONObject) new JSONParser().parse(response);
            JSONArray choices = (JSONArray) root.get("choices");
            if (choices == null || choices.isEmpty()) {
                throw new IOException("AI response has no choices");
            }
            JSONObject answer = (JSONObject) ((JSONObject) choices.get(0)).get("message");
            String content = (String) answer.get("content");
            if (content == null) {
                throw new IOException("AI response has no content");
            }
            String normalized = content.trim();
            if (normalized.startsWith("```")) {
                normalized = normalized.replaceFirst("^```(?:json)?\\s*", "")
                    .replaceFirst("\\s*```$", "");
            }
            return (JSONObject) new JSONParser().parse(normalized);
        } catch (ParseException | ClassCastException | NullPointerException error) {
            throw new IOException("AI response format is invalid", error);
        }
    }

    public String requiredText(JSONObject fields, String key, int maxLength)
        throws IOException {
        Object value = fields.get(key);
        if (!(value instanceof String) || ((String) value).trim().isEmpty()) {
            throw new IOException("AI response is missing " + key);
        }
        String text = ((String) value).trim().replace('\r', ' ').replace('\n', ' ');
        return text.length() <= maxLength ? text : text.substring(0, maxLength);
    }

    private String execute(String apiKey, String requestBody) throws IOException {
        HttpURLConnection connection = (HttpURLConnection) new URL(API_URL).openConnection();
        connection.setRequestMethod("POST");
        connection.setConnectTimeout(5000);
        connection.setReadTimeout(15000);
        connection.setDoOutput(true);
        connection.setRequestProperty("Authorization", "Bearer " + apiKey);
        connection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");

        try {
            try (OutputStream output = connection.getOutputStream()) {
                output.write(requestBody.getBytes(StandardCharsets.UTF_8));
            }
            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
                throw new IOException("AI provider returned HTTP " + connection.getResponseCode());
            }
            StringBuilder response = new StringBuilder();
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(
                connection.getInputStream(), StandardCharsets.UTF_8))) {
                int next;
                while ((next = reader.read()) != -1) {
                    if (response.length() >= MAX_RESPONSE_LENGTH) {
                        throw new IOException("AI response too large");
                    }
                    response.append((char) next);
                }
            }
            return response.toString();
        } finally {
            connection.disconnect();
        }
    }

    @SuppressWarnings("unchecked")
    private JSONObject message(String role, String content) {
        JSONObject value = new JSONObject();
        value.put("role", role);
        value.put("content", content);
        return value;
    }

    private String requiredEnvironment(String name) throws IOException {
        String value = System.getenv(name);
        if (value == null || value.trim().isEmpty()) {
            throw new IOException("AI environment settings are missing: " + name);
        }
        return value.trim();
    }

    public static final class Completion {
        private final JSONObject fields;
        private final String model;

        private Completion(JSONObject fields, String model) {
            this.fields = fields;
            this.model = model;
        }

        public JSONObject getFields() {
            return fields;
        }

        public String getModel() {
            return model;
        }
    }
}
