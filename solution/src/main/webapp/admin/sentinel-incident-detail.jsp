<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="adminPageTitle" scope="request" value="인시던트 상세 분석"/>
<jsp:include page="/inc/admin-top.jsp"/>
<div class="admin-inquiry-page">
    <div class="admin-page-heading">
        <div>
            <div class="admin-eyebrow">INCIDENT #<c:out value="${incident.incidentId}"/>
            </div>
            <h1>인시던트 상세 분석</h1>
            <p>
                <c:out value="${incident.serviceName}"/> · <c:out value="${incident.occurredAt}"/>
            </p>
        </div>
        <a class="admin-action-link" href="${pageContext.request.contextPath}/sentinel/incidents">
            <span class="material-symbols-outlined">arrow_back</span> 목록으로</a>
    </div>
    <section class="admin-detail-card">
        <div class="admin-detail-header">
            <div>
                <div class="admin-eyebrow">ERROR DETAILS</div>
                <h2>
                    <c:out value="${incident.errorType}"/>
                </h2>
            </div>
            <div class="incident-badges">
                <span class="incident-severity severity-${incident.severity.toLowerCase()}">
                    <c:out value="${incident.severity}"/>
                </span>
                <span class="admin-status">
                    <c:out value="${incident.status}"/>
                </span>
            </div>
        </div>
        <div class="admin-detail-meta">
            <div>
                <span>서비스</span>
                <strong>
                    <c:out value="${incident.serviceName}"/>
                </strong>
            </div>
            <div>
                <span>발생 시간</span>
                <strong>
                    <c:out value="${incident.occurredAt}"/>
                </strong>
            </div>
            <div>
                <span>HTTP 요청</span>
                <strong>
                    <c:out value="${incident.httpMethod}"/>
                    <c:out value="${incident.requestUri}"/>
                </strong>
            </div>
            <div>
                <span>오류 유형</span>
                <strong>
                    <c:out value="${incident.errorType}"/>
                </strong>
            </div>
        </div>
        <div class="admin-message-block">
            <h3>오류 메시지</h3>
            <p>
                <c:out value="${incident.errorMessage}"/>
            </p>
        </div>
        <details class="incident-stack">
            <summary>Stack trace 보기</summary>
            <pre>
                <c:out value="${incident.stackTrace}"/>
            </pre>
        </details>
    </section>
    <section class="admin-detail-card">
        <div class="admin-detail-header">
            <div>
                <div class="admin-eyebrow">AI ASSISTANCE</div>
                <h2>AI 분석 보조</h2>
            </div>
        </div>
        <p class="incident-note">AI는 원인 후보와 점검 제안을 제공합니다. 심각도와 처리 상태는 규칙 및 관리자가 결정합니다.</p>
        <c:if test="${param.aiError eq '1'}">
            <div class="admin-notice-error">AI 분석을 완료하지 못했습니다. 설정 또는 서버 로그를 확인해 주세요.</div>
        </c:if>
        <div class="incident-action-form">
            <button class="admin-primary-button" type="button" data-admin-action="${pageContext.request.contextPath}/sentinel/incident/analyze" data-id="${incident.incidentId}" data-csrf="${csrfToken}">
                <span class="material-symbols-outlined">auto_awesome</span> AI 분석 요청</button>
        </div>
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
                    <span>가능한 원인</span>
                    <p>
                        <c:out value="${analysis.possibleCause}"/>
                    </p>
                </div>
                <div>
                    <span>확인할 사항</span>
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
        <c:if test="${incident.status eq 'OPEN' || incident.status eq 'ACKNOWLEDGED'}">
            <div class="incident-action-form">
                <button class="admin-primary-button" type="button" data-admin-action="${pageContext.request.contextPath}/sentinel/incident/status" data-id="${incident.incidentId}" data-csrf="${csrfToken}" data-expected-status="${incident.status}" data-new-status="${incident.status eq 'OPEN' ? 'ACKNOWLEDGED' : 'RESOLVED'}">${incident.status eq 'OPEN' ? '확인 처리' : '해결 처리'}</button>
            </div>
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
    <section class="admin-detail-card">
        <div class="admin-detail-header">
            <div>
                <div class="admin-eyebrow">CUSTOMER SUPPORT</div>
                <h2>연결된 문의</h2>
            </div>
        </div>
        <c:choose>
            <c:when test="${empty linkedInquiries}">
                <p class="incident-note">연결된 문의가 없습니다.</p>
            </c:when>
            <c:otherwise>
                <div class="incident-linked-list">
                    <c:forEach var="item" items="${linkedInquiries}">
                        <article>
                            <div>
                                <strong>#<c:out value="${item.inquiryId}"/> · <c:out value="${item.title}"/>
                                </strong>
                                <p>
                                    <c:out value="${item.status}"/> · <c:out value="${item.linkReason}"/>
                                </p>
                                <small>연결 시각: <c:out value="${item.linkedAt}"/>
                                </small>
                            </div>
                            <button class="admin-action-link" type="button" data-admin-action="${pageContext.request.contextPath}/sentinel/incident/inquiry/unlink" data-id="${incident.incidentId}" data-inquiry-id="${item.inquiryId}" data-csrf="${csrfToken}" data-confirm="이 문의 연결을 해제할까요?">연결 해제</button>
                        </article>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
        <div class="incident-link-form" data-link-inquiry data-admin-fields>
            <label>문의 ID<input type="number" name="inquiryId" min="1" required>
            </label>
            <label>연결 사유<input type="text" name="reason" maxlength="500">
            </label>
            <button class="admin-primary-button" type="button" data-admin-action="${pageContext.request.contextPath}/sentinel/incident/inquiry/link" data-id="${incident.incidentId}" data-csrf="${csrfToken}">문의 연결</button>
        </div>
    </section>
</div>
<jsp:include page="/inc/admin-bottom.jsp"/>
