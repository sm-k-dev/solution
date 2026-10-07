<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="adminPageTitle" scope="request" value="보안 이벤트 상세"/>
<jsp:include page="/inc/admin-top.jsp"/>
<div class="admin-inquiry-page security-console">
    <div class="admin-page-heading">
        <div>
            <div class="admin-eyebrow">SECURITY EVENT #<c:out value="${securityEvent.securityEventId}"/>
            </div>
            <h1>보안 이벤트 상세</h1>
            <p>
                <c:out value="${securityEvent.category}"/> · 최근 탐지 <c:out value="${securityEvent.lastSeenAt}"/>
            </p>
        </div>
        <a class="admin-action-link" href="${pageContext.request.contextPath}/security/events">
            <span class="material-symbols-outlined">arrow_back</span> 목록으로</a>
    </div>
    <section class="admin-detail-card">
        <div class="admin-detail-header">
            <div>
                <div class="admin-eyebrow">RULE-BASED DETECTION</div>
                <h2>
                    <c:out value="${securityEvent.threatType}"/>
                </h2>
            </div>
            <div class="incident-badges">
                <span class="security-category category-${securityEvent.category.toLowerCase()}">
                    <c:out value="${securityEvent.category}"/>
                </span>
                <span class="incident-severity severity-${securityEvent.severity.toLowerCase()}">
                    <c:out value="${securityEvent.severity}"/>
                </span>
                <span class="admin-status">
                    <c:out value="${securityEvent.status}"/>
                </span>
            </div>
        </div>
        <div class="admin-detail-meta security-detail-meta">
            <div>
                <span>탐지 규칙</span>
                <strong>
                    <c:out value="${securityEvent.ruleCode}"/>
                </strong>
            </div>
            <div>
                <span>탐지 경계</span>
                <strong>
                    <c:out value="${securityEvent.detectionSource}"/>
                </strong>
            </div>
            <div>
                <span>최초 탐지</span>
                <strong>
                    <c:out value="${securityEvent.firstSeenAt}"/>
                </strong>
            </div>
            <div>
                <span>최근 탐지</span>
                <strong>
                    <c:out value="${securityEvent.lastSeenAt}"/>
                </strong>
            </div>
            <div>
                <span>HTTP 요청</span>
                <strong>
                    <c:out value="${securityEvent.httpMethod}"/>
                    <c:out value="${securityEvent.requestUri}"/>
                </strong>
            </div>
            <div>
                <span>발생 횟수</span>
                <strong>
                    <c:out value="${securityEvent.occurrenceCount}"/>회</strong>
            </div>
            <div>
                <span>출발지 식별값</span>
                <strong class="security-hash">
                    <c:out value="${securityEvent.sourceIpHash}"/>
                </strong>
            </div>
        </div>
        <div class="admin-message-block">
            <h3>마스킹된 탐지 근거</h3>
            <p>
                <c:out value="${securityEvent.evidenceExcerpt}"/>
            </p>
        </div>
        <p class="incident-note">탐지 근거는 제한된 길이로 저장되며 비밀번호·토큰·API 키 패턴은 마스킹됩니다. 이 이벤트는 공격 확정이 아닌 의심 징후입니다.</p>
    </section>
    <section class="admin-detail-card">
        <div class="admin-detail-header">
            <div>
                <div class="admin-eyebrow">AI ASSISTANCE</div>
                <h2>AI 위협 분석 보조</h2>
            </div>
        </div>
        <p class="incident-note">AI에는 탐지 유형·규칙·경로 등 제한된 메타데이터만 전달합니다. 심각도와 상태는 규칙 및 관리자가 결정합니다.</p>
        <button class="admin-primary-button" type="button" data-admin-action="${pageContext.request.contextPath}/security/event/analyze" data-id="${securityEvent.securityEventId}" data-csrf="${csrfToken}">
            <span class="material-symbols-outlined">auto_awesome</span> AI 분석 요청</button>
        <c:if test="${not empty analysis}">
            <div class="incident-analysis-grid">
                <div>
                    <span>분석 시각 · 모델</span>
                    <p>
                        <c:out value="${analysis.createdAt}"/> · <c:out value="${analysis.modelName}"/>
                    </p>
                </div>
                <div>
                    <span>요약</span>
                    <p>
                        <c:out value="${analysis.summary}"/>
                    </p>
                </div>
                <div>
                    <span>가능한 영향</span>
                    <p>
                        <c:out value="${analysis.possibleImpact}"/>
                    </p>
                </div>
                <div>
                    <span>권장 조치</span>
                    <p>
                        <c:out value="${analysis.suggestedAction}"/>
                    </p>
                </div>
            </div>
        </c:if>
    </section>
    <section class="admin-detail-card">
        <div class="admin-detail-header">
            <div>
                <div class="admin-eyebrow">OPERATIONS</div>
                <h2>상태 변경 및 이력</h2>
            </div>
        </div>
        <c:if test="${securityEvent.status eq 'OPEN' || securityEvent.status eq 'ACKNOWLEDGED'}">
            <button class="admin-primary-button" type="button" data-admin-action="${pageContext.request.contextPath}/security/event/status" data-id="${securityEvent.securityEventId}" data-csrf="${csrfToken}" data-expected-status="${securityEvent.status}" data-new-status="${securityEvent.status eq 'OPEN' ? 'ACKNOWLEDGED' : 'RESOLVED'}">${securityEvent.status eq 'OPEN' ? '확인 처리' : '해결 처리'}</button>
        </c:if>
        <ul class="incident-history">
            <c:forEach var="entry" items="${history}">
                <li>
                    <span>
                        <c:out value="${entry.changedAt}"/>
                    </span>
                    <strong>
                        <c:out value="${entry.previousStatus}"/> → <c:out value="${entry.newStatus}"/>
                    </strong>
                    <small>관리자 ID <c:out value="${entry.changedBy}"/>
                    </small>
                </li>
            </c:forEach>
            <c:if test="${empty history}">
                <li class="muted">상태 변경 이력이 없습니다.</li>
            </c:if>
        </ul>
    </section>
</div>
<jsp:include page="/inc/admin-bottom.jsp"/>
