<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0" name="viewport"/><meta content="web_blank" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&amp;family=JetBrains+Mono:wght@400;600&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base{html,body{margin:0;padding:0;}body{overscroll-behavior:none;}main>:first-child{margin-top:0!important;}main>:last-child{margin-bottom:0!important;}}::-webkit-scrollbar{display:none;}</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config={darkMode:"class",theme:{extend:{colors:{"surface-container-low":"#eff4ff","inverse-on-surface":"#eaf1ff","tertiary-container":"#001e2f","inverse-primary":"#b9c7e4","primary-fixed":"#d6e3ff","on-secondary-fixed-variant":"#0039b3","outline-variant":"#c5c6cd","on-tertiary-fixed":"#001e2f","on-primary-container":"#76849f","surface":"#f8f9ff","on-surface-variant":"#44474d","tertiary":"#000000","on-primary":"#ffffff","on-secondary":"#ffffff","on-background":"#0b1c30","surface-dim":"#cbdbf5","surface-container-lowest":"#ffffff","tertiary-fixed-dim":"#89ceff","surface-bright":"#f8f9ff","on-tertiary":"#ffffff","on-primary-fixed":"#0d1c32","on-surface":"#0b1c30","outline":"#75777e","on-secondary-container":"#fffbff","surface-variant":"#d3e4fe","secondary-container":"#3f69f1","secondary-fixed":"#dce1ff","on-error":"#ffffff","secondary-fixed-dim":"#b6c4ff","primary":"#000000","primary-container":"#0d1c32","error":"#ba1a1a","surface-container-highest":"#d3e4fe","background":"#f8f9ff","inverse-surface":"#213145","primary-fixed-dim":"#b9c7e4","on-error-container":"#93000a","surface-container":"#e5eeff","on-tertiary-container":"#008cc7","on-tertiary-fixed-variant":"#004c6e","tertiary-fixed":"#c9e6ff","secondary":"#1c4fd7","error-container":"#ffdad6","surface-container-high":"#dce9ff","on-primary-fixed-variant":"#39475f","on-secondary-fixed":"#001550","surface-tint":"#515f78"},borderRadius:{DEFAULT:"0.125rem",lg:"0.25rem",xl:"0.5rem",full:"0.75rem"},spacing:{gutter:"1.5rem","space-lg":"1.5rem","space-sm":"0.5rem","gutter-mobile":"1rem",margin:"1.5rem","space-md":"1rem","space-xs":"0.25rem","margin-desktop":"2rem","gutter-desktop":"2rem","space-xl":"2.5rem","margin-mobile":"1rem"},fontFamily:{"headline-md":["Inter"],"headline-xl":["Inter"],"display-hero-mobile":["Inter"],"metric-val":["JetBrains Mono"],"body-md":["Inter"],"body-sm":["Inter"],"display-hero":["Inter"],"code-inline":["JetBrains Mono"],"headline-xl-mobile":["Inter"],"headline-lg":["Inter"],"label-caps":["Inter"],"headline-sm":["Inter"],"body-lg":["Inter"]},fontSize:{"headline-md":["22px",{lineHeight:"30px",letterSpacing:"-0.005em",fontWeight:"600"}],"headline-xl":["36px",{lineHeight:"44px",letterSpacing:"-0.02em",fontWeight:"700"}],"display-hero-mobile":["32px",{lineHeight:"40px",letterSpacing:"-0.015em",fontWeight:"700"}],"metric-val":["20px",{lineHeight:"28px",letterSpacing:"-0.02em",fontWeight:"600"}],"body-md":["14px",{lineHeight:"22px",letterSpacing:"0",fontWeight:"400"}],"body-sm":["13px",{lineHeight:"20px",letterSpacing:"0",fontWeight:"400"}],"display-hero":["44px",{lineHeight:"56px",letterSpacing:"-0.02em",fontWeight:"700"}],"code-inline":["12px",{lineHeight:"18px",letterSpacing:"0",fontWeight:"400"}],"headline-xl-mobile":["28px",{lineHeight:"36px",letterSpacing:"-0.015em",fontWeight:"700"}],"headline-lg":["28px",{lineHeight:"36px",letterSpacing:"-0.01em",fontWeight:"600"}],"label-caps":["11px",{lineHeight:"16px",letterSpacing:"0.06em",fontWeight:"700"}],"headline-sm":["18px",{lineHeight:"26px",letterSpacing:"0",fontWeight:"600"}],"body-lg":["16px",{lineHeight:"26px",letterSpacing:"-0.005em",fontWeight:"400"}]}}}};</script></head><body class="bg-background font-body-md text-body-md text-on-surface min-h-screen antialiased">
<jsp:include page="/inc/top.jsp" /><main class="w-full max-w-[1200px] mx-auto px-gutter-mobile lg:px-gutter-desktop py-space-xl"><div class="flex flex-col w-full space-y-12">
<!-- 1. Breadcrumb & Page Header Banner -->
<section class="flex flex-col gap-6 bg-surface-container-lowest p-8 md:p-10 rounded-xl shadow-sm">
<!-- Breadcrumb -->
<nav aria-label="Breadcrumb" class="flex items-center gap-2 text-body-sm text-outline">
<a class="hover:text-secondary transition-colors flex items-center gap-1" href="${pageContext.request.contextPath}/index.jsp">
<span class="material-symbols-outlined text-[16px]">home</span>
<span>홈</span>
</a>
<span class="material-symbols-outlined text-[14px] text-outline-variant">chevron_right</span>
<span class="text-on-surface font-semibold">고객센터</span>
</nav>
<!-- Header Content & Status Badges -->
<div class="flex flex-col lg:flex-row lg:items-end justify-between gap-6">
<div class="space-y-3 max-w-2xl">
<div class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-surface-container text-secondary font-label-caps text-label-caps">
<span class="w-2 h-2 rounded-full bg-secondary animate-pulse"></span>
          NEXURA SUPPORT SUITE
        </div>
