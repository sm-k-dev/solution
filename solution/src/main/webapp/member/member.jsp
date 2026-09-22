<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0" name="viewport"/><meta content="web_blank" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base { html, body { margin: 0; padding: 0; } body { overscroll-behavior: none; } main > :first-child { margin-top: 0 !important; } main > :last-child { margin-bottom: 0 !important; } } ::-webkit-scrollbar { display: none; }</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { "colors": { "on-error": "#ffffff", "error-container": "#ffdad6", "secondary-container": "#3f69f1", "surface-container": "#e5eeff", "on-surface": "#0b1c30", "on-secondary-fixed-variant": "#0039b3", "primary-fixed": "#d6e3ff", "outline-variant": "#c5c6cd", "on-primary-fixed-variant": "#39475f", "inverse-surface": "#213145", "on-secondary-container": "#fffbff", "surface-variant": "#d3e4fe", "inverse-primary": "#b9c7e4", "surface-container-lowest": "#ffffff", "primary-fixed-dim": "#b9c7e4", "surface-dim": "#cbdbf5", "surface-container-low": "#eff4ff", "surface-container-high": "#dce9ff", "on-secondary-fixed": "#001550", "tertiary-container": "#001e2f", "on-surface-variant": "#44474d", "surface-container-highest": "#d3e4fe", "secondary": "#1c4fd7", "secondary-fixed": "#dce1ff", "tertiary": "#000000", "on-background": "#0b1c30", "on-tertiary-fixed-variant": "#004c6e", "background": "#f8f9ff", "tertiary-fixed-dim": "#89ceff", "on-tertiary-container": "#008cc7", "secondary-fixed-dim": "#b6c4ff", "tertiary-fixed": "#c9e6ff", "on-error-container": "#93000a", "on-primary": "#ffffff", "surface-tint": "#515f78", "primary": "#000000", "surface": "#f8f9ff", "outline": "#75777e", "error": "#ba1a1a", "on-tertiary": "#ffffff", "primary-container": "#0d1c32", "inverse-on-surface": "#eaf1ff", "on-tertiary-fixed": "#001e2f", "on-primary-fixed": "#0d1c32", "surface-bright": "#f8f9ff", "on-primary-container": "#76849f", "on-secondary": "#ffffff" }, "borderRadius": { "DEFAULT": "0.125rem", "lg": "0.25rem", "xl": "0.5rem", "full": "0.75rem" }, "spacing": { "margin-mobile": "1rem", "space-lg": "1.5rem", "space-sm": "0.5rem", "gutter-desktop": "2rem", "gutter": "1.5rem", "margin": "1.5rem", "space-md": "1rem", "margin-desktop": "2rem", "space-xl": "2.5rem", "space-xs": "0.25rem", "gutter-mobile": "1rem" }, "fontFamily": { "headline-lg": [ "Inter" ], "headline-sm": [ "Inter" ], "headline-xl-mobile": [ "Inter" ], "metric-val": [ "JetBrains Mono" ], "headline-xl": [ "Inter" ], "display-hero": [ "Inter" ], "display-hero-mobile": [ "Inter" ], "body-md": [ "Inter" ], "headline-md": [ "Inter" ], "body-sm": [ "Inter" ], "label-caps": [ "Inter" ], "body-lg": [ "Inter" ], "code-inline": [ "JetBrains Mono" ] }, "fontSize": { "headline-lg": [ "28px", { "lineHeight": "36px", "letterSpacing": "-0.01em", "fontWeight": "600" } ], "headline-sm": [ "18px", { "lineHeight": "26px", "letterSpacing": "0", "fontWeight": "600" } ], "headline-xl-mobile": [ "28px", { "lineHeight": "36px", "letterSpacing": "-0.015em", "fontWeight": "700" } ], "metric-val": [ "20px", { "lineHeight": "28px", "letterSpacing": "-0.02em", "fontWeight": "600" } ], "headline-xl": [ "36px", { "lineHeight": "44px", "letterSpacing": "-0.02em", "fontWeight": "700" } ], "display-hero": [ "44px", { "lineHeight": "56px", "letterSpacing": "-0.02em", "fontWeight": "700" } ], "display-hero-mobile": [ "32px", { "lineHeight": "40px", "letterSpacing": "-0.015em", "fontWeight": "700" } ], "body-md": [ "14px", { "lineHeight": "22px", "letterSpacing": "0", "fontWeight": "400" } ], "headline-md": [ "22px", { "lineHeight": "30px", "letterSpacing": "-0.005em", "fontWeight": "600" } ], "body-sm": [ "13px", { "lineHeight": "20px", "letterSpacing": "0", "fontWeight": "400" } ], "label-caps": [ "11px", { "lineHeight": "16px", "letterSpacing": "0.06em", "fontWeight": "700" } ], "body-lg": [ "16px", { "lineHeight": "26px", "letterSpacing": "-0.005em", "fontWeight": "400" } ], "code-inline": [ "12px", { "lineHeight": "18px", "letterSpacing": "0", "fontWeight": "400" } ] } } } };</script></head><body class="bg-background font-body-md text-on-surface antialiased">
<jsp:include page="/inc/top.jsp" /><main class="min-h-screen w-full flex flex-col justify-center items-center py-space-xl px-gutter-mobile md:px-gutter lg:px-gutter-desktop"><div class="w-full max-w-[1200px] mx-auto"><div class="flex flex-col w-full">
<!-- Breadcrumb & Top Bar -->
<div class="flex flex-col md:flex-row md:items-center justify-between gap-4 pb-space-lg">
<div class="flex flex-col gap-1">
<nav class="flex items-center gap-1.5 text-on-surface-variant font-body-sm text-body-sm">
<span>홈</span>
<span class="material-symbols-outlined text-[16px] text-outline">chevron_right</span>
<span>마이페이지</span>
<span class="material-symbols-outlined text-[16px] text-outline">chevron_right</span>
<span class="text-on-surface font-semibold">회원정보 관리</span>
</nav>
<div class="flex items-center gap-2.5 mt-1">
<span class="bg-surface-container-high text-secondary text-label-caps font-label-caps px-2.5 py-0.5 rounded-full uppercase tracking-wider">
          Enterprise B2B Account
        </span>
