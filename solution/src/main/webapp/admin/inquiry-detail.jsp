<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="adminPageTitle" scope="request" value="문의 상세 및 답변"/>
<jsp:include page="/inc/admin-top.jsp"/>
<div class="admin-inquiry-page">
    <div class="admin-page-heading">
        <div>
            <div class="admin-eyebrow">TICKET #<c:out value="${inquiry.inquiryId}"/>
            </div>
            <h1>
                <c:out value="${inquiry.title}"/>
            </h1>
            <p>접수 <fmt:formatDate value="${inquiry.createdAt}" pattern="yyyy-MM-dd HH:mm"/>
            </p>
        </div>
        <a class="admin-action-link" href="${pageContext.request.contextPath}/admin/inquiry/list">
            <span class="material-symbols-outlined">arrow_back</span> 문의 목록</a>
    </div>
    <c:if test="${param.saved eq '1'}">
        <div class="admin-notice-success">
            <span class="material-symbols-outlined">check_circle</span> 답변을 저장했어요.</div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="admin-notice-error">
            <c:out value="${errorMessage}"/>
        </div>
    </c:if>
    <section class="admin-detail-card">
        <div class="admin-detail-header">
            <div>
                <div class="admin-eyebrow">INQUIRY DETAILS</div>
                <h2>접수 내용</h2>
            </div>
            <c:choose>
                <c:when test="${inquiry.status eq 'RECEIVED'}">
                    <span class="admin-status status-RECEIVED">접수</span>
                </c:when>
                <c:when test="${inquiry.status eq 'IN_PROGRESS'}">
                    <span class="admin-status status-IN_PROGRESS">처리 중</span>
                </c:when>
                <c:otherwise>
                    <span class="admin-status status-COMPLETED">완료</span>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="admin-detail-meta">
            <div>
                <span>문의자</span>
                <strong>
                    <c:out value="${inquiry.contactName}"/>
                </strong>
            </div>
            <div>
                <span>이메일</span>
                <a href="mailto:${inquiry.contactEmail}">
                    <c:out value="${inquiry.contactEmail}"/>
                </a>
            </div>
            <div>
                <span>회사</span>
                <strong>
                    <c:out value="${inquiry.companyName}"/>
                </strong>
            </div>
            <div>
                <span>문의 유형</span>
                <strong>
                    <c:out value="${inquiry.category}"/>
                </strong>
            </div>
        </div>
        <div class="admin-message-block">
            <h3>문의 내용</h3>
            <p>
                <c:out value="${inquiry.content}"/>
            </p>
        </div>
    </section>
    <section class="admin-detail-card">
        <div class="admin-detail-header">
            <div>
                <div class="admin-eyebrow">RESPONSE</div>
                <h2>관리자 답변</h2>
            </div>
        </div>
        <form method="post" action="${pageContext.request.contextPath}/admin/inquiry/answer">
            <input type="hidden" name="csrfToken" value="${csrfToken}">
            <input type="hidden" name="inquiryId" value="${inquiry.inquiryId}">
            <label class="admin-form-label" for="adminAnswer">답변 내용</label>
            <textarea class="admin-answer-input" id="adminAnswer" name="adminAnswer" maxlength="10000" rows="8" required>
                <c:out value="${inquiry.adminAnswer}"/>
            </textarea>
            <div class="admin-form-footer">
                <label class="admin-form-label" for="status">처리 상태</label>
                <select class="admin-status-select" id="status" name="status">
                    <option value="IN_PROGRESS" ${inquiry.status eq 'IN_PROGRESS' ? 'selected' : ''}>처리 중</option>
                    <option value="COMPLETED" ${inquiry.status eq 'COMPLETED' ? 'selected' : ''}>답변 완료</option>
                </select>
                <button class="admin-primary-button" type="submit">
                    <span class="material-symbols-outlined">save</span> 답변 저장</button>
            </div>
        </form>
    </section>
</div>
<jsp:include page="/inc/admin-bottom.jsp"/>