<h1 class="font-headline-xl text-headline-xl text-on-surface tracking-tight">
          고객센터
        </h1>
<p class="font-body-lg text-body-lg text-on-surface-variant whitespace-pre-line leading-relaxed">
          서비스 이용에 필요한 정보를 확인하고
문제가 발생하면 문의해주세요.
        </p>
</div>
<!-- Operational Indicators -->
<div class="flex flex-wrap sm:flex-nowrap gap-3 items-center">
<div class="flex items-center gap-2.5 px-4 py-2.5 rounded-lg bg-surface-container-low text-on-surface shadow-xs">
<span class="relative flex h-2.5 w-2.5">
<span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-secondary opacity-75"></span>
<span class="relative inline-flex rounded-full h-2.5 w-2.5 bg-secondary"></span>
</span>
<div class="flex flex-col">
<span class="font-label-caps text-label-caps text-outline">SLA ENGINE</span>
<span class="font-body-sm text-body-sm font-semibold text-on-surface">24/7/365 긴급 기술지원 센터 운영</span>
</div>
</div>
<div class="flex items-center gap-2.5 px-4 py-2.5 rounded-lg bg-surface-container-low text-on-surface shadow-xs">
<span class="material-symbols-outlined text-secondary text-[20px]">timer</span>
<div class="flex flex-col">
<span class="font-label-caps text-label-caps text-outline">RESPONSE TARGET</span>
<span class="font-body-sm text-body-sm font-semibold text-on-surface">평균 1차 응답 시간 15분 이내</span>
</div>
</div>
</div>
</div>
</section>
<!-- 2. Quick Menu (4 Cards Grid) -->
<section class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
<!-- Card 1 -->
<a class="group relative flex flex-col justify-between p-6 rounded-xl bg-surface-container-lowest shadow-sm hover:shadow-md transition-all duration-200" href="#notice">
<div class="space-y-4">
<div class="w-12 h-12 rounded-xl bg-surface-container-low flex items-center justify-center text-secondary group-hover:bg-secondary group-hover:text-on-secondary transition-colors">
<span class="material-symbols-outlined text-[26px]">campaign</span>
</div>
<div>
<div class="inline-block px-2 py-0.5 mb-2 rounded bg-surface-container text-on-surface-variant text-[11px] font-medium">
            정기점검 및 보안 패치 안내
          </div>
<h2 class="font-headline-sm text-headline-sm text-on-surface group-hover:text-secondary transition-colors">
            공지사항
          </h2>
<p class="font-body-sm text-body-sm text-on-surface-variant mt-1">
            서비스 관련 주요 소식
          </p>
</div>
</div>
<div class="mt-6 flex items-center text-body-sm font-semibold text-secondary gap-1.5 group-hover:translate-x-1 transition-transform">
<span>공지사항 바로가기</span>
<span class="material-symbols-outlined text-[16px]">arrow_forward</span>
</div>
</a>
<!-- Card 2 -->
<a class="group relative flex flex-col justify-between p-6 rounded-xl bg-surface-container-lowest shadow-sm hover:shadow-md transition-all duration-200" href="#faq">
<div class="space-y-4">
<div class="w-12 h-12 rounded-xl bg-surface-container-low flex items-center justify-center text-secondary group-hover:bg-secondary group-hover:text-on-secondary transition-colors">
<span class="material-symbols-outlined text-[26px]">help_outline</span>
</div>
<div>
<div class="inline-block px-2 py-0.5 mb-2 rounded bg-surface-container text-on-surface-variant text-[11px] font-medium">
            분야별 핵심 가이드
          </div>
<h2 class="font-headline-sm text-headline-sm text-on-surface group-hover:text-secondary transition-colors">
            FAQ
          </h2>
<p class="font-body-sm text-body-sm text-on-surface-variant mt-1">
            자주 묻는 질문
          </p>