<h1 class="font-headline-lg text-headline-lg text-on-surface tracking-tight">회원정보</h1>
</div>
<p class="font-body-md text-body-md text-on-surface-variant">
        회원님의 엔터프라이즈 계정 정보 및 보안 환경 설정을 통합 관리합니다.
      </p>
</div>
<div class="flex items-center gap-2 self-start md:self-auto bg-surface-container-lowest px-3.5 py-2 rounded-xl shadow-sm">
<span class="relative flex h-2.5 w-2.5">
<span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-secondary opacity-75"></span>
<span class="relative inline-flex rounded-full h-2.5 w-2.5 bg-secondary"></span>
</span>
<span class="font-body-sm text-body-sm text-on-surface-variant">보안 등급:</span>
<span class="font-body-sm text-body-sm font-semibold text-secondary">엔터프라이즈 최상위 (ISMS-P 보호 중)</span>
</div>
</div>
<!-- Profile Summary Card -->
<section class="bg-surface-container-lowest rounded-xl p-space-lg shadow-sm mb-space-lg">
<div class="flex flex-col lg:flex-row lg:items-center justify-between gap-6">
<!-- User Profile Left Group -->
<div class="flex items-start sm:items-center gap-4">
<div class="relative flex-shrink-0 w-16 h-16 rounded-xl bg-primary-container flex items-center justify-center text-on-primary shadow-inner">
<span class="font-headline-md text-headline-md tracking-wider">HG</span>
<span class="absolute -bottom-1 -right-1 flex h-5 w-5 rounded-full bg-secondary ring-2 ring-surface-container-lowest items-center justify-center">
<span class="material-symbols-outlined text-[13px] text-on-secondary" style="font-variation-settings: 'FILL' 1;">verified</span>
</span>
</div>
<div class="flex flex-col min-w-0">
<div class="flex flex-wrap items-center gap-2">
<h2 class="font-headline-sm text-headline-sm text-on-surface">홍길동 (Hong Gil-Dong)</h2>
<span class="bg-surface-container text-on-secondary-fixed-variant text-label-caps font-label-caps px-2 py-0.5 rounded">
              기업 마스터 계정
            </span>
</div>
<p class="font-body-sm text-body-sm text-on-surface-variant mt-0.5">
            (주)넥서라시스템즈 / 인프라보안팀 수석엔지니어
          </p>
