package common.util;

/** 로그·외부 연동에 전달할 문자열을 제한된 길이의 한 줄로 정리합니다. */
public final class TextUtils {

    private TextUtils() {
    }

    public static String singleLine(String value, int maxLength) {
        return singleLine(value, maxLength, "unknown");
    }

    public static String singleLine(String value, int maxLength, String fallback) {
        if (value == null) {
            return fallback;
        }
        String normalized = value.replace('\r', ' ').replace('\n', ' ');
        return normalized.length() <= maxLength
            ? normalized
            : normalized.substring(0, maxLength);
    }

    public static String truncateNullable(String value, int maxLength) {
        if (value == null || value.length() <= maxLength) {
            return value;
        }
        return value.substring(0, maxLength);
    }
}
