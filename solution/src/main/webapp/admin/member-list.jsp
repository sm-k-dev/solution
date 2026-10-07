<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="adminPageTitle" scope="request" value="회원 관리"/>
<jsp:include page="/inc/admin-top.jsp"/>
<div class="admin-inquiry-page">
    <div class="admin-page-heading">
        <div>
            <div class="admin-eyebrow">MEMBER GOVERNANCE</div>
            <h1>회원 관리</h1>
            <p>회원 정보를 조회하고 이용 상태와 운영 권한을 안전하게 관리합니다.</p>
        </div>
        <a class="admin-action-link" href="${pageContext.request.contextPath}/admin/dashboard">
            <span class="material-symbols-outlined">arrow_back</span> 대시보드</a>
    </div>
    <div id="memberActionNotice" class="admin-notice-success" data-member-action-notice hidden>
    </div>
    <div class="admin-member-stats admin-member-stats-four">
        <div>
            <span class="material-symbols-outlined" aria-hidden="true">how_to_reg</span>
            <span>활동 계정</span>
            <strong>
                <c:out value="${activeMemberCount}"/>
            </strong>
        </div>
        <div>
            <span class="material-symbols-outlined" aria-hidden="true">person_off</span>
            <span>이용 정지</span>
            <strong>
                <c:out value="${suspendedMemberCount}"/>
            </strong>
        </div>
        <div>
            <span class="material-symbols-outlined" aria-hidden="true">admin_panel_settings</span>
            <span>관리자</span>
            <strong>
                <c:out value="${adminCount}"/>
            </strong>
        </div>
        <div>
            <span class="material-symbols-outlined" aria-hidden="true">manage_search</span>
            <span>검색 결과</span>
            <strong>
                <c:out value="${totalCount}"/>
            </strong>
        </div>
    </div>
    <section class="admin-table-card">
        <form class="admin-board-search" method="get" action="${pageContext.request.contextPath}/admin/members">
            <input type="search" name="q" value="<c:out value='${q}'/>" placeholder="아이디, 이름, 이메일 검색">
            <select name="status">
                <option value="ALL" ${statusFilter eq 'ALL'?'selected':''}>전체 상태</option>
                <option value="ACTIVE" ${statusFilter eq 'ACTIVE'?'selected':''}>활동</option>
                <option value="SUSPENDED" ${statusFilter eq 'SUSPENDED'?'selected':''}>정지</option>
                <option value="WITHDRAWN" ${statusFilter eq 'WITHDRAWN'?'selected':''}>탈퇴</option>
            </select>
            <button class="admin-primary-button" type="submit">검색</button>
        </form>
        <div class="admin-table-scroll">
            <table class="admin-inquiry-table">
                <thead>
                    <tr>
                        <th>회원</th>
                        <th>이메일</th>
                        <th>연락처</th>
                        <th>가입일</th>
                        <th>권한</th>
                        <th>상태</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="m" items="${memberList}">
                        <tr>
                            <td>
                                <a class="admin-member-name" href="${pageContext.request.contextPath}/admin/members/detail?id=${m.memberId}">
                                    <strong>
                                        <c:out value="${m.name}"/>
                                    </strong>
                                    <span class="admin-subtext">@<c:out value="${m.loginId}"/>
                                    </span>
                                </a>
                            </td>
                            <td>
                                <c:out value="${m.email}"/>
                            </td>
                            <td>
                                <c:out value="${m.phone}"/>
                            </td>
                            <td>
                                <fmt:formatDate value="${m.createdAt}" pattern="yyyy-MM-dd"/>
                            </td>
                            <td>
                                <span class="admin-role-badge role-${m.role eq 'ADMIN' ? 'admin' : 'user'}">
                                    <c:out value="${m.role}"/>
                                </span>
                            </td>
                            <td>
                                <span class="admin-status ${m.status eq 'ACTIVE'?'status-active':(m.status eq 'SUSPENDED'?'status-suspended':'status-withdrawn')}">
                                    <c:choose>
                                        <c:when test="${m.status eq 'ACTIVE'}">활동</c:when>
                                        <c:when test="${m.status eq 'SUSPENDED'}">정지</c:when>
                                        <c:otherwise>탈퇴</c:otherwise>
                                    </c:choose>
                                </span>
                            </td>
                            <td>
                                <div class="admin-member-actions">
                                    <a class="admin-row-action admin-member-action-detail" href="${pageContext.request.contextPath}/admin/members/detail?id=${m.memberId}">
                                        <span class="material-symbols-outlined" aria-hidden="true">visibility</span>상세 보기
                                    </a>
                                    <c:if test="${m.role eq 'USER' and m.status ne 'WITHDRAWN'}">
                                        <button class="admin-row-action ${m.status eq 'ACTIVE'?'admin-member-action-suspend':'admin-member-action-restore'}" type="button"
                                        data-member-action="${pageContext.request.contextPath}/admin/members/status"
                                        data-member-id="${m.memberId}" data-csrf="<c:out value='${csrfToken}'/>"
                                        data-field="status" data-value="${m.status eq 'ACTIVE'?'SUSPENDED':'ACTIVE'}"
                                        data-confirm="${m.status eq 'ACTIVE'?'이 회원의 서비스 이용을 정지할까요?':'이 회원의 이용 정지를 해제할까요?'}">
                                        <span class="material-symbols-outlined" aria-hidden="true">${m.status eq 'ACTIVE'?'block':'check_circle'}</span>
                                        <c:out value="${m.status eq 'ACTIVE'?'이용 정지':'정지 해제'}"/>
                                    </button>
                                </c:if>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty memberList}">
                    <tr>
                        <td colspan="7" class="admin-empty-row">검색된 회원이 없습니다.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</section>
<nav class="admin-pagination">
    <c:if test="${currentPage gt 1}">
        <a href="?q=<c:out value='${q}'/>&amp;status=<c:out value='${statusFilter}'/>&amp;page=${currentPage-1}">이전</a>
    </c:if>
    <span>
        <c:out value="${currentPage}"/> / <c:out value="${pageCount}"/>
    </span>
    <c:if test="${currentPage lt pageCount}">
        <a href="?q=<c:out value='${q}'/>&amp;status=<c:out value='${statusFilter}'/>&amp;page=${currentPage+1}">다음</a>
    </c:if>
</nav>
</div>
<jsp:include page="/inc/admin-bottom.jsp"/>