</div>
</div>
<div class="mt-6 flex items-center text-body-sm font-semibold text-secondary gap-1.5 group-hover:translate-x-1 transition-transform">
<span>FAQ 모아보기</span>
<span class="material-symbols-outlined text-[16px]">arrow_forward</span>
</div>
</a>
<!-- Card 3 -->
<a class="group relative flex flex-col justify-between p-6 rounded-xl bg-surface-container-lowest shadow-sm hover:shadow-md transition-all duration-200" href="#tech-support">
<div class="space-y-4">
<div class="w-12 h-12 rounded-xl bg-surface-container-low flex items-center justify-center text-secondary group-hover:bg-secondary group-hover:text-on-secondary transition-colors">
<span class="material-symbols-outlined text-[26px]">terminal</span>
</div>
<div>
<div class="inline-block px-2 py-0.5 mb-2 rounded bg-surface-container text-on-surface-variant text-[11px] font-medium">
            1:1 엔지니어 배정
          </div>
<h2 class="font-headline-sm text-headline-sm text-on-surface group-hover:text-secondary transition-colors">
            기술지원
          </h2>
<p class="font-body-sm text-body-sm text-on-surface-variant mt-1">
            서비스 이용 중 발생한 문제를 문의
          </p>
</div>
</div>
<div class="mt-6 flex items-center text-body-sm font-semibold text-secondary gap-1.5 group-hover:translate-x-1 transition-transform">
<span>기술지원 접수</span>
<span class="material-symbols-outlined text-[16px]">arrow_forward</span>
</div>
</a>
<!-- Card 4 -->
<a class="group relative flex flex-col justify-between p-6 rounded-xl bg-surface-container-lowest shadow-sm hover:shadow-md transition-all duration-200" href="${pageContext.request.contextPath}/customer/inquiry.jsp">
<div class="space-y-4">
<div class="w-12 h-12 rounded-xl bg-surface-container-low flex items-center justify-center text-secondary group-hover:bg-secondary group-hover:text-on-secondary transition-colors">
<span class="material-symbols-outlined text-[26px]">chat</span>
</div>
<div>
<div class="inline-block px-2 py-0.5 mb-2 rounded bg-surface-container text-on-surface-variant text-[11px] font-medium">
            도입 및 견적 문의
          </div>
<h2 class="font-headline-sm text-headline-sm text-on-surface group-hover:text-secondary transition-colors">
            문의하기
          </h2>
<p class="font-body-sm text-body-sm text-on-surface-variant mt-1">
            궁금한 사항을 직접 문의
          </p>
</div>
</div>
<div class="mt-6 flex items-center text-body-sm font-semibold text-secondary gap-1.5 group-hover:translate-x-1 transition-transform">
<span>일반 문의하기</span>
<span class="material-symbols-outlined text-[16px]">arrow_forward</span>
</div>
</a>
</section>
<!-- 3. Notice Preview -->
<section class="flex flex-col gap-4" id="notice">
<div class="flex items-center justify-between pb-1">
<div class="flex items-center gap-3">
<h2 class="font-headline-lg text-headline-lg text-on-surface">공지사항</h2>
<span class="text-label-caps font-label-caps px-2 py-0.5 rounded bg-surface-container text-on-surface-variant">LATEST BULLETINS</span>
</div>
<a class="flex items-center gap-1 text-body-sm font-semibold text-secondary hover:text-on-secondary-fixed-variant transition-colors" href="${pageContext.request.contextPath}/board/board.jsp">
<span>더보기</span>
<span class="material-symbols-outlined text-[16px]">add</span>
</a>
</div>
<!-- Desktop Data Table View -->
<div class="hidden md:block overflow-hidden rounded-xl bg-surface-container-lowest shadow-sm">
<table class="w-full text-left">
<thead class="bg-surface-container-low text-on-surface-variant font-label-caps text-label-caps">
<tr>
<th class="py-3 px-6 text-center w-20" scope="col">번호</th>
<th class="py-3 px-4 w-32" scope="col">분류</th>
<th class="py-3 px-6" scope="col">제목</th>
<th class="py-3 px-6 text-center w-36" scope="col">작성일</th>
<th class="py-3 px-6 text-right w-28" scope="col">조회수</th>
</tr>
</thead>
<tbody class="divide-y divide-transparent font-body-md text-body-md text-on-surface">
<tr class="hover:bg-surface-container-low transition-colors group cursor-pointer">
<td class="py-4 px-6 text-center font-code-inline text-code-inline text-outline">05</td>
<td class="py-4 px-4">
<span class="inline-flex items-center px-2 py-0.5 rounded text-[11px] font-semibold bg-error-container text-error">
                보안권고
              </span>
</td>
<td class="py-4 px-6">
<div class="flex items-center gap-2">
<span class="font-medium group-hover:text-secondary transition-colors">OpenSSL 및 커널 취약점 보안 패치 적용 안내</span>
<span class="px-1.5 py-0.2 rounded bg-error text-on-error font-label-caps text-[10px]">NEW</span>
</div>
</td>
<td class="py-4 px-6 text-center font-code-inline text-code-inline text-on-surface-variant">2026-03-28</td>
<td class="py-4 px-6 text-right font-code-inline text-code-inline text-on-surface-variant">1,420</td>
</tr>
<tr class="hover:bg-surface-container-low transition-colors group cursor-pointer bg-surface/50">
<td class="py-4 px-6 text-center font-code-inline text-code-inline text-outline">04</td>
<td class="py-4 px-4">
<span class="inline-flex items-center px-2 py-0.5 rounded text-[11px] font-semibold bg-surface-variant text-secondary">
                긴급점검
              </span>
