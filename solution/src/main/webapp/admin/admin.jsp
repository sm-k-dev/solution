<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="ko"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0" name="viewport"/><meta content="web_dashboard" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet"/><link href="https://fonts.googleapis.com" rel="preconnect"/><link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/><link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&amp;family=JetBrains+Mono:wght@400;600&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base { html, body { margin: 0; padding: 0; } body { overscroll-behavior: none; } main > :first-child { margin-top: 0 !important; } main > :last-child { margin-bottom: 0 !important; } } ::-webkit-scrollbar { display: none; }</style><link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/admin_admin.css"/></head><body class="bg-surface font-body-md text-on-surface antialiased"><aside class="fixed left-0 top-0 h-full w-72 bg-primary-container text-on-primary z-50 flex flex-col justify-between shadow-[0_1px_8px_rgba(0,0,0,0.04)]"><div class="flex flex-col h-full"><div class="h-16 px-space-md flex items-center gap-space-sm bg-tertiary-container/30"><div class="w-8 h-8 rounded-xl bg-secondary flex items-center justify-center"><span class="material-symbols-outlined text-on-secondary text-[20px]">security</span></div><div class="flex flex-col"><span class="font-headline-sm text-headline-sm tracking-tight text-on-primary font-bold">NEXORA</span><span class="font-label-caps text-label-caps text-on-primary-container uppercase">SentinelOps Core</span></div></div><div class="flex-1 overflow-y-auto px-space-sm py-space-md"><div class="px-space-sm mb-space-xs font-label-caps text-label-caps text-on-primary-container uppercase tracking-wider">Main Console</div><nav class="flex flex-col gap-1 mb-space-lg" data-active-classes="bg-secondary-container text-on-secondary-container font-semibold rounded-xl"><a aria-current="page" class="flex items-center px-space-md py-space-sm transition-colors bg-secondary-container text-on-secondary-container font-semibold rounded-xl" data-path="dashboard" href="#"><span class="material-symbols-outlined mr-space-sm text-[20px]">dashboard</span><span>대시보드 (Dashboard)</span></a></nav><div class="px-space-sm mb-space-xs font-label-caps text-label-caps text-on-primary-container uppercase tracking-wider">Member Governance</div><nav class="flex flex-col gap-1 mb-space-lg" data-active-classes="bg-secondary-container text-on-secondary-container font-semibold rounded-xl"><a class="flex items-center px-space-md py-space-sm rounded-xl text-on-primary-container hover:bg-surface-variant hover:text-on-surface transition-colors font-body-md text-body-md" data-path="members-list" href="#"><span class="material-symbols-outlined mr-space-sm text-[20px]">group</span><span>회원 목록</span></a><a class="flex items-center px-space-md py-space-sm rounded-xl text-on-primary-container hover:bg-surface-variant hover:text-on-surface transition-colors font-body-md text-body-md" data-path="members-search" href="#"><span class="material-symbols-outlined mr-space-sm text-[20px]">person_search</span><span>회원 검색 및 심사</span></a></nav><div class="px-space-sm mb-space-xs font-label-caps text-label-caps text-on-primary-container uppercase tracking-wider">Content &amp; Ops</div><nav class="flex flex-col gap-1 mb-space-lg" data-active-classes="bg-secondary-container text-on-secondary-container font-semibold rounded-xl"><a class="flex items-center px-space-md py-space-sm rounded-xl text-on-primary-container hover:bg-surface-variant hover:text-on-surface transition-colors font-body-md text-body-md" data-path="boards-notice" href="#"><span class="material-symbols-outlined mr-space-sm text-[20px]">campaign</span><span>공지사항 관리</span></a><a class="flex items-center px-space-md py-space-sm rounded-xl text-on-primary-container hover:bg-surface-variant hover:text-on-surface transition-colors font-body-md text-body-md" data-path="boards-community" href="#"><span class="material-symbols-outlined mr-space-sm text-[20px]">forum</span><span>커뮤니티 모니터링</span></a><a class="flex items-center px-space-md py-space-sm rounded-xl text-on-primary-container hover:bg-surface-variant hover:text-on-surface transition-colors font-body-md text-body-md" data-path="boards-support" href="#"><span class="material-symbols-outlined mr-space-sm text-[20px]">support_agent</span><span>고객 문의 티켓</span></a></nav><div class="px-space-sm mb-space-xs font-label-caps text-label-caps text-on-primary-container uppercase tracking-wider">SentinelOps Telemetry</div><nav class="flex flex-col gap-1 mb-space-lg" data-active-classes="bg-secondary-container text-on-secondary-container font-semibold rounded-xl"><a class="flex items-center px-space-md py-space-sm rounded-xl text-on-primary-container hover:bg-surface-variant hover:text-on-surface transition-colors font-body-md text-body-md" data-path="sentinelops-monitoring" href="#"><span class="material-symbols-outlined mr-space-sm text-[20px]">query_stats</span><span>AI 실시간 관제</span></a><a class="flex items-center px-space-md py-space-sm rounded-xl text-on-primary-container hover:bg-surface-variant hover:text-on-surface transition-colors font-body-md text-body-md" data-path="sentinelops-incidents" href="#"><span class="material-symbols-outlined mr-space-sm text-[20px]">notification_important</span><span>인시던트 대응 센터</span></a><a class="flex items-center px-space-md py-space-sm rounded-xl text-on-primary-container hover:bg-surface-variant hover:text-on-surface transition-colors font-body-md text-body-md" data-path="sentinelops-logs" href="#"><span class="material-symbols-outlined mr-space-sm text-[20px]">terminal</span><span>시스템 에러 로그</span></a><a class="flex items-center px-space-md py-space-sm rounded-xl text-on-primary-container hover:bg-surface-variant hover:text-on-surface transition-colors font-body-md text-body-md" data-path="sentinelops-alerts" href="#"><span class="material-symbols-outlined mr-space-sm text-[20px]">mark_chat_unread</span><span>Slack 경보 파이프라인</span></a></nav><div class="px-space-sm mb-space-xs font-label-caps text-label-caps text-on-primary-container uppercase tracking-wider">Administration</div><nav class="flex flex-col gap-1" data-active-classes="bg-secondary-container text-on-secondary-container font-semibold rounded-xl"><a class="flex items-center px-space-md py-space-sm rounded-xl text-on-primary-container hover:bg-surface-variant hover:text-on-surface transition-colors font-body-md text-body-md" data-path="system-settings" href="#"><span class="material-symbols-outlined mr-space-sm text-[20px]">settings</span><span>글로벌 시스템 설정</span></a><a class="flex items-center px-space-md py-space-sm rounded-xl text-on-primary-container hover:bg-surface-variant hover:text-on-surface transition-colors font-body-md text-body-md" data-path="admin-accounts" href="#"><span class="material-symbols-outlined mr-space-sm text-[20px]">admin_panel_settings</span><span>관리자 계정 권한</span></a></nav></div><div class="p-space-md bg-tertiary-container/50 mx-space-sm mb-space-sm rounded-xl"><div class="flex items-center justify-between mb-space-xs"><span class="font-label-caps text-label-caps text-on-primary-container uppercase">SOC Node #01</span><span class="flex h-2 w-2 relative"><span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-secondary-fixed opacity-75"></span><span class="relative inline-flex rounded-full h-2 w-2 bg-secondary"></span></span></div><div class="font-code-inline text-code-inline text-on-primary">LATENCY: 14ms (OPTIMAL)</div></div></div></aside><div class="pl-72 min-h-screen flex flex-col bg-surface"><header class="fixed top-0 left-72 right-0 h-16 bg-surface-container-lowest/90 backdrop-blur-xl shadow-[0_1px_8px_rgba(0,0,0,0.04)] z-40 flex items-center justify-between px-gutter-desktop"><div class="flex items-center gap-space-md"><div class="flex items-center gap-space-xs text-on-surface-variant font-body-sm text-body-sm"><span class="font-semibold text-on-surface">엔터프라이즈 통합 관제</span><span class="material-symbols-outlined text-[14px]">chevron_right</span><span class="text-outline">Admin Console</span></div><div class="flex items-center gap-space-xs px-space-sm py-0.5 rounded-full bg-surface-container font-label-caps text-label-caps text-on-surface"><span class="w-1.5 h-1.5 rounded-full bg-secondary"></span><span>Static Simulation Mode</span></div></div><div class="flex items-center gap-space-md"><div class="relative flex items-center"><button class="w-9 h-9 rounded-xl bg-surface-container-low hover:bg-surface-container hover:text-on-surface text-on-surface-variant flex items-center justify-center transition-colors relative"><span class="material-symbols-outlined text-[20px]">notifications</span><span class="absolute -top-1 -right-1 w-4 h-4 rounded-full bg-error text-on-error font-code-inline text-[10px] flex items-center justify-center font-bold">3</span></button></div><div class="h-6 w-[1px] bg-surface-container"></div><div class="flex items-center gap-space-sm bg-surface-container-low px-space-sm py-1.5 rounded-xl"><div class="w-8 h-8 rounded-full bg-primary flex items-center justify-center"><span class="material-symbols-outlined text-on-primary text-[18px]">person</span></div><div class="flex flex-col text-left pr-space-xs"><span class="font-body-sm text-body-sm font-semibold text-on-surface">홍길동 수석</span><span class="font-label-caps text-label-caps text-on-surface-variant font-code-inline">role_admin</span></div></div><a class="flex items-center gap-1 text-on-surface-variant hover:text-error transition-colors px-space-xs py-1 rounded-lg" data-path="login" href="#"><span class="material-symbols-outlined text-[18px]">logout</span><span class="font-body-sm text-body-sm font-semibold hidden lg:inline">로그아웃</span></a></div></header><main class="w-full pt-16 bg-surface px-gutter-desktop py-space-lg flex-1"><div class="flex flex-col w-full">
<!-- Simulation Prototype Status Strip -->
<div class="w-full bg-primary-container text-on-primary px-space-md py-space-xs rounded-xl shadow-sm flex items-center justify-between mb-space-lg">
<div class="flex items-center gap-space-sm min-w-0">
<span class="flex h-2.5 w-2.5 relative shrink-0">
<span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-secondary-fixed opacity-75"></span>
<span class="relative inline-flex rounded-full h-2.5 w-2.5 bg-secondary"></span>
</span>
<span class="font-label-caps text-label-caps uppercase tracking-wider text-surface-variant font-code-inline shrink-0">SYSTEM PROTOTYPE</span>
<div class="h-3 w-[1px] bg-outline-variant/30 hidden sm:block shrink-0"></div>
<p class="font-body-sm text-body-sm truncate text-on-primary-fixed-variant">
        System Simulation Prototype | Static Operational Preview <span class="text-surface-variant">(실시간 연동 준비 상태 - SentinelOps Telemetry Core v4.2)</span>
