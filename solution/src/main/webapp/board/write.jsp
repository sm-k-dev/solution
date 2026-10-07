<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>
            <c:out value="${editMode ? '게시글 수정' : '글쓰기'}"/> | NEXORA Community</title>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&amp;family=JetBrains+Mono:wght@400;600&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/index.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/board_write.css">
        <style>.board-error{margin-bottom:1.25rem;border:1px solid #fecaca;border-radius:.5rem;background:#fef2f2;padding:.75rem 1rem;color:#b91c1c;font-size:.875rem}</style>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/top.css?v=20261002-4"/>
    </head>
    <body class="bg-page text-navy font-sans min-h-screen">
        <jsp:include page="/inc/top.jsp" />
        <main class="w-full max-w-[1200px] mx-auto px-4 md:px-8 py-10">
            <nav class="flex items-center gap-2 text-sm text-muted mb-7">
                <a class="hover:text-blue flex items-center gap-1" href="${pageContext.request.contextPath}/index.jsp">
                    <span class="material-symbols-outlined text-[17px]">home</span>홈</a>
                <span class="material-symbols-outlined text-[15px]">chevron_right</span>
                <a class="hover:text-blue" href="${pageContext.request.contextPath}/board/list?category=${writeCategory}">커뮤니티</a>
                <span class="material-symbols-outlined text-[15px]">chevron_right</span>
                <strong>
                    <c:out value="${editMode ? '게시글 수정' : '글쓰기'}"/>
                </strong>
            </nav>
            <section class="mb-7 border-b border-line pb-6">
                <div class="flex items-center gap-2 mb-2">
                    <span class="px-2 py-1 rounded bg-blue/10 text-blue text-[11px] font-bold tracking-wider">ENTERPRISE FORUM</span>
                    <span class="font-mono text-[11px] text-muted">
                        <c:out value="${editMode ? 'EDIT POST' : 'NEW POST'}"/>
                    </span>
                </div>
                <h1 class="text-3xl md:text-4xl font-bold tracking-tight">
                    <c:out value="${editMode ? '게시글 수정' : '게시글 작성'}"/>
                </h1>
                <p class="mt-2 text-muted">NEXORA 커뮤니티에 새로운 글을 작성합니다.</p>
            </section>
            <c:if test="${not empty errorMessage}">
                <div class="board-error">
                    <c:out value="${errorMessage}"/>
                </div>
            </c:if>
            <form id="boardWriteForm" class="bg-white border border-line rounded-xl shadow-sm overflow-hidden" action="${pageContext.request.contextPath}/board/${editMode ? 'update' : 'create'}" method="post" enctype="multipart/form-data">
                <input type="hidden" name="csrfToken" value="<c:out value='${csrfToken}'/>"/>
                <input type="hidden" name="inlineDetail" value="<c:out value='${inlineDetail}'/>"/>
                <c:if test="${editMode}">
                    <input type="hidden" name="boardId" value="${board.boardId}"/>
                </c:if>
                <div class="p-5 md:p-7 space-y-6">
                    <div class="grid md:grid-cols-[220px_1fr] gap-5">
                        <div>
                            <label class="block text-sm font-semibold mb-2" for="category">게시판 분류 <span class="text-red-600">*</span>
                            </label>
                            <select id="category" name="category" required class="w-full rounded-lg border border-line bg-white px-3 py-3 outline-none focus:ring-2 focus:ring-blue/20 focus:border-blue">
                                <c:if test="${sessionScope.role eq 'ADMIN'}">
                                    <option value="NOTICE" ${writeCategory eq 'NOTICE' ? 'selected' : ''}>공지사항</option>
                                </c:if>
                                <option value="RESOURCE" ${writeCategory eq 'RESOURCE' ? 'selected' : ''}>자료실</option>
                                <option value="FREE" ${writeCategory eq 'FREE' ? 'selected' : ''}>자유게시판</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-sm font-semibold mb-2" for="title">제목 <span class="text-red-600">*</span>
                            </label>
                            <input id="title" name="title" required maxlength="200" value="<c:out value='${board.title}'/>" class="w-full rounded-lg border border-line px-4 py-3 outline-none focus:ring-2 focus:ring-blue/20 focus:border-blue" placeholder="게시글 제목을 입력하세요"/>
                        </div>
                    </div>
                    <div>
                        <label class="block text-sm font-semibold mb-2" for="tags">태그 <span class="text-xs text-muted">쉼표로 구분</span>
                        </label>
                        <input id="tags" name="tags" maxlength="500" value="<c:out value='${board.tags}'/>" class="w-full rounded-lg border border-line px-4 py-3 outline-none focus:ring-2 focus:ring-blue/20 focus:border-blue" placeholder="Java, MVC, 질문"/>
                    </div>
                    <div>
                        <div class="flex items-center justify-between mb-2">
                            <label class="text-sm font-semibold" for="content">내용 <span class="text-red-600">*</span>
                            </label>
                            <span class="text-xs text-muted">최대 5,000자</span>
                        </div>
                        <textarea id="content" name="content" required maxlength="5000" rows="14" class="w-full resize-y rounded-lg border border-line px-4 py-4 leading-7 outline-none focus:ring-2 focus:ring-blue/20 focus:border-blue" placeholder="내용을 입력하세요.">
                            <c:out value="${board.content}"/>
                        </textarea>
                    </div>
                    <div>
                        <label class="block text-sm font-semibold mb-2" for="files">첨부파일</label>
                        <label class="flex flex-col md:flex-row md:items-center justify-between gap-3 border border-dashed border-line rounded-xl px-5 py-5 hover:border-blue transition cursor-pointer">
                            <span class="flex items-center gap-3">
                                <span class="material-symbols-outlined text-blue">attach_file</span>
                                <span>
                                    <strong class="block text-sm">파일 선택</strong>
                                    <span class="text-xs text-muted">파일당 최대 10MB, 최대 5개까지 첨부할 수 있습니다.</span>
                                </span>
                            </span>
                            <span id="fileName" class="text-xs font-mono text-muted">선택된 파일 없음</span>
                            <input class="hidden" type="file" id="files" name="files" multiple accept=".pdf,.png,.jpg,.jpeg,.gif,.txt,.csv,.doc,.docx,.xls,.xlsx,.ppt,.pptx,.zip" onchange="document.getElementById('fileName').textContent=this.files.length ? Array.from(this.files).map(file => file.name).join(', ') : '선택된 파일 없음'"/>
                        </label>
                    </div>
                </div>
                <div class="flex flex-col-reverse sm:flex-row sm:justify-between gap-3 px-5 md:px-7 py-5 bg-slate-50 border-t border-line">
                    <a href="${pageContext.request.contextPath}/board/list?category=${writeCategory}" class="inline-flex justify-center items-center gap-2 px-5 py-3 rounded-lg border border-line bg-white font-semibold hover:bg-slate-100">
                        <span class="material-symbols-outlined text-[18px]">arrow_back</span>목록으로</a>
                    <div class="flex gap-3">
                        <button type="reset" class="flex-1 sm:flex-none px-5 py-3 rounded-lg border border-line bg-white font-semibold hover:bg-slate-100">초기화</button>
                        <button type="submit" class="flex-1 sm:flex-none inline-flex justify-center items-center gap-2 px-6 py-3 rounded-lg bg-navy text-white font-semibold hover:bg-blue">
                            <span class="material-symbols-outlined text-[18px]">edit_square</span>
                            <c:out value="${editMode ? '수정하기' : '등록하기'}"/>
                        </button>
                    </div>
                </div>
            </form>
        </main>
        <jsp:include page="/inc/bottom.jsp" />
    </body>
</html>
