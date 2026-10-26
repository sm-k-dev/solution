# NEXORA

NEXORA는 회원·커뮤니티·문의 기능과 보안 관제 기능을 제공하는 웹 프로젝트입니다. SentinelOps는 서버 오류와 인시던트를 기록하고, Security는 웹 요청과 AI 프롬프트의 위협 패턴을 규칙으로 탐지해 관제 화면에 제공합니다. AI 분석은 이벤트 요약과 대응 제안을 보조합니다.

> 현재 프로젝트는 **Java Servlet/JSP 애플리케이션**입니다. REST API는 기존 웹 애플리케이션에 추가된 서버 간 JSON 연동 기능이며, Spring Boot 서비스는 아닙니다.

## 주요 기능

- 회원가입, 로그인, 마이페이지 및 회원정보 관리
- 커뮤니티 게시글, 댓글, 첨부파일
- 문의 접수 및 관리자 문의 관리
- SentinelOps: 서버 예외·HTTP 5XX 인시던트 기록, 심각도 분류, AI 요약, Slack 알림, 상태 이력
- Security: 웹 요청·AI 프롬프트 위협 이벤트 기록, 규칙 기반 분류, 마스킹, AI 분석 및 알림
- 외부 서비스 연동용 REST API: 상태 확인, 이벤트 등록, 인시던트·보안 이벤트 조회

## 기술 스택

| 구분 | 기술 |
|---|---|
| 언어 | Java 17, JavaScript, SQL |
| 웹 | Java Servlet, JSP, JSTL, HTML/CSS |
| 서버 | Apache Tomcat 9 |
| 데이터베이스 | MySQL |
| 데이터 접근 | JDBC, JNDI DataSource (`jdbc/jspdb`) |
| 외부 연동 | OpenRouter, Slack Incoming Webhook |

## 실행 환경 준비

### 요구 환경

- JDK 17
- Apache Tomcat 9
- MySQL 8.x
- Eclipse Dynamic Web Project 또는 호환되는 Servlet/JSP 개발 환경

### 데이터베이스

새 개발 DB에서 다음 순서로 SQL을 실행합니다.

1. `database/01_schema.sql`
2. 선택 사항: `database/02_sample_data.sql`

> `01_schema.sql`은 기존 테이블을 삭제하고 다시 만듭니다. 데이터가 필요한 DB나 운영 DB에서는 실행하지 마세요. 상세 내용은 [데이터베이스 가이드](docs/운영/데이터베이스_가이드.md)를 확인하세요.

Tomcat이 사용하는 JNDI 이름은 `jdbc/jspdb`입니다. `src/main/webapp/META-INF/context.xml.example`을 참고해 로컬 `context.xml`을 만들고 DB 접속 정보를 설정하세요. 실제 접속 정보와 비밀번호는 Git에 올리지 않습니다.

### 환경 변수

필수 여부는 기능별로 다릅니다. 실제 키와 Webhook 주소는 README나 저장소에 넣지 마세요.

| 환경 변수 | 용도 |
|---|---|
| `NEXORA_API_KEY` | REST API 인증용 서버 간 공유 키. health API를 제외한 API에서 사용 |
| `OPENROUTER_API_KEY` | SentinelOps·Security AI 분석 |
| `OPENROUTER_MODEL` | OpenRouter에서 사용할 모델 식별자 |
| `SLACK_WEBHOOK_URL` | 중요 인시던트·보안 이벤트 알림 |

환경 변수를 설정한 뒤 Tomcat을 재시작해야 적용됩니다. REST API 인증 키는 `X-API-Key` 요청 헤더로만 전달하고 URL이나 로그에 넣지 마세요.

## 배포 주소

