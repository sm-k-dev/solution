<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head><meta charset="UTF-8"><title>Incident 목록 | NEXORA</title></head>
<body>
<main>
  <h1>Incident 목록</h1>
  <p>최근 발생한 50건</p>
  <p>어제의 Incident 건수를 Slack에 보냅니다. 오늘 성공한 요약이 있으면 다시 보내지 않습니다.</p>
  <c:if test="${param.summary eq 'sent'}"><p>일일 요약을 전송했습니다.</p></c:if>
  <c:if test="${param.summary eq 'skipped'}"><p>전송되지 않았습니다. 오늘 이미 전송했거나 Slack 설정 또는 전송 결과를 확인하세요.</p></c:if>
  <form method="post" action="${pageContext.request.contextPath}/sentinel/daily-summary">
    <input type="hidden" name="csrfToken" value="${csrfToken}">
    <button type="submit">어제의 오류 요약 전송</button>
  </form>
  <table border="1">
    <thead><tr><th>ID</th><th>발생 시간</th><th>등급</th><th>상태</th><th>오류</th><th>요청 경로</th></tr></thead>
    <tbody>
      <c:forEach var="item" items="${incidents}">
        <tr>
          <td><a href="${pageContext.request.contextPath}/sentinel/incident?id=${item.incidentId}"><c:out value="${item.incidentId}"/></a></td>
          <td><c:out value="${item.occurredAt}"/></td>
          <td><c:out value="${item.severity}"/></td>
          <td><c:out value="${item.status}"/></td>
          <td><c:out value="${item.errorType}"/></td>
          <td><c:out value="${item.requestUri}"/></td>
        </tr>
      </c:forEach>
      <c:if test="${empty incidents}"><tr><td colspan="6">기록된 Incident가 없습니다.</td></tr></c:if>
    </tbody>
  </table>
</main>
</body>
</html>
