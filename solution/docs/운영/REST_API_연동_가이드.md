# REST API 연동 가이드

## 개요

이 API는 JSP/Servlet 웹 애플리케이션에 추가된 서버 간 JSON 연동 인터페이스입니다. 현재 외부 서비스가 이벤트를 접수하고, 인시던트·보안 이벤트를 조회하며, 애플리케이션 상태를 확인할 수 있습니다. 브라우저 화면을 REST API로 전환하거나 구독·요금제 기능을 제공하지는 않습니다.

배포 context path가 `/solution`이면 기본 주소는 `http://localhost:8080/solution`입니다. 실제 환경에서는 HTTPS를 사용하세요.

## 인증 및 설정

`/api/v1/health`를 제외한 모든 경로는 `X-API-Key` 헤더가 필요합니다.

```http
X-API-Key: <NEXORA_API_KEY 값>
```

Tomcat 프로세스 환경 변수 `NEXORA_API_KEY`를 설정하고 재시작합니다. 키는 소스, URL, 로그, Git에 넣지 마세요. 현재 구현은 서버 전체에서 공유하는 단일 키이며, 고객별 발급·폐기·회전, 호출량 제한, 요금제 검사는 구현되어 있지 않습니다. 외부 공개 시에는 키 접근을 제한하고 HTTPS 및 네트워크 접근 통제를 적용하세요.

## 엔드포인트

| 메서드 | 경로 | 인증 | 설명 |
|---|---|---|---|
| `GET` | `/api/v1/health` | 불필요 | 애플리케이션과 DB 연결 상태 |
| `POST` | `/api/v1/events` | 필요 | 오류 또는 보안 이벤트 등록 |
| `GET` | `/api/v1/incidents` | 필요 | 최근 인시던트 목록 |
| `GET` | `/api/v1/incidents/{id}` | 필요 | 인시던트 요약 조회 |
| `GET` | `/api/v1/security/events` | 필요 | 최근 보안 이벤트 목록 |
| `GET` | `/api/v1/security/events/{id}` | 필요 | 보안 이벤트 요약 조회 |

목록은 `limit` 쿼리 파라미터를 지원합니다. 기본값은 50, 허용 범위는 1~100입니다. 현재 페이지 번호나 cursor 기반 페이지네이션은 없습니다. Incident와 Security 상태 변경은 API로 제공하지 않습니다. API는 서버 간 연동용이며 CORS를 제공하지 않습니다. ERROR 등록에는 idempotency key나 중복 방지 기능이 없으므로 호출 측에서 재시도 정책을 제한해야 합니다.

## 이벤트 등록

요청은 `Content-Type: application/json`이어야 하고 본문은 UTF-8 JSON 객체, 최대 64KB입니다. 필드 오류는 `400 INVALID_FIELD`와 `field` 값을 반환합니다.

### 오류 이벤트

필수 필드는 `type`, `service`, `errorType`, `message`입니다. 문자열 길이와 허용 형식은 다음 표를 따릅니다.

| 필드 | 필수 | 규칙 |
|---|---:|---|
| `type` | 예 | `ERROR` |
| `service` | 예 | 1~50자, 영문자·숫자로 시작하며 영문자·숫자·`_ . -` 허용 |
| `errorType` | 예 | 최대 150자 |
| `message` | 예 | 최대 4,000자 |
| `stackTrace` | 아니오 | 최대 16,000자 |
| `path` | 아니오 | 최대 500자, `/`로 시작하는 요청 경로 |
| `method` | 아니오 | `GET`, `POST`, `PUT`, `PATCH`, `DELETE`, `HEAD`, `OPTIONS` |
| `httpStatus` | 아니오 | 100~599 정수. 생략 시 분류에 500 사용 |
| `severity` | 아니오 | `LOW`, `MEDIUM`, `HIGH`, `CRITICAL`. 전달하면 해당 값 사용 |
| `clientIp` | 아니오 | 2~45자이며 16진수·콜론·점만 허용. 생략하면 요청 원격 주소 사용 |

예시:

```http
POST /solution/api/v1/events
Content-Type: application/json
X-API-Key: <NEXORA_API_KEY>
```

```json
{
  "type": "ERROR",
  "service": "switchbase-order",
  "errorType": "DatabaseTimeoutException",
  "message": "Order persistence timed out",
  "stackTrace": "...",
  "path": "/orders/42",
  "method": "POST",
  "httpStatus": 500
}
```

### 보안 이벤트

필수 필드는 `type`, `service`, `category`, `threatType`, `ruleCode`입니다.