</p>
</div>
<div class="flex items-center gap-space-xs shrink-0 font-code-inline text-code-inline text-surface-variant">
<span class="material-symbols-outlined text-[16px] text-secondary-fixed">sync_alt</span>
<span class="hidden md:inline">NODE_KR_SEOUL_01</span>
<span class="px-space-xs py-0.5 rounded bg-surface-container/20 text-on-primary font-semibold">SYNC 99.98%</span>
</div>
</div>
<!-- Operational Header Zone -->
<div class="flex flex-col md:flex-row md:items-end justify-between gap-space-md mb-space-lg">
<div>
<div class="flex items-center gap-space-xs text-secondary font-label-caps text-label-caps tracking-widest uppercase mb-1">
<span class="material-symbols-outlined text-[16px]">shield_with_heart</span>
<span>Mission-Critical Telemetry Surface</span>
</div>
<h2 class="font-headline-lg text-headline-lg text-on-surface font-bold tracking-tight">통합 관제 및 인시던트 조사 콘솔</h2>
<p class="font-body-md text-body-md text-on-surface-variant">
        NEXORA IT Solutions 인프라 전역의 이벤트 감지, 이상 징후 분석 및 실시간 장애 대응 워크스페이스입니다.
      </p>
</div>
<div class="flex items-center gap-space-sm shrink-0">
<div class="flex items-center gap-space-xs bg-surface-container-low px-space-md py-space-xs rounded-xl shadow-sm">
<span class="material-symbols-outlined text-secondary text-[18px]">update</span>
<span class="font-code-inline text-code-inline text-on-surface-variant">Last Polled: 14:38:02 KST</span>
</div>
<button class="flex items-center gap-space-xs bg-primary hover:bg-secondary text-on-primary px-space-md py-space-xs rounded-xl shadow-sm transition-all duration-150" onclick="window.location.reload()">
<span class="material-symbols-outlined text-[16px]">refresh</span>
<span class="font-body-sm text-body-sm font-semibold">수동 새로고침</span>
</button>
</div>
</div>
<!-- Section 1: KPI Summary Cards (4 Cards Grid) -->
<section class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-space-md mb-space-xl">
<!-- KPI 1: 전체 회원 -->
<div class="bg-surface-container-lowest p-space-md rounded-xl shadow-sm flex flex-col justify-between hover:shadow-md transition-shadow">
<div class="flex items-start justify-between mb-space-sm">
<div class="flex flex-col">
<span class="font-label-caps text-label-caps uppercase text-on-surface-variant tracking-wider font-semibold">전체 회원 (Total Members)</span>
<span class="font-headline-md text-headline-md font-metric-val text-on-surface font-bold mt-1">12,480명</span>
</div>
<div class="w-10 h-10 rounded-xl bg-surface-container-low flex items-center justify-center text-secondary">
<span class="material-symbols-outlined text-[24px]">group</span>
</div>
</div>
<div class="flex items-center gap-1 font-body-sm text-body-sm text-on-surface-variant pt-space-xs">
<span class="inline-flex items-center font-semibold text-secondary">
<span class="material-symbols-outlined text-[16px]">trending_up</span>+12.4%
        </span>
