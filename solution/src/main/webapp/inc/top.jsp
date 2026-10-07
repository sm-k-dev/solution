<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="nexoraRequestUri" value="${pageContext.request.requestURI}" />
<c:set var="nexoraCompanyActive" value="${fn:contains(nexoraRequestUri, '/company/')}" />
<c:set var="nexoraSolutionsActive" value="${fn:contains(nexoraRequestUri, '/solutions/')}" />
<c:set var="nexoraSupportActive" value="${fn:contains(nexoraRequestUri, '/inquiry/') and not fn:contains(nexoraRequestUri, '/inquiry/my')}" />
<c:set var="nexoraCommunityActive" value="${fn:contains(nexoraRequestUri, '/board/')}" />
<c:set var="nexoraMyPageActive" value="${fn:contains(nexoraRequestUri, '/member/member.do') or fn:contains(nexoraRequestUri, '/inquiry/my')}" />
<c:set var="nexoraAdminActive" value="${fn:contains(nexoraRequestUri, '/admin/')}" />
<header id="nexora-global-header"
class="sticky top-0 z-50 w-full bg-white border-b border-slate-200/80 shadow-[0_2px_12px_rgba(15,23,42,0.04)] backdrop-blur-md bg-white/95 transition-colors">
<div
class="nexora-header-inner max-w-[1200px] mx-auto px-4 sm:px-6 lg:px-8 h-[72px] flex items-center justify-between gap-2 whitespace-nowrap">
<!-- Left: Brand Logo -->
<div class="nexora-brand-group flex items-center gap-4 shrink-0">
    <a aria-label="NEXORA 홈으로 이동"
    class="nexora-brand-link flex items-center gap-2.5 group py-2 focus:outline-none"
    href="${pageContext.request.contextPath}/index.jsp">
<!-- Logo Symbol: Geometric Shield & Network Node -->
    <div
    class="nexora-brand-mark w-9 h-9 rounded-lg bg-[#0a192f] flex items-center justify-center text-white shadow-sm group-hover:bg-[#1c4fd7] transition-colors">
    <svg class="w-5 h-5 text-sky-400" fill="none" stroke="currentColor"
    stroke-linecap="round" stroke-linejoin="round" stroke-width="2.2"
    viewbox="0 0 24 24">
    <path
    d="M12 2L3 7v6c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V7l-9-5z">
</path>
<path d="M9 12l2 2 4-4">
</path>
</svg>
</div>
<!-- Wordmark -->
<div class="nexora-brand-copy flex flex-col">
    <span
    class="nexora-brand-title font-bold tracking-tight text-[21px] text-[#0a192f] leading-none flex items-center gap-1">
    NEXORA <span class="nexora-brand-dot w-1.5 h-1.5 rounded-full bg-[#1c4fd7]">
    </span>
</span>
<span
class="nexora-brand-tagline text-[10px] font-semibold text-slate-400 tracking-wider uppercase mt-0.5">Enterprise
Solutions</span>
</div>
</a>
<!-- Desktop Navigation Bar -->
<nav aria-label="메인 내비게이션"
class="nexora-desktop-nav hidden lg:flex items-center gap-0.5 pl-1 shrink-0 whitespace-nowrap">
<!-- Item 1: 회사소개 -->
<a class="nexora-nav-link ${nexoraCompanyActive ? 'nexora-nav-link--active' : ''}"
aria-current="${nexoraCompanyActive ? 'page' : 'false'}"
href="${pageContext.request.contextPath}/company/company.jsp">
회사소개 </a>
<!-- Item 2: 솔루션 (Dropdown Mega-Menu) -->
<div class="relative group">
    <a aria-haspopup="true"
    class="nexora-nav-link ${nexoraSolutionsActive ? 'nexora-nav-link--active' : ''} px-2.5 py-2 text-[14px] font-medium rounded-md flex items-center gap-1 transition-colors focus:outline-none shrink-0 whitespace-nowrap"
    aria-current="${nexoraSolutionsActive ? 'page' : 'false'}"
    href="${pageContext.request.contextPath}/solutions/solutions.jsp">
    <span>솔루션</span>
    <span
    class="material-symbols-outlined text-[18px] transition-transform duration-200 group-hover:rotate-180">expand_more</span>
