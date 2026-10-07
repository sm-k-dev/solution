<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>문의 상세 | NEXORA</title>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/index.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/inquiry_flow.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common-files.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/top.css?v=20261002-4"/>
        <script src="${pageContext.request.contextPath}/assets/js/private-page.js" defer></script>
    </head>
    <body>
        <jsp:include page="/inc/top.jsp"/>
        <main class="flow-container">
            <div class="page-heading">
                <p class="eyebrow">SUPPORT TICKET #<c:out value="${inquiry.inquiryId}"/>
                </p>
                <h1>
                    <c:out value="${inquiry.title}"/>
                </h1>
                <p>
                    <c:out value="${inquiry.category}"/> · <fmt:formatDate value="${inquiry.createdAt}" pattern="yyyy-MM-dd HH:mm"/> · <span class="status status-${inquiry.status}">
                        <c:out value="${inquiry.status}"/>
                    </span>
                </p>
            </div>
            <section class="detail-card">
                <h2>문의 내용</h2>
                <p class="detail-text">
                    <c:out value="${inquiry.content}"/>
                </p>
            </section>
            <c:if test="${not empty inquiryFiles}">
                <section class="detail-card">
                    <h2>첨부파일</h2>
                    <ul class="private-file-list">
                        <c:forEach var="file" items="${inquiryFiles}">
                            <li>
                                <a href="${pageContext.request.contextPath}/inquiry/file?id=${file.fileId}">
                                    <c:out value="${file.originalName}"/>
                                </a> (<fmt:formatNumber value="${file.fileSize / 1024}" maxFractionDigits="0"/> KB)</li>
                        </c:forEach>
                    </ul>
                </section>
            </c:if>
            <section class="detail-card answer-card">
                <h2>관리자 답변</h2>
                <c:choose>
                    <c:when test="${not empty inquiry.adminAnswer}">
                        <p class="detail-text">
                            <c:out value="${inquiry.adminAnswer}"/>
                        </p>
                        <p class="muted">
                            <c:if test="${not empty inquiry.answeredAt}">
                                <fmt:formatDate value="${inquiry.answeredAt}" pattern="yyyy-MM-dd HH:mm"/> 답변</c:if>
                        </p>
                    </c:when>
                    <c:otherwise>
                        <p class="muted">아직 답변이 등록되지 않았습니다.</p>
                    </c:otherwise>
                </c:choose>
            </section>
            <div class="flow-actions">
                <a class="button button-secondary" href="${pageContext.request.contextPath}/inquiry/my">문의 목록</a>
                <a class="button button-primary" href="${pageContext.request.contextPath}/inquiry/new">새 문의 접수</a>
            </div>
        </main>
        <jsp:include page="/inc/bottom.jsp"/>
    </body>
</html>