</div>
</div>
<!-- Quick Metrics Grid / Badge Data -->
<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-3 pt-4 lg:pt-0">
<div class="bg-surface-container-low px-3.5 py-2.5 rounded-lg flex flex-col justify-center">
<span class="font-label-caps text-label-caps text-on-surface-variant uppercase">아이디 (ID)</span>
<div class="flex items-center gap-1.5 mt-0.5">
<span class="font-metric-val text-metric-val text-on-surface">nexora_admin</span>
</div>
</div>
<div class="bg-surface-container-low px-3.5 py-2.5 rounded-lg flex flex-col justify-center">
<span class="font-label-caps text-label-caps text-on-surface-variant uppercase">기업 이메일</span>
<div class="flex items-center gap-1 mt-0.5 truncate">
<span class="font-body-sm text-body-sm text-on-surface font-medium truncate">hong.gd@nexura-systems.com</span>
<span class="material-symbols-outlined text-[15px] text-secondary flex-shrink-0" title="인증 완료">check_circle</span>
</div>
</div>
<div class="bg-surface-container-low px-3.5 py-2.5 rounded-lg flex flex-col justify-center">
<span class="font-label-caps text-label-caps text-on-surface-variant uppercase">가입일자</span>
<span class="font-body-sm text-body-sm text-on-surface font-medium mt-0.5">
            2024.03.15 <span class="text-on-surface-variant text-[11px]">(412일째)</span>
</span>
</div>
<div class="bg-surface-container-low px-3.5 py-2.5 rounded-lg flex flex-col justify-center">
<span class="font-label-caps text-label-caps text-on-surface-variant uppercase">최종 로그인</span>
<div class="font-code-inline text-code-inline text-on-surface mt-0.5 leading-tight">
            2025-05-18 09:42<br/>
<span class="text-on-surface-variant text-[10px]">211.234.12.89 (서울)</span>
</div>
</div>
</div>
</div>
</section>
<!-- Activity Metrics (3 Columns) -->
<section class="grid grid-cols-1 md:grid-cols-3 gap-space-md mb-space-lg">
<!-- Card 1 -->
<div class="bg-surface-container-lowest p-5 rounded-xl shadow-sm hover:shadow-md transition-shadow flex flex-col justify-between">
<div class="flex items-start justify-between">
<div class="flex flex-col">
<span class="font-body-sm text-body-sm text-on-surface-variant font-medium">작성한 게시글</span>
<span class="font-metric-val text-headline-lg text-on-surface mt-1">14<span class="text-body-md font-body-md text-on-surface-variant ml-0.5">건</span></span>
<p class="font-body-sm text-body-sm text-outline mt-1">기술 Q&amp;A 및 커뮤니티 게시글</p>
</div>
<div class="w-10 h-10 rounded-lg bg-surface-container-low text-secondary flex items-center justify-center">
<span class="material-symbols-outlined text-[22px]">article</span>
</div>
</div>
<div class="pt-4 mt-2">
<a class="inline-flex items-center text-body-sm font-body-sm text-secondary font-medium hover:underline" href="#posts">
          게시글 보기 <span class="material-symbols-outlined text-[16px] ml-0.5">arrow_forward</span>
</a>
</div>
</div>
<!-- Card 2 -->
<div class="bg-surface-container-lowest p-5 rounded-xl shadow-sm hover:shadow-md transition-shadow flex flex-col justify-between">
<div class="flex items-start justify-between">
<div class="flex flex-col">
<span class="font-body-sm text-body-sm text-on-surface-variant font-medium">작성한 댓글</span>
<span class="font-metric-val text-headline-lg text-on-surface mt-1">48<span class="text-body-md font-body-md text-on-surface-variant ml-0.5">건</span></span>
<p class="font-body-sm text-body-sm text-outline mt-1">답변 및 피드백 댓글</p>
</div>
<div class="w-10 h-10 rounded-lg bg-surface-container-low text-secondary flex items-center justify-center">
<span class="material-symbols-outlined text-[22px]">forum</span>
</div>
</div>
<div class="pt-4 mt-2">
<a class="inline-flex items-center text-body-sm font-body-sm text-secondary font-medium hover:underline" href="#comments">
          댓글 보기 <span class="material-symbols-outlined text-[16px] ml-0.5">arrow_forward</span>