<span class="text-outline">MoM 증감률 (기준: 당월 누적)</span>
</div>
</div>
<!-- KPI 2: 신규 문의 -->
<div class="bg-surface-container-lowest p-space-md rounded-xl shadow-sm flex flex-col justify-between hover:shadow-md transition-shadow">
<div class="flex items-start justify-between mb-space-sm">
<div class="flex flex-col">
<span class="font-label-caps text-label-caps uppercase text-on-surface-variant tracking-wider font-semibold">신규 문의 (New Inquiries)</span>
<span class="font-headline-md text-headline-md font-metric-val text-on-surface font-bold mt-1">28건</span>
</div>
<div class="w-10 h-10 rounded-xl bg-surface-container-high flex items-center justify-center text-on-tertiary-container">
<span class="material-symbols-outlined text-[24px]">contact_support</span>
</div>
</div>
<div class="flex items-center justify-between font-body-sm text-body-sm text-on-surface-variant pt-space-xs">
<span class="text-on-surface">미처리 대기 중</span>
<span class="px-space-xs py-0.5 rounded-full bg-surface-container font-code-inline font-semibold text-secondary">6건 대기 중</span>
</div>
</div>
<!-- KPI 3: OPEN Incidents -->
<div class="bg-surface-container-lowest p-space-md rounded-xl shadow-sm flex flex-col justify-between hover:shadow-md transition-shadow">
<div class="flex items-start justify-between mb-space-sm">
<div class="flex flex-col">
<span class="font-label-caps text-label-caps uppercase text-on-surface-variant tracking-wider font-semibold">OPEN Incidents</span>
<span class="font-headline-md text-headline-md font-metric-val text-on-surface font-bold mt-1">7건</span>
</div>
<div class="w-10 h-10 rounded-xl bg-surface-container-highest flex items-center justify-center text-on-surface">
<span class="material-symbols-outlined text-[24px]">warning</span>
</div>
</div>
<div class="flex items-center gap-1 font-body-sm text-body-sm text-on-surface-variant pt-space-xs">
<span class="material-symbols-outlined text-[16px] text-outline">timelapse</span>
<span>평균 조치 시간: <strong class="font-code-inline text-on-surface">18분</strong></span>
</div>
</div>
<!-- KPI 4: CRITICAL Incidents -->
<div class="bg-error-container p-space-md rounded-xl shadow-sm flex flex-col justify-between hover:shadow-md transition-shadow">
<div class="flex items-start justify-between mb-space-sm">
<div class="flex flex-col">
<div class="flex items-center gap-1.5">
<span class="font-label-caps text-label-caps uppercase text-on-error-container tracking-wider font-bold">CRITICAL Incidents</span>
<span class="flex h-2 w-2 relative">
<span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-error opacity-75"></span>
<span class="relative inline-flex rounded-full h-2 w-2 bg-error"></span>
</span>
</div>
<span class="font-headline-md text-headline-md font-metric-val text-error font-bold mt-1">2건</span>
</div>
<div class="w-10 h-10 rounded-xl bg-error flex items-center justify-center text-on-error shadow-sm">
<span class="material-symbols-outlined text-[24px]">error</span>
</div>
</div>
<div class="flex items-center justify-between font-body-sm text-body-sm pt-space-xs">
<span class="font-bold text-on-error-container">즉각 대응 필요</span>
<span class="px-space-xs py-0.5 rounded-full bg-error text-on-error font-code-inline text-code-inline font-bold">HIGH PRIORITY</span>
</div>
</div>
</section>
<!-- Section 2: Incident Overview Analytics (2 Columns) -->
<section class="grid grid-cols-1 lg:grid-cols-12 gap-space-md mb-space-xl">
<!-- Left Chart: Daily Error Traffic Trend (7-day) -->
<div class="lg:col-span-7 bg-surface-container-lowest p-space-lg rounded-xl shadow-sm flex flex-col justify-between">
<div class="flex items-center justify-between mb-space-md">
<div>
<div class="font-label-caps text-label-caps text-secondary uppercase font-bold tracking-wider">Telemetry Telemetry Feed</div>
<h3 class="font-headline-sm text-headline-sm text-on-surface font-semibold">주간 일별 에러 트래픽 발생 추이 (7-Day)</h3>
</div>
<div class="flex items-center gap-space-xs text-on-surface-variant font-code-inline text-code-inline">
<span class="w-2.5 h-2.5 rounded-sm bg-secondary"></span>
<span>전체 인시던트 수치</span>
</div>
</div>
<!-- Custom High-Precision SVG Bar/Line Visualization -->
<div class="relative w-full h-48 flex flex-col justify-end pt-4">
<!-- SVG Spark Line Over Bars -->
<svg class="w-full h-full" preserveaspectratio="none" viewbox="0 0 700 160">
<defs>
<lineargradient id="barGradient" x1="0" x2="0" y1="0" y2="1">
<stop offset="0%" stop-color="#1c4fd7" stop-opacity="0.9"></stop>
<stop offset="100%" stop-color="#dce9ff" stop-opacity="0.3"></stop>
</lineargradient>
<lineargradient id="peakGradient" x1="0" x2="0" y1="0" y2="1">
<stop offset="0%" stop-color="#ba1a1a" stop-opacity="0.9"></stop>
<stop offset="100%" stop-color="#ffdad6" stop-opacity="0.4"></stop>
</lineargradient>
</defs>
<!-- Grid Lines -->
<line stroke="#d3e4fe" stroke-dasharray="3 3" x1="0" x2="700" y1="30" y2="30"></line>
<line stroke="#d3e4fe" stroke-dasharray="3 3" x1="0" x2="700" y1="80" y2="80"></line>
<line stroke="#d3e4fe" stroke-dasharray="3 3" x1="0" x2="700" y1="130" y2="130"></line>
<!-- Mon: 42 -->
<rect fill="url(#barGradient)" height="45" rx="4" width="40" x="35" y="105"></rect>
<text fill="#44474d" font-family="JetBrains Mono" font-size="11" font-weight="600" text-anchor="middle" x="55" y="98">42</text>
<!-- Tue: 38 -->
<rect fill="url(#barGradient)" height="40" rx="4" width="40" x="135" y="110"></rect>
<text fill="#44474d" font-family="JetBrains Mono" font-size="11" font-weight="600" text-anchor="middle" x="155" y="103">38</text>
<!-- Wed: 85 -->
<rect fill="url(#barGradient)" height="92" rx="4" width="40" x="235" y="58"></rect>
<text fill="#44474d" font-family="JetBrains Mono" font-size="11" font-weight="600" text-anchor="middle" x="255" y="51">85</text>
<!-- Thu: 124 (Peak) -->
<rect fill="url(#peakGradient)" height="136" rx="4" width="40" x="335" y="14"></rect>
<text fill="#ba1a1a" font-family="JetBrains Mono" font-size="11" font-weight="700" text-anchor="middle" x="355" y="8">124 🔥 PEAK</text>
<!-- Fri: 96 -->
<rect fill="url(#barGradient)" height="104" rx="4" width="40" x="435" y="46"></rect>
<text fill="#44474d" font-family="JetBrains Mono" font-size="11" font-weight="600" text-anchor="middle" x="455" y="39">96</text>
<!-- Sat: 28 -->
<rect fill="url(#barGradient)" height="28" rx="4" width="40" x="535" y="122"></rect>
<text fill="#44474d" font-family="JetBrains Mono" font-size="11" font-weight="600" text-anchor="middle" x="555" y="115">28</text>
<!-- Sun: 19 -->
<rect fill="url(#barGradient)" height="18" rx="4" width="40" x="635" y="132"></rect>
<text fill="#44474d" font-family="JetBrains Mono" font-size="11" font-weight="600" text-anchor="middle" x="655" y="125">19</text>
</svg>
<!-- X-axis Labels -->
<div class="grid grid-cols-7 text-center font-code-inline text-code-inline text-on-surface-variant pt-2">
<span>Mon</span>
<span>Tue</span>
<span>Wed</span>
<span class="font-bold text-error">Thu (목)</span>
<span>Fri</span>
<span>Sat</span>
<span>Sun</span>
</div>
</div>
<div class="mt-space-md p-space-sm bg-surface-container-low rounded-lg flex items-center justify-between font-body-sm text-body-sm">
<span class="text-on-surface-variant">목요일(Thu) 14:00~16:00 코어 결제망 연계 타임아웃으로 인한 스파이크 유입</span>
<span class="font-code-inline text-code-inline font-semibold text-secondary">MAX: 124 ERR/HR</span>
</div>
</div>
<!-- Right Chart: Severity Distribution -->
<div class="lg:col-span-5 bg-surface-container-lowest p-space-lg rounded-xl shadow-sm flex flex-col justify-between">
<div class="flex items-center justify-between mb-space-md">
<div>
<div class="font-label-caps text-label-caps text-secondary uppercase font-bold tracking-wider">Classification Matrix</div>
<h3 class="font-headline-sm text-headline-sm text-on-surface font-semibold">인시던트 심각도 분포 (Severity)</h3>
</div>
<span class="font-label-caps text-label-caps bg-surface-container px-space-xs py-0.5 rounded text-on-surface-variant">총 92건 산출</span>
</div>
<!-- Segmented Bar Visual -->
<div class="w-full flex h-4 rounded-full overflow-hidden bg-surface-container mb-space-md shadow-inner">
<div class="bg-surface-dim hover:opacity-90 transition-opacity" style="width: 52%;" title="LOW: 52%"></div>
<div class="bg-secondary-container hover:opacity-90 transition-opacity" style="width: 28%;" title="MEDIUM: 28%"></div>
<div class="bg-on-tertiary-container hover:opacity-90 transition-opacity" style="width: 13%;" title="HIGH: 13%"></div>
<div class="bg-error hover:opacity-90 transition-opacity" style="width: 7%;" title="CRITICAL: 7%"></div>
</div>
<!-- Severity Badges Grid -->
<div class="grid grid-cols-2 gap-space-sm mb-space-sm">
<!-- LOW -->
<div class="p-space-sm rounded-lg bg-surface-container-low flex flex-col justify-between">
<div class="flex items-center justify-between">
<span class="px-2 py-0.5 rounded text-[11px] font-bold font-code-inline bg-surface-container text-on-surface-variant">LOW</span>
<span class="font-code-inline text-code-inline text-outline font-semibold">52%</span>
</div>
<div class="mt-2 flex items-baseline gap-1">
<span class="font-headline-sm text-headline-sm font-metric-val font-bold text-on-surface">48</span>
<span class="font-body-sm text-body-sm text-on-surface-variant">건</span>
</div>
</div>
<!-- MEDIUM -->
<div class="p-space-sm rounded-lg bg-surface-container-low flex flex-col justify-between">
<div class="flex items-center justify-between">
<span class="px-2 py-0.5 rounded text-[11px] font-bold font-code-inline bg-secondary-fixed text-on-secondary-fixed">MEDIUM</span>
<span class="font-code-inline text-code-inline text-secondary font-semibold">28%</span>
</div>
<div class="mt-2 flex items-baseline gap-1">
<span class="font-headline-sm text-headline-sm font-metric-val font-bold text-on-surface">26</span>
<span class="font-body-sm text-body-sm text-on-surface-variant">건</span>
</div>
</div>
<!-- HIGH -->
<div class="p-space-sm rounded-lg bg-surface-container-low flex flex-col justify-between">
<div class="flex items-center justify-between">
<span class="px-2 py-0.5 rounded text-[11px] font-bold font-code-inline bg-primary-fixed text-on-primary-fixed">HIGH</span>
<span class="font-code-inline text-code-inline text-on-primary-container font-semibold">13%</span>
</div>
<div class="mt-2 flex items-baseline gap-1">
<span class="font-headline-sm text-headline-sm font-metric-val font-bold text-on-surface">12</span>
<span class="font-body-sm text-body-sm text-on-surface-variant">건</span>
</div>
</div>
<!-- CRITICAL -->
<div class="p-space-sm rounded-lg bg-error-container flex flex-col justify-between">
<div class="flex items-center justify-between">
<span class="px-2 py-0.5 rounded text-[11px] font-bold font-code-inline bg-error text-on-error flex items-center gap-1">
<span class="w-1.5 h-1.5 rounded-full bg-on-error animate-ping"></span>
              CRITICAL
            </span>
