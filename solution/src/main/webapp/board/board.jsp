<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>커뮤니티 | NEXORA</title>
        <link href="https://fonts.googleapis.com" rel="preconnect">
        <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&amp;family=JetBrains+Mono:wght@400;600&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/index.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/board_board.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common-community.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/top.css?v=20261002-4"/>
    </head>
    <body class="bg-background font-body-md text-on-surface min-h-screen">
        <jsp:include page="/inc/top.jsp" />
        <main class="w-full max-w-[1200px] mx-auto px-gutter py-space-xl">
            <nav aria-label="Breadcrumb" class="flex items-center gap-2 text-on-surface-variant font-body-sm mb-space-md">
                <a class="flex items-center gap-1 hover:text-secondary transition-colors" href="${pageContext.request.contextPath}/index.jsp">
                    <span class="material-symbols-outlined text-[16px]">home</span>
                    <span>홈</span>
                </a>
                <span class="material-symbols-outlined text-[14px] text-outline">chevron_right</span>
                <span class="text-primary-container font-semibold">커뮤니티</span>
            </nav>
            <header class="flex flex-col md:flex-row md:items-end justify-between gap-space-md pb-space-lg mb-space-lg border-b border-surface-container-highest">
                <div>
                    <div class="flex items-center gap-space-sm mb-1">
                        <span class="px-2 py-0.5 rounded-full bg-surface-container-high text-secondary font-label-caps tracking-wider">ENTERPRISE FORUM</span>
                        <span class="inline-flex items-center gap-1 text-[11px] font-metric-val text-on-surface-variant">
                            <span class="w-2 h-2 rounded-full bg-secondary-container">
                            </span>NEXORA COMMUNITY</span>
                    </div>
                    <h1 class="font-headline-xl text-primary-container font-bold tracking-tight">커뮤니티</h1>
                    <p class="font-body-md text-on-surface-variant mt-1">넥서라 엔터프라이즈의 소식과 자료를 확인하고 자유롭게 의견을 나눠보세요.</p>
                </div>
                <div class="flex flex-wrap items-center gap-2">
                    <div class="flex items-center gap-2 px-3 py-1.5 rounded-lg bg-surface-container-lowest shadow-sm">
                        <span class="material-symbols-outlined text-[18px] text-secondary">forum</span>
                        <span class="font-body-sm text-on-surface-variant">전체 게시글 <strong class="font-metric-val text-primary-container font-semibold">
                                <c:out value="${totalCount}"/>
                            </strong>건</span>
                    </div>
                    <div class="flex items-center gap-2 px-3 py-1.5 rounded-lg bg-surface-container-lowest shadow-sm">
                        <span class="material-symbols-outlined text-[18px] text-secondary">support_agent</span>
                        <span class="font-body-sm text-on-surface-variant">NEXORA 지식 커뮤니티</span>
                    </div>
                </div>
            </header>
            <div id="board-list" class="flex flex-col gap-space-lg">
                <div class="flex flex-col sm:flex-row sm:items-center justify-between gap-space-md">
                    <nav aria-label="게시판 분류" class="flex items-center p-1 rounded-xl bg-surface-container-high/60 gap-1 overflow-x-auto">
                        <a class="flex items-center gap-2 px-4 py-2 rounded-lg font-headline-sm text-[14px] transition-all ${category eq 'NOTICE' ? 'bg-surface-container-lowest text-primary-container shadow-sm font-semibold' : 'text-on-surface-variant hover:text-primary-container'}" href="${pageContext.request.contextPath}/board/list?category=NOTICE">
                            <span class="material-symbols-outlined text-[18px]">campaign</span>공지사항</a>
                        <a class="flex items-center gap-2 px-4 py-2 rounded-lg font-headline-sm text-[14px] transition-all ${category eq 'RESOURCE' ? 'bg-surface-container-lowest text-primary-container shadow-sm font-semibold' : 'text-on-surface-variant hover:text-primary-container'}" href="${pageContext.request.contextPath}/board/list?category=RESOURCE">
                            <span class="material-symbols-outlined text-[18px]">cloud_download</span>자료실</a>
                        <a class="flex items-center gap-2 px-4 py-2 rounded-lg font-headline-sm text-[14px] transition-all ${category eq 'FREE' ? 'bg-surface-container-lowest text-primary-container shadow-sm font-semibold' : 'text-on-surface-variant hover:text-primary-container'}" href="${pageContext.request.contextPath}/board/list?category=FREE">
                            <span class="material-symbols-outlined text-[18px]">forum</span>자유게시판</a>
                    </nav>
                    <c:if test="${not empty sessionScope.loginId}">
                        <a class="inline-flex items-center justify-center gap-1.5 px-4 py-2 rounded-lg bg-primary-container hover:bg-secondary text-on-primary font-body-sm font-semibold shadow-sm transition-all" href="${pageContext.request.contextPath}/board/write?category=${category}">
                            <span class="material-symbols-outlined text-[18px]">edit</span>글쓰기</a>
                    </c:if>
                </div>
                <div class="flex flex-col lg:flex-row lg:items-center justify-between gap-space-md p-4 rounded-xl bg-surface-container-lowest shadow-sm">
                    <span class="font-body-sm text-on-surface-variant">총 <strong class="font-metric-val text-primary-container font-semibold">
                            <c:out value="${totalCount}"/>
                        </strong>개의 게시글</span>
                    <form class="flex flex-wrap sm:flex-nowrap items-center gap-2 w-full lg:w-auto" method="get" action="${pageContext.request.contextPath}/board/list">
                        <input type="hidden" name="category" value="<c:out value='${category}'/>">
                        <label class="sr-only" for="searchWord">검색어</label>
                        <input class="w-full sm:w-72 h-10 px-3 rounded-lg bg-surface-container-low text-primary-container font-body-sm placeholder:text-outline focus:outline-none focus:bg-surface-container-lowest" id="searchWord" name="q" value="<c:out value='${searchQuery}'/>" placeholder="제목, 내용, 작성자, 태그 검색">
                        <button class="h-10 px-4 rounded-lg bg-primary-container hover:bg-secondary text-on-primary font-body-sm font-semibold transition-all" type="submit">
                            <span class="material-symbols-outlined text-[18px] align-middle">search</span> 검색</button>
                    </form>
                </div>
                <section class="rounded-xl overflow-hidden shadow-sm bg-surface-container-lowest" aria-label="게시글 목록">
                    <div class="hidden md:grid grid-cols-12 gap-2 px-6 py-3.5 bg-surface-container font-label-caps text-on-surface-variant tracking-wider">
                        <div class="col-span-1 text-center">번호</div>
                        <div class="col-span-6">제목</div>
                        <div class="col-span-2 text-center">작성자</div>
                        <div class="col-span-2 text-center">등록일</div>
                        <div class="col-span-1 text-center">조회수</div>
                    </div>
                    <c:forEach var="item" items="${boardList}" varStatus="status">
                        <a class="group flex flex-col md:grid md:grid-cols-12 gap-2 px-4 md:px-6 py-4 items-start md:items-center border-b border-surface-container-highest hover:bg-surface-container-low/60 transition-colors ${item.category eq 'NOTICE' ? 'bg-surface-container-high/20' : ''}" href="${pageContext.request.contextPath}/board/list?category=${category}&amp;q=<c:out value='${searchQuery}'/>&amp;page=${currentPage}&amp;id=${item.boardId}#detail-preview-section">
                            <div class="hidden md:flex col-span-1 justify-center text-outline font-metric-val text-[13px]">
                                <c:out value="${totalCount - ((currentPage - 1) * 10) - status.index}"/>
                            </div>
                            <div class="w-full md:col-span-6 flex items-center gap-2 min-w-0">
                                <span class="md:hidden px-2 py-0.5 rounded-full bg-surface-container-high text-on-surface-variant font-label-caps text-[10px]">
                                    <c:out value="${item.category eq 'NOTICE' ? '공지' : (item.category eq 'RESOURCE' ? '자료' : '자유')}"/>
                                </span>
                                <span class="material-symbols-outlined text-secondary text-[18px] flex-shrink-0">
                                    <c:out value="${item.category eq 'NOTICE' ? 'campaign' : (item.category eq 'RESOURCE' ? 'description' : 'forum')}"/>
                                </span>
                                <span class="font-headline-sm text-[15px] ${item.category eq 'NOTICE' ? 'font-semibold text-primary-container' : 'text-on-surface'} group-hover:text-secondary transition-colors truncate">
                                    <c:out value="${item.title}"/>
                                </span>
                                <c:if test="${not empty item.tags}">
                                    <span class="hidden lg:inline px-1.5 py-0.5 rounded bg-surface-container text-on-surface-variant text-[10px] truncate">
                                        <c:out value="${item.tags}"/>
                                    </span>
                                </c:if>
                            </div>
                            <div class="w-full md:col-span-2 flex items-center md:justify-center gap-2 mt-1 md:mt-0">
                                <span class="md:hidden text-on-surface-variant text-xs">작성자</span>
                                <span class="text-on-surface-variant font-body-sm text-[13px]">
                                    <c:out value="${item.authorName}"/>
                                </span>
                            </div>
                            <div class="w-full md:col-span-2 flex items-center md:justify-center gap-2 text-outline font-metric-val text-[13px]">
                                <span class="md:hidden text-on-surface-variant text-xs">등록일</span>
                                <fmt:formatDate value="${item.createdAt}" pattern="yyyy-MM-dd"/>
                            </div>
                            <div class="w-full md:col-span-1 flex items-center md:justify-center gap-2 text-outline font-metric-val text-[13px]">
                                <span class="md:hidden text-on-surface-variant text-xs">조회수</span>
                                <c:out value="${item.viewCount}"/>
                            </div>
                        </a>
                    </c:forEach>
                    <c:if test="${empty boardList}">
                        <div class="px-6 py-16 text-center text-on-surface-variant">
                            <span class="material-symbols-outlined block text-4xl mb-2 text-outline">search_off</span>검색 결과가 없습니다.</div>
                    </c:if>
                </section>
                <c:if test="${pageCount gt 1}">
                    <nav aria-label="페이지 이동" class="flex items-center justify-center gap-1.5">
                        <c:if test="${currentPage gt 1}">
                            <a class="w-9 h-9 flex items-center justify-center rounded-lg bg-surface-container-lowest text-on-surface-variant hover:bg-surface-container-high shadow-sm" href="${pageContext.request.contextPath}/board/list?category=${category}&amp;q=<c:out value='${searchQuery}'/>&amp;page=${currentPage - 1}" title="이전">
                                <span class="material-symbols-outlined text-[18px]">chevron_left</span>
                            </a>
                        </c:if>
                        <c:forEach var="pageNo" begin="1" end="${pageCount}">
                            <a class="w-9 h-9 flex items-center justify-center rounded-lg font-metric-val text-[13px] shadow-sm ${pageNo eq currentPage ? 'bg-primary-container text-on-primary font-semibold' : 'bg-surface-container-lowest text-on-surface hover:bg-surface-container-high'}" href="${pageContext.request.contextPath}/board/list?category=${category}&amp;q=<c:out value='${searchQuery}'/>&amp;page=${pageNo}">
                                <c:out value="${pageNo}"/>
                            </a>
                        </c:forEach>
                        <c:if test="${currentPage lt pageCount}">
                            <a class="w-9 h-9 flex items-center justify-center rounded-lg bg-surface-container-lowest text-on-surface-variant hover:bg-surface-container-high shadow-sm" href="${pageContext.request.contextPath}/board/list?category=${category}&amp;q=<c:out value='${searchQuery}'/>&amp;page=${currentPage + 1}" title="다음">
                                <span class="material-symbols-outlined text-[18px]">chevron_right</span>
                            </a>
                        </c:if>
                    </nav>
                </c:if>
            </div>
            <c:if test="${not empty selectedBoard}">
                <section class="mt-space-xl pt-space-lg border-t border-surface-container-highest" id="detail-preview-section">
                    <div class="flex items-center justify-between mb-4">
                        <div class="flex items-center gap-2">
                            <span class="w-2.5 h-2.5 rounded-full bg-secondary">
                            </span>
                            <h2 class="font-headline-lg text-[20px] text-primary-container font-semibold">게시글 상세 보기</h2>
                        </div>
                        <span class="text-outline font-label-caps tracking-wider">POST #<c:out value="${selectedBoard.boardId}"/>
                        </span>
                    </div>
                    <article class="bg-surface-container-lowest rounded-xl shadow-md overflow-hidden">
                        <header class="p-6 md:p-8 bg-surface-container-low/50 border-b border-surface-container-highest">
                            <div class="flex flex-wrap items-center gap-2 mb-3">
                                <span class="px-2.5 py-0.5 rounded-full bg-error-container text-on-error-container font-label-caps">
                                    <c:out value="${selectedBoard.category eq 'NOTICE' ? '공지사항' : (selectedBoard.category eq 'RESOURCE' ? '자료실' : '자유게시판')}"/>
                                </span>
                                <c:if test="${not empty selectedBoard.tags}">
                                    <span class="px-2 py-0.5 rounded bg-secondary-fixed text-secondary font-label-caps text-[11px]">
                                        <c:out value="${selectedBoard.tags}"/>
                                    </span>
                                </c:if>
                            </div>
                            <h3 class="font-headline-lg text-primary-container font-bold mb-4 leading-snug community-title">
                                <c:out value="${selectedBoard.title}"/>
                            </h3>
                            <div class="flex flex-wrap items-center justify-between gap-3 text-on-surface-variant font-body-sm pt-4 border-t border-surface-container-high/60">
                                <div class="flex flex-wrap items-center gap-4">
                                    <div class="flex items-center gap-2">
                                        <span class="w-8 h-8 rounded-full bg-secondary-fixed flex items-center justify-center text-secondary font-bold text-xs">NX</span>
                                        <span class="font-semibold text-primary-container">
                                            <c:out value="${selectedBoard.authorName}"/>
                                        </span>
                                    </div>
                                    <span class="text-surface-container-highest">|</span>
                                    <span class="inline-flex items-center gap-1 text-outline">
                                        <span class="material-symbols-outlined text-[16px]">schedule</span>
                                        <fmt:formatDate value="${selectedBoard.createdAt}" pattern="yyyy-MM-dd HH:mm"/>
                                    </span>
                                </div>
                                <div class="flex items-center gap-1 font-metric-val text-[13px] text-outline">
                                    <span class="material-symbols-outlined text-[16px]">visibility</span>
                                    <c:out value="${selectedBoard.viewCount}"/>
                                </div>
                            </div>
                        </header>
                        <c:if test="${not empty selectedFiles}">
                            <section class="mx-6 md:mx-8 my-6 p-4 rounded-xl bg-surface-container-low">
                                <h4 class="font-body-sm font-semibold text-primary-container mb-3">첨부파일</h4>
                                <div class="flex flex-col gap-2">
                                    <c:forEach var="file" items="${selectedFiles}">
                                        <a class="inline-flex items-center gap-2 text-secondary hover:underline" href="${pageContext.request.contextPath}/board/file?id=${file.fileId}">
                                            <span class="material-symbols-outlined text-[18px]">attach_file</span>
                                            <c:out value="${file.originalName}"/>
                                            <small class="text-on-surface-variant">(<fmt:formatNumber value="${file.fileSize div 1024}" maxFractionDigits="0"/> KB)</small>
                                        </a>
                                    </c:forEach>
                                </div>
                            </section>
                        </c:if>
                        <div class="px-6 md:px-8 py-6 space-y-5 text-on-surface font-body-md leading-relaxed community-content community-content--list">
                            <c:out value="${selectedBoard.content}"/>
                        </div>
                        <div class="p-5 md:p-8 bg-surface-container-low/30 border-t border-surface-container-highest flex flex-wrap items-center justify-between gap-3">
                            <a class="inline-flex items-center gap-1.5 px-4 py-2 rounded-lg bg-surface-container hover:bg-surface-container-high text-primary-container font-body-sm font-semibold" href="${pageContext.request.contextPath}/board/list?category=${category}#board-list">
                                <span class="material-symbols-outlined text-[18px]">format_list_bulleted</span>목록으로</a>
                            <c:if test="${sessionScope.role eq 'ADMIN' or sessionScope.memberId eq selectedBoard.memberId}">
                                <div class="flex items-center gap-2">
                                    <a class="inline-flex items-center gap-1.5 px-4 py-2 rounded-lg bg-surface-container hover:bg-surface-container-high text-primary-container font-body-sm font-semibold" href="${pageContext.request.contextPath}/board/edit?id=${selectedBoard.boardId}&amp;inlineDetail=true">
                                        <span class="material-symbols-outlined text-[18px]">edit_note</span>수정</a>
                                    <form method="post" action="${pageContext.request.contextPath}/board/delete" onsubmit="return confirm('게시글을 삭제할까요?')">
                                        <input type="hidden" name="csrfToken" value="<c:out value='${csrfToken}'/>">
                                        <input type="hidden" name="boardId" value="${selectedBoard.boardId}">
                                        <button class="inline-flex items-center gap-1.5 px-4 py-2 rounded-lg bg-error-container/60 hover:bg-error-container text-on-error-container font-body-sm font-semibold" type="submit">
                                            <span class="material-symbols-outlined text-[18px]">delete</span>삭제</button>
                                    </form>
                                </div>
                            </c:if>
                        </div>
                        <section id="comments" class="p-6 md:p-8 border-t border-surface-container-highest">
                            <div class="flex items-center justify-between mb-6">
                                <h4 class="font-headline-sm text-primary-container font-semibold">
                                    <span class="material-symbols-outlined text-secondary text-[20px] align-middle">comment</span> 댓글 <span class="text-secondary font-metric-val">
                                        <c:out value="${selectedComments.size()}"/>
                                    </span>개</h4>
                                <span class="text-outline font-label-caps">NEXORA COMMUNITY</span>
                            </div>
                            <div class="space-y-4" id="commentThread">
                                <c:forEach var="comment" items="${selectedComments}">
                                    <article class="p-4 rounded-xl bg-surface-container-low/50 ${not empty comment.parentCommentId ? 'ml-6 border-l-2 border-secondary-fixed-dim' : ''}">
                                        <div class="flex flex-wrap items-center justify-between gap-2">
                                            <div class="flex flex-wrap items-center gap-2">
                                                <strong class="font-semibold text-primary-container font-body-sm">
                                                    <c:out value="${comment.authorName}"/>
                                                </strong>
                                                <span class="text-outline font-metric-val text-xs">
                                                    <fmt:formatDate value="${comment.createdAt}" pattern="yyyy-MM-dd HH:mm"/>
                                                </span>
                                            </div>
                                            <div class="flex items-center gap-3">
                                                <c:if test="${not empty sessionScope.loginId}">
                                                    <button class="text-xs text-secondary hover:underline" type="button" data-comment-id="${comment.commentId}" data-author="<c:out value='${comment.authorName}'/>" data-board-reply>답글</button>
                                                </c:if>
                                                <c:if test="${sessionScope.role eq 'ADMIN' or sessionScope.memberId eq comment.memberId}">
                                                    <form method="post" action="${pageContext.request.contextPath}/board/comment/delete">
                                                        <input type="hidden" name="csrfToken" value="<c:out value='${csrfToken}'/>">
                                                        <input type="hidden" name="boardId" value="${selectedBoard.boardId}">
                                                        <input type="hidden" name="commentId" value="${comment.commentId}">
                                                        <input type="hidden" name="inlineDetail" value="true">
                                                        <button class="text-xs text-outline hover:text-error" type="submit">삭제</button>
                                                    </form>
                                                </c:if>
                                            </div>
                                        </div>
                                        <p class="mt-2 whitespace-pre-wrap break-words text-on-surface font-body-md">
                                            <c:out value="${comment.content}"/>
                                        </p>
                                    </article>
                                </c:forEach>
                                <c:if test="${empty selectedComments}">
                                    <p class="text-center text-on-surface-variant py-4">첫 댓글을 남겨보세요.</p>
                                </c:if>
                            </div>
                            <c:choose>
                                <c:when test="${not empty sessionScope.loginId}">
                                    <form class="mt-6" method="post" action="${pageContext.request.contextPath}/board/comment">
                                        <input type="hidden" name="csrfToken" value="<c:out value='${csrfToken}'/>">
                                        <input type="hidden" name="boardId" value="${selectedBoard.boardId}">
                                        <input type="hidden" name="inlineDetail" value="true">
                                        <input type="hidden" id="parentCommentId" name="parentCommentId">
                                        <div id="replyNotice" class="mb-2 text-sm text-secondary" hidden>
                                        </div>
                                        <label class="sr-only" for="commentContent">댓글 작성</label>
                                        <textarea class="w-full rounded-xl bg-surface-container-low p-4 text-primary-container placeholder:text-outline focus:outline-none focus:bg-white resize-y" id="commentContent" name="content" maxlength="2000" rows="3" required placeholder="댓글을 입력하세요.">
                                        </textarea>
                                        <div class="flex justify-end mt-3">
                                            <button class="inline-flex items-center gap-1.5 px-4 py-2 rounded-lg bg-primary-container hover:bg-secondary text-on-primary font-body-sm font-semibold" type="submit">
                                                <span class="material-symbols-outlined text-[18px]">send</span>댓글 등록</button>
                                        </div>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <p class="mt-5 text-on-surface-variant">
                                        <a class="text-secondary font-semibold hover:underline" href="${pageContext.request.contextPath}/member/login.do">로그인</a> 후 댓글을 작성할 수 있습니다.</p>
                                </c:otherwise>
                            </c:choose>
                        </section>
                    </article>
                </section>
            </c:if>
        </main>
        <script src="${pageContext.request.contextPath}/assets/js/board-replies.js"></script>
<jsp:include page="/inc/bottom.jsp" /></body>
</html>