</a>
</div>
</div>
<!-- Card 3 -->
<div class="bg-surface-container-lowest p-5 rounded-xl shadow-sm hover:shadow-md transition-shadow flex flex-col justify-between">
<div class="flex items-start justify-between">
<div class="flex flex-col">
<div class="flex items-center gap-1.5">
<span class="font-body-sm text-body-sm text-on-surface-variant font-medium">문의 내역 (1:1/기술지원)</span>
<span class="h-2 w-2 rounded-full bg-secondary-container"></span>
</div>
<span class="font-metric-val text-headline-lg text-on-surface mt-1">3<span class="text-body-md font-body-md text-on-surface-variant ml-0.5">건</span></span>
<p class="font-body-sm text-body-sm text-outline mt-1 truncate">처리 완료 2건 · 처리 중 1건</p>
</div>
<div class="w-10 h-10 rounded-lg bg-surface-container-low text-secondary flex items-center justify-center">
<span class="material-symbols-outlined text-[22px]">support_agent</span>
</div>
</div>
<div class="pt-4 mt-2 flex items-center justify-between">
<a class="inline-flex items-center text-body-sm font-body-sm text-secondary font-medium hover:underline" href="#inquiries">
          문의 내역 보기 <span class="material-symbols-outlined text-[16px] ml-0.5">arrow_forward</span>
</a>
<span class="font-label-caps text-label-caps text-outline bg-surface-container px-1.5 py-0.5 rounded">SentinelOps 연동</span>
</div>
</div>
</section>
<!-- Main Grid: 2 Columns (60% / 40%) -->
<div class="grid grid-cols-1 lg:grid-cols-12 gap-space-lg mb-space-lg">
<!-- Left Column: Primary Account Info Form (~60%) -->
<div class="lg:col-span-7 flex flex-col">
<div class="bg-surface-container-lowest rounded-xl p-space-lg shadow-sm flex flex-col h-full justify-between">
<div>
<!-- Section Title -->
<div class="flex items-center justify-between pb-space-sm mb-space-md">
<div>
<h2 class="font-headline-sm text-headline-sm text-on-surface">기본 회원정보 수정</h2>
<p class="font-body-sm text-body-sm text-on-surface-variant mt-0.5">
                기업 담당자 연락처 및 사업장 주소를 최신 정보로 갱신할 수 있습니다.
              </p>
</div>
<span class="material-symbols-outlined text-outline text-[24px]">manage_accounts</span>
</div>
<!-- Form Area -->
<form class="space-y-4" id="memberInfoForm">
<!-- User ID (Read-only) -->
<div>
<label class="block font-body-sm text-body-sm font-medium text-on-surface mb-1.5">
                아이디 (User ID)
              </label>
<div class="relative flex items-center">
<input class="w-full h-11 px-3.5 bg-surface-container-low text-on-surface-variant font-code-inline text-code-inline rounded-lg cursor-not-allowed select-none focus:outline-none" readonly="" type="text" value="nexora_admin"/>
<span class="material-symbols-outlined absolute right-3 text-outline text-[18px]">lock</span>
</div>
<p class="font-body-sm text-body-sm text-outline mt-1 flex items-center gap-1">
<span class="material-symbols-outlined text-[14px]">info</span>
                아이디는 기업 보안 감사 규정 및 인증 토큰 발급 정책에 따라 변경할 수 없습니다.
              </p>
</div>
<!-- Name Input -->
<div>
<label class="block font-body-sm text-body-sm font-medium text-on-surface mb-1.5" for="memberName">
                담당자 성명 <span class="text-error">*</span>
</label>
<input class="w-full h-11 px-3.5 bg-surface-container-lowest text-on-surface font-body-md text-body-md rounded-lg shadow-sm focus:outline-none focus:bg-surface-container-lowest" id="memberName" required="" type="text" value="홍길동"/>
</div>
<!-- Corporate Email with action -->
<div>
<label class="block font-body-sm text-body-sm font-medium text-on-surface mb-1.5" for="memberEmail">
                기업 담당자 이메일 <span class="text-error">*</span>
</label>
<div class="flex flex-col sm:flex-row gap-2">
<div class="relative flex-1">
<input class="w-full h-11 px-3.5 bg-surface-container-lowest text-on-surface font-body-md text-body-md rounded-lg shadow-sm focus:outline-none" id="memberEmail" required="" type="email" value="hong.gd@nexura-systems.com"/>
<div class="absolute right-3 top-2.5 flex items-center gap-1 bg-surface-container px-2 py-0.5 rounded-full text-secondary text-label-caps font-label-caps">
<span class="material-symbols-outlined text-[14px]">check</span>
<span>인증완료</span>
</div>
</div>
<button class="h-11 px-4 rounded-lg bg-surface-container hover:bg-surface-container-high text-on-surface font-body-sm text-body-sm font-medium transition-colors flex items-center justify-center flex-shrink-0" type="button">
                  이메일 변경
                </button>
