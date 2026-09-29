<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head><meta charset="UTF-8"><title>Incident 상세 | NEXORA</title></head>
<body>
<main>
  <p><a href="${pageContext.request.contextPath}/sentinel/incidents">목록으로</a></p>
  <h1>Incident #<c:out value="${incident.incidentId}"/></h1>
  <dl>
    <dt>서비스</dt><dd><c:out value="${incident.serviceName}"/></dd>
    <dt>발생 시간</dt><dd><c:out value="${incident.occurredAt}"/></dd>
    <dt>오류 종류</dt><dd><c:out value="${incident.errorType}"/></dd>
    <dt>등급 / 상태</dt><dd><c:out value="${incident.severity}"/> / <c:out value="${incident.status}"/></dd>
    <dt>요청</dt><dd><c:out value="${incident.httpMethod}"/> <c:out value="${incident.requestUri}"/></dd>
    <dt>메시지</dt><dd><c:out value="${incident.errorMessage}"/></dd>
  </dl>
  <h2>Stack trace</h2>
  <pre style="white-space:pre-wrap;overflow-wrap:anywhere"><c:out value="${incident.stackTrace}"/></pre>

  <h2>AI 분석 보조</h2>
  <p>AI 내용은 원인 후보와 점검 제안입니다. 심각도와 상태는 Java 규칙과 관리자가 결정합니다.</p>
  <c:if test="${param.aiError eq '1'}"><p>AI 분석을 완료하지 못했습니다. 설정이나 서버 로그를 확인하세요.</p></c:if>
  <form method="post" action="${pageContext.request.contextPath}/sentinel/incident/analyze">
    <input type="hidden" name="id" value="${incident.incidentId}">
    <input type="hidden" name="csrfToken" value="${csrfToken}">
    <button type="submit">AI 분석 요청</button>
  </form>
  <c:if test="${not empty analysis}">
    <p>분석 시각: <c:out value="${analysis.createdAt}"/> / 모델: <c:out value="${analysis.modelName}"/></p>
    <h3>요약</h3><p><c:out value="${analysis.summary}"/></p>
    <h3>가능한 원인</h3><p><c:out value="${analysis.possibleCause}"/></p>
    <h3>확인할 사항</h3><p><c:out value="${analysis.suggestedAction}"/></p>
  </c:if>

  <c:if test="${incident.status eq 'OPEN' || incident.status eq 'ACKNOWLEDGED'}">
    <form method="post" action="${pageContext.request.contextPath}/sentinel/incident/status">
      <input type="hidden" name="id" value="${incident.incidentId}">
      <input type="hidden" name="expectedStatus" value="${incident.status}">
      <input type="hidden" name="newStatus" value="${incident.status eq 'OPEN' ? 'ACKNOWLEDGED' : 'RESOLVED'}">
      <input type="hidden" name="csrfToken" value="${csrfToken}">
      <button type="submit">${incident.status eq 'OPEN' ? '확인 처리' : '해결 처리'}</button>
    </form>
  </c:if>

  <h2>상태 변경 이력</h2>
  <ul>
    <c:forEach var="entry" items="${history}">
      <li><c:out value="${entry.changedAt}"/>:
          <c:out value="${entry.previousStatus}"/> → <c:out value="${entry.newStatus}"/>
          (관리자 ID <c:out value="${entry.changedBy}"/>)</li>
    </c:forEach>
  </ul>

  <h2>연결된 문의</h2>
  <c:choose>
    <c:when test="${empty linkedInquiries}"><p>연결된 문의가 없습니다.</p></c:when>
    <c:otherwise>
      <ul>
        <c:forEach var="item" items="${linkedInquiries}">
          <li>문의 #<c:out value="${item.inquiryId}"/>:
              <c:out value="${item.title}"/> (<c:out value="${item.status}"/>)
              <c:out value="${item.linkReason}"/>
              <span>연결: <c:out value="${item.linkedAt}"/></span>
              <form method="post" action="${pageContext.request.contextPath}/sentinel/incident/inquiry/unlink">
                <input type="hidden" name="id" value="${incident.incidentId}">
                <input type="hidden" name="inquiryId" value="${item.inquiryId}">
                <input type="hidden" name="csrfToken" value="${csrfToken}">
                <button type="submit">연결 해제</button>
              </form>
          </li>
        </c:forEach>
      </ul>
    </c:otherwise>
  </c:choose>
  <h3>문의 연결</h3>
  <p>존재하는 문의 ID를 입력하세요. 삭제된 문의는 연결할 수 없습니다.</p>
  <form method="post" action="${pageContext.request.contextPath}/sentinel/incident/inquiry/link">
    <input type="hidden" name="id" value="${incident.incidentId}">
    <input type="hidden" name="csrfToken" value="${csrfToken}">
    <label>문의 ID <input type="number" name="inquiryId" min="1" required></label>
    <label>연결 사유 <input type="text" name="reason" maxlength="500"></label>
    <button type="submit">문의 연결</button>
  </form>
</main>
</body>
</html>
