import java.io.IOException;
import sentinel.service.SlackWebhookClient;

public class SlackWebhookCheck {
    public static void main(String[] args) throws Exception {
        try {
            new SlackWebhookClient().send("http://localhost/private", "test");
            throw new AssertionError("Non-Slack URL was accepted");
        } catch (IOException expected) { }
        System.out.println("Slack webhook URL check passed");
    }
}