</div>
</div>
<!-- Phone Number -->
<div>
<label class="block font-body-sm text-body-sm font-medium text-on-surface mb-1.5" for="memberPhone">
                휴대폰 번호 <span class="text-error">*</span>
</label>
<input class="w-full h-11 px-3.5 bg-surface-container-lowest text-on-surface font-body-md text-body-md rounded-lg shadow-sm focus:outline-none" id="memberPhone" required="" type="tel" value="010-1234-5678"/>
</div>
<!-- Business Address -->
<div class="space-y-2">
<label class="block font-body-sm text-body-sm font-medium text-on-surface">
                사업장 / 납품 배송 주소
              </label>
<div class="flex gap-2">
<input class="w-32 h-11 px-3.5 bg-surface-container-low text-on-surface font-code-inline text-code-inline rounded-lg focus:outline-none" placeholder="우편번호" readonly="" type="text" value="06164"/>
<button class="h-11 px-4 rounded-lg bg-surface-container hover:bg-surface-container-high text-on-surface font-body-sm text-body-sm font-medium transition-colors flex items-center justify-center" type="button">
<span class="material-symbols-outlined text-[18px] mr-1.5">search</span>
                  우편번호 검색
                </button>
</div>
<input class="w-full h-11 px-3.5 bg-surface-container-low text-on-surface font-body-md text-body-md rounded-lg focus:outline-none" readonly="" type="text" value="서울특별시 강남구 영동대로 517 (삼성동)"/>
<input class="w-full h-11 px-3.5 bg-surface-container-lowest text-on-surface font-body-md text-body-md rounded-lg shadow-sm focus:outline-none" placeholder="상세 주소를 입력하세요" type="text" value="아셈타워 28층 클라우드 엔지니어링 랩"/>
</div>
</form>
</div>
<!-- Form Actions -->
<div class="pt-6 mt-6 flex flex-col sm:flex-row items-center gap-3">
<button class="w-full sm:w-auto h-11 px-6 rounded-lg bg-secondary hover:bg-secondary-container text-on-secondary font-body-md text-body-md font-medium shadow-sm flex items-center justify-center gap-1.5 transition-all" onclick="handleSaveSuccess()" type="button">
<span class="material-symbols-outlined text-[18px]">check</span>
            정보 수정 완료 (저장)
          </button>
<button class="w-full sm:w-auto h-11 px-5 rounded-lg bg-surface-container-low hover:bg-surface-container text-on-surface font-body-md text-body-md font-medium transition-colors flex items-center justify-center" form="memberInfoForm" type="reset">
            원래대로 되돌리기
          </button>
<div class="hidden text-secondary font-body-sm text-body-sm ml-auto items-center gap-1" id="saveNotice">
<span class="material-symbols-outlined text-[16px]">task_alt</span>
            수정 정보가 저장되었습니다.
          </div>
</div>
</div>
</div>
<!-- Right Column: Security, Password & MFA (~40%) -->
<div class="lg:col-span-5 flex flex-col gap-space-lg">
<!-- Card A: Password Change -->
<div class="bg-surface-container-lowest rounded-xl p-space-lg shadow-sm">
<div class="flex items-center justify-between pb-space-sm mb-space-md">
<div>
<h2 class="font-headline-sm text-headline-sm text-on-surface">비밀번호 변경</h2>
<p class="font-body-sm text-body-sm text-on-surface-variant mt-0.5">
              정기적인 패스워드 갱신으로 계정을 보호하세요.
            </p>
</div>
<span class="material-symbols-outlined text-outline text-[24px]">key</span>
</div>
<form class="space-y-3.5" id="passwordForm">
<!-- Current Password -->
<div>
<label class="block font-body-sm text-body-sm font-medium text-on-surface mb-1" for="currentPassword">
              현재 비밀번호
            </label>
