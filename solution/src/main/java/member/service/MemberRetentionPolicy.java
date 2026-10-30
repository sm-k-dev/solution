package member.service;

import java.time.LocalDateTime;

/** 회원 탈퇴 데이터의 보유 기간을 한 곳에서 관리합니다. */
public final class MemberRetentionPolicy {

    public static final int RETENTION_MONTHS = 3;

    private MemberRetentionPolicy() {
    }

    public static LocalDateTime cleanupCutoff(LocalDateTime now) {
        if (now == null) {
            throw new IllegalArgumentException("기준 시각이 필요합니다.");
        }
        return now.minusMonths(RETENTION_MONTHS);
    }

    public static boolean isCleanupEligible(LocalDateTime withdrawnAt, LocalDateTime now) {
        if (withdrawnAt == null) {
            return false;
        }
        return !withdrawnAt.isAfter(cleanupCutoff(now));
    }
}
