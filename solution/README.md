# NEXORA

NEXORA는 기업용 IT 인프라·보안·운영 지원을 주제로 한 Java Web 팀 프로젝트입니다.  
현재 프로젝트는 기존 FunWeb 기반 WAR를 출발점으로 사용하고 있으며, 화면 디자인은 NEXORA 형태로 정리되어 있습니다. 기존 Member/Board 코드는 참고 가능한 레거시 코드이며, 팀 프로젝트 기능은 새 DB 설계와 팀 규칙에 맞춰 단계적으로 재구현합니다.

## 현재 WAR 기준 상태

### 현재 포함된 화면

- `/index.jsp`
- `/company/company.jsp`
- `/solutions/solutions.jsp`
- `/solutions/sentinelops.jsp`
- `/customer/customer.jsp`
- `/customer/inquiry.jsp`
- `/board/board.jsp`
- `/board/write.jsp`
- `/member/login.jsp`
- `/member/signup.jsp`
- `/member/member.jsp`
- `/admin/admin.jsp`
- `/legal/legal.jsp`
- `/legal/sitemap.jsp`
- `/inc/top.jsp`
- `/inc/bottom.jsp`

### 현재 포함된 Java legacy class

```text
board.BoardBean
board.BoardDAO
member.MemberBean
member.MemberDAO
```

현재 WAR의 README에도 로그인 처리, 실제 게시판 CRUD/검색/다운로드, 회원가입 처리, 문의 저장은 아직 backend MVC 구현 대상이라고 명시되어 있습니다. 따라서 화면이 존재하는 것과 실제 기능 구현 완료는 구분합니다.

## 개발 환경

| 구분 | 현재 기준 |
|---|---|
| Java Web | Servlet/JSP |
| WAS | Apache Tomcat 9 |
| Web descriptor | Servlet 3.0 |
| Database | MySQL 8 |
| JDBC Driver | mysql-connector-java 8.0.25 |
| View | JSP, JSTL, HTML, CSS, JavaScript |
| DB Connection | JNDI `jdbc/jspdb` |
| IDE | Eclipse |
| Collaboration | Git / GitHub |

## 프로젝트 문서

| 문서 | 설명 |
|---|---|
| [Git Team Guide](./docs/GIT_TEAM_GUIDE.md) | 브랜치, Commit, PR 협업 규칙 |
| [Coding Convention](./docs/CODING_CONVENTION.md) | Java/JSP/DB 명명 및 코딩 규칙 |
| [Requirements](./docs/REQUIREMENTS.md) | 기능 요구사항과 구현 상태 |
| [Team Roles](./docs/TEAM_ROLES.md) | 팀원별 역할 |
| [Architecture](./docs/ARCHITECTURE.md) | 현재 WAR와 목표 MVC 구조 |
| [Project Schedule](./docs/PROJECT_SCHEDULE.md) | 일정, 결정, 피드백 기록 |
| [Test Cases](./docs/TEST_CASES.md) | 테스트 계획 및 결과 |
| [Current WAR Audit](./docs/CURRENT_WAR_AUDIT.md) | 현재 WAR 분석 결과 |
| [Database Guide](./database/DATABASE_GUIDE.md) | NEXORA DB v4 구조와 적용 방법 |

## 권장 Repository 구조

```text
solution/
├── README.md
├── .gitignore
├── db.properties.example
├── docs/
├── database/
└── src/
    └── main/
        ├── java/
        └── webapp/
```

루트에는 프로젝트 진입점인 `README.md`만 두고, 개발 문서는 `docs/`, DB 산출물은 `database/`에 관리합니다.

## DB 설정

실제 DB 자격 증명이 들어간 `context.xml`은 Git에 올리지 않습니다.

```text
src/main/webapp/META-INF/context.xml          # local only
src/main/webapp/META-INF/context.xml.example  # commit
```

`context.xml.example`을 복사해 로컬 `context.xml`을 만들고 실제 접속정보를 입력합니다.

DB 구조는 `database/01_schema.sql`을 기준으로 하고 필요 시 `02_sample_data.sql`을 실행합니다.

## 중요한 정리 사항

현재 WAR의 `WEB-INF/web.xml`에는 display-name이 아직 `FunWeb`으로 남아 있습니다. 프로젝트 정리 시 `NEXORA` 또는 팀에서 확정한 display-name으로 변경할 수 있습니다.

현재 WAR의 실제 `META-INF/context.xml`은 구형 MySQL driver class와 기존 DB 이름을 사용하고 있습니다. 새 NEXORA DB 적용 시 `context.xml.example`의 MySQL Connector/J 8 형식을 기준으로 로컬 설정을 맞춥니다.

또한 WAR 안의 `README.md`와 `PURE_CSS_CONVERSION_README.md`는 과거 UI 변환/패키징 작업 기록입니다. 저장소의 최종 문서 체계에서는 이 README로 통합하고 별도 루트 문서로 유지하지 않는 것을 권장합니다.