<div class="relative flex items-center">
<input class="w-full h-11 px-3.5 pr-10 bg-surface-container-lowest text-on-surface font-body-md text-body-md rounded-lg shadow-sm focus:outline-none" id="currentPassword" placeholder="현재 비밀번호를 입력하세요" type="password"/>
<button class="absolute right-3 text-outline hover:text-on-surface focus:outline-none flex items-center" onclick="togglePasswordVisibility('currentPassword', this)" type="button">
<span class="material-symbols-outlined text-[20px]">visibility</span>
</button>
</div>
</div>
<!-- New Password -->
<div>
<label class="block font-body-sm text-body-sm font-medium text-on-surface mb-1" for="newPassword">
              새 비밀번호
            </label>
<div class="relative flex items-center">
<input class="w-full h-11 px-3.5 pr-10 bg-surface-container-lowest text-on-surface font-body-md text-body-md rounded-lg shadow-sm focus:outline-none" id="newPassword" placeholder="새 비밀번호 입력" type="password"/>
<button class="absolute right-3 text-outline hover:text-on-surface focus:outline-none flex items-center" onclick="togglePasswordVisibility('newPassword', this)" type="button">
<span class="material-symbols-outlined text-[20px]">visibility</span>
</button>
</div>
<p class="font-body-sm text-body-sm text-outline mt-1">
              8자 이상 영문 대소문자, 숫자, 특수문자 조합
            </p>
</div>
<!-- Confirm New Password -->
<div>
<label class="block font-body-sm text-body-sm font-medium text-on-surface mb-1" for="confirmPassword">
              새 비밀번호 확인
            </label>
<div class="relative flex items-center">
<input class="w-full h-11 px-3.5 pr-10 bg-surface-container-lowest text-on-surface font-body-md text-body-md rounded-lg shadow-sm focus:outline-none" id="confirmPassword" placeholder="새 비밀번호 다시 입력" type="password"/>
<button class="absolute right-3 text-outline hover:text-on-surface focus:outline-none flex items-center" onclick="togglePasswordVisibility('confirmPassword', this)" type="button">
<span class="material-symbols-outlined text-[20px]">visibility</span>
</button>
</div>
</div>
<div class="pt-2 text-right">
<span class="font-body-sm text-body-sm text-outline">
              마지막 변경일: <span class="font-medium text-on-surface">2025-02-10 (97일 전)</span>
</span>
</div>
<div class="pt-2">
<button class="w-full h-11 px-4 rounded-lg bg-primary-container hover:bg-on-surface text-on-primary font-body-md text-body-md font-medium shadow-sm transition-colors flex items-center justify-center gap-2" type="button">
<span class="material-symbols-outlined text-[18px]">lock_reset</span>
              비밀번호 변경 적용
            </button>
</div>
</form>
</div>
<!-- Card B: Security & Access Control -->
<div class="bg-surface-container-lowest rounded-xl p-space-lg shadow-sm">
<div class="flex items-center justify-between pb-space-sm mb-space-md">
<h2 class="font-headline-sm text-headline-sm text-on-surface">계정 보안 및 권한 정보</h2>
<span class="material-symbols-outlined text-outline text-[24px]">verified_user</span>
</div>
<div class="space-y-4">
<!-- 2FA Status -->
<div class="flex items-center justify-between p-3 rounded-lg bg-surface-container-low">
<div class="flex items-center gap-2.5">
<div class="w-8 h-8 rounded-lg bg-surface-container-highest text-secondary flex items-center justify-center">
<span class="material-symbols-outlined text-[18px]">phonelink_lock</span>
</div>
<div class="flex flex-col">
<span class="font-body-sm text-body-sm font-medium text-on-surface">2단계 다중 인증 (MFA)</span>
<span class="font-body-sm text-body-sm text-outline text-[12px]">FIDO2 / OTP 연동 활성화</span>
</div>
</div>
<span class="inline-flex items-center gap-1 px-2.5 py-1 rounded-full bg-surface-container text-secondary text-label-caps font-label-caps font-semibold">
<span class="h-1.5 w-1.5 rounded-full bg-secondary"></span>
              ENABLED
            </span>
</div>
<!-- Role Access Level -->
<div class="flex items-center justify-between p-3 rounded-lg bg-surface-container-low">
<div class="flex items-center gap-2.5">
<div class="w-8 h-8 rounded-lg bg-surface-container-highest text-secondary flex items-center justify-center">
<span class="material-symbols-outlined text-[18px]">admin_panel_settings</span>
</div>
<div class="flex flex-col">
<span class="font-body-sm text-body-sm font-medium text-on-surface">계정 접근 권한</span>
<span class="font-body-sm text-body-sm text-outline text-[12px]">최고 관리자 레벨 정책 적용</span>
</div>
</div>
<span class="font-code-inline text-code-inline text-on-surface font-semibold bg-surface-container px-2 py-1 rounded">
              ROLE_ADMIN
            </span>
