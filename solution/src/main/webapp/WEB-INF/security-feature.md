# NEXORA Security 기능

## 동작 범위

- 웹 요청: SQL Injection, XSS, 경로 탐색, 명령 삽입, 내부 주소 접근(SSRF) 의심 패턴
- AI 입력: 프롬프트 인젝션, 시스템 프롬프트 추출, AI 도구 오용, 민감정보 입력 패턴
- 기록: 동일 출발지·규칙·경로에서 10분 이내 반복되는 이벤트는 발생 횟수로 집계
- 분류: 규칙 기반 `MEDIUM`, `HIGH`, `CRITICAL`
- 분석: 관리자 상세 화면에서 OpenRouter 기반 AI 분석 요청
- 알림: `CRITICAL` 즉시 Slack 알림, 전날 전체 위협 일일 요약

## 관리자 경로

- 목록: `/security/events`
- 상세: `/security/event?id={보안 이벤트 ID}`

관리자 화면의 `보안 위협 관제` 메뉴로도 이동할 수 있습니다.

## 데이터 보호

- 비밀번호 및 CSRF 토큰 필드는 검사 대상에서 제외합니다.
- 출발지 IP 원문 대신 SHA-256 해시를 저장합니다.
- 탐지 근거는 제한된 길이만 저장하며 토큰·비밀번호·API 키 패턴은 마스킹합니다.
- AI 분석에는 탐지 메타데이터만 전달하고 원문 탐지 근거는 전달하지 않습니다.

## DB

최초 Security 기능 접근 또는 위협 탐지 시 필요한 테이블을 자동 생성합니다.
DB 계정에 테이블 생성 권한이 없다면 `WEB-INF/sql/security_schema.sql`을 먼저 실행하세요.

## 환경 설정

기존 SentinelOps와 동일한 환경 변수를 재사용합니다.

- `OPENROUTER_API_KEY`
- `OPENROUTER_MODEL`
- `SLACK_WEBHOOK_URL`

## 주의

현재 버전은 애플리케이션에 들어오는 HTTP 요청과 AI 호출 경계를 감시합니다.
네트워크 방화벽, 서버 패킷, 외부 WAF 로그를 감시하는 기능은 포함하지 않습니다.
