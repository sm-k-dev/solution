# REST API 추가 구현 보고

작성일: 2026-10-12

## 변경 목적

JSP 화면과 기존 `.do`·Servlet 요청 처리를 유지하면서, 별도 서비스(Spring Boot 기반 SwitchBase 등)가 HTTP/JSON으로 NEXORA와 연동할 수 있도록 서버 간 REST API를 추가했습니다. 기획 단계에서 정한 세 가지 엔드포인트(이벤트 수신, 인시던트 조회, health)와 API Key 인증·입력 검증·일관된 오류 형식을 기준으로 구현했습니다.

## 구현 내용

| 메서드 | 경로 | 내용 |
|---|---|---|
| POST | `/api/v1/events` | 외부 서비스의 오류(`type=ERROR`)·보안(`type=SECURITY`) 이벤트 수신. ERROR는 `incident`, SECURITY는 `security_event`에 저장하고 201과 `Location` 반환 |
| GET | `/api/v1/incidents`, `/api/v1/incidents/{id}` | SentinelOps 인시던트 목록·상세 조회 (limit 1~100, 기본 50) |
| GET | `/api/v1/security/events`, `/api/v1/security/events/{id}` | Security 위협 이벤트 목록·상세 조회 (limit 1~100, 기본 50) |
| GET | `/api/v1/health` | 서비스·DB 연결 상태 확인. 인증 없이 `UP`(200) / `DOWN`(503)만 반환 |

- 인증: `X-API-Key` 헤더를 Tomcat 환경 변수 `NEXORA_API_KEY`와 상수 시간 비교로 검증합니다(health 제외).
- 공통 베이스 `common.api.JsonApiServlet`: JSON 오류 형식 `{"error":{"code","message"}}`, 허용 메서드 외 405 + `Allow`, `Cache-Control: no-store`, 예외 발생 시 내부 정보 없는 500 JSON을 모든 API에 적용합니다.
- 입력 검증: 수신 API는 `Content-Type: application/json`(415), 본문 64KB(413), JSON 객체 여부(400 `INVALID_JSON`), 필드별 필수·길이·형식·허용값(400 `INVALID_FIELD` + `field`)을 검사합니다.
- 심각도: 호출 측이 `severity`를 생략하면 기존 규칙 분류기(`SeverityClassifier`, `SecuritySeverityClassifier`)로 결정합니다. CRITICAL은 기존과 같이 Slack 알림 대상입니다.
- Security 수신 이벤트는 기존 fingerprint 10분 집계를 그대로 사용하고, `sourceIp`는 SHA-256 해시로만 저장합니다.
- `/api/*` 아래 미정의 경로는 HTML 오류 화면 대신 JSON 404를 반환합니다(`ApiNotFoundServlet`).
- 조회 응답은 운영 메타데이터만 반환합니다. Incident 원본 오류 메시지·stack trace, Security 요청 URI·증거 발췌·IP 해시는 반환하지 않습니다.
- DB 스키마 변경은 없습니다. `IncidentDAO`에 서비스명을 지정하는 저장 메서드, `SecurityEventRecorder`에 외부 이벤트 저장 메서드를 추가했습니다.

## 1차 구현 대비 수정 사항

| 문제 | 영향 | 조치 |
|---|---|---|
| 이벤트 수신·health 엔드포인트 누락 | SwitchBase가 NEXORA로 이벤트를 보낼 수 없음 | `EventIngestApiServlet`, `HealthApiServlet` 추가 |
| API 키 미설정 시 503이 CRITICAL 인시던트로 기록 | 인증 없이 호출만으로 인시던트·Slack 알림 폭증 가능 | 예상된 API 503은 `IncidentFilter` 기록 제외 |
| `PATCH` 등 미지원 메서드가 Tomcat HTML 501 반환 | JSON 형식 불일치, MEDIUM 인시던트 생성 | 405 JSON으로 통일 |
| `/api/` 미정의 경로가 HTML 404 화면 반환 | 연동 측 JSON 파싱 실패 | JSON 404 catch-all 추가 |
| 두 조회 Servlet의 응답·검증 코드 중복 | 수정 누락 위험 | `JsonApiServlet` 공통 베이스로 정리 |

## 문서 반영

README, REST API 연동 가이드, 요구사항(SEN-012·SEN-013 추가), 아키텍처, 프로젝트 구조, 코딩 규칙, 테스트 케이스(API-TC-001~025), 체크리스트, 진행기록, 테스트 가이드를 갱신했습니다. 기획설계 엑셀과 결과보고서 PPT의 REST API 항목도 수정했습니다. 문서 점검 중 발견한 Security 중복 집계 시간(1분 → 실제 10분), ERD 파일명, AI 환경 변수명, 샘플 데이터 건수 설명 오류도 함께 바로잡았습니다.

## 검증 결과

- 전체 Java 소스와 `tests/` 점검 코드 컴파일 성공(`javac --release 17`), 기존 회귀 점검 11개 통과.
- 로컬 Apache Tomcat 9.0.98 + MariaDB 10.11(JNDI `jdbc/jspdb`, `01_schema.sql`·`02_sample_data.sql` 적용)에 배포해 `curl`로 API-TC-001~025를 실행했고 모두 기대 결과와 일치했습니다.
- 운영 MySQL 8.4, HTTPS, 실제 Slack Webhook 환경은 이 검증에 포함되지 않았습니다. 배포 후 `tests/api_smoke_test.sh`로 다시 확인해야 합니다.

## 배포 설정

Tomcat 프로세스에 `NEXORA_API_KEY`를 설정하고 재시작해야 수신·조회 API를 호출할 수 있습니다. 실제 DB `context.xml`은 배포 환경에서 별도로 설정합니다. 운영 시 HTTPS를 적용하고 API 키를 코드나 로그에 남기지 않습니다.

## 남은 과제

- 고객별 API Key 발급·폐기·회전과 감사 로그
- 사용량 계측과 rate limit, 무료·유료 구독
- API를 통한 인시던트·Security 이벤트 상태 변경(현재는 관리자 화면 전용)