</a>
<!-- Mega Dropdown Panel -->
<div
class="dropdown-enter absolute left-0 top-full w-[680px] bg-white rounded-xl border border-slate-200/90 shadow-xl p-5 z-50">
<!-- Mega Menu Header Note -->
<div
class="flex items-center justify-between pb-3.5 mb-3.5 border-b border-slate-100">
<div class="flex items-center gap-2">
    <span class="w-2 h-2 rounded-full bg-[#1c4fd7]">
    </span>
    <span
    class="text-xs font-bold text-slate-500 uppercase tracking-wider">엔터프라이즈
    인프라 및 보안 솔루션</span>
</div>
<a
class="text-xs font-semibold text-[#1c4fd7] hover:underline flex items-center gap-0.5"
href="${pageContext.request.contextPath}/solutions/solutions.jsp">
솔루션 전체보기 <span class="material-symbols-outlined text-[14px]">chevron_right</span>
</a>
</div>
<!-- Security API Products -->
<div class="grid grid-cols-1 gap-3">
<!-- 2. Web + Network + AI Security -->
    <a
    class="flex items-start gap-3.5 p-3 rounded-lg hover:bg-slate-50 border border-transparent hover:border-slate-200/70 transition-all group/item"
    href="${pageContext.request.contextPath}/solutions/web-security.jsp">
    <div
    class="w-10 h-10 rounded-lg bg-indigo-50 flex items-center justify-center text-indigo-600 group-hover/item:bg-indigo-600 group-hover/item:text-white transition-colors shrink-0 mt-0.5">
    <span class="material-symbols-outlined text-[22px]">security</span>
</div>
<div>
    <div class="flex items-center gap-1.5">
        <span
        class="text-[14px] font-semibold text-[#0f172a] group-hover/item:text-indigo-600 transition-colors">Web + Network + AI Security</span>
    <span
    class="text-[10px] font-semibold uppercase px-1.5 py-0.2 rounded bg-red-50 text-red-600">SECURITY API</span>
</div>
<p class="text-xs text-slate-500 mt-1 leading-relaxed">네트워크·웹앱·AI 보안 정책을 API로 연동</p>
</div>
</a>
<!-- 4. SentinelOps -->
<a
class="flex items-start gap-3.5 p-3 rounded-lg bg-slate-900 text-white hover:bg-slate-800 transition-all group/item shadow-sm"
href="${pageContext.request.contextPath}/solutions/sentinelops.jsp">
<div
class="w-10 h-10 rounded-lg bg-sky-500/20 flex items-center justify-center text-sky-400 group-hover/item:bg-sky-500 group-hover/item:text-white transition-colors shrink-0 mt-0.5">
<span class="material-symbols-outlined text-[22px]">smart_toy</span>
</div>
<div>
    <div class="flex items-center gap-1.5">
        <span
        class="text-[14px] font-semibold text-white group-hover/item:text-sky-300 transition-colors">SentinelOps</span>
    <span
    class="text-[10px] font-bold uppercase px-1.5 py-0.5 rounded bg-sky-500/30 text-sky-300">AI
    CORE</span>
</div>
<p class="text-xs text-slate-300 mt-1 leading-relaxed">실시간
    이상 징후 머신러닝 탐지 및 자동 복구 지능형 모니터링 엔진</p>
</div>
</a>
</div>
<!-- Mega Menu Footer Status Bar -->
<div
class="mt-4 pt-3 border-t border-slate-100 flex items-center justify-between text-xs text-slate-500">
<div class="flex items-center gap-2">
    <span class="w-2 h-2 rounded-full bg-emerald-500">
    </span>
    <span>모든
        NEXORA 보안 API 서비스</span>
