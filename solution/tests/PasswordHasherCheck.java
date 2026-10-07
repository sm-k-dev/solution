import common.security.PasswordHasher;

public class PasswordHasherCheck {

    public static void main(String[] args) {
        String raw = "Nexora!2026";
        String hash = PasswordHasher.hash(raw);
        if (!PasswordHasher.isHashed(hash)) {
            throw new AssertionError("해시 형식 확인 실패");
        }
        if (!PasswordHasher.matches(raw, hash)) {
            throw new AssertionError("정상 비밀번호 검증 실패");
        }
        if (PasswordHasher.matches("wrong-password", hash)) {
            throw new AssertionError("잘못된 비밀번호 허용");
        }
        if (!PasswordHasher.matches(raw, raw)) {
            throw new AssertionError("레거시 평문 호환 검증 실패");
        }
        System.out.println("Password hasher checks passed");
    }
}