<span class="font-code-inline text-code-inline text-error font-bold">7%</span>
</div>
<div class="mt-2 flex items-baseline gap-1">
<span class="font-headline-sm text-headline-sm font-metric-val font-bold text-error">6</span>
<span class="font-body-sm text-body-sm text-on-error-container font-semibold">건 (격리 중)</span>
</div>
</div>
</div>
<div class="font-code-inline text-code-inline text-on-surface-variant flex items-center gap-space-xs bg-surface-container-high/40 p-2 rounded">
<span class="material-symbols-outlined text-[16px] text-secondary">verified</span>
<span>SLA 준수율 99.4% (Critical 목표 복구 30분 이내 관리)</span>
</div>
</div>
</section>
<!-- Section 3: Recent Incidents Table -->
<section class="bg-surface-container-lowest rounded-xl shadow-sm p-space-md mb-space-xl">
<div class="flex flex-col md:flex-row md:items-center justify-between gap-space-sm mb-space-md">
<div>
<div class="flex items-center gap-space-xs">
<h3 class="font-headline-sm text-headline-sm text-on-surface font-bold">최근 발생 인시던트 로그 (Recent Incidents)</h3>
<span class="px-2 py-0.5 rounded bg-surface-container font-code-inline text-code-inline text-on-surface font-semibold">Live Buffer</span>
</div>
<p class="font-body-sm text-body-sm text-on-surface-variant">실시간 수집된 트레이스 및 에러 콜백 스택 (상세 분석 버튼 클릭 시 조사 모달 활성화)</p>
</div>
<div class="flex items-center gap-space-xs font-body-sm text-body-sm">
<span class="text-on-surface-variant font-code-inline text-code-inline">필터:</span>
<button class="px-space-sm py-1 rounded-lg bg-primary text-on-primary font-semibold text-body-sm">전체</button>
<button class="px-space-sm py-1 rounded-lg bg-surface-container hover:bg-surface-container-high text-on-surface transition-colors">Critical / High</button>
<button class="px-space-sm py-1 rounded-lg bg-surface-container hover:bg-surface-container-high text-on-surface transition-colors">Open Only</button>
</div>
</div>
<!-- Responsive Table Container -->
<div class="w-full overflow-x-auto">
<table class="w-full text-left font-body-md text-body-md border-collapse">
<thead>
<tr class="bg-surface-container-low text-on-surface-variant font-label-caps text-label-caps uppercase tracking-wider h-10">
<th class="px-space-md rounded-l-lg">Time</th>
<th class="px-space-md">Service</th>
<th class="px-space-md">Error Definition</th>
<th class="px-space-md">Severity</th>
<th class="px-space-md">Status</th>
<th class="px-space-md text-right rounded-r-lg">Action</th>
</tr>
</thead>
<tbody class="divide-y-0">
<!-- Row 1: CRITICAL (Payment API - Active / Trigger Modal) -->
<tr class="h-14 bg-surface-container/60 hover:bg-surface-container transition-colors font-medium">
<td class="px-space-md font-code-inline text-code-inline text-on-surface font-bold">14:35:21</td>
<td class="px-space-md font-semibold text-on-surface flex items-center gap-2 h-14">
<span class="w-2 h-2 rounded-full bg-error"></span>
              Payment API
            </td>
