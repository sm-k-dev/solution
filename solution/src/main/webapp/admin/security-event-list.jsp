<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="adminPageTitle" scope="request" value="보안 위협 관제"/>
<jsp:include page="/inc/admin-top.jsp"/>
<div class="admin-inquiry-page security-console">
    <div class="admin-page-heading">
        <div>
            <div class="admin-eyebrow">WEB &amp; AI SECURITY TELEMETRY</div>
            <h1>보안 위협 관제</h1>
            <p>웹 요청과 AI 프롬프트에서 탐지된 의심 패턴을 기록하고 대응합니다.</p>
        </div>
        <button class="admin-primary-button" type="button"
        data-admin-action="${pageContext.request.contextPath}/security/daily-summary"
        data-csrf="${csrfToken}" data-result-param="summary" data-result-header="X-Security-Summary">
        <span class="material-symbols-outlined">send</span> 어제 위협 요약 전송
    </button>
</div>
<c:if test="${param.summary eq 'sent'}">
    <div class="admin-notice-success">
        <span class="material-symbols-outlined">check_circle</span> 보안 위협 일일 요약을 전송했습니다.</div>
</c:if>
<c:if test="${param.summary eq 'skipped'}">
    <div class="admin-notice-error">이미 전송했거나 Slack 설정 및 전송 결과를 확인해 주세요.</div>
</c:if>
<div class="security-scope-grid">
    <article>
        <span class="material-symbols-outlined">language</span>
        <div>
            <strong>웹 요청 위협</strong>
            <p>SQL Injection · XSS · 경로 탐색 · 명령 삽입 · SSRF</p>
        </div>
    </article>
    <article>
        <span class="material-symbols-outlined">psychology</span>
        <div>
            <strong>AI 프롬프트 위협</strong>
            <p>Prompt Injection · 시스템 프롬프트 탈취 · 도구 오용 · 민감정보 입력</p>
        </div>
    </article>
    <article>
        <span class="material-symbols-outlined">policy</span>
        <div>
            <strong>현재 정책</strong>
            <p>모니터링 중심 · 민감정보 마스킹 · CRITICAL 즉시 알림</p>
        </div>
    </article>
</div>
<section class="admin-table-card">
    <div class="admin-table-heading">
        <div>
            <h2>최근 탐지 이벤트</h2>
            <p>최근 100건 · 10분 이내 동일 위협은 발생 횟수로 집계합니다.</p>
        </div>
        <span class="admin-live-badge">
            <i>
            </i> SECURITY LIVE</span>
    </div>
    <div class="admin-table-scroll">
        <table class="admin-inquiry-table security-event-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>최근 탐지</th>
                    <th>분류</th>
                    <th>심각도</th>
                    <th>상태</th>
                    <th>위협 유형</th>
                    <th>발생</th>
                    <th>요청 경로</th>
                    <th>상세</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${securityEvents}">
                    <tr>
                        <td class="admin-ticket-id">
                            #<c:out value="${item.securityEventId}"/>
                        </td>
                        <td>
                            <c:out value="${item.lastSeenAt}"/>
                        </td>
                        <td>
                            <span class="security-category category-${item.category}">
                                <c:out value="${item.category}"/>
                            </span>
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
                            <c:out value="${item.threatType}"/>
                        </td>
                        <td>
                            <strong>
                                <c:out value="${item.occurrenceCount}"/>회</strong>
                        </td>
                        <td class="incident-path">
                            <c:out value="${item.requestUri}"/>
                        </td>
                        <td>
                            <a class="admin-row-action admin-detail-row-link" href="${pageContext.request.contextPath}/security/event?id=${item.securityEventId}">
                                상세 보기 <span class="material-symbols-outlined" aria-hidden="true">arrow_forward</span>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty securityEvents}">
                    <tr>
                        <td colspan="9" class="admin-empty-row">
                            <span class="material-symbols-outlined">verified_user</span>
                            <strong>탐지된 보안 위협이 없습니다.</strong>
                        </td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</section>
</div>
<jsp:include page="/inc/admin-bottom.jsp"/>
