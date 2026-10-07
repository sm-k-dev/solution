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

/** Shared OpenRouter transport and response parser for AI-backed features. */
public final class OpenRouterClient {
    private static final String API_URL = "https://openrouter.ai/api/v1/chat/completions";
    private static final int MAX_RESPONSE_CHARS = 30000;

    public String complete(JSONArray messages, int maxTokens) throws IOException {
        String apiKey = System.getenv("OPENROUTER_API_KEY");
        String model = System.getenv("OPENROUTER_MODEL");
        if (apiKey == null || apiKey.trim().isEmpty() || model == null || model.trim().isEmpty()) {
            throw new IOException("AI environment settings are missing");
        }

        JSONObject body = new JSONObject();
        body.put("model", model);
        body.put("temperature", Integer.valueOf(0));
        body.put("max_tokens", Integer.valueOf(maxTokens));
        body.put("messages", messages);

        HttpURLConnection connection = (HttpURLConnection) new URL(API_URL).openConnection();
        connection.setRequestMethod("POST");
        connection.setConnectTimeout(5000);
        connection.setReadTimeout(15000);
        connection.setDoOutput(true);
        connection.setRequestProperty("Authorization", "Bearer " + apiKey);
        connection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        try {
            try (OutputStream output = connection.getOutputStream()) {
                output.write(body.toJSONString().getBytes(StandardCharsets.UTF_8));
            }
            if (connection.getResponseCode() != HttpURLConnection.HTTP_OK) {
                throw new IOException("AI provider returned HTTP " + connection.getResponseCode());
            }
            StringBuilder response = new StringBuilder();
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(
                connection.getInputStream(), StandardCharsets.UTF_8))) {
                int next;
                while ((next = reader.read()) != -1) {
                    if (response.length() >= MAX_RESPONSE_CHARS) {
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

    public static JSONObject extractJsonObject(String response) throws IOException {
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
            String trimmed = content.trim();
            if (trimmed.startsWith("```")) {
                trimmed = trimmed.replaceFirst("^```(?:json)?\\s*", "")
                .replaceFirst("\\s*```$", "");
            }
            return (JSONObject) new JSONParser().parse(trimmed);
        } catch (ParseException | ClassCastException | NullPointerException error) {
            throw new IOException("AI response format is invalid", error);
        }
    }

    public static String requiredString(JSONObject fields, String key, int maxLength)
    throws IOException {
        Object value = fields.get(key);
        if (!(value instanceof String) || ((String) value).trim().isEmpty()) {
            throw new IOException("AI response is missing " + key);
        }
        return safeLine((String) value, maxLength);
    }

    public static String safeLine(String value, int maxLength) {
        if (value == null) {
            return "unknown";
        }
        String normalized = value.replace('\n', ' ').replace('\r', ' ');
        return normalized.length() <= maxLength ? normalized : normalized.substring(0, maxLength);
    }
}
