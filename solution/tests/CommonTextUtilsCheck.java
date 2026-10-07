import common.util.TextUtils;

public class CommonTextUtilsCheck {

    public static void main(String[] args) {
        if (!"first second".equals(TextUtils.singleLine("first\nsecond", 40))) {
            throw new AssertionError("Line breaks should be normalized");
        }
        if (!"abc".equals(TextUtils.singleLine("abcdef", 3))) {
            throw new AssertionError("Text should respect the configured limit");
        }
        if (!"unknown".equals(TextUtils.singleLine(null, 20))) {
            throw new AssertionError("Null input should have a safe fallback");
        }
        System.out.println("Common text utility checks passed");
    }
}