</div>
<span class="text-slate-400">무료·유료 구독 플랜 제공</span>
</div>
</div>
</div>
<!-- Item 3: 고객센터 -->
<a
class="nexora-nav-link ${nexoraSupportActive ? 'nexora-nav-link--active' : ''}"
aria-current="${nexoraSupportActive ? 'page' : 'false'}"
href="${pageContext.request.contextPath}/inquiry/index.jsp">
고객센터 </a>
<!-- Item 4: 커뮤니티 -->
<a
class="nexora-nav-link ${nexoraCommunityActive ? 'nexora-nav-link--active' : ''}"
aria-current="${nexoraCommunityActive ? 'page' : 'false'}"
href="${pageContext.request.contextPath}/board/list?category=FREE"> 커뮤니티
</a>
</nav>
</div>
<!-- Right: User Actions (Desktop Auth & RFP CTA) -->
<div class="nexora-desktop-actions hidden lg:flex items-center gap-0.5 shrink-0 whitespace-nowrap">
    <c:choose>
        <c:when test="${not empty sessionScope.loginId}">
            <span class="nexora-user-name">
                <c:out value="${sessionScope.name}"/>님</span>
            <a
            class="nexora-action-link nexora-mypage-link ${nexoraMyPageActive ? 'nexora-action-link--active' : ''}"
            aria-current="${nexoraMyPageActive ? 'page' : 'false'}"
            href="${pageContext.request.contextPath}/member/member.do">
            마이페이지 </a>
        <c:if test="${sessionScope.role eq 'ADMIN'}">
            <a class="nexora-action-link nexora-admin-link ${nexoraAdminActive ? 'nexora-action-link--active' : ''}" aria-current="${nexoraAdminActive ? 'page' : 'false'}" href="${pageContext.request.contextPath}/admin/dashboard">관리자</a>
        </c:if>
        <a
        class="nexora-action-link"
        href="${pageContext.request.contextPath}/member/logout.do">
        로그아웃 </a>
</c:when>
<c:otherwise>
    <a
    class="nexora-action-link"
    href="${pageContext.request.contextPath}/member/login.do"> 로그인
</a>
<span class="nexora-action-divider" aria-hidden="true">
</span>
<a
class="nexora-action-link nexora-mypage-link"
href="${pageContext.request.contextPath}/member/signup.do">
회원가입 </a>
</c:otherwise>
</c:choose>
<a
class="nexora-cta-link"
href="${pageContext.request.contextPath}/inquiry/write.jsp">
<span>도입문의</span>
<span class="material-symbols-outlined">arrow_forward</span>
</a>
</div>
<!-- Mobile Right: Hamburger Toggle Button -->
<div class="nexora-mobile-actions flex items-center gap-2 lg:hidden">
    <c:choose>
        <c:when test="${not empty sessionScope.loginId}">
            <a class="nexora-mobile-account-link" href="${pageContext.request.contextPath}/member/member.do">마이페이지</a>
        </c:when>
        <c:otherwise>
            <a class="nexora-mobile-account-link" href="${pageContext.request.contextPath}/member/login.do">로그인</a>
        </c:otherwise>
    </c:choose>
    <button aria-label="모바일 메뉴 열기"
    class="w-10 h-10 flex items-center justify-center rounded-lg text-slate-700 hover:bg-slate-100 focus:outline-none"
    id="mobile-menu-btn" onclick="toggleMobileDrawer()" type="button">
    <span class="material-symbols-outlined text-[26px]">menu</span>
</button>
</div>
</div>
<!-- ========================================================================= -->
<!-- Mobile Navigation Drawer & Backdrop                                       -->
<!-- ========================================================================= -->
<div
class="fixed inset-0 bg-slate-900/50 backdrop-blur-sm z-40 hidden opacity-0 transition-opacity lg:hidden"
id="mobile-backdrop" onclick="toggleMobileDrawer()">
</div>
<div
class="fixed top-0 right-0 bottom-0 w-[84%] max-w-[360px] bg-white z-50 shadow-2xl flex flex-col translate-x-full transition-transform lg:hidden"
id="mobile-drawer">
<!-- Drawer Header -->
<div
class="h-[72px] px-5 flex items-center justify-between border-b border-slate-100">
<div class="flex items-center gap-2">
    <div
    class="w-8 h-8 rounded bg-[#0a192f] flex items-center justify-center text-white">
    <svg class="w-4 h-4 text-sky-400" fill="none" stroke="currentColor"
    stroke-width="2.2" viewbox="0 0 24 24">
    <path
    d="M12 2L3 7v6c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V7l-9-5z">