</td>
<td class="py-4 px-6">
<span class="font-medium group-hover:text-secondary transition-colors">KT 목동 제1데이터센터 백본 네트워크 정기 점검 작업 안내</span>
</td>
<td class="py-4 px-6 text-center font-code-inline text-code-inline text-on-surface-variant">2026-03-24</td>
<td class="py-4 px-6 text-right font-code-inline text-code-inline text-on-surface-variant">2,890</td>
</tr>
<tr class="hover:bg-surface-container-low transition-colors group cursor-pointer">
<td class="py-4 px-6 text-center font-code-inline text-code-inline text-outline">03</td>
<td class="py-4 px-4">
<span class="inline-flex items-center px-2 py-0.5 rounded text-[11px] font-semibold bg-secondary-fixed text-on-secondary-fixed-variant">
                업데이트
              </span>
</td>
<td class="py-4 px-6">
<span class="font-medium group-hover:text-secondary transition-colors">SentinelOps™ v4.2 릴리즈 및 슬랙 웹훅 v2 마이그레이션 가이드</span>
</td>
<td class="py-4 px-6 text-center font-code-inline text-code-inline text-on-surface-variant">2026-03-18</td>
<td class="py-4 px-6 text-right font-code-inline text-code-inline text-on-surface-variant">3,150</td>
</tr>
<tr class="hover:bg-surface-container-low transition-colors group cursor-pointer bg-surface/50">
<td class="py-4 px-6 text-center font-code-inline text-code-inline text-outline">02</td>
<td class="py-4 px-4">
<span class="inline-flex items-center px-2 py-0.5 rounded text-[11px] font-semibold bg-surface-container text-on-surface-variant">
                안내
              </span>
</td>
<td class="py-4 px-6">
<span class="font-medium group-hover:text-secondary transition-colors">2026년 1분기 무중단 클라우드 인프라 및 WAF 보안 리포트 발행</span>
</td>
<td class="py-4 px-6 text-center font-code-inline text-code-inline text-on-surface-variant">2026-03-10</td>
<td class="py-4 px-6 text-right font-code-inline text-code-inline text-on-surface-variant">1,840</td>
</tr>
<tr class="hover:bg-surface-container-low transition-colors group cursor-pointer">
<td class="py-4 px-6 text-center font-code-inline text-code-inline text-outline">01</td>
<td class="py-4 px-4">
<span class="inline-flex items-center px-2 py-0.5 rounded text-[11px] font-semibold bg-surface-container text-on-surface-variant">
                안내
              </span>
