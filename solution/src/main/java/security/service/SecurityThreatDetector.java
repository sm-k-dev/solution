package security.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import security.dto.ThreatFinding;

public class SecurityThreatDetector {
    private static final int MAX_INPUT = 12000;
    private final SecuritySeverityClassifier classifier = new SecuritySeverityClassifier();

    private static final Rule[] WEB_RULES = new Rule[] {
        rule("WEB", "SQL_INJECTION", "WEB-SQLI-001",
            "(?i)(?:\\bunion\\s+(?:all\\s+)?select\\b|(?:'|%27)\\s*(?:or|and)\\s+(?:'[^']*'|\\d+)\\s*=\\s*(?:'[^']*'|\\d+)|\\b(?:sleep|benchmark)\\s*\\()"),
        rule("WEB", "SQL_INJECTION", "WEB-SQLI-002",
            "(?i)(?:\\binformation_schema\\b|\\bload_file\\s*\\(|\\binto\\s+outfile\\b)"),
        rule("WEB", "XSS", "WEB-XSS-001",
            "(?i)(?:<\\s*script\\b|javascript\\s*:|<\\s*(?:img|svg|iframe)\\b[^>]*(?:onerror|onload)\\s*=|on(?:error|load|click|focus)\\s*=)"),
        rule("WEB", "PATH_TRAVERSAL", "WEB-PATH-001",
            "(?i)(?:\\.\\.[/\\\\]|%2e%2e(?:%2f|%5c)|/etc/passwd|win(?:dows)?[/\\\\]system32)"),
        rule("WEB", "COMMAND_INJECTION", "WEB-CMD-001",
            "(?i)(?:(?:;|\\|\\||&&|`|\\$\\()\\s*(?:bash|sh|cmd|powershell|curl|wget|nc|cat|whoami|id)\\b)"),
        rule("WEB", "SSRF_METADATA_ACCESS", "WEB-SSRF-001",
            "(?i)https?://(?:127(?:\\.\\d{1,3}){3}|localhost|0\\.0\\.0\\.0|169\\.254\\.169\\.254)(?::\\d+)?(?:/|$)")
    };

    private static final Rule[] AI_RULES = new Rule[] {
        rule("AI", "PROMPT_INJECTION", "AI-PI-001",
            "(?i)(?:ignore|disregard|forget)\\s+(?:all\\s+)?(?:previous|prior|above|system|developer)\\s+(?:instructions?|prompts?|rules?)"),
        rule("AI", "PROMPT_INJECTION", "AI-PI-002",
            "(?:이전|위의|기존|시스템|개발자)\\s*(?:지시|명령|규칙|프롬프트)(?:를|을)?\\s*(?:무시|잊어|폐기|따르지)"),
        rule("AI", "SYSTEM_PROMPT_EXTRACTION", "AI-LEAK-001",
            "(?i)(?:reveal|show|print|repeat|expose)\\s+(?:the\\s+)?(?:hidden\\s+)?(?:system|developer)\\s+(?:prompt|instructions?)"),
        rule("AI", "SYSTEM_PROMPT_EXTRACTION", "AI-LEAK-002",
            "(?:시스템|개발자|숨겨진)\\s*(?:프롬프트|지시|명령)(?:를|을)?\\s*(?:보여|출력|공개|노출|반복)"),
        rule("AI", "AI_TOOL_ABUSE", "AI-TOOL-001",
            "(?i)(?:call|invoke|execute|run|use)\\s+(?:the\\s+)?(?:tool|function|shell|terminal).{0,80}(?:send|upload|delete|download|execute|exfiltrate)"),
        rule("AI", "AI_TOOL_ABUSE", "AI-TOOL-002",
            "(?:도구|함수|셸|터미널)(?:을|를)?\\s*(?:호출|실행|사용).{0,80}(?:전송|업로드|삭제|다운로드|유출)"),
        rule("AI", "PROMPT_INJECTION", "AI-JAILBREAK-001",
            "(?i)(?:jailbreak|developer\\s+mode|DAN\\s+mode|bypass\\s+(?:safety|policy|guardrail)|disable\\s+(?:safety|filter))"),
        rule("AI", "SENSITIVE_DATA_IN_PROMPT", "AI-SECRET-001",
            "(?i)(?:sk-[a-z0-9_-]{16,}|AKIA[0-9A-Z]{16}|(?:api[_ -]?key|password|passwd|secret|token)\\s*[:=]\\s*[^\\s&]{8,}|authorization\\s*:\\s*bearer\\s+[^\\s]{8,}|jdbc:mysql://[^\\s]+)")
    };

    public List<ThreatFinding> inspectWeb(String input) {
        return inspect(input, WEB_RULES);
    }

    public List<ThreatFinding> inspectAiContent(String input) {
        return inspect(input, AI_RULES);
    }

    public String sanitizeForAi(String input) {
        if (input == null) return "unknown";
        String sanitized = limit(input, 3000);
        for (Rule rule : AI_RULES) {
            sanitized = rule.pattern.matcher(sanitized).replaceAll("[차단된 보안 위협 패턴]");
        }
        sanitized = sanitized.replaceAll("[\\p{Cntrl}&&[^\\r\\n\\t]]", " ");
        return sanitized;
    }

    private List<ThreatFinding> inspect(String input, Rule[] rules) {
        List<ThreatFinding> findings = new ArrayList<ThreatFinding>();
        if (input == null || input.isEmpty()) return findings;
        String bounded = limit(input, MAX_INPUT);
        Set<String> matchedCodes = new HashSet<String>();
        for (Rule rule : rules) {
            Matcher matcher = rule.pattern.matcher(bounded);
            if (matcher.find() && matchedCodes.add(rule.code)) {
                findings.add(new ThreatFinding(rule.category, rule.type,
                    classifier.classify(rule.type), rule.code,
                    excerpt(bounded, matcher.start(), matcher.end(), rule.type)));
            }
        }
        return findings;
    }

    private String excerpt(String input, int start, int end, String type) {
        if ("SENSITIVE_DATA_IN_PROMPT".equals(type)) return "[민감정보 패턴 마스킹됨]";
        int from = Math.max(0, start - 50);
        int to = Math.min(input.length(), end + 50);
        String value = input.substring(from, to)
            .replace('\r', ' ').replace('\n', ' ').replace('\t', ' ')
            .replaceAll("(?i)(?:password|passwd|secret|token|api[_ -]?key)\\s*[:=]\\s*[^\\s&]+", "[민감정보]=[REDACTED]");
        return limit(value, 240);
    }

    private String limit(String value, int max) {
        return value.length() <= max ? value : value.substring(0, max);
    }

    private static Rule rule(String category, String type, String code, String expression) {
        return new Rule(category, type, code, Pattern.compile(expression));
    }

    private static class Rule {
        final String category;
        final String type;
        final String code;
        final Pattern pattern;
        Rule(String category, String type, String code, Pattern pattern) {
            this.category = category;
            this.type = type;
            this.code = code;
            this.pattern = pattern;
        }
    }
}