<td class="px-space-md">
<div class="flex flex-col">
<span class="font-code-inline text-code-inline font-bold text-error">PaymentException</span>
<span class="font-body-sm text-body-sm text-on-surface-variant">PG Timeout / NHN KCP Gateway</span>
</div>
</td>
<td class="px-space-md">
<span class="px-2.5 py-1 rounded-full font-code-inline text-[11px] font-bold bg-error text-on-error flex items-center gap-1 w-max">
<span class="material-symbols-outlined text-[14px]">bolt</span>
                CRITICAL
              </span>
</td>
<td class="px-space-md">
<span class="px-2.5 py-1 rounded-full font-code-inline text-[11px] font-bold bg-error-container text-on-error-container w-max inline-block">
                OPEN
              </span>
</td>
<td class="px-space-md text-right">
<button class="px-space-sm py-1.5 rounded-lg bg-secondary hover:bg-primary text-on-secondary font-body-sm text-body-sm font-semibold transition-all inline-flex items-center gap-1 shadow-sm" onclick="openIncidentModal()">
<span class="material-symbols-outlined text-[16px]">troubleshoot</span>
<span>상세 분석</span>
</button>
</td>
</tr>
<!-- Row 2: HIGH (Login Service) -->
<tr class="h-14 hover:bg-surface-container-low transition-colors">
<td class="px-space-md font-code-inline text-code-inline text-on-surface-variant">14:32:11</td>
<td class="px-space-md font-semibold text-on-surface flex items-center gap-2 h-14">
<span class="w-2 h-2 rounded-full bg-on-tertiary-container"></span>
              Login Service
            </td>
<td class="px-space-md">
<div class="flex flex-col">
<span class="font-code-inline text-code-inline font-semibold text-on-surface">LoginException</span>
<span class="font-body-sm text-body-sm text-on-surface-variant">OAuth Token Desync (Redis Cache Miss)</span>
</div>
</td>
<td class="px-space-md">
<span class="px-2.5 py-1 rounded-full font-code-inline text-[11px] font-bold bg-surface-container-highest text-on-surface w-max inline-block">
                HIGH
              </span>
</td>
<td class="px-space-md">
<span class="px-2.5 py-1 rounded-full font-code-inline text-[11px] font-bold bg-error-container text-on-error-container w-max inline-block">
                OPEN
              </span>
</td>
<td class="px-space-md text-right">
<button class="px-space-sm py-1.5 rounded-lg bg-surface-container hover:bg-surface-container-high text-on-surface font-body-sm text-body-sm font-semibold transition-colors inline-flex items-center gap-1" onclick="openIncidentModal()">
<span class="material-symbols-outlined text-[16px]">visibility</span>
<span>상세 분석</span>
</button>
</td>
</tr>
<!-- Row 3: MEDIUM (Database Node-02) -->
<tr class="h-14 hover:bg-surface-container-low transition-colors">
<td class="px-space-md font-code-inline text-code-inline text-on-surface-variant">14:18:04</td>
<td class="px-space-md font-semibold text-on-surface flex items-center gap-2 h-14">
<span class="w-2 h-2 rounded-full bg-secondary"></span>
              Database Node-02
            </td>
<td class="px-space-md">
<div class="flex flex-col">
<span class="font-code-inline text-code-inline font-semibold text-on-surface">SlowQueryWarning</span>
<span class="font-body-sm text-body-sm text-on-surface-variant">Index Cache Eviction on pg_stat_activity</span>
</div>
</td>
<td class="px-space-md">
<span class="px-2.5 py-1 rounded-full font-code-inline text-[11px] font-bold bg-secondary-fixed text-on-secondary-fixed w-max inline-block">
                MEDIUM
              </span>
</td>
<td class="px-space-md">
<span class="px-2.5 py-1 rounded-full font-code-inline text-[11px] font-bold bg-surface-container-high text-secondary w-max inline-block">
                IN PROGRESS
              </span>
</td>
<td class="px-space-md text-right">
<button class="px-space-sm py-1.5 rounded-lg bg-surface-container hover:bg-surface-container-high text-on-surface font-body-sm text-body-sm font-semibold transition-colors inline-flex items-center gap-1" onclick="openIncidentModal()">
<span class="material-symbols-outlined text-[16px]">visibility</span>
<span>상세 분석</span>
</button>
</td>
</tr>
<!-- Row 4: LOW (Storage SAN) -->
<tr class="h-14 hover:bg-surface-container-low transition-colors">
<td class="px-space-md font-code-inline text-code-inline text-on-surface-variant">13:50:22</td>
<td class="px-space-md font-semibold text-on-surface flex items-center gap-2 h-14">
<span class="w-2 h-2 rounded-full bg-outline"></span>
              Storage SAN
            </td>
<td class="px-space-md">
<div class="flex flex-col">
<span class="font-code-inline text-code-inline text-on-surface">DiskUsageThreshold</span>
<span class="font-body-sm text-body-sm text-on-surface-variant">92% usage reached on /mnt/archive_logs</span>
</div>
</td>
<td class="px-space-md">
<span class="px-2.5 py-1 rounded-full font-code-inline text-[11px] font-bold bg-surface-dim text-on-surface-variant w-max inline-block">
                LOW
              </span>
</td>
<td class="px-space-md">
<span class="px-2.5 py-1 rounded-full font-code-inline text-[11px] font-bold bg-surface-container text-outline w-max inline-block">
                RESOLVED
              </span>
</td>
<td class="px-space-md text-right">
<button class="px-space-sm py-1.5 rounded-lg bg-surface-container-low hover:bg-surface-container text-on-surface-variant font-body-sm text-body-sm font-semibold transition-colors">
                조회
              </button>
</td>
</tr>
<!-- Row 5: LOW (Community Board) -->
<tr class="h-14 hover:bg-surface-container-low transition-colors">
<td class="px-space-md font-code-inline text-code-inline text-on-surface-variant">13:12:49</td>
<td class="px-space-md font-semibold text-on-surface flex items-center gap-2 h-14">
<span class="w-2 h-2 rounded-full bg-outline"></span>
              Community Board
            </td>
<td class="px-space-md">
<div class="flex flex-col">
<span class="font-code-inline text-code-inline text-on-surface">AttachmentUploadFailure</span>
<span class="font-body-sm text-body-sm text-on-surface-variant">S3 Network Glitch / Temporary Bucket Throttling</span>
</div>
</td>
<td class="px-space-md">
<span class="px-2.5 py-1 rounded-full font-code-inline text-[11px] font-bold bg-surface-dim text-on-surface-variant w-max inline-block">
                LOW
              </span>
</td>
<td class="px-space-md">
<span class="px-2.5 py-1 rounded-full font-code-inline text-[11px] font-bold bg-surface-container text-outline w-max inline-block">
                RESOLVED
              </span>
</td>
<td class="px-space-md text-right">
<button class="px-space-sm py-1.5 rounded-lg bg-surface-container-low hover:bg-surface-container text-on-surface-variant font-body-sm text-body-sm font-semibold transition-colors">
                조회
              </button>
