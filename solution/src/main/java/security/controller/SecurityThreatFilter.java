package security.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import security.dto.ThreatFinding;
import security.service.SecurityEventRecorder;
import security.service.SecurityThreatDetector;

public class SecurityThreatFilter implements Filter {
    private static final int MAX_PARAMETERS = 40;
    private static final int MAX_VALUES_PER_PARAMETER = 4;
    private final SecurityThreatDetector detector = new SecurityThreatDetector();
    private final SecurityEventRecorder recorder = new SecurityEventRecorder();

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
    throws IOException, ServletException {
        if (request instanceof HttpServletRequest) {
            try {
                request.setCharacterEncoding("UTF-8");
                inspectRequest((HttpServletRequest) request);
            } catch (RuntimeException ignored) {
                // Monitoring must never prevent the original customer request.
            }
        }
        chain.doFilter(request, response);
    }

    private void inspectRequest(HttpServletRequest request) {
        String uri = request.getRequestURI();
        if (isStaticAsset(uri)) {
            return;
        }
        Set<String> recorded = new HashSet<String>();
        inspectWeb(request, "REQUEST_TARGET", uri + "?"    + safe(request.getQueryString()), recorded);

        int parameters = 0;
        for (Map.Entry<String, String[]> entry : request.getParameterMap().entrySet()) {
            if (++parameters > MAX_PARAMETERS) {
                break;
            }
            String name = entry.getKey();
            if (isSensitiveField(name)) {
                continue;
            }
            String[] values = entry.getValue();
            if (values == null) {
                continue;
            }
            for (int index = 0; index < values.length && index < MAX_VALUES_PER_PARAMETER; index++) {
                inspectWeb(request, "HTTP_PARAMETER:"    + bounded(name, 40), values[index], recorded);
                if (isAiField(name) || isAiEndpoint(uri)) {
                    inspectAi(request, "AI_INPUT:"    + bounded(name, 40), values[index], recorded);
                }
            }
        }
    }

    private void inspectWeb(HttpServletRequest request, String source, String value, Set<String> recorded) {
        List<ThreatFinding> findings = detector.inspectWeb(value);
        for (ThreatFinding finding : findings) {
            String key = source + "|"    + finding.getRuleCode();
            if (recorded.add(key)) {
                recorder.recordWeb(request, finding, source);
            }
        }
    }

    private void inspectAi(HttpServletRequest request, String source, String value, Set<String> recorded) {
        List<ThreatFinding> findings = detector.inspectAiContent(value);
        for (ThreatFinding finding : findings) {
            String key = source + "|"    + finding.getRuleCode();
            if (recorded.add(key)) {
                recorder.recordWeb(request, finding, source);
            }
        }
    }

    private boolean isAiField(String name) {
        if (name == null) {
            return false;
        }
        String lower = name.toLowerCase(java.util.Locale.ROOT);
        return lower.contains("prompt") || lower.contains("instruction") ||
        lower.equals("aiinput") || lower.equals("ai_input");
    }

    private boolean isAiEndpoint(String uri) {
        if (uri == null) {
            return false;
        }
        String lower = uri.toLowerCase(java.util.Locale.ROOT);
        return lower.contains("/ai/") || lower.endsWith("/ai") || lower.contains("/chat/");
    }

    private boolean isSensitiveField(String name) {
        if (name == null) {
            return false;
        }
        String lower = name.toLowerCase(java.util.Locale.ROOT);
        return lower.contains("password") || lower.contains("passwd") ||
        lower.contains("credential") || lower.equals("token") ||
        lower.contains("csrftoken");
    }

    private boolean isStaticAsset(String uri) {
        if (uri == null) {
            return false;
        }
        return uri.contains("/assets/") || uri.endsWith(".css") || uri.endsWith(".js") ||
        uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".jpeg") ||
        uri.endsWith(".gif") || uri.endsWith(".svg") || uri.endsWith(".ico");
    }

    private String safe(String value) {
        return value == null ? "" : value;
    }

    private String bounded(String value, int max) {
        if (value == null) {
            return "unknown";
        }
        return value.length() <= max ? value : value.substring(0, max);
    }
}