</path>
</svg>
</div>
<span class="font-bold text-lg text-[#0a192f] tracking-tight">NEXORA</span>
</div>
<button aria-label="메뉴 닫기"
class="w-9 h-9 flex items-center justify-center rounded-lg text-slate-500 hover:bg-slate-100"
onclick="toggleMobileDrawer()" type="button">
<span class="material-symbols-outlined text-[24px]">close</span>
</button>
</div>
<!-- Drawer Scrollable Body -->
<div class="flex-1 overflow-y-auto p-5 flex flex-col gap-6">
<!-- Mobile Auth Banner -->
    <div class="p-4 rounded-xl bg-slate-50 border border-slate-200/80 flex flex-col gap-3">
        <c:choose>
            <c:when test="${not empty sessionScope.loginId}">
                <div class="flex items-center justify-between">
                    <span class="text-sm font-bold text-slate-800">
                        <c:out value="${sessionScope.name}"/>님</span>
                    <span class="text-[11px] text-[#1c4fd7] font-semibold">
                        <c:out value="${sessionScope.role}"/>
                    </span>
                </div>
                <div class="nexora-mobile-account-grid">
                    <a class="nexora-mobile-drawer-account-link" href="${pageContext.request.contextPath}/member/member.do">마이페이지</a>
                </div>
                <c:if test="${sessionScope.role eq 'ADMIN'}">
                    <a class="w-full py-2.5 rounded-lg bg-blue-50 text-center text-xs font-bold text-[#1c4fd7] hover:bg-blue-100 transition-colors" href="${pageContext.request.contextPath}/admin/dashboard">관리자 화면</a>
                </c:if>
                <a class="w-full py-2.5 rounded-lg bg-[#0a192f] text-center text-xs font-bold text-white hover:bg-[#1c4fd7] transition-colors" href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
            </c:when>
            <c:otherwise>
                <div class="flex items-center justify-between">
                    <span class="text-xs font-semibold text-slate-500">NEXORA 계정 서비스</span>
                    <span class="text-[11px] text-[#1c4fd7] font-semibold">기업 회원</span>
                </div>
                <div class="grid grid-cols-2 gap-2">
                    <a class="w-full py-2.5 rounded-lg bg-white border border-slate-200 text-center text-xs font-bold text-slate-800 hover:bg-slate-100 transition-colors" href="${pageContext.request.contextPath}/member/login.do">로그인</a>
                    <a class="w-full py-2.5 rounded-lg bg-[#0a192f] text-center text-xs font-bold text-white hover:bg-[#1c4fd7] transition-colors" href="${pageContext.request.contextPath}/member/signup.do">회원가입</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
<!-- Mobile Nav Links -->
    <nav aria-label="모바일 내비게이션" class="flex flex-col gap-1 text-[15px]">
        <a
        class="nexora-mobile-link ${nexoraCompanyActive ? 'nexora-mobile-link--active' : ''}"
        aria-current="${nexoraCompanyActive ? 'page' : 'false'}"
        href="${pageContext.request.contextPath}/company/company.jsp">
        <span>회사소개</span>
        <span
        class="material-symbols-outlined text-[18px]">chevron_right</span>
</a>
<!-- Mobile Solutions Accordion -->
<div class="flex flex-col">
    <button
    class="nexora-mobile-solutions-toggle ${nexoraSolutionsActive ? 'nexora-mobile-solutions-toggle--active' : ''}"
    onclick="toggleMobileSubmenu()" type="button">
    <span class="flex items-center gap-2">
        <span
        class="material-symbols-outlined text-[20px]">apps</span>
    <span>솔루션</span>
</span>
<span
class="material-symbols-outlined text-[20px] transition-transform"
id="mobile-sub-chevron">expand_more</span>
</button>
<!-- Submenu Items -->
<div class="pl-4 pr-1 py-2 flex flex-col gap-1"
id="mobile-sub-menu">
<a class="nexora-mobile-solution-link ${nexoraSolutionsActive ? 'nexora-mobile-solution-link--active' : ''}"
href="${pageContext.request.contextPath}/solutions/solutions.jsp">
<span class="material-symbols-outlined text-[18px]">apps</span>
<span>솔루션 전체보기</span>
</a>
<a
class="nexora-mobile-solution-link ${fn:contains(nexoraRequestUri, '/web-security') ? 'nexora-mobile-solution-link--active' : ''}"
href="${pageContext.request.contextPath}/solutions/web-security.jsp">
<span
class="material-symbols-outlined text-[18px] text-indigo-600">security</span>
<div>
    <div class="text-[11px] font-semibold text-slate-800">Web + Network + AI Security</div>
    <div class="text-[11px] text-slate-400">네트워크·웹앱·AI 보안 API</div>