</td>
</tr>
</tbody>
</table>
</div>
</section>
<!-- Section 4 & Section 5: Asymmetric Dual Column (Customer Support & System Health) -->
<div class="grid grid-cols-1 lg:grid-cols-12 gap-space-md mb-space-xl">
<!-- Section 4: Recent Customer Support (최근 고객 문의 연계) (7 Cols) -->
<section class="lg:col-span-7 bg-surface-container-lowest p-space-md rounded-xl shadow-sm flex flex-col justify-between">
<div>
<div class="flex items-center justify-between mb-space-sm">
<div class="flex items-center gap-space-xs">
<div class="w-8 h-8 rounded-lg bg-surface-container-high flex items-center justify-center text-secondary">
<span class="material-symbols-outlined text-[20px]">support_agent</span>
</div>
<div>
<h3 class="font-headline-sm text-headline-sm text-on-surface font-bold">최근 고객 문의 연계 (Customer Support)</h3>
<p class="font-body-sm text-body-sm text-on-surface-variant">장애 인시던트와 결합 분석 가능한 접수 티켓 목록</p>
</div>
</div>
<a class="font-body-sm text-body-sm text-secondary font-semibold hover:underline flex items-center" href="#">
            전체 보기 <span class="material-symbols-outlined text-[16px]">chevron_right</span>
</a>
</div>
<div class="w-full overflow-x-auto mt-space-sm">
<table class="w-full text-left font-body-sm text-body-sm">
<thead>
<tr class="bg-surface-container-low text-on-surface-variant font-label-caps text-label-caps uppercase h-9">
<th class="px-space-sm rounded-l">문의 제목</th>
<th class="px-space-sm">작성자</th>
<th class="px-space-sm">접수 시간</th>
<th class="px-space-sm text-right rounded-r">상태</th>
</tr>
</thead>
<tbody class="divide-y-0">
<!-- Item 1: Linked to Active Incident -->
<tr class="h-12 bg-surface-container-high/40 hover:bg-surface-container transition-colors">
<td class="px-space-sm py-2">
<div class="flex items-center gap-1.5">
<span class="w-2 h-2 rounded-full bg-error shrink-0"></span>
<span class="font-semibold text-on-surface truncate max-w-xs">PG 결제 승인 과정에서 504 Gateway Timeout 오류 발생 건</span>
<span class="px-1.5 py-0.5 rounded bg-error-container text-error text-[10px] font-bold font-code-inline shrink-0">INC-8842 연계</span>
</div>
</td>
<td class="px-space-sm text-on-surface-variant font-medium">핀테크 코어인프라팀 박민수</td>
<td class="px-space-sm font-code-inline text-code-inline text-on-surface">14:36:10</td>
<td class="px-space-sm text-right">
<span class="px-2 py-0.5 rounded-full bg-error-container text-on-error-container font-code-inline text-code-inline font-bold">접수</span>
</td>
</tr>
<!-- Item 2 -->
<tr class="h-12 hover:bg-surface-container-low transition-colors">
<td class="px-space-sm py-2">
<div class="font-medium text-on-surface truncate max-w-xs">기술지원 계정 2차 인증(MFA) OTP 동기화 오류</div>
</td>
<td class="px-space-sm text-on-surface-variant">클라우드 엔지니어 김태준</td>
<td class="px-space-sm font-code-inline text-code-inline text-on-surface-variant">14:31:00</td>
<td class="px-space-sm text-right">
<span class="px-2 py-0.5 rounded-full bg-secondary-fixed text-on-secondary-fixed font-code-inline text-code-inline font-semibold">처리중</span>
</td>
</tr>
<!-- Item 3 -->
<tr class="h-12 hover:bg-surface-container-low transition-colors">
<td class="px-space-sm py-2">
<div class="font-medium text-on-surface truncate max-w-xs">SentinelOps eBPF 커널 에이전트 설치 라이선스 키 발급 문의</div>
</td>
<td class="px-space-sm text-on-surface-variant">넥서라솔루션즈 최진영</td>
<td class="px-space-sm font-code-inline text-code-inline text-on-surface-variant">13:40:15</td>
<td class="px-space-sm text-right">
<span class="px-2 py-0.5 rounded-full bg-surface-container text-outline font-code-inline text-code-inline font-semibold">완료</span>
</td>
</tr>
<!-- Item 4 -->
<tr class="h-12 hover:bg-surface-container-low transition-colors">
<td class="px-space-sm py-2">
<div class="font-medium text-on-surface truncate max-w-xs">WAF 보안 정책 룰셋 일괄 적용 문의</div>
</td>
<td class="px-space-sm text-on-surface-variant">보안운영센터 정우성</td>
<td class="px-space-sm font-code-inline text-code-inline text-on-surface-variant">12:15:30</td>
<td class="px-space-sm text-right">
<span class="px-2 py-0.5 rounded-full bg-surface-container text-outline font-code-inline text-code-inline font-semibold">완료</span>
</td>
</tr>
</tbody>
</table>
</div>
</div>
<div class="pt-space-sm flex items-center justify-between font-label-caps text-label-caps text-on-surface-variant">
<span>SLA 긴급 티켓 자동 디스패치 파이프라인 활성</span>
<span class="text-secondary font-code-inline font-bold">Auto-Routing Active</span>
</div>
</section>
<!-- Section 5: System Health Matrix (5 Cols) -->
<section class="lg:col-span-5 bg-surface-container-lowest p-space-md rounded-xl shadow-sm flex flex-col justify-between">
<div>
<div class="flex items-center justify-between mb-space-sm">
<div class="flex items-center gap-space-xs">
<div class="w-8 h-8 rounded-lg bg-surface-container flex items-center justify-center text-primary">
<span class="material-symbols-outlined text-[20px]">dns</span>
</div>
<div>
<h3 class="font-headline-sm text-headline-sm text-on-surface font-bold">시스템 상태 요약 (System Health)</h3>
<p class="font-body-sm text-body-sm text-on-surface-variant">실시간 인프라 가용성 매트릭스</p>
</div>
</div>
<span class="w-2.5 h-2.5 rounded-full bg-secondary animate-pulse"></span>
</div>
<div class="flex flex-col gap-2 mt-space-sm">
<!-- Web Server -->
<div class="p-space-sm rounded-lg bg-surface-container-low flex items-center justify-between">
<div class="flex flex-col">
<span class="font-body-sm text-body-sm font-semibold text-on-surface">Web Server (Nginx Ingress / Pods 32/32)</span>
<span class="font-code-inline text-code-inline text-outline">Uptime 99.99% • Avg Latency 12ms</span>
</div>
<span class="px-2.5 py-0.5 rounded-full bg-surface-container-highest text-on-surface font-code-inline text-code-inline font-bold">
              Normal
            </span>
</div>
<!-- Database -->
<div class="p-space-sm rounded-lg bg-surface-container-low flex items-center justify-between">
<div class="flex flex-col">
<span class="font-body-sm text-body-sm font-semibold text-on-surface">Database (PostgreSQL Multi-Cluster)</span>
<span class="font-code-inline text-code-inline text-outline">Replication Lag 0.2s • WAL Sync OK</span>
</div>
<span class="px-2.5 py-0.5 rounded-full bg-surface-container-highest text-on-surface font-code-inline text-code-inline font-bold">
              Normal
            </span>
</div>
<!-- Payment API -->
<div class="p-space-sm rounded-lg bg-error-container/60 flex items-center justify-between">
<div class="flex flex-col">
<span class="font-body-sm text-body-sm font-bold text-on-error-container">Payment API (KR-PG Gateway Integration Mesh)</span>
<span class="font-code-inline text-code-inline text-error font-semibold">High Latency &amp; Timeout Rate 4.8%</span>
</div>
<span class="px-2.5 py-0.5 rounded-full bg-error text-on-error font-code-inline text-code-inline font-bold flex items-center gap-1">
<span class="w-1.5 h-1.5 rounded-full bg-on-error animate-ping"></span>
              Error
            </span>