</td>
<td class="py-4 px-6">
<span class="font-medium group-hover:text-secondary transition-colors">전자세금계산서 발행 및 결제 대행(PG) 정산 주기 변경 건</span>
</td>
<td class="py-4 px-6 text-center font-code-inline text-code-inline text-on-surface-variant">2026-03-02</td>
<td class="py-4 px-6 text-right font-code-inline text-code-inline text-on-surface-variant">960</td>
</tr>
</tbody>
</table>
</div>
<!-- Mobile Card/List View -->
<div class="flex flex-col gap-3 md:hidden">
<div class="p-4 rounded-xl bg-surface-container-lowest shadow-sm flex flex-col gap-2">
<div class="flex items-center justify-between">
<span class="px-2 py-0.5 rounded text-[11px] font-semibold bg-error-container text-error">보안권고</span>
<span class="font-code-inline text-code-inline text-outline">2026-03-28</span>
</div>
<p class="font-body-md font-semibold text-on-surface">OpenSSL 및 커널 취약점 보안 패치 적용 안내</p>
<div class="flex items-center justify-between text-body-sm text-outline pt-2">
<span>No. 05</span>
<span>조회 1,420</span>
</div>
</div>
<div class="p-4 rounded-xl bg-surface-container-lowest shadow-sm flex flex-col gap-2">
<div class="flex items-center justify-between">
<span class="px-2 py-0.5 rounded text-[11px] font-semibold bg-surface-variant text-secondary">긴급점검</span>
<span class="font-code-inline text-code-inline text-outline">2026-03-24</span>
</div>
<p class="font-body-md font-semibold text-on-surface">KT 목동 제1데이터센터 백본 네트워크 정기 점검 작업 안내</p>
<div class="flex items-center justify-between text-body-sm text-outline pt-2">
<span>No. 04</span>
<span>조회 2,890</span>
</div>
</div>
<div class="p-4 rounded-xl bg-surface-container-lowest shadow-sm flex flex-col gap-2">
<div class="flex items-center justify-between">
<span class="px-2 py-0.5 rounded text-[11px] font-semibold bg-secondary-fixed text-on-secondary-fixed-variant">업데이트</span>
<span class="font-code-inline text-code-inline text-outline">2026-03-18</span>
</div>
<p class="font-body-md font-semibold text-on-surface">SentinelOps™ v4.2 릴리즈 및 슬랙 웹훅 v2 마이그레이션 가이드</p>
<div class="flex items-center justify-between text-body-sm text-outline pt-2">
<span>No. 03</span>
<span>조회 3,150</span>
</div>
</div>
</div>
</section>
<!-- 4. FAQ Preview (자주 묻는 질문 아코디언) -->
<section class="flex flex-col gap-6" id="faq">
<div class="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
<div>
<h2 class="font-headline-lg text-headline-lg text-on-surface">자주 묻는 질문 (FAQ)</h2>
<p class="font-body-md text-body-md text-on-surface-variant">Nexura 고객들이 가장 빈번하게 조회한 기술 및 계약 관련 답변입니다.</p>
</div>
<!-- FAQ Tabs -->
<div class="flex flex-wrap gap-1.5 p-1 rounded-lg bg-surface-container">
<button class="faq-tab active px-3 py-1.5 rounded text-body-sm font-semibold bg-surface-container-lowest text-secondary shadow-xs transition-all" data-category="all" type="button">전체</button>
<button class="faq-tab px-3 py-1.5 rounded text-body-sm font-semibold text-on-surface-variant hover:text-on-surface transition-all" data-category="account" type="button">계정</button>
<button class="faq-tab px-3 py-1.5 rounded text-body-sm font-semibold text-on-surface-variant hover:text-on-surface transition-all" data-category="billing" type="button">결제</button>
<button class="faq-tab px-3 py-1.5 rounded text-body-sm font-semibold text-on-surface-variant hover:text-on-surface transition-all" data-category="service" type="button">서비스</button>
<button class="faq-tab px-3 py-1.5 rounded text-body-sm font-semibold text-on-surface-variant hover:text-on-surface transition-all" data-category="tech" type="button">기술지원</button>
<button class="faq-tab px-3 py-1.5 rounded text-body-sm font-semibold text-on-surface-variant hover:text-on-surface transition-all" data-category="security" type="button">보안</button>
</div>
</div>
<!-- Accordion Container -->
<div class="flex flex-col gap-3" id="faqAccordion">
<!-- Item 1: 기술지원 -->
<div class="faq-item rounded-xl bg-surface-container-lowest shadow-sm transition-all overflow-hidden" data-category="tech">
<button aria-expanded="false" class="faq-toggle w-full flex items-center justify-between p-5 text-left focus:outline-none" type="button">
<div class="flex items-center gap-3.5 pr-4">
<span class="flex-shrink-0 w-7 h-7 rounded-lg bg-secondary/10 text-secondary font-code-inline text-code-inline flex items-center justify-center font-bold">Q</span>
<span class="font-headline-sm text-headline-sm text-on-surface font-medium">
<span class="text-secondary font-semibold mr-1.5">[기술지원]</span>인프라 장애 발생 시 SLA 보상 및 긴급 NOC 연결 절차는 어떻게 되나요?
            </span>
</div>
<span class="material-symbols-outlined text-outline transition-transform duration-200 icon-arrow">expand_more</span>
</button>
<div class="faq-content hidden px-5 pb-5 pt-1">
<div class="p-4 rounded-lg bg-surface-container-low text-body-md text-on-surface-variant leading-relaxed">
<p>24/7/365 직통 NOC 핫라인(1544-6820)으로 즉시 연결되며, P1 긴급 인시던트의 경우 15분 이내 전담 엔지니어가 지정되어 텔레메트리 세션이 개시됩니다. 월간 가용률 99.99% 미달 시 SLA 규정에 따라 서비스 이용료 감면 조치가 적용됩니다.</p>
</div>
</div>
</div>
<!-- Item 2: 보안 -->
<div class="faq-item rounded-xl bg-surface-container-lowest shadow-sm transition-all overflow-hidden" data-category="security">
<button aria-expanded="false" class="faq-toggle w-full flex items-center justify-between p-5 text-left focus:outline-none" type="button">
<div class="flex items-center gap-3.5 pr-4">
<span class="flex-shrink-0 w-7 h-7 rounded-lg bg-secondary/10 text-secondary font-code-inline text-code-inline flex items-center justify-center font-bold">Q</span>
<span class="font-headline-sm text-headline-sm text-on-surface font-medium">
<span class="text-secondary font-semibold mr-1.5">[보안]</span>제로 트러스트 WAF 및 DDoS 방어 규칙은 실시간 적용이 가능한가요?
            </span>
