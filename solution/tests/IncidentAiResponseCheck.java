import java.io.IOException;
import sentinel.dto.IncidentAnalysis;
import sentinel.service.IncidentAiService;

public class IncidentAiResponseCheck {

    public static void main(String[] args) throws Exception {
        IncidentAiService service = new IncidentAiService();
        String response = "{\"choices\":[{\"message\":{\"content\":\"{\\\"summary\\\":\\\"요약\\\",\\\"possible_cause\\\":\\\"원인 후보\\\",\\\"suggested_action\\\":\\\"점검\\\"}\"}}]}";
        IncidentAnalysis analysis = service.parseAnalysis(response, "sample/model");
        if (!"요약".equals(analysis.getSummary()) ||
        !"원인 후보".equals(analysis.getPossibleCause()) ||
        !"점검".equals(analysis.getSuggestedAction())) throw new AssertionError();
        try {
            service.parseAnalysis("{\"choices\":[]}", "sample/model");
            throw new AssertionError("Empty response was accepted");
        } catch (IOException expected) {
        }
        System.out.println("Incident AI response checks passed");
    }
}