</div>
<!-- Monitoring -->
<div class="p-space-sm rounded-lg bg-surface-container-low flex items-center justify-between">
<div class="flex flex-col">
<span class="font-body-sm text-body-sm font-semibold text-on-surface">Monitoring (SentinelOps Telemetry Core)</span>
<span class="font-code-inline text-code-inline text-outline">Active Sensors 148 nodes • Loss 0.00%</span>
</div>
<span class="px-2.5 py-0.5 rounded-full bg-surface-container-highest text-on-surface font-code-inline text-code-inline font-bold">
              Normal
            </span>
</div>
<!-- Slack Integration -->
<div class="p-space-sm rounded-lg bg-surface-container-high/50 flex items-center justify-between">
<div class="flex flex-col">
<span class="font-body-sm text-body-sm font-semibold text-on-surface">Slack Integration (#alerts-critical-secops)</span>
<span class="font-code-inline text-code-inline text-secondary font-semibold">Rate-limit Warning 85% capacity</span>
</div>
<span class="px-2.5 py-0.5 rounded-full bg-primary-fixed text-on-primary-fixed font-code-inline text-code-inline font-bold">
              Warning
            </span>
</div>
</div>
</div>
<div class="pt-space-sm flex items-center justify-between font-code-inline text-code-inline text-on-surface-variant">
<span>Global Gateway Status</span>
<span class="text-error font-bold">1 DEGRADED NODE</span>
</div>
</section>
</div>
<!-- Section 6: Incident Detail View (인시던트 상세 분석 모달 / 슬라이드 오버 패널) -->
<!-- Modal Overlay Container -->
<div class="fixed inset-0 z-50 bg-primary-container/70 backdrop-blur-sm flex items-center justify-center p-space-md sm:p-space-lg transition-opacity duration-200" id="incidentModal">
<div class="bg-surface-container-lowest rounded-2xl shadow-xl w-full max-w-4xl max-h-[92vh] flex flex-col overflow-hidden transform transition-all">
<!-- Modal Header -->
<div class="p-space-md bg-surface-container-low flex items-start justify-between">
<div class="flex flex-col">
<div class="flex items-center gap-space-xs mb-1">
<span class="font-headline-sm text-headline-sm text-on-surface font-bold">Incident #INC-2025-8842</span>
<span class="px-2.5 py-0.5 rounded-full bg-error text-on-error font-code-inline text-code-inline font-bold">CRITICAL</span>
<span class="px-2.5 py-0.5 rounded-full bg-error-container text-on-error-container font-code-inline text-code-inline font-bold">OPEN</span>
</div>
<div class="flex items-center gap-space-sm font-code-inline text-code-inline text-on-surface-variant">
<span>Timestamp: 2025-05-18 14:35:21 KST</span>
<span>•</span>
<span>Triggered via Auto-Sentry Heartbeat #9921</span>
</div>
</div>
<button class="w-9 h-9 rounded-xl bg-surface-container hover:bg-surface-container-high text-on-surface flex items-center justify-center transition-colors" onclick="closeIncidentModal()">
<span class="material-symbols-outlined text-[20px]">close</span>
</button>
</div>
<!-- Modal Body (Scrollable) -->
<div class="p-space-lg overflow-y-auto flex-1 flex flex-col gap-space-lg">
<!-- 1. Metadata Grid -->
<div>
<div class="font-label-caps text-label-caps text-secondary uppercase font-bold tracking-wider mb-space-xs">인시던트 상세 메타데이터</div>
<div class="grid grid-cols-1 sm:grid-cols-2 gap-space-sm bg-surface-container-low p-space-md rounded-xl">
<div class="flex flex-col">
<span class="font-label-caps text-label-caps text-on-surface-variant uppercase">Affected Service</span>
<span class="font-body-md text-body-md font-semibold text-on-surface">Payment API <span class="font-code-inline text-code-inline text-outline">(Gateway Module v2.4.1)</span></span>
</div>
<div class="flex flex-col">
<span class="font-label-caps text-label-caps text-on-surface-variant uppercase">Error Class</span>
<span class="font-code-inline text-code-inline font-bold text-error">com.nexura.payment.exception.PaymentTimeoutException</span>
</div>
<div class="flex flex-col">
<span class="font-label-caps text-label-caps text-on-surface-variant uppercase">Affected Entity</span>
<span class="font-body-md text-body-md font-semibold text-on-surface">user_corp_8819 <span class="text-on-surface-variant font-normal">(주식회사 테크핀 엔터프라이즈)</span></span>
</div>
<div class="flex flex-col">
<span class="font-label-caps text-label-caps text-on-surface-variant uppercase">Request Telemetry</span>
<span class="font-code-inline text-code-inline text-on-surface">POST /api/v2/payments/settle (IP: 211.234.12.89 | Trace-ID: 7a8f9c0e2b)</span>
</div>
</div>
</div>
<!-- 2. Stack Trace Preview -->
<div>
<div class="flex items-center justify-between mb-space-xs">
<span class="font-label-caps text-label-caps text-on-surface-variant uppercase font-bold tracking-wider">시스템 예외 스택 트레이스 (Stack Trace)</span>
<button class="text-secondary hover:underline font-code-inline text-code-inline flex items-center gap-1" id="copyBtn" onclick="copyStackTrace()">
<span class="material-symbols-outlined text-[14px]">content_copy</span>
<span>복사하기</span>
</button>
</div>
<div class="bg-primary-container p-space-md rounded-xl text-on-primary font-code-inline text-code-inline overflow-x-auto shadow-inner">
<div class="text-surface-variant">at com.nexura.payment.client.PgGatewayClient.executeSettle(PgGatewayClient.java:184)</div>
<div class="text-surface-variant">at com.nexura.payment.service.PaymentProcessor.process(PaymentProcessor.java:92)</div>
<div class="text-surface-variant">at com.nexura.payment.controller.PaymentApiController.settle(PaymentApiController.java:45)</div>
<div class="text-error-container font-bold mt-1">Caused by: java.net.SocketTimeoutException: Read timed out after 5000ms</div>
<div class="text-on-primary-container pl-4">at java.base/sun.nio.ch.NioSocketImpl.timedRead(NioSocketImpl.java:283)</div>
<div class="text-on-primary-container pl-4">at java.base/sun.nio.ch.NioSocketImpl.implRead(NioSocketImpl.java:309)</div>
</div>
</div>
<!-- 3. AI-assisted Analysis Section -->
<div class="p-space-md rounded-xl bg-surface-container-high/30 shadow-sm flex flex-col gap-space-sm">
<div class="flex flex-col sm:flex-row sm:items-center justify-between gap-2">
<div class="flex items-center gap-space-xs">
<div class="w-7 h-7 rounded-lg bg-secondary flex items-center justify-center text-on-secondary">
<span class="material-symbols-outlined text-[18px]">auto_awesome</span>
</div>
<span class="font-headline-sm text-headline-sm text-on-surface font-bold">AI-assisted Analysis</span>
<span class="px-2 py-0.5 rounded-full bg-secondary-fixed text-on-secondary-fixed font-code-inline text-[11px] font-bold">Admin Decision Support (보조용 분석 요약)</span>
</div>
</div>
<div class="p-space-xs bg-surface-container-lowest/80 rounded-lg text-outline font-body-sm text-body-sm flex items-center gap-1.5">
<span class="material-symbols-outlined text-[16px] text-secondary">info</span>
<span>본 AI 분석 결과는 시스템 관리자 및 엔지니어의 원인 파악을 지원하기 위한 보조 참고 자료입니다.</span>
</div>
<div class="grid grid-cols-1 md:grid-cols-2 gap-space-sm mt-1">
<div class="p-space-sm bg-surface-container-lowest rounded-lg">
<span class="font-label-caps text-label-caps text-secondary uppercase font-bold block mb-1">분석 요약 (Summary)</span>
<p class="font-body-sm text-body-sm text-on-surface leading-relaxed">
                NHN KCP PG 게이트웨이 커넥션 풀 고갈 및 소켓 읽기 타임아웃(5000ms 초과)으로 인한 결제 트랜잭션 롤백 발생.
              </p>
</div>
<div class="p-space-sm bg-surface-container-lowest rounded-lg">
<span class="font-label-caps text-label-caps text-error uppercase font-bold block mb-1">추정 원인 (Possible Cause)</span>
<p class="font-body-sm text-body-sm text-on-surface leading-relaxed">
                동시 결제 트래픽 급증 시 엔드포인트 커넥션 재사용 설정 미흡 또는 PG사 upstream 지연 발생 추정.
              </p>
</div>
</div>
<div class="p-space-sm bg-surface-container-lowest rounded-lg">
<span class="font-label-caps text-label-caps text-on-surface-variant uppercase font-bold block mb-1">Suggested Investigation Points (권장 조사 절차)</span>
<ol class="list-decimal list-inside font-body-sm text-body-sm text-on-surface space-y-1">
<li>PG사 엔드포인트 응답 핑 및 외부 통신 지연율 확인</li>
<li>Tomcat 커넥션 풀(HikariCP / HTTP Client pool) 최대 임계치 확인</li>
<li>장애 전후 배포된 커밋 내역 교차 검토</li>
</ol>
</div>
</div>
<!-- 4. Related Customer Inquiry & Potentially Related Change Grid -->
<div class="grid grid-cols-1 md:grid-cols-2 gap-space-sm">
<!-- Related Customer Inquiry -->
<div class="p-space-md rounded-xl bg-surface-container-low flex flex-col justify-between">
<div>
<div class="flex items-center gap-1 font-label-caps text-label-caps text-secondary uppercase font-bold mb-1">
<span class="material-symbols-outlined text-[16px]">link</span>
<span>Related Customer Inquiry (연계 문의)</span>
</div>
<p class="font-body-sm text-body-sm text-on-surface font-semibold mt-1">
                고객 문의 연계: <span class="text-error">[티켓 #SUP-4921]</span> "PG 결제 승인 과정에서 504 Gateway Timeout 오류 발생 건"
              </p>
<div class="font-code-inline text-code-inline text-on-surface-variant mt-1">
                접수: 14:36:10 | 작성자: 핀테크 코어인프라팀 박민수
              </div>
</div>
<div class="mt-space-sm pt-space-xs flex items-center justify-between font-body-sm text-body-sm">
<span class="text-outline">티켓 싱크 상태: ACTIVE</span>
<button class="text-secondary font-semibold hover:underline">티켓 바로가기</button>
</div>
</div>
<!-- Potentially Related Change -->
<div class="p-space-md rounded-xl bg-surface-container-low flex flex-col justify-between">
<div>
<div class="flex items-center gap-1 font-label-caps text-label-caps text-on-surface uppercase font-bold mb-1">
<span class="material-symbols-outlined text-[16px]">commit</span>
<span>Potentially Related Change</span>
</div>
<span class="font-label-caps text-[11px] text-outline block mb-1">
                (Do not claim that the commit caused the incident - 관리자 검토 권장)
              </span>
<div class="p-space-xs bg-surface-container-lowest rounded-lg font-code-inline text-code-inline text-on-surface mt-1">
<span class="font-bold text-secondary">commit 4e91b2c</span> "refactor(payment): update connection timeout parameters for KR-PG gateway"
                <div class="text-on-surface-variant text-[11px] mt-0.5">By dev_lead_kim • 2 hours ago</div>
</div>
</div>
<div class="mt-space-sm pt-space-xs flex items-center justify-between font-body-sm text-body-sm">
<span class="text-outline">GitHub Enterprise PR #1042</span>
<button class="text-secondary font-semibold hover:underline">Diff 비교</button>
</div>
</div>
</div>
</div>
<!-- Modal Footer -->
<div class="p-space-md bg-surface-container-low flex flex-col sm:flex-row items-center justify-between gap-space-sm">
<div class="flex items-center gap-space-xs text-on-surface-variant font-code-inline text-code-inline">
<span class="material-symbols-outlined text-[16px] text-secondary">security_update_good</span>
<span>SentinelOps Automated Audit Trail Active</span>
</div>
<div class="flex items-center gap-space-sm w-full sm:w-auto">
<button class="w-1/2 sm:w-auto px-space-md py-space-xs rounded-xl bg-surface-container hover:bg-surface-container-high text-on-surface font-body-sm text-body-sm font-semibold transition-colors" onclick="closeIncidentModal()">
            닫기 (Esc)
          </button>
<button class="w-1/2 sm:w-auto px-space-md py-space-xs rounded-xl bg-error hover:bg-primary text-on-error font-body-sm text-body-sm font-bold transition-colors inline-flex items-center justify-center gap-1 shadow-sm" onclick="triggerEmergencyAction()">
<span class="material-symbols-outlined text-[18px]">emergency_share</span>
<span>비상 워룸(War-Room) 소집</span>
</button>
</div>
</div>
</div>
</div>
<!-- Interactive Logic for Modal & Micro-Interactions -->
<script>
    function openIncidentModal() {
      const modal = document.getElementById('incidentModal');
      if (modal) {
        modal.classList.remove('hidden');
        modal.classList.add('flex');
        document.body.style.overflow = 'hidden';
      }
    }

    function closeIncidentModal() {
      const modal = document.getElementById('incidentModal');
      if (modal) {
        modal.classList.add('hidden');
        modal.classList.remove('flex');
        document.body.style.overflow = 'auto';
      }
    }

    function copyStackTrace() {
      const trace = `at com.nexura.payment.client.PgGatewayClient.executeSettle(PgGatewayClient.java:184)
at com.nexura.payment.service.PaymentProcessor.process(PaymentProcessor.java:92)
Caused by: java.net.SocketTimeoutException: Read timed out after 5000ms`;
      navigator.clipboard.writeText(trace).then(() => {
        const btn = document.getElementById('copyBtn');
        if (btn) {
          btn.innerHTML = '<span class="material-symbols-outlined text-[14px]">check</span><span>복사됨!</span>';
          setTimeout(() => {
            btn.innerHTML = '<span class="material-symbols-outlined text-[14px]">content_copy</span><span>복사하기</span>';
          }, 2000);
        }
      });
    }

    function triggerEmergencyAction() {
      alert("🚨 [긴급 알림 발송 완료]\n\nSlack #alerts-critical-secops 채널 및 온콜(On-Call) 엔지니어에게 비상 워룸 소집 호출이 전송되었습니다.");
    }

    // Close on Escape Key
    window.addEventListener('keydown', function(e) {
      if (e.key === 'Escape') {
        closeIncidentModal();
      }
    });

    // Default open on initial preview for user convenience to showcase Section 6
    document.addEventListener('DOMContentLoaded', () => {
      // Optional initial highlight
    });
  </script>
</div></main></div></body></html>