</div>
<span class="material-symbols-outlined text-outline transition-transform duration-200 icon-arrow">expand_more</span>
</button>
<div class="faq-content hidden px-5 pb-5 pt-1">
<div class="p-4 rounded-lg bg-surface-container-low text-body-md text-on-surface-variant leading-relaxed">
<p>네, 글로벌 36개 Anycast PoP에 BGP Flowspec 및 커스텀 ACL 룰셋이 400ms 이내에 즉시 동기화되어 즉각적인 가상 패치(Virtual Patching)가 가능합니다.</p>
</div>
</div>
</div>
<!-- Item 3: 결제 -->
<div class="faq-item rounded-xl bg-surface-container-lowest shadow-sm transition-all overflow-hidden" data-category="billing">
<button aria-expanded="false" class="faq-toggle w-full flex items-center justify-between p-5 text-left focus:outline-none" type="button">
<div class="flex items-center gap-3.5 pr-4">
<span class="flex-shrink-0 w-7 h-7 rounded-lg bg-secondary/10 text-secondary font-code-inline text-code-inline flex items-center justify-center font-bold">Q</span>
<span class="font-headline-sm text-headline-sm text-on-surface font-medium">
<span class="text-secondary font-semibold mr-1.5">[결제]</span>신용카드 정기 과금 및 세금계산서 후불 정산 방식 전환이 가능한가요?
            </span>
</div>
<span class="material-symbols-outlined text-outline transition-transform duration-200 icon-arrow">expand_more</span>
</button>
<div class="faq-content hidden px-5 pb-5 pt-1">
<div class="p-4 rounded-lg bg-surface-container-low text-body-md text-on-surface-variant leading-relaxed">
<p>엔터프라이즈 전용 계약 고객의 경우 전자세금계산서 월말 익월 결제(Net-30) 및 다중 결제 수단 분할 청구를 지원합니다. 콘솔 관리자 패널의 청구 탭에서 증빙 서류 제출 후 즉시 전환 승인 프로세스가 진행됩니다.</p>
</div>
</div>
</div>
<!-- Item 4: 계정 -->
<div class="faq-item rounded-xl bg-surface-container-lowest shadow-sm transition-all overflow-hidden" data-category="account">
<button aria-expanded="false" class="faq-toggle w-full flex items-center justify-between p-5 text-left focus:outline-none" type="button">
<div class="flex items-center gap-3.5 pr-4">
<span class="flex-shrink-0 w-7 h-7 rounded-lg bg-secondary/10 text-secondary font-code-inline text-code-inline flex items-center justify-center font-bold">Q</span>
<span class="font-headline-sm text-headline-sm text-on-surface font-medium">
<span class="text-secondary font-semibold mr-1.5">[계정]</span>서브 관리자 계정 생성 및 역할 기반 접근 제어(RBAC)는 어떻게 설정하나요?
            </span>
</div>
<span class="material-symbols-outlined text-outline transition-transform duration-200 icon-arrow">expand_more</span>
</button>
<div class="faq-content hidden px-5 pb-5 pt-1">
<div class="p-4 rounded-lg bg-surface-container-low text-body-md text-on-surface-variant leading-relaxed">
<p>관리자 콘솔 &gt; 보안 설정 &gt; 접근 권한 메뉴에서 엔지니어, 재무담당자, 일반 모니터링 관리자 등 세분화된 RBAC 권한과 2차 인증(MFA)을 필수 구성할 수 있습니다. Okta 및 Azure AD SAML SSO 연동도 지원됩니다.</p>
</div>
</div>
</div>
<!-- Item 5: 서비스 -->
<div class="faq-item rounded-xl bg-surface-container-lowest shadow-sm transition-all overflow-hidden" data-category="service">
<button aria-expanded="false" class="faq-toggle w-full flex items-center justify-between p-5 text-left focus:outline-none" type="button">
<div class="flex items-center gap-3.5 pr-4">
<span class="flex-shrink-0 w-7 h-7 rounded-lg bg-secondary/10 text-secondary font-code-inline text-code-inline flex items-center justify-center font-bold">Q</span>
<span class="font-headline-sm text-headline-sm text-on-surface font-medium">
<span class="text-secondary font-semibold mr-1.5">[서비스]</span>SentinelOps 에이전트를 온프레미스 쿠버네티스 클러스터에도 설치할 수 있나요?
            </span>
</div>
<span class="material-symbols-outlined text-outline transition-transform duration-200 icon-arrow">expand_more</span>
</button>
<div class="faq-content hidden px-5 pb-5 pt-1">
<div class="p-4 rounded-lg bg-surface-container-low text-body-md text-on-surface-variant leading-relaxed">
<p>네, DaemonSet 형태의 초경량 eBPF 에이전트 또는 Helm 차트를 통해 프라이빗 IDC 및 퍼블릭 멀티클라우드 환경에 수분 내 배포 가능합니다. 클러스터 외부 아웃바운드 텔레메트리 포트(TCP 443)만 허용되어 있으면 완벽히 기능합니다.</p>
</div>
</div>
</div>
</div>
</section>
<!-- 5. Technical Support CTA Banner -->
<section class="relative overflow-hidden rounded-xl bg-primary-container text-on-primary p-8 md:p-12 shadow-xl" id="tech-support">
<!-- Ambient graphic accents -->
<div class="absolute -right-20 -top-20 w-80 h-80 rounded-full bg-secondary-container/20 blur-3xl pointer-events-none"></div>
<div class="absolute -left-20 -bottom-20 w-80 h-80 rounded-full bg-secondary/20 blur-3xl pointer-events-none"></div>
<div class="relative z-10 flex flex-col lg:flex-row items-start lg:items-center justify-between gap-8">
<div class="space-y-4 max-w-2xl">
<div class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-surface-container-highest/20 text-tertiary-fixed-dim text-label-caps font-label-caps">
<span class="material-symbols-outlined text-[14px]">shield</span>
          24/7 MISSION CRITICAL NOC
        </div>
