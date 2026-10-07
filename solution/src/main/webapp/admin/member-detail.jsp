<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="adminPageTitle" scope="request" value="회원 상세 관리"/>
<jsp:include page="/inc/admin-top.jsp"/>
<div class="admin-inquiry-page">
    <div class="admin-page-heading">
        <div>
            <div class="admin-eyebrow">MEMBER #<c:out value="${managedMember.memberId}"/>
            </div>
            <h1>
                <c:out value="${managedMember.name}"/> 회원 관리</h1>
            <p>회원의 가입 정보와 서비스 활동을 확인하고 계정 상태 및 권한을 관리합니다.</p>
        </div>
        <a class="admin-action-link" href="${pageContext.request.contextPath}/admin/members">
            <span class="material-symbols-outlined">arrow_back</span> 회원 목록</a>
    </div>
    <div id="memberDetailNotice" class="admin-notice-success" data-member-action-notice ${param.updated eq '1'?'':'hidden'}>회원 정보가 변경되었습니다.</div>
    <div class="admin-member-detail-grid">
        <section class="admin-detail-card">
            <div class="admin-detail-header">
                <div>
                    <div class="admin-eyebrow">ACCOUNT PROFILE</div>
                    <h2>계정 기본 정보</h2>
                </div>
                <div class="admin-member-badges">
                    <span class="admin-role-badge role-${managedMember.role}">
                        <c:out value="${managedMember.role}"/>
                    </span>
                    <span class="admin-status ${managedMember.status eq 'ACTIVE'?'status-COMPLETED':(managedMember.status eq 'SUSPENDED'?'status-RECEIVED':'status-IN_PROGRESS')}">
                        <c:out value="${managedMember.status}"/>
                    </span>
                </div>
            </div>
            <dl class="admin-member-profile">
                <div>
                    <dt>로그인 아이디</dt>
                    <dd>@<c:out value="${managedMember.loginId}"/>
                    </dd>
                </div>
                <div>
                    <dt>담당자명</dt>
                    <dd>
                        <c:out value="${managedMember.name}"/>
                    </dd>
                </div>
                <div>
                    <dt>기업 이메일</dt>
                    <dd>
                        <a href="mailto:<c:out value='${managedMember.email}'/>">
                            <c:out value="${managedMember.email}"/>
                        </a>
                    </dd>
                </div>
                <div>
                    <dt>연락처</dt>
                    <dd>
                        <c:out value="${managedMember.phone}"/>
                    </dd>
                </div>
                <div class="profile-wide">
                    <dt>주소</dt>
                    <dd>
                        <c:out value="${managedMember.postcode}"/>
                        <c:out value="${managedMember.address}"/>
                        <c:out value="${managedMember.addressDetail}"/>
                    </dd>
                </div>
                <div>
                    <dt>가입일</dt>
                    <dd>
                        <fmt:formatDate value="${managedMember.createdAt}" pattern="yyyy-MM-dd HH:mm"/>
                    </dd>
                </div>
                <div>
                    <dt>최근 정보 변경</dt>
                    <dd>
                        <fmt:formatDate value="${managedMember.updatedAt}" pattern="yyyy-MM-dd HH:mm"/>
                    </dd>
                </div>
                <c:if test="${not empty managedMember.withdrawnAt}">
                    <div>
                        <dt>탈퇴일</dt>
                        <dd>
                            <fmt:formatDate value="${managedMember.withdrawnAt}" pattern="yyyy-MM-dd HH:mm"/>
                        </dd>
                    </div>
                </c:if>
            </dl>
        </section>
        <aside class="admin-detail-card admin-member-control-card">
            <div class="admin-detail-header">
                <div>
                    <div class="admin-eyebrow">GOVERNANCE</div>
                    <h2>계정 관리</h2>
                </div>
            </div>
            <c:choose>
                <c:when test="${sessionScope.memberId eq managedMember.memberId}">
                    <div class="admin-control-note">
                        <span class="material-symbols-outlined">shield</span>
                        <p>
                            <strong>현재 로그인한 관리자 계정입니다.</strong>
                            <br>세션 보호를 위해 자신의 상태나 권한은 이 화면에서 변경할 수 없습니다.</p>
                    </div>
                </c:when>
                <c:when test="${managedMember.status eq 'WITHDRAWN'}">
                    <div class="admin-control-note">
                        <span class="material-symbols-outlined">person_off</span>
                        <p>
                            <strong>탈퇴 처리된 계정입니다.</strong>
                            <br>감사 기록 보존을 위해 관리자 화면에서는 재활성화하지 않습니다.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="admin-control-group">
                        <span>서비스 이용 상태</span>
                        <p>일반 회원을 정지하면 다음 로그인부터 서비스 이용이 제한됩니다.</p>
                        <c:choose>
                            <c:when test="${managedMember.role eq 'USER'}">
                                <button class="admin-control-button ${managedMember.status eq 'ACTIVE'?'danger':'primary'}" type="button"
                                data-member-action="${pageContext.request.contextPath}/admin/members/status"
                                data-member-id="${managedMember.memberId}" data-csrf="<c:out value='${csrfToken}'/>"
                                data-field="status" data-value="${managedMember.status eq 'ACTIVE'?'SUSPENDED':'ACTIVE'}"
                                data-confirm="${managedMember.status eq 'ACTIVE'?'이 회원의 서비스 이용을 정지할까요?':'이 회원의 이용 정지를 해제할까요?'}">
                                <span class="material-symbols-outlined">${managedMember.status eq 'ACTIVE'?'block':'restart_alt'}</span>
                                <c:out value="${managedMember.status eq 'ACTIVE'?'서비스 이용 정지':'이용 정지 해제'}"/>
                            </button>
                        </c:when>
                        <c:otherwise>
                            <div class="admin-control-note compact">관리자 계정은 먼저 일반 회원으로 권한을 변경해야 이용 상태를 조정할 수 있습니다.</div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="admin-control-group">
                    <span>운영 권한</span>
                    <p>관리자 권한은 회원·게시판·문의·관제 기능에 접근할 수 있습니다.</p>
                    <c:choose>
                        <c:when test="${managedMember.role eq 'USER' and managedMember.status eq 'ACTIVE'}">
                            <button class="admin-control-button primary" type="button"
                            data-member-action="${pageContext.request.contextPath}/admin/members/role"
                            data-member-id="${managedMember.memberId}" data-csrf="<c:out value='${csrfToken}'/>"
                            data-field="role" data-value="ADMIN" data-confirm="이 회원에게 관리자 권한을 부여할까요?">
                            <span class="material-symbols-outlined">admin_panel_settings</span>관리자 권한 부여
                        </button>
                    </c:when>
                    <c:when test="${managedMember.role eq 'ADMIN' and activeAdminCount gt 1}">
                        <button class="admin-control-button danger" type="button"
                        data-member-action="${pageContext.request.contextPath}/admin/members/role"
                        data-member-id="${managedMember.memberId}" data-csrf="<c:out value='${csrfToken}'/>"
                        data-field="role" data-value="USER" data-confirm="이 관리자의 운영 권한을 회수할까요?">
                        <span class="material-symbols-outlined">shield_person</span>일반 회원으로 변경
                    </button>
                </c:when>
                <c:otherwise>
                    <div class="admin-control-note compact">최소 한 명의 활성 관리자는 유지되어야 합니다.</div>
                </c:otherwise>
            </c:choose>
        </div>
    </c:otherwise>
</c:choose>
</aside>
</div>
<section class="admin-detail-card">
    <div class="admin-detail-header">
        <div>
            <div class="admin-eyebrow">SERVICE ACTIVITY</div>
            <h2>서비스 활동 요약</h2>
        </div>
    </div>
    <div class="admin-member-activity">
        <div>
            <span class="material-symbols-outlined">article</span>
            <div>
                <strong>
                    <c:out value="${managedMember.boardCount}"/>
                </strong>
                <small>작성 게시글</small>
            </div>
        </div>
        <div>
            <span class="material-symbols-outlined">comment</span>
            <div>
                <strong>
                    <c:out value="${managedMember.commentCount}"/>
                </strong>
                <small>작성 댓글</small>
            </div>
        </div>
        <div>
            <span class="material-symbols-outlined">support_agent</span>
            <div>
                <strong>
                    <c:out value="${managedMember.inquiryCount}"/>
                </strong>
                <small>접수 문의</small>
            </div>
        </div>
    </div>
</section>
</div>
<jsp:include page="/inc/admin-bottom.jsp"/>