| 필드 | 필수 | 규칙 |
|---|---:|---|
| `type` | 예 | `SECURITY` |
| `service` | 예 | 오류 이벤트와 같은 규칙 |
| `category` | 예 | `WEB` 또는 `AI` |
| `threatType` | 예 | 대문자로 시작하는 2~60자 `UPPER_SNAKE_CASE` |
| `ruleCode` | 예 | 1~80자, 영문자·숫자·`_ . : -` 허용 |
| `severity` | 아니오 | 네 단계 등급. 생략 시 서버 규칙으로 분류 |
| `evidence` | 아니오 | 최대 500자 |
| `path` | 아니오 | 최대 500자, `/`로 시작하는 요청 경로 |
| `method` | 아니오 | 오류 이벤트와 동일한 HTTP 메서드 |
| `sourceIp` | 아니오 | 2~45자이며 16진수·콜론·점만 허용. 원문 대신 SHA-256 해시 저장 |

예시:

```json
{
  "type": "SECURITY",
  "service": "switchbase-gateway",
  "category": "WEB",
  "threatType": "SQL_INJECTION",
  "ruleCode": "WAF.SQLI.001",
  "evidence": "parameter pattern matched: [REDACTED]",
  "path": "/search",
  "method": "GET",
  "sourceIp": "192.0.2.10"
}
```

호출자가 `severity`를 보내면 현재 구현은 이를 수용합니다. 연동 서비스가 보낸 값이므로 NEXORA 자체 탐지 결과와 동일한 신뢰도를 보장하지 않습니다. IP 필드는 문자와 길이만 제한하며 IPv4/IPv6 주소 구조를 완전히 검증하지 않습니다. 민감정보가 포함될 수 있는 원문 요청·프롬프트·stack trace는 보내기 전에 호출 측에서 마스킹하세요. **Incident 이벤트의 `clientIp`는 현재 DB에 원문 저장되며, Security 이벤트의 `sourceIp`는 해시 저장됩니다.**

### 성공 응답

등록 성공은 `201 Created`와 `Location` 헤더를 돌려줍니다.

```json
{
  "data": {
    "type": "ERROR",
    "id": 123,
    "severity": "HIGH",
    "location": "/api/v1/incidents/123"
  }
}
```

보안 이벤트는 `type`이 `SECURITY`이고 `location`은 `/api/v1/security/events/{id}`입니다. Security 중복 이벤트는 기존 이벤트 ID를 반환하고 발생 횟수를 올릴 수 있습니다. 중복 집계는 동일한 fingerprint의 10분 고정 구간을 기준으로 합니다.

## 조회 응답

목록은 `data` 배열과 `meta.count`, `meta.limit`을 반환합니다. 상세 응답은 `{ "data": { ... } }` 형태입니다.

- Incident는 `id`, `service`, `type`, `severity`, `status`, `path`, `method`, `occurredAt`을 제공합니다.
- Security는 `id`, `category`, `threatType`, `severity`, `status`, `detectionSource`, `ruleCode`, `method`, `occurrenceCount`, `firstSeenAt`, `lastSeenAt`을 제공합니다.
- 원본 오류 메시지·stack trace, Security 요청 URI·증거 발췌·IP 해시는 조회 API에서 제외합니다.
- 날짜는 UTC ISO-8601 문자열입니다.

## 상태 확인

`GET /api/v1/health`는 키 없이 호출할 수 있습니다. DB 연결이 정상일 때 `200`과 `UP`, DB 연결 실패 때 `503`과 `DOWN`을 반환합니다. 상세 내부 설정은 노출하지 않지만, 공개 인터넷에 무제한으로 노출하지 말고 로드밸런서·모니터링 네트워크에서만 접근시키는 것이 좋습니다.

## 오류 응답

오류는 JSON으로 통일됩니다.

```json
{
  "error": {
    "code": "UNAUTHORIZED",
    "message": "A valid API key is required."
  }
}
```

필드 검증 실패에는 `field`가 추가됩니다. 대표 상태 코드는 `400` 입력 오류, `401` 인증 실패, `404` 미등록 리소스, `405` 미지원 메서드, `413` 본문 초과, `415` Content-Type 오류, `500` 내부 처리 오류, `503` 키 미설정 또는 DB 상태 확인 실패입니다. 응답에는 SQL·stack trace·내부 예외 상세를 포함하지 않습니다.

## 빠른 확인

아래처럼 `curl`로 먼저 상태 코드와 응답 본문을 확인할 수 있습니다. 등록 요청은 DB에 실제 행을 생성하므로 개발용 DB에서만 실행하세요. 이전 구현 메모에는 로컬 Tomcat 9.0.98 + MariaDB 10.11에서 API 사례를 실행했다고 기록되어 있었지만, 현재 압축본에는 해당 테스트 로그와 자동 smoke-test 스크립트가 포함되어 있지 않습니다. 최신 통합본과 배포 환경에서 다시 검증해야 합니다.

```bash
curl -i http://localhost:8080/solution/api/v1/health
curl -i -H "X-API-Key: ${NEXORA_API_KEY}" \
  "http://localhost:8080/solution/api/v1/incidents?limit=10"
```

요청 본문 예시는 위 엔드포인트 설명을 사용합니다. 응답 상태 코드, JSON 본문, `Location` 헤더를 직접 확인하세요.
