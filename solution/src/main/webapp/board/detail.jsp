<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title><c:out value="${board.title}"/> | NEXORA</title>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&amp;family=JetBrains+Mono:wght@400;600&amp;display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/board_board.css">
<style>.community-content{white-space:pre-wrap;overflow-wrap:anywhere;min-height:16rem}.community-title{overflow-wrap:anywhere}</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"/><link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/top.css?v=20261002-4"/></head>
<body class="bg-background font-body-md text-on-surface min-h-screen">
<jsp:include page="/inc/top.jsp" />
<main class="w-full max-w-[1200px] mx-auto px-4 md:px-8 py-space-xl">
  <nav aria-label="Breadcrumb" class="flex items-center gap-2 text-on-surface-variant font-body-sm mb-space-md">
    <a class="hover:text-secondary" href="${pageContext.request.contextPath}/board/list?category=${board.category}">커뮤니티</a><span class="material-symbols-outlined text-[14px] text-outline">chevron_right</span>
    <span class="text-primary-container font-semibold"><c:choose><c:when test="${board.category eq 'NOTICE'}">공지사항</c:when><c:when test="${board.category eq 'RESOURCE'}">자료실</c:when><c:otherwise>자유게시판</c:otherwise></c:choose></span>
  </nav>
  <article class="rounded-xl overflow-hidden shadow-sm bg-surface-container-lowest">
    <header class="px-5 md:px-8 py-7 border-b border-surface-container-highest">
      <div class="flex items-center gap-2 mb-3"><span class="px-2 py-0.5 rounded-full bg-surface-container-high text-secondary font-label-caps tracking-wider"><c:out value="${board.category eq 'NOTICE' ? '공지사항' : (board.category eq 'RESOURCE' ? '자료실' : '자유게시판')}"/></span><c:if test="${not empty board.tags}"><span class="text-on-surface-variant text-xs"><c:out value="${board.tags}"/></span></c:if></div>
      <h1 class="font-headline-xl text-primary-container font-bold tracking-tight community-title"><c:out value="${board.title}"/></h1>
      <div class="flex flex-wrap items-center gap-x-5 gap-y-2 mt-4 text-on-surface-variant font-body-sm"><span class="inline-flex items-center gap-1"><span class="material-symbols-outlined text-[17px]">person</span><c:out value="${board.authorName}"/></span><span class="inline-flex items-center gap-1"><span class="material-symbols-outlined text-[17px]">schedule</span><fmt:formatDate value="${board.createdAt}" pattern="yyyy-MM-dd HH:mm"/></span><span class="inline-flex items-center gap-1"><span class="material-symbols-outlined text-[17px]">visibility</span>조회 <c:out value="${board.viewCount}"/></span></div>
    </header>
    <c:if test="${not empty boardFiles}"><section class="px-5 md:px-8 py-5 bg-surface-container-low border-b border-surface-container-highest"><h2 class="font-semibold text-primary-container mb-3">첨부파일</h2><div class="flex flex-col gap-2"><c:forEach var="file" items="${boardFiles}"><a class="inline-flex items-center gap-2 text-secondary hover:underline" href="${pageContext.request.contextPath}/board/file?id=${file.fileId}"><span class="material-symbols-outlined text-[18px]">attach_file</span><span><c:out value="${file.originalName}"/></span><small class="text-on-surface-variant">(<fmt:formatNumber value="${file.fileSize div 1024}" maxFractionDigits="0"/> KB)</small></a></c:forEach></div></section></c:if>
    <div class="px-5 md:px-8 py-8 leading-8 text-on-surface community-content"><c:out value="${board.content}"/></div>
    <footer class="flex flex-wrap items-center justify-between gap-3 px-5 md:px-8 py-5 bg-surface-container-low border-t border-surface-container-highest">
      <a class="inline-flex items-center gap-2 px-4 py-2 rounded-lg border border-surface-container-highest bg-surface-container-lowest hover:bg-surface-container text-primary-container font-semibold" href="${pageContext.request.contextPath}/board/list?category=${board.category}"><span class="material-symbols-outlined text-[18px]">arrow_back</span>목록</a>
      <c:if test="${sessionScope.role eq 'ADMIN' or sessionScope.memberId eq board.memberId}"><div class="flex gap-2"><a class="inline-flex items-center gap-2 px-4 py-2 rounded-lg bg-surface-container-high hover:bg-surface-container-highest text-primary-container font-semibold" href="${pageContext.request.contextPath}/board/edit?id=${board.boardId}"><span class="material-symbols-outlined text-[18px]">edit</span>수정</a><form method="post" action="${pageContext.request.contextPath}/board/delete" onsubmit="return confirm('게시글을 삭제할까요?')"><input type="hidden" name="csrfToken" value="<c:out value='${csrfToken}'/>"><input type="hidden" name="boardId" value="${board.boardId}"><button class="inline-flex items-center gap-2 px-4 py-2 rounded-lg bg-error-container text-on-error-container hover:opacity-80 font-semibold" type="submit"><span class="material-symbols-outlined text-[18px]">delete</span>삭제</button></form></div></c:if>
    </footer>
  </article>
  <section id="comments" class="mt-space-lg rounded-xl overflow-hidden shadow-sm bg-surface-container-lowest">
    <header class="px-5 md:px-8 py-5 border-b border-surface-container-highest"><h2 class="font-headline-sm text-primary-container font-bold">댓글 <span class="text-secondary"><c:out value="${comments.size()}"/></span></h2></header>
    <div class="divide-y divide-surface-container-highest">
      <c:forEach var="comment" items="${comments}"><article class="px-5 md:px-8 py-5 ${not empty comment.parentCommentId ? 'pl-10 md:pl-14 bg-surface-container-low/50' : ''}"><div class="flex flex-wrap items-center gap-3 text-sm"><strong class="text-primary-container"><c:out value="${comment.authorName}"/></strong><span class="text-on-surface-variant"><fmt:formatDate value="${comment.createdAt}" pattern="yyyy-MM-dd HH:mm"/></span></div><p class="mt-2 whitespace-pre-wrap break-words text-on-surface leading-7"><c:out value="${comment.content}"/></p><div class="flex gap-3 mt-3"><c:if test="${not empty sessionScope.loginId}"><button class="text-secondary text-sm font-semibold hover:underline" type="button" data-comment-id="${comment.commentId}" data-author="<c:out value='${comment.authorName}'/>" onclick="replyTo(this)">답글</button></c:if><c:if test="${sessionScope.role eq 'ADMIN' or sessionScope.memberId eq comment.memberId}"><form method="post" action="${pageContext.request.contextPath}/board/comment/delete"><input type="hidden" name="csrfToken" value="<c:out value='${csrfToken}'/>"><input type="hidden" name="boardId" value="${board.boardId}"><input type="hidden" name="commentId" value="${comment.commentId}"><button class="text-error text-sm font-semibold hover:underline" type="submit">삭제</button></form></c:if></div></article></c:forEach>
      <c:if test="${empty comments}"><p class="px-5 md:px-8 py-8 text-center text-on-surface-variant">첫 댓글을 남겨보세요.</p></c:if>
    </div>
    <c:if test="${not empty sessionScope.loginId}"><form class="p-5 md:px-8 md:py-6 border-t border-surface-container-highest" method="post" action="${pageContext.request.contextPath}/board/comment"><input type="hidden" name="csrfToken" value="<c:out value='${csrfToken}'/>"><input type="hidden" name="boardId" value="${board.boardId}"><input type="hidden" id="parentCommentId" name="parentCommentId"><div id="replyNotice" class="mb-2 text-sm text-secondary" hidden></div><label class="sr-only" for="commentContent">댓글 내용</label><textarea id="commentContent" name="content" maxlength="2000" rows="3" required class="w-full rounded-lg border border-surface-container-highest bg-surface-container-lowest px-4 py-3 focus:outline-none focus:ring-2 focus:ring-secondary/30" placeholder="댓글을 입력하세요."></textarea><div class="flex justify-end mt-3"><button class="inline-flex items-center gap-2 px-4 py-2 rounded-lg bg-primary-container hover:bg-secondary text-on-primary font-semibold" type="submit"><span class="material-symbols-outlined text-[18px]">send</span>댓글 등록</button></div></form></c:if>
    <c:if test="${empty sessionScope.loginId}"><p class="px-5 md:px-8 py-5 border-t border-surface-container-highest text-on-surface-variant"><a class="text-secondary font-semibold hover:underline" href="${pageContext.request.contextPath}/member/login.do">로그인</a> 후 댓글을 작성할 수 있습니다.</p></c:if>
  </section>
</main>
<jsp:include page="/inc/bottom.jsp" />
<script>function replyTo(button){document.getElementById('parentCommentId').value=button.dataset.commentId;const n=document.getElementById('replyNotice');n.hidden=false;n.textContent='@'+button.dataset.author+' 님에게 답글 작성 중';document.getElementById('commentContent').focus();}</script>
</body></html>