<h2 class="font-headline-xl text-headline-xl tracking-tight text-on-primary">
          서비스 이용 중 문제가 발생했나요?
        </h2>
<p class="font-body-lg text-body-lg text-on-primary-container leading-relaxed">
          발생한 문제를 알려주시면 전담 엔지니어와 시스템 관리자가 실시간으로 확인하고 대응합니다.
        </p>
<!-- NOC Quick Info Cards -->
<div class="pt-4 flex flex-wrap items-center gap-4">
<div class="flex items-center gap-3 bg-surface-container-highest/10 px-4 py-3 rounded-lg backdrop-blur-sm">
<span class="material-symbols-outlined text-secondary-fixed text-[24px]">call</span>
<div class="flex flex-col">
<span class="text-label-caps font-label-caps text-on-primary-container">긴급 NOC 직통 핫라인</span>
<span class="font-metric-val text-metric-val text-on-primary font-bold">1544-6820</span>
</div>
</div>
<div class="flex items-center gap-3 bg-surface-container-highest/10 px-4 py-3 rounded-lg backdrop-blur-sm">
<span class="material-symbols-outlined text-secondary-fixed text-[24px]">bolt</span>
<div class="flex flex-col">
<span class="text-label-caps font-label-caps text-on-primary-container">평균 1차 조치 개시</span>
<span class="font-metric-val text-metric-val text-secondary-fixed font-bold">12분 이내</span>
</div>
</div>
</div>
</div>
<div class="flex flex-col gap-3 w-full lg:w-auto">
<button class="w-full lg:w-auto inline-flex items-center justify-center gap-3 px-8 py-4 rounded-xl bg-secondary hover:bg-secondary-container text-on-secondary font-headline-sm text-headline-sm transition-all shadow-md hover:shadow-lg" type="button">
<span>기술지원 문의 접수하기</span>
<span class="material-symbols-outlined text-[20px]">arrow_forward</span>
</button>
<span class="text-center text-body-sm text-on-primary-container">
          티켓 등록 즉시 P1-P4 우선순위가 자동 책정됩니다.
        </span>
</div>
</div>
</section>
<!-- 6. SentinelOps Connection (고객 문의 & 인시던트 연계 워크플로우) -->
<section class="flex flex-col gap-6 bg-surface-container-lowest p-8 md:p-10 rounded-xl shadow-sm">
<div class="max-w-3xl space-y-2">
<div class="inline-flex items-center gap-1.5 text-secondary font-label-caps text-label-caps">
<span class="material-symbols-outlined text-[16px]">sync_alt</span>
<span>INTELLIGENT ROOT CAUSE TELEMETRY</span>
</div>
<h2 class="font-headline-lg text-headline-lg text-on-surface">
        고객 문의와 시스템 인시던트의 유기적 연계
      </h2>
<p class="font-body-md text-body-md text-on-surface-variant leading-relaxed">
        단순 고객 문의에 그치지 않고, 시스템 로그 및 SentinelOps 텔레메트리를 결합하여 장애의 근본 원인을 과학적으로 규명합니다.
      </p>
</div>
<!-- Visual Flow Grid / Stepper -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-6 gap-4 pt-4">
<!-- Step 1 -->
<div class="relative flex flex-col p-5 rounded-xl bg-surface-container-low shadow-xs">
<div class="flex items-center justify-between mb-3">
<span class="font-code-inline text-code-inline font-bold text-secondary">STEP 01</span>
<span class="material-symbols-outlined text-outline text-[20px]">support_agent</span>
</div>
<h3 class="font-headline-sm text-headline-sm text-on-surface mb-1">고객 문의</h3>
<p class="font-body-sm text-body-sm text-on-surface-variant leading-normal">
          사용자가 오류 및 문의 등록 (시간, 계정, 증상)
        </p>
</div>
<!-- Step 2 -->
<div class="relative flex flex-col p-5 rounded-xl bg-surface-container-low shadow-xs">
<div class="flex items-center justify-between mb-3">
<span class="font-code-inline text-code-inline font-bold text-secondary">STEP 02</span>
<span class="material-symbols-outlined text-outline text-[20px]">assignment_ind</span>
</div>
<h3 class="font-headline-sm text-headline-sm text-on-surface mb-1">관리자 확인</h3>
<p class="font-body-sm text-body-sm text-on-surface-variant leading-normal">
          엔지니어가 티켓 접수 및 우선순위 지정
        </p>
