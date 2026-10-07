<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>
            <c:out value="${requestScope.adminPageTitle}"/> | NEXORA Admin</title>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/admin_admin.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/inquiry_flow.css">
    </head>
    <body class="bg-surface font-body-md text-on-surface antialiased">
        <aside class="fixed left-0 top-0 h-full w-72 bg-primary-container text-on-primary z-50 flex flex-col justify-between shadow-[0_1px_8px_rgba(0,0,0,0.04)]">
            <div class="flex flex-col h-full">
                <a class="h-16 px-space-md flex items-center gap-space-sm bg-tertiary-container/30" href="${pageContext.request.contextPath}/admin/dashboard">
                    <div class="w-8 h-8 rounded-xl bg-secondary flex items-center justify-center">
                        <span class="material-symbols-outlined text-on-secondary text-[20px]">security</span>
                    </div>
                    <div class="flex flex-col">
                        <span class="font-headline-sm text-headline-sm tracking-tight text-on-primary font-bold">NEXORA</span>
                        <span class="font-label-caps text-label-caps text-on-primary-container uppercase">SentinelOps Core</span>
                    </div>
                </a>
                <div class="flex-1 overflow-y-auto px-space-sm py-space-md">
                    <div class="px-space-sm mb-space-xs font-label-caps text-label-caps text-on-primary-container uppercase tracking-wider">Main Console</div>
                    <nav class="flex flex-col gap-1 mb-space-lg">
                        <a class="flex items-center px-space-md py-space-sm rounded-xl text-on-primary-container hover:bg-surface-variant hover:text-on-surface transition-colors" href="${pageContext.request.contextPath}/admin/dashboard">
                            <span class="material-symbols-outlined mr-space-sm text-[20px]">dashboard</span>
                            <span>대시보드</span>
                        </a>
                        <a class="flex items-center px-space-md py-space-sm rounded-xl text-on-primary-container hover:bg-surface-variant hover:text-on-surface transition-colors" href="${pageContext.request.contextPath}/admin/members">
                            <span class="material-symbols-outlined mr-space-sm text-[20px]">group</span>
                            <span>회원 관리</span>
                        </a>
                        <a class="flex items-center px-space-md py-space-sm rounded-xl text-on-primary-container hover:bg-surface-variant hover:text-on-surface transition-colors" href="${pageContext.request.contextPath}/admin/boards?category=FREE">
                            <span class="material-symbols-outlined mr-space-sm text-[20px]">forum</span>
                            <span>게시판 관리</span>
                        </a>
                    </nav>
                    <div class="px-space-sm mb-space-xs font-label-caps text-label-caps text-on-primary-container uppercase tracking-wider">Content &amp; Ops</div>
                    <nav class="flex flex-col gap-1 mb-space-lg">
                        <a class="flex items-center px-space-md py-space-sm rounded-xl text-on-primary-container hover:bg-surface-variant hover:text-on-surface transition-colors" href="${pageContext.request.contextPath}/admin/inquiry/list">
                            <span class="material-symbols-outlined mr-space-sm text-[20px]">support_agent</span>
                            <span>고객 문의 티켓</span>
                        </a>
                        <a class="flex items-center px-space-md py-space-sm rounded-xl text-on-primary-container hover:bg-surface-variant hover:text-on-surface transition-colors" href="${pageContext.request.contextPath}/sentinel/incidents">
                            <span class="material-symbols-outlined mr-space-sm text-[20px]">notification_important</span>
                            <span>인시던트 대응 센터</span>
                        </a>
                        <a class="flex items-center px-space-md py-space-sm rounded-xl text-on-primary-container hover:bg-surface-variant hover:text-on-surface transition-colors" href="${pageContext.request.contextPath}/security/events">
                            <span class="material-symbols-outlined mr-space-sm text-[20px]">shield_lock</span>
                            <span>보안 위협 관제</span>
                        </a>
                    </nav>
                    <div class="px-space-sm mb-space-xs font-label-caps text-label-caps text-on-primary-container uppercase tracking-wider">Session</div>
                    <nav class="flex flex-col gap-1">
                        <a class="flex items-center px-space-md py-space-sm rounded-xl text-on-primary-container hover:bg-surface-variant hover:text-on-surface transition-colors" href="${pageContext.request.contextPath}/index.jsp">
                            <span class="material-symbols-outlined mr-space-sm text-[20px]">public</span>
                            <span>고객 화면으로</span>
                        </a>
                    </nav>
                </div>
                <div class="p-space-md bg-tertiary-container/50 mx-space-sm mb-space-sm rounded-xl">
                    <div class="font-label-caps text-label-caps text-on-primary-container uppercase">관리자 세션</div>
                    <div class="font-body-sm text-on-primary mt-1">
                        <c:out value="${sessionScope.name}"/>
                    </div>
                </div>
            </div>
        </aside>
        <div class="pl-72 min-h-screen flex flex-col bg-surface">
            <header class="fixed top-0 left-72 right-0 h-16 bg-surface-container-lowest/90 backdrop-blur-xl shadow-[0_1px_8px_rgba(0,0,0,0.04)] z-40 flex items-center justify-between px-gutter-desktop">
                <div class="flex items-center gap-space-md">
                    <div class="flex items-center gap-space-xs text-on-surface-variant font-body-sm">
                        <span class="font-semibold text-on-surface">NEXORA 운영</span>
                        <span class="material-symbols-outlined text-[14px]">chevron_right</span>
                        <span>관리자 콘솔</span>
                        <span class="material-symbols-outlined text-[14px]">chevron_right</span>
                        <span class="text-outline">
                            <c:out value="${requestScope.adminPageTitle}"/>
                        </span>
                    </div>
                </div>
                <div class="flex items-center gap-space-sm">
                    <span class="font-body-sm text-on-surface-variant hidden sm:inline">
                        <c:out value="${sessionScope.name}"/> · ADMIN</span>
                    <a class="flex items-center gap-1 text-on-surface-variant hover:text-error px-space-xs py-1 rounded-lg" href="${pageContext.request.contextPath}/member/logout.do">
                        <span class="material-symbols-outlined text-[18px]">logout</span>
                        <span class="font-body-sm font-semibold">로그아웃</span>
                    </a>
                </div>
            </header>
            <main class="w-full pt-16 bg-surface px-gutter-desktop py-space-lg flex-1">
                <div class="flex flex-col w-full">
