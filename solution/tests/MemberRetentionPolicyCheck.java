import java.time.LocalDateTime;
import member.service.MemberRetentionPolicy;

public class MemberRetentionPolicyCheck {

    public static void main(String[] args) {
        LocalDateTime now = LocalDateTime.of(2026, 10, 7, 12, 0);

        if (!MemberRetentionPolicy.isCleanupEligible(
            LocalDateTime.of(2026, 7, 7, 12, 0), now)) {
            throw new AssertionError("정확히 3개월이 지난 회원은 정리 대상이어야 합니다.");
        }
        if (!MemberRetentionPolicy.isCleanupEligible(
            LocalDateTime.of(2026, 7, 6, 23, 59), now)) {
            throw new AssertionError("3개월을 초과한 회원은 정리 대상이어야 합니다.");
        }
        if (MemberRetentionPolicy.isCleanupEligible(
            LocalDateTime.of(2026, 7, 7, 12, 1), now)) {
            throw new AssertionError("3개월이 지나지 않은 회원은 정리하면 안 됩니다.");
        }
        if (MemberRetentionPolicy.isCleanupEligible(null, now)) {
            throw new AssertionError("탈퇴일이 없는 회원은 정리하면 안 됩니다.");
        }

        System.out.println("Member retention policy checks passed");
    }
}
