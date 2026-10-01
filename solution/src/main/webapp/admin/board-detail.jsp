<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="adminPageTitle" scope="request" value="게시글 상세 관리"/>
<jsp:include page="/inc/admin-top.jsp"/>
<div class="admin-inquiry-page">
  <div class="admin-page-heading">
    <div><div class="admin-eyebrow">CONTENT MODERATION · #<c:out value="${board.boardId}"/></div><h1><c:out value="${board.title}"/></h1><p><c:out value="${board.category}"/> · <c:out value="${board.authorName}"/> · <fmt:formatDate value="${board.createdAt}" pattern="yyyy-MM-dd HH:mm"/> · 조회 <c:out value="${board.viewCount}"/></p></div>
    <a class="admin-action-link" href="${pageContext.request.contextPath}/admin/boards?category=${board.category}"><span class="material-symbols-outlined">arrow_back</span> 게시글 목록</a>
  </div>
  <section class="admin-detail-card">
    <div class="admin-detail-header"><div><div class="admin-eyebrow">POST DETAILS</div><h2>게시글 내용</h2></div><span class="admin-status status-IN_PROGRESS"><c:out value="${board.category}"/></span></div>
    <c:if test="${not empty board.tags}"><div class="admin-detail-meta"><div><span>태그</span><strong><c:out value="${board.tags}"/></strong></div></div></c:if>
    <div class="admin-message-block"><p style="white-space:pre-wrap;overflow-wrap:anywhere"><c:out value="${board.content}"/></p></div>
    <c:if test="${not empty boardFiles}"><div class="admin-detail-meta"><c:forEach var="file" items="${boardFiles}"><div><span>첨부파일</span><a href="${pageContext.request.contextPath}/board/file?id=${file.fileId}"><c:out value="${file.originalName}"/></a></div></c:forEach></div></c:if>
    <div class="admin-form-footer"><a class="admin-action-link" href="${pageContext.request.contextPath}/board/edit?id=${board.boardId}"><span class="material-symbols-outlined">edit</span> 게시글 수정</a><form method="post" action="${pageContext.request.contextPath}/admin/boards/delete" onsubmit="return confirm('이 게시글을 숨길까요?')"><input type="hidden" name="csrfToken" value="<c:out value='${csrfToken}'/>"/><input type="hidden" name="boardId" value="${board.boardId}"/><input type="hidden" name="category" value="<c:out value='${board.category}'/>"/><button class="admin-primary-button admin-danger-action" type="submit"><span class="material-symbols-outlined">visibility_off</span> 게시글 숨김</button></form></div>
  </section>
  <section class="admin-detail-card" id="comments">
    <div class="admin-detail-header"><div><div class="admin-eyebrow">COMMUNITY</div><h2>댓글 관리</h2></div></div>
    <c:forEach var="comment" items="${comments}"><article class="incident-linked-list"><div><strong><c:out value="${comment.authorName}"/></strong><p><fmt:formatDate value="${comment.createdAt}" pattern="yyyy-MM-dd HH:mm"/></p><p style="white-space:pre-wrap;overflow-wrap:anywhere"><c:out value="${comment.content}"/></p></div><form method="post" action="${pageContext.request.contextPath}/board/comment/delete" onsubmit="return confirm('이 댓글을 삭제할까요?')"><input type="hidden" name="csrfToken" value="<c:out value='${csrfToken}'/>"/><input type="hidden" name="boardId" value="${board.boardId}"/><input type="hidden" name="commentId" value="${comment.commentId}"/><button class="admin-row-action admin-danger-action" type="submit">댓글 삭제</button></form></article></c:forEach>
    <c:if test="${empty comments}"><p class="incident-note">등록된 댓글이 없습니다.</p></c:if>
  </section>
</div>
<jsp:include page="/inc/admin-bottom.jsp"/>
