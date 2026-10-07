package common.util;

/** Text normalization shared by notifications and audit summaries. */
public final class TextUtils {

    private TextUtils() {
    }

    public static String singleLine(String value, int maxLength) {
        if (value == null) {
            return "unknown";
        }
        String normalized = value.replace('\r', ' ').replace('\n', ' ').trim();
        if (normalized.length() <= maxLength) {
            return normalized;
        }
        return normalized.substring(0, maxLength);
    }
}
