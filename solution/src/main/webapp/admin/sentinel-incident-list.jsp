<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="adminPageTitle" scope="request" value="인시던트 대응 센터"/>
<jsp:include page="/inc/admin-top.jsp"/>
<div class="admin-inquiry-page">
    <div class="admin-page-heading">
        <div>
            <div class="admin-eyebrow">SENTINELOPS TELEMETRY</div>
            <h1>인시던트 대응 센터</h1>
            <p>최근 발생한 시스템 오류를 확인하고 운영 조치를 진행합니다.</p>
        </div>
        <form method="post" action="${pageContext.request.contextPath}/sentinel/daily-summary">
            <input type="hidden" name="csrfToken" value="${csrfToken}">
            <button class="admin-primary-button" type="submit">
                <span class="material-symbols-outlined">send</span> 어제 오류 요약 전송</button>
        </form>
    </div>
    <c:if test="${param.summary eq 'sent'}">
        <div class="admin-notice-success">
            <span class="material-symbols-outlined">check_circle</span> 일일 요약을 전송했습니다.</div>
    </c:if>
    <c:if test="${param.summary eq 'skipped'}">
        <div class="admin-notice-error">요약을 전송하지 않았습니다. 이미 전송했거나 Slack 설정 및 전송 결과를 확인해 주세요.</div>
    </c:if>
    <section class="admin-table-card">
        <div class="admin-table-heading">
            <div>
                <h2>최근 발생 오류</h2>
                <p>최근 50건 · 등급과 상태를 확인하세요.</p>
            </div>
            <span class="admin-live-badge">
                <i>
                </i> TELEMETRY</span>
        </div>
        <div class="admin-table-scroll">
            <table class="admin-inquiry-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>발생 시각</th>
                        <th>심각도</th>
                        <th>상태</th>
                        <th>오류 유형</th>
                        <th>요청 경로</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${incidents}">
                        <tr>
                            <td class="admin-ticket-id">
                                <a href="${pageContext.request.contextPath}/sentinel/incident?id=${item.incidentId}">#<c:out value="${item.incidentId}"/>
                                </a>
                            </td>
                            <td>
                                <c:out value="${item.occurredAt}"/>
                            </td>
                            <td>
                                <span class="incident-severity severity-${item.severity}">
                                    <c:out value="${item.severity}"/>
                                </span>
                            </td>
                            <td>
                                <c:out value="${item.status}"/>
                            </td>
                            <td class="admin-title-cell">
                                <c:out value="${item.errorType}"/>
                            </td>
                            <td class="incident-path">
                                <c:out value="${item.requestUri}"/>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty incidents}">
                        <tr>
                            <td colspan="6" class="admin-empty-row">
                                <span class="material-symbols-outlined">check_circle</span>
                                <strong>기록된 인시던트가 없습니다.</strong>
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </section>
</div>
<jsp:include page="/inc/admin-bottom.jsp"/>