</div>
<!-- Active Sessions -->
<div class="p-3 rounded-lg bg-surface-container-low flex flex-col gap-2">
<div class="flex items-center justify-between">
<div class="flex items-center gap-2">
<span class="material-symbols-outlined text-[18px] text-on-surface-variant">devices</span>
<span class="font-body-sm text-body-sm font-medium text-on-surface">세션 모니터링</span>
</div>
<span class="text-body-sm font-body-sm text-on-surface-variant">현재 기기 외 <span class="font-semibold text-secondary">1개</span> 활성</span>
</div>
<div class="flex items-center justify-between pt-1">
<span class="font-body-sm text-body-sm text-outline text-[12px]">Chrome on macOS · 서울</span>
<button class="font-body-sm text-body-sm text-error font-medium hover:underline flex items-center gap-1" type="button">
                다른 세션 모두 로그아웃
              </button>
</div>
</div>
</div>
</div>
</div>
</div>
<!-- Account Deletion Section (Explicitly separated subtle warning zone) -->
<section class="bg-surface-container-lowest rounded-xl p-space-lg shadow-sm">
<div class="flex flex-col md:flex-row md:items-center justify-between gap-6">
<div class="flex items-start gap-4">
<div class="w-10 h-10 rounded-lg bg-error-container text-error flex items-center justify-center flex-shrink-0">
<span class="material-symbols-outlined text-[22px]">warning</span>
</div>
<div class="flex flex-col">
<h2 class="font-headline-sm text-headline-sm text-on-surface">회원 탈퇴 및 서비스 해지 안내</h2>
<p class="font-body-sm text-body-sm text-on-surface-variant mt-1 max-w-3xl leading-relaxed">
            회원 탈퇴 시 등록된 기업 정보, 시스템 권한, SentinelOps 모니터링 연동 토큰 및 커뮤니티 활동 내역에 대한 접근 권한이 즉시 영구 상실됩니다. 법령 및 내부 감사 정책에 따라 일부 기록은 지정된 의무 보존 기간 동안 안전하게 보관 후 파기됩니다.
          </p>
</div>
</div>
<div class="flex flex-col sm:flex-row lg:flex-col xl:flex-row items-start sm:items-center gap-3 flex-shrink-0">
<a class="font-body-sm text-body-sm text-secondary hover:underline inline-flex items-center" href="#corporate-transfer">
          기업 계정 양도 및 대표자 변경 문의
          <span class="material-symbols-outlined text-[16px] ml-0.5">open_in_new</span>
</a>
<button class="h-10 px-4 rounded-lg bg-surface-container-lowest text-error hover:bg-error-container font-body-sm text-body-sm font-semibold transition-colors flex items-center justify-center gap-1.5 shadow-sm" onclick="confirmAccountTermination()" type="button">
<span class="material-symbols-outlined text-[18px]">person_remove</span>
          회원 탈퇴 신청
        </button>
</div>
</div>
</section>
</div>
<script>
  function togglePasswordVisibility(fieldId, buttonElement) {
    const input = document.getElementById(fieldId);
    if (!input) return;
    const icon = buttonElement.querySelector('.material-symbols-outlined');
    if (input.type === 'password') {
      input.type = 'text';
      if (icon) icon.textContent = 'visibility_off';
    } else {
      input.type = 'password';
      if (icon) icon.textContent = 'visibility';
    }
  }

  function handleSaveSuccess() {
    const notice = document.getElementById('saveNotice');
    if (notice) {
      notice.classList.remove('hidden');
      notice.classList.add('flex');
      setTimeout(() => {
        notice.classList.add('hidden');
        notice.classList.remove('flex');
      }, 3500);
    }
  }

  function confirmAccountTermination() {
    if (confirm('엔터프라이즈 마스터 계정 탈퇴 신청 시 기업 연계 서비스가 중단될 수 있습니다. 탈퇴 절차를 진행하시겠습니까?')) {
      alert('본인 확인 및 기업 대표자 확인 절차를 위해 고객지원센터로 연결됩니다.');
    }
  }
</script></div></main><jsp:include page="/inc/bottom.jsp" />
</body></html>