</div>
<!-- Step 3 -->
<div class="relative flex flex-col p-5 rounded-xl bg-surface-container-low shadow-xs">
<div class="flex items-center justify-between mb-3">
<span class="font-code-inline text-code-inline font-bold text-secondary">STEP 03</span>
<span class="material-symbols-outlined text-outline text-[20px]">description</span>
</div>
<h3 class="font-headline-sm text-headline-sm text-on-surface mb-1">시스템 로그 확인</h3>
<p class="font-body-sm text-body-sm text-on-surface-variant leading-normal">
          발생 시점의 어플리케이션 &amp; 네트워크 로그 트레이싱
        </p>
</div>
<!-- Step 4 -->
<div class="relative flex flex-col p-5 rounded-xl bg-surface-container text-on-surface shadow-xs">
<div class="flex items-center justify-between mb-3">
<span class="font-code-inline text-code-inline font-bold text-secondary">STEP 04</span>
<span class="material-symbols-outlined text-secondary text-[20px]">hub</span>
</div>
<h3 class="font-headline-sm text-headline-sm text-on-surface mb-1">SentinelOps 매핑</h3>
<p class="font-body-sm text-body-sm text-on-surface-variant leading-normal">
          SentinelOps AI 텔레메트리 및 P1~P4 인시던트와 1:1 매핑
        </p>
</div>
<!-- Step 5 -->
<div class="relative flex flex-col p-5 rounded-xl bg-surface-container-low shadow-xs">
<div class="flex items-center justify-between mb-3">
<span class="font-code-inline text-code-inline font-bold text-secondary">STEP 05</span>
<span class="material-symbols-outlined text-outline text-[20px]">psychology</span>
</div>
<h3 class="font-headline-sm text-headline-sm text-on-surface mb-1">원인 분석</h3>
<p class="font-body-sm text-body-sm text-on-surface-variant leading-normal">
          규칙 기반 판정 및 AI 로그 요약으로 근본 원인(RCA) 도출
        </p>
</div>
<!-- Step 6 -->
<div class="relative flex flex-col p-5 rounded-xl bg-surface-container-low shadow-xs">
<div class="flex items-center justify-between mb-3">
<span class="font-code-inline text-code-inline font-bold text-secondary">STEP 06</span>
<span class="material-symbols-outlined text-outline text-[20px]">task_alt</span>
</div>
<h3 class="font-headline-sm text-headline-sm text-on-surface mb-1">처리 완료</h3>
<p class="font-body-sm text-body-sm text-on-surface-variant leading-normal">
          장애 조치 및 고객에게 상세 기술 리포트 회신
        </p>
</div>
</div>
<!-- High Assurance Callout Strip -->
<div class="flex items-start gap-4 p-5 rounded-xl bg-surface-container text-on-surface mt-2">
<span class="material-symbols-outlined text-secondary text-[24px] mt-0.5">verified_user</span>
<div class="space-y-1">
<p class="font-headline-sm text-headline-sm text-on-surface font-semibold">
          통합 인시던트 관제 타임라인
        </p>
<p class="font-body-md text-body-md text-on-surface-variant">
          고객 리포트(VOC)와 백엔드 시스템 인시던트를 관리자가 하나의 타임라인에서 교차 검증하므로, 불필요한 핑퐁 없이 신속 정확하게 원인을 해결합니다.
        </p>
</div>
</div>
</section>
</div>
<script>
  (function () {
    // FAQ Category Filter
    const tabs = document.querySelectorAll('.faq-tab');
    const items = document.querySelectorAll('.faq-item');

    tabs.forEach(tab => {
      tab.addEventListener('click', () => {
        tabs.forEach(t => {
          t.classList.remove('bg-surface-container-lowest', 'text-secondary', 'shadow-xs');
          t.classList.add('text-on-surface-variant');
        });
        tab.classList.add('bg-surface-container-lowest', 'text-secondary', 'shadow-xs');
        tab.classList.remove('text-on-surface-variant');

        const cat = tab.getAttribute('data-category');
        items.forEach(item => {
          if (cat === 'all' || item.getAttribute('data-category') === cat) {
            item.classList.remove('hidden');
          } else {
            item.classList.add('hidden');
          }
        });
      });
    });

    // FAQ Accordion Toggle
    const toggles = document.querySelectorAll('.faq-toggle');
    toggles.forEach(toggle => {
      toggle.addEventListener('click', () => {
        const expanded = toggle.getAttribute('aria-expanded') === 'true';
        const content = toggle.nextElementSibling;
        const icon = toggle.querySelector('.icon-arrow');

        // Toggle current item
        toggle.setAttribute('aria-expanded', !expanded);
        if (!expanded) {
          content.classList.remove('hidden');
          if (icon) icon.textContent = 'expand_less';
        } else {
          content.classList.add('hidden');
          if (icon) icon.textContent = 'expand_more';
        }
      });
    });
  })();
</script></main><jsp:include page="/inc/bottom.jsp" />
</body></html>