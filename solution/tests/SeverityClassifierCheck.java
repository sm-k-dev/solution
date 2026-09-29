import java.sql.SQLException;
import sentinel.service.SeverityClassifier;

public class SeverityClassifierCheck {
    private static final SeverityClassifier CLASSIFIER = new SeverityClassifier();

    public static void main(String[] args) {
        expect("HIGH", 500, null, "/solution/board/list.do");
        expect("CRITICAL", 503, null, "/solution/index.jsp");
        expect("CRITICAL", 500, null, "/solution/member/login.jsp");
        expect("CRITICAL", 500,
            new RuntimeException("wrapped", new SQLException("database unavailable", "08001")),
            "/solution/board/list.do");
        expect("MEDIUM", 501, null, "/solution/index.jsp");
        expect("LOW", 404, null, "/solution/missing.jsp");
        System.out.println("SeverityClassifier checks passed");
    }

    private static void expect(String expected, int status, Throwable error, String uri) {
        String actual = CLASSIFIER.classifySeverity(status, error, uri);
        if (!expected.equals(actual)) throw new AssertionError(uri + ": " + actual + " != " + expected);
    }
}