- 서비스: [https://nexorasolution.kro.kr](https://nexorasolution.kro.kr)
- REST API 기본 주소: `https://nexorasolution.kro.kr/api/v1`

아래 경로는 현재 서비스 도메인에 배포된 API 주소입니다. 배포 context path가 바뀌면 기본 주소 뒤에 해당 context path를 포함해야 합니다.

## REST API

### 공통 사항

- 데이터 형식: JSON (`application/json; charset=UTF-8`)
- 인증: `GET /api/v1/health`를 제외한 모든 API에 `X-API-Key` 헤더 필요
- 목록 조회의 `limit`: 기본 50, 허용 범위 1~100
- 인증 키는 서버 환경 변수 `NEXORA_API_KEY`와 일치해야 합니다.
- 현재 API는 서버 간 연동용입니다. CORS 설정, 고객별 키 발급·회전, 요청량 제한, 상태 변경 API는 제공하지 않습니다.

### 주소 목록

| 메서드 | 전체 주소 | 인증 | 설명 |
|---|---|---|---|
| `GET` | `https://nexorasolution.kro.kr/api/v1/health` | 불필요 | 애플리케이션 DB 연결 상태 |
| `POST` | `https://nexorasolution.kro.kr/api/v1/events` | 필요 | 오류 또는 보안 이벤트 등록 |
| `GET` | `https://nexorasolution.kro.kr/api/v1/incidents?limit=10` | 필요 | 최근 인시던트 목록 |
| `GET` | `https://nexorasolution.kro.kr/api/v1/incidents/{id}` | 필요 | 인시던트 요약 상세 |
| `GET` | `https://nexorasolution.kro.kr/api/v1/security/events?limit=10` | 필요 | 최근 보안 이벤트 목록 |
| `GET` | `https://nexorasolution.kro.kr/api/v1/security/events/{id}` | 필요 | 보안 이벤트 요약 상세 |

### 호출 예시

Health 확인은 API Key 없이 호출할 수 있습니다.

```bash
curl -i "https://nexorasolution.kro.kr/api/v1/health"
```

인시던트 목록 조회는 유효한 키를 헤더에 넣습니다.

```bash
curl -i \
  -H "X-API-Key: <NEXORA_API_KEY>" \
  "https://nexorasolution.kro.kr/api/v1/incidents?limit=10"
```

보안 이벤트 한 건을 조회하려면 실제 이벤트 ID로 `{id}`를 바꿉니다.

```bash
curl -i \
  -H "X-API-Key: <NEXORA_API_KEY>" \
  "https://nexorasolution.kro.kr/api/v1/security/events/123"
```

이벤트 등록 요청은 `Content-Type: application/json`을 사용합니다. 아래는 오류 이벤트 예시입니다.

```bash
curl -i -X POST \
  -H "X-API-Key: <NEXORA_API_KEY>" \
  -H "Content-Type: application/json" \
  -d '{
    "type": "ERROR",
    "service": "sample-service",
    "errorType": "DatabaseTimeoutException",
    "message": "Database request timed out",
    "path": "/orders",
    "method": "POST",
    "httpStatus": 500
  }' \
  "https://nexorasolution.kro.kr/api/v1/events"
```

보안 이벤트 등록은 `type`을 `SECURITY`로 지정하고 `category`(`WEB` 또는 `AI`), `threatType`, `ruleCode`를 포함합니다. 개인정보, 원문 프롬프트, 비밀키를 `message`, `stackTrace`, `evidence`에 넣지 말고 호출 측에서 먼저 마스킹하세요.

### 응답 요약

- 목록 응답은 `data` 배열과 `meta.count`, `meta.limit`을 포함합니다.
- 상세 응답은 `data` 객체를 포함합니다.
- 이벤트 등록 성공은 `201 Created`와 생성된 데이터 및 `Location` 헤더를 반환합니다.
- Health는 DB 연결이 정상이면 `200 UP`, 확인에 실패하면 `503 DOWN`을 반환합니다.
- 인증 누락·오류는 `401`, 서버에 키 설정이 없으면 `503`, 입력 오류는 `400` 등 JSON 오류 응답을 반환합니다.
- API 응답에는 원본 오류 메시지·stack trace, 보안 증거 및 출처 IP 해시가 포함되지 않습니다.

REST API의 입력 형식, 필드별 제약, 응답 예시와 오류 코드는 [REST API 연동 가이드](docs/운영/REST_API_연동_가이드.md)를 참고하세요.

## 프로젝트 구조

```text
solution/
├── database/                 # 스키마, 샘플 데이터, ERD
├── docs/                     # 프로젝트·개발·운영 문서
├── src/main/java/            # Servlet, Service, DAO, DTO 및 공통 코드
├── src/main/webapp/          # JSP, CSS, JavaScript, WEB-INF 설정
├── tests/                    # 기능별 테스트 코드
└── README.md
```

## 문서

- [전체 문서 안내](docs/README.md)
- [REST API 연동 가이드](docs/운영/REST_API_연동_가이드.md)
- [데이터베이스 가이드](docs/운영/데이터베이스_가이드.md)
- [Security 테스트 가이드](docs/운영/Security_테스트_가이드.md)
- [시스템 아키텍처](docs/프로젝트/시스템_아키텍처.md)
- [Git 협업 가이드](docs/개발/Git_협업_가이드.md)

## 보안 및 검증 안내

- 운영 도메인에는 500 오류를 일부러 발생시키거나 공격 테스트 문자열을 보내지 마세요. 위협 탐지는 소유한 로컬 개발 환경에서만 시험합니다.
- API Key, DB 비밀번호, OpenRouter 키, Slack Webhook URL은 코드·문서·Git에 저장하지 않습니다.
- 현재 확인된 동작과 배포 검증 상태를 구분해서 기록합니다. 로컬에서 확인한 기능을 실제 운영 환경에서 검증했다고 표현하지 않습니다.
