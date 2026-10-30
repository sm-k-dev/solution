<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="adminPageTitle" scope="request" value="게시판 관리"/>
<jsp:include page="/inc/admin-top.jsp"/>
<div class="admin-inquiry-page">
    <div class="admin-page-heading">
        <div>
            <div class="admin-eyebrow">CONTENT MODERATION</div>
            <h1>게시판 관리</h1>
            <p>공지사항, 자료실, 자유게시판 게시글을 확인하고 숨김 처리합니다.</p>
        </div>
        <a class="admin-action-link" href="${pageContext.request.contextPath}/admin/dashboard">
            <span class="material-symbols-outlined">arrow_back</span> 대시보드</a>
    </div>
    <c:if test="${param.deleted eq '1'}">
        <div class="admin-notice-success">
            <span class="material-symbols-outlined">check_circle</span> 게시글을 숨김 처리했습니다.</div>
    </c:if>
    <div class="admin-board-tabs">
        <a class="${category eq 'NOTICE'?'selected':''}" href="?category=NOTICE">공지사항</a>
        <a class="${category eq 'RESOURCE'?'selected':''}" href="?category=RESOURCE">자료실</a>
        <a class="${category eq 'FREE'?'selected':''}" href="?category=FREE">자유게시판</a>
    </div>
    <section class="admin-table-card">
        <form class="admin-board-search" method="get" action="${pageContext.request.contextPath}/admin/boards">
            <input type="hidden" name="category" value="<c:out value='${category}'/>">
            <input type="search" name="q" value="<c:out value='${q}'/>" placeholder="제목, 내용, 작성자, 태그 검색">
            <button class="admin-primary-button" type="submit">검색</button>
            <span class="admin-result-count">총 <c:out value="${totalCount}"/>건</span>
        </form>
        <div class="admin-table-scroll">
            <table class="admin-inquiry-table">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>등록일</th>
                        <th>조회수</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${boardList}">
                        <tr>
                            <td>#<c:out value="${item.boardId}"/>
                            </td>
                            <td class="admin-title-cell">
                                <a href="${pageContext.request.contextPath}/admin/boards/detail?id=${item.boardId}">
                                    <c:out value="${item.title}"/>
                                </a>
                                <c:if test="${not empty item.tags}">
                                    <span class="admin-subtext">
                                        <c:out value="${item.tags}"/>
                                    </span>
                                </c:if>
                            </td>
                            <td>
                                <c:out value="${item.authorName}"/>
                            </td>
                            <td>
                                <fmt:formatDate value="${item.createdAt}" pattern="yyyy-MM-dd HH:mm"/>
                            </td>
                            <td>
                                <c:out value="${item.viewCount}"/>
                            </td>
                            <td>
                                <form method="post" action="${pageContext.request.contextPath}/admin/boards/delete" class="admin-inline-form" onsubmit="return confirm('이 게시글을 숨길까요?')">
                                    <input type="hidden" name="csrfToken" value="<c:out value='${csrfToken}'/>">
                                    <input type="hidden" name="boardId" value="${item.boardId}">
                                    <input type="hidden" name="category" value="<c:out value='${category}'/>">
                                    <button class="admin-row-action admin-danger-action" type="submit">숨김</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty boardList}">
                        <tr>
                            <td colspan="6" class="admin-empty-row">게시글이 없습니다.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </section>
    <nav class="admin-pagination">
        <c:if test="${currentPage gt 1}">
            <a href="?category=<c:out value='${category}'/>&amp;q=<c:out value='${q}'/>&amp;page=${currentPage-1}">이전</a>
        </c:if>
        <span>
            <c:out value="${currentPage}"/> / <c:out value="${pageCount}"/>
        </span>
        <c:if test="${currentPage lt pageCount}">
            <a href="?category=<c:out value='${category}'/>&amp;q=<c:out value='${q}'/>&amp;page=${currentPage+1}">다음</a>
        </c:if>
    </nav>
</div>
<jsp:include page="/inc/admin-bottom.jsp"/>
