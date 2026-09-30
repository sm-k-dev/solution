# Current WAR Audit

분석 대상: `solution(1).war`

## 1. 실제 WAR 구성

### JSP
- admin/admin.jsp
- board/board.jsp
- board/write.jsp
- company/company.jsp
- customer/customer.jsp
- customer/inquiry.jsp
- inc/top.jsp
- inc/bottom.jsp
- index.jsp
- legal/legal.jsp
- legal/sitemap.jsp
- member/login.jsp
- member/member.jsp
- member/signup.jsp
- solutions/sentinelops.jsp
- solutions/solutions.jsp

### CSS
`assets/css/pages/`에 페이지별 Pure CSS가 존재합니다.

### Reference image
`assets/reference/`에 주요 페이지 디자인 reference PNG가 존재합니다.

### Java class
```text
board.BoardBean
board.BoardDAO
member.MemberBean
member.MemberDAO
```

## 2. 현재 legacy DAO method

### BoardDAO
```text
insertBoard
finsertBoard
getBoardCount
getBoards
getBoard
updateReadCount
updateBoard
deleteBoard
reInsertBoard
```

### MemberDAO
```text
insertMember
userCheck
getMember
updateMember
deleteMember
getMembers
IDcheck
```

이 명칭들은 현재 WAR에 실제로 존재하는 legacy API입니다. 신규 NEXORA 코드의 naming convention과 다르더라도 일괄 rename하지 말고, 기능 이관/수정 시 호출부와 함께 단계적으로 정리합니다.

## 3. web.xml

- Servlet spec: 3.0
- display-name: `FunWeb`
- JNDI resource-ref: `jdbc/jspdb`

`display-name`은 아직 이전 프로젝트 이름이므로 정리 대상입니다.

## 4. Libraries

현재 WAR에 확인된 주요 library:

```text
commons-collections4-4.0.jar
commons-dbcp2-2.1.jar
commons-fileupload-1.3.3.jar
commons-io-2.6.jar
commons-pool2-2.3.jar
cos.jar
javax.websocket-api-1.1.jar
json-simple-1.1.1.jar
jsoup-1.15.3.jar
jstl-1.2.jar
mysql-connector-java-8.0.25.jar
servlet-api.jar
tomcat-dbcp-7.0.30.jar
```

현재 정상 실행 중인 library는 필요성이 확인되기 전까지 무리하게 삭제하지 않습니다.

## 5. context.xml

WAR에는 실제 `META-INF/context.xml`과 안전한 `META-INF/context.xml.example`이 모두 들어 있습니다.

실제 `context.xml`은 Git 추적 대상에서 제외해야 합니다. 또한 WAR의 실제 파일은 구형 driver class와 기존 DB 이름을 사용하고 있으므로 NEXORA DB 전환 시 로컬 설정을 갱신해야 합니다.

안전한 example 기준:

```text
driverClassName = com.mysql.cj.jdbc.Driver
database = nexora
JNDI name = jdbc/jspdb
```

## 6. 기존 README 정리

WAR 루트에:
- `README.md`
- `PURE_CSS_CONVERSION_README.md`

가 들어 있으나 둘 다 UI 패키징/변환 이력을 설명하는 문서입니다. 최종 Repository에서는 프로젝트 `README.md`에 필요한 현재 상태만 통합하고, Pure CSS 변환 이력 문서는 제거하거나 Git history로 남기는 것을 권장합니다.

## 7. 현재 구현 해석

WAR의 기존 README가 명시하는 미구현 backend:
- login submit
- real board CRUD/search/download
- signup processing
- inquiry persistence

따라서 현재 화면을 `DONE`으로 기록하지 않습니다. 실제 Servlet/DAO/DB 연결과 테스트가 끝나야 완료 처리합니다.