</div>
</a>
<a
class="nexora-mobile-solution-link nexora-mobile-solution-link--sentinel ${fn:contains(nexoraRequestUri, '/sentinelops') ? 'nexora-mobile-solution-link--active' : ''}"
href="${pageContext.request.contextPath}/solutions/sentinelops.jsp">
<span class="material-symbols-outlined text-[18px] text-sky-400">smart_toy</span>
<div>
    <div
    class="text-xs font-semibold ${fn:contains(nexoraRequestUri, '/sentinelops') ? 'text-white' : 'text-slate-800'} flex items-center gap-1.5">
    <span>SentinelOps</span>
    <span
    class="text-[9px] px-1 py-0.2 bg-sky-500/30 text-sky-300 rounded font-mono">AI
    CORE</span>
</div>
<div class="text-[10px] ${fn:contains(nexoraRequestUri, '/sentinelops') ? 'text-slate-300' : 'text-slate-500'}">AI 기반 지능형 관제 모니터링</div>
</div>
</a>
</div>
</div>
<a
class="nexora-mobile-link ${nexoraSupportActive ? 'nexora-mobile-link--active' : ''}"
aria-current="${nexoraSupportActive ? 'page' : 'false'}"
href="${pageContext.request.contextPath}/inquiry/index.jsp">
<span>고객센터</span>
<span class="material-symbols-outlined text-[18px] text-slate-400">chevron_right</span>
</a>
<a
class="nexora-mobile-link ${nexoraCommunityActive ? 'nexora-mobile-link--active' : ''}"
aria-current="${nexoraCommunityActive ? 'page' : 'false'}"
href="${pageContext.request.contextPath}/board/list?category=FREE">
<span>커뮤니티</span>
<span class="material-symbols-outlined text-[18px] text-slate-400">chevron_right</span>
</a>
</nav>
<!-- Mobile Tech Support Hotline -->
<div
class="mt-auto pt-4 border-t border-slate-100 flex flex-col gap-2">
<span
class="text-[11px] font-bold uppercase tracking-wider text-slate-400">기술
지원 센터</span>
<div
class="flex items-center gap-2 text-slate-800 font-bold text-sm">
<span class="material-symbols-outlined text-[18px] text-[#1c4fd7]">support_agent</span>
<span>1544-6820</span>
<span
class="text-[11px] font-normal text-slate-500">(평일 09:00–18:00)</span>
</div>
<a
class="w-full mt-2 py-3 rounded-xl bg-[#1c4fd7] text-white text-center text-xs font-bold shadow-sm hover:bg-[#0a192f] transition-colors"
href="${pageContext.request.contextPath}/inquiry/write.jsp"> 기술
도입 상담 신청 </a>
</div>
</div>
</div>
</header>
<script>
    let mobileDrawerOpen = false;

    function toggleMobileDrawer() {
    const drawer = document.getElementById('mobile-drawer');
    const backdrop = document.getElementById('mobile-backdrop');
    mobileDrawerOpen = !mobileDrawerOpen;

    if (mobileDrawerOpen) {
    backdrop.classList.remove('hidden');
    setTimeout(() => {
    backdrop.classList.remove('opacity-0');
    backdrop.classList.add('opacity-100');
    drawer.classList.remove('translate-x-full');
    }, 10);
    document.body.style.overflow = 'hidden';
    } else {
    backdrop.classList.remove('opacity-100');
    backdrop.classList.add('opacity-0');
    drawer.classList.add('translate-x-full');
    setTimeout(() => {
    backdrop.classList.add('hidden');
    }, 300);
    document.body.style.overflow = '';
    }
    }

    let mobileSubOpen = true;
    function toggleMobileSubmenu() {
    const menu = document.getElementById('mobile-sub-menu');
    const chevron = document.getElementById('mobile-sub-chevron');
    mobileSubOpen = !mobileSubOpen;

    if (mobileSubOpen) {
    menu.classList.remove('hidden');
    chevron.style.transform = 'rotate(0deg)';
    } else {
    menu.classList.add('hidden');
    chevron.style.transform = 'rotate(-90deg)';
    }
    }
</script>
