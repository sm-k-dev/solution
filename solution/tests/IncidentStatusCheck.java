import sentinel.service.IncidentStatusService;

public class IncidentStatusCheck {
    public static void main(String[] args) {
        IncidentStatusService service = new IncidentStatusService();
        if (!service.isAllowedTransition("OPEN", "ACKNOWLEDGED")) throw new AssertionError();
        if (!service.isAllowedTransition("ACKNOWLEDGED", "RESOLVED")) throw new AssertionError();
        if (service.isAllowedTransition("OPEN", "RESOLVED")) throw new AssertionError();
        if (service.isAllowedTransition("RESOLVED", "OPEN")) throw new AssertionError();
        if (service.isAllowedTransition("OPEN", "OPEN")) throw new AssertionError();
        System.out.println("Incident status checks passed");
    }
}
