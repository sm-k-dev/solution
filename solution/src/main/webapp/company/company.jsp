<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="ko"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Nexura Systems - 엔터프라이즈 미션 크리티컬 IT 인프라 &amp; 보안 솔루션</title>
<!-- Tailwind CSS v3 CDN with forms and container-queries -->

<!-- Tailwind Custom Configuration -->

<!-- Google Material Symbols & Web Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
<style data-purpose="custom-animations">
    @keyframes pulseGlow {
      0%, 100% { opacity: 0.8; transform: scale(1); }
      50% { opacity: 1; transform: scale(1.05); }
    }
    .animate-pulse-glow {
      animation: pulseGlow 3s ease-in-out infinite;
    }
  </style>
<meta content="web_blank" name="shell-type"/><link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/company_company.css"/></head>
<body class="bg-[#f8f9ff]">
<jsp:include page="/inc/top.jsp" />
<!-- BEGIN: MainContent -->
<!-- Note: Header and Footer are omitted per architecture requirements for JSP inclusion -->
<main class="w-full min-h-screen bg-[#f8f9ff] font-sans antialiased text-[#0b1c30]"><div class="flex flex-col w-full">
<!-- SECTION 1: Page Hero Section & Trust Indicators -->
<section class="w-full bg-surface py-20">
<div class="max-w-[1200px] mx-auto px-gutter-mobile md:px-gutter lg:px-gutter-desktop">
<!-- Breadcrumb Navigation -->
<nav aria-label="Breadcrumb" class="flex items-center gap-space-xs text-body-sm font-body-sm text-on-surface-variant mb-8">
<span class="material-symbols-outlined text-body-sm leading-none text-secondary">home</span>
<span class="text-on-surface-variant">홈</span>
<span class="material-symbols-outlined text-body-sm leading-none text-outline-variant">chevron_right</span>
<span class="text-on-surface font-semibold">회사소개</span>
</nav>
<!-- Badge & Hero Headings -->
<div class="flex flex-col items-start max-w-4xl mb-12">
<div class="inline-flex items-center gap-2 px-3.5 py-1.5 rounded-full bg-secondary-fixed text-on-secondary-fixed text-label-caps font-label-caps uppercase tracking-wider mb-6 shadow-sm">
<span class="w-2 h-2 rounded-full bg-secondary animate-pulse"></span>
ABOUT NEXORA SYSTEMS
</div>
<h1 class="text-display-hero-mobile md:text-display-hero font-display-hero text-on-background tracking-tight mb-6 leading-tight">
기술로 더 안정적인 디지털 환경을 만듭니다.
</h1>
<p class="text-body-lg font-body-lg text-on-surface-variant max-w-3xl leading-relaxed">
기업의 IT 인프라와 미션 크리티컬 서비스를 위한 신뢰할 수 있는 기술 파트너. 고성능 인프라 엔지니어링과 자율형 보안 텔레메트리로 무중단 비즈니스를 보증합니다.
</p>
</div>
<!-- Trust Metrics Strip -->
<div class="grid grid-cols-1 md:grid-cols-3 gap-6 pt-4">
<div class="flex items-center gap-5 p-6 rounded-2xl bg-surface-container-lowest shadow-sm hover:shadow-md transition-shadow border border-outline-variant/30">
<div class="flex items-center justify-center w-14 h-14 rounded-xl bg-surface-container text-secondary flex-shrink-0">
<span class="material-symbols-outlined text-headline-md" style="font-variation-settings: 'FILL' 1;">verified</span>
</div>
<div>
<div class="text-metric-val font-metric-val text-on-background text-xl font-bold">SLA 99.99%</div>
<div class="text-body-sm font-body-sm text-on-surface-variant mt-1">무중단 인프라 가용성 보장</div>
</div>
</div>
<div class="flex items-center gap-5 p-6 rounded-2xl bg-surface-container-lowest shadow-sm hover:shadow-md transition-shadow border border-outline-variant/30">
<div class="flex items-center justify-center w-14 h-14 rounded-xl bg-surface-container text-secondary flex-shrink-0">
<span class="material-symbols-outlined text-headline-md" style="font-variation-settings: 'FILL' 1;">security</span>
</div>
<div>
<div class="text-metric-val font-metric-val text-on-background text-xl font-bold">ISMS-P &amp; ISO 27001</div>
<div class="text-body-sm font-body-sm text-on-surface-variant mt-1">글로벌 최고 보안 규격 준수</div>
</div>
</div>
<div class="flex items-center gap-5 p-6 rounded-2xl bg-surface-container-lowest shadow-sm hover:shadow-md transition-shadow border border-outline-variant/30">
<div class="flex items-center justify-center w-14 h-14 rounded-xl bg-surface-container text-secondary flex-shrink-0">
<span class="material-symbols-outlined text-headline-md" style="font-variation-settings: 'FILL' 1;">account_balance</span>
</div>
<div>
<div class="text-metric-val font-metric-val text-on-background text-xl font-bold">500+ References</div>
<div class="text-body-sm font-body-sm text-on-surface-variant mt-1">금융 및 대규모 엔터프라이즈 레퍼런스</div>
</div>
</div>
</div>
</div>
</section>
<!-- SECTION 2: Company Introduction (Two-Column Section) -->
<section class="w-full bg-surface-container-low py-20">
<div class="max-w-[1200px] mx-auto px-gutter-mobile md:px-gutter lg:px-gutter-desktop">
<div class="grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-16 items-center">
<!-- Left Column: Narrative & Mission Pillars -->
<div class="lg:col-span-7 flex flex-col">
<div class="text-label-caps font-label-caps text-secondary uppercase tracking-wider mb-3">Mission &amp; Strategy</div>
<h2 class="text-headline-xl-mobile md:text-headline-xl font-headline-xl text-on-background tracking-tight mb-5 leading-tight">
우리는 기업의 디지털 환경을 설계합니다.
</h2>
<p class="text-body-md font-body-md text-on-surface-variant mb-8 leading-relaxed">
NEXORA는 예측 불가능한 분산 환경에서도 비즈니스가 언제나 흔들림 없이 가동될 수 있도록 시스템 코어부터 L7 애플리케이션 레벨까지 포괄적인 아키텍처를 구축합니다.
</p>
<!-- Core Capability List -->
<div class="space-y-4 mb-8">
<div class="flex items-start gap-4 p-4 rounded-xl bg-surface-container-lowest shadow-sm border border-outline-variant/30 hover:border-secondary/40 transition-colors">
<div class="flex items-center justify-center w-10 h-10 rounded-lg bg-surface-container text-secondary flex-shrink-0 mt-0.5">
<span class="material-symbols-outlined text-headline-sm">dns</span>
</div>
<div class="flex-1">
<strong class="text-body-md font-semibold text-on-background block mb-1">IT Infrastructure</strong>
<p class="text-body-sm font-body-sm text-on-surface-variant leading-relaxed">고성능 Tier-IV 데이터센터 및 맞춤형 베어메탈 고밀도 인프라 운영</p>
</div>
</div>
<div class="flex items-start gap-4 p-4 rounded-xl bg-surface-container-lowest shadow-sm border border-outline-variant/30 hover:border-secondary/40 transition-colors">
<div class="flex items-center justify-center w-10 h-10 rounded-lg bg-surface-container text-secondary flex-shrink-0 mt-0.5">
<span class="material-symbols-outlined text-headline-sm">shield_with_heart</span>
</div>
<div class="flex-1">
<strong class="text-body-md font-semibold text-on-background block mb-1">Integrated Security</strong>
<p class="text-body-sm font-body-sm text-on-surface-variant leading-relaxed">다계층 제로 트러스트 웹 방화벽(WAF) 및 Terabit급 안티 DDoS 능동 방어</p>
</div>
</div>
<div class="flex items-start gap-4 p-4 rounded-xl bg-surface-container-lowest shadow-sm border border-outline-variant/30 hover:border-secondary/40 transition-colors">
<div class="flex items-center justify-center w-10 h-10 rounded-lg bg-surface-container text-secondary flex-shrink-0 mt-0.5">
<span class="material-symbols-outlined text-headline-sm">credit_card</span>
</div>
<div class="flex-1">
<strong class="text-body-md font-semibold text-on-background block mb-1">Financial Payment</strong>
<p class="text-body-sm font-body-sm text-on-surface-variant leading-relaxed">금융보안원 가이드라인 및 PCI-DSS Level 1 공인 하드웨어 암호화 결제 엔진</p>
</div>
</div>
<div class="flex items-start gap-4 p-4 rounded-xl bg-surface-container-lowest shadow-sm border border-outline-variant/30 hover:border-secondary/40 transition-colors">
<div class="flex items-center justify-center w-10 h-10 rounded-lg bg-surface-container text-secondary flex-shrink-0 mt-0.5">
<span class="material-symbols-outlined text-headline-sm">monitoring</span>
</div>
<div class="flex-1">
<strong class="text-body-md font-semibold text-on-background block mb-1">SentinelOps™ Monitoring</strong>
<p class="text-body-sm font-body-sm text-on-surface-variant leading-relaxed">자율 인공지능 기반 사전 장애 이상징후 예측 및 초밀집 실시간 텔레메트리 관제</p>
</div>
</div>
<div class="flex items-start gap-4 p-4 rounded-xl bg-surface-container-lowest shadow-sm border border-outline-variant/30 hover:border-secondary/40 transition-colors">
<div class="flex items-center justify-center w-10 h-10 rounded-lg bg-surface-container text-secondary flex-shrink-0 mt-0.5">
<span class="material-symbols-outlined text-headline-sm">published_with_changes</span>
</div>
<div class="flex-1">
<strong class="text-body-md font-semibold text-on-background block mb-1">Operational Efficiency</strong>
<p class="text-body-sm font-body-sm text-on-surface-variant leading-relaxed">반복 수작업을 배제하는 자동화 프로비저닝과 24/7/365 엔지니어 현장 기술 지원</p>
</div>
</div>
</div>
<!-- Philosophy Callout Box -->
<div class="p-6 rounded-2xl bg-primary-container text-on-primary shadow-sm relative overflow-hidden">
<div class="absolute left-0 top-0 bottom-0 w-2 bg-secondary-container"></div>
<p class="text-body-md font-body-md text-primary-fixed pl-3 italic leading-relaxed">
"기술의 가치는 복잡함에 있지 않고, 가장 불안정한 순간에도 결코 멈추지 않는 지속성에 있습니다. NEXORA는 가장 견고한 디지털 기반을 약속합니다."
</p>
<div class="mt-3 pl-3 text-label-caps font-label-caps text-on-primary-container tracking-wider uppercase">
— NEXORA Architecture Committee
</div>
</div>
</div>
<!-- Right Column: Technology Architecture Vector Illustration -->
<div class="lg:col-span-5 flex flex-col items-center">
<div class="w-full bg-primary-container rounded-3xl p-6 shadow-xl text-center border border-white/10">
<div class="w-full rounded-2xl overflow-hidden bg-tertiary-container shadow-inner mx-auto">
<img alt="Nexura Enterprise Architecture" class="w-full h-auto aspect-square object-contain mx-auto" src="https://lh3.googleusercontent.com/aida/AEtjO1UGfu_zuUYcMBWgVx_FqM7pyNbRpNMSk0n5hRaqola4Q7Xyxl4m4stkysw7IAiS9U-cgV0-VMtjWDtH4TRHWQEMkAl7yGXC2uQ3S0dcG-pwkg-RmThZOIv1CR2IlBHXq3ip4I-7odXVTkU0byPheZKZTOjhTA8fKEcKrSMD8fgb_OLm9x5f2jpESq6NXjcQ3vy-5qzOMgeZ-eCcDUYvBOcDdIQ20PkY8LO6ZQsJH9kC6agI8XiezGG7dmo"/>
</div>
<div class="mt-5 text-left p-4 bg-surface-container-lowest/5 rounded-xl border border-white/5">
<div class="flex items-center gap-2 mb-1.5">
<span class="w-2 h-2 rounded-full bg-tertiary-fixed-dim"></span>
<span class="text-body-sm font-semibold text-primary-fixed">Unified Mesh Architecture</span>
</div>
<p class="text-code-inline font-code-inline text-on-primary-container leading-relaxed">
Seoul IDC (Primary) ⇄ Tokyo POP ⇄ Singapore Cloud Edge 전용 저지연 사설 백본망과 SentinelOps 지능형 패킷 필터링 연동.
</p>
</div>
</div>
</div>
</div>
</div>
</section>
<!-- SECTION 3: Core Values (4 Cards Grid) -->
<section class="w-full bg-surface py-20">
<div class="max-w-[1200px] mx-auto px-gutter-mobile md:px-gutter lg:px-gutter-desktop">
<div class="text-center max-w-2xl mx-auto mb-16">
<div class="text-label-caps font-label-caps text-secondary uppercase tracking-wider mb-3">Core Values</div>
<h2 class="text-headline-xl-mobile md:text-headline-xl font-headline-xl text-on-background tracking-tight mb-4">
NEXORA의 핵심 가치
</h2>
<p class="text-body-md font-body-md text-on-surface-variant leading-relaxed">
어떤 타협도 없는 엄격한 공학적 기준과 고객 중심의 책임 운영 체계를 고수합니다.
</p>
</div>
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
<!-- Card 1: Trust -->
<div class="p-7 rounded-2xl bg-surface-container-lowest shadow-sm hover:shadow-lg transition-all duration-200 flex flex-col justify-between group border border-outline-variant/30">
<div>
<div class="w-14 h-14 rounded-2xl bg-surface-container flex items-center justify-center text-secondary mb-6 group-hover:bg-secondary group-hover:text-on-secondary transition-colors">
<span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">verified_user</span>
</div>
<h3 class="text-headline-sm font-headline-sm text-on-background mb-1">신뢰</h3>
<span class="text-label-caps font-label-caps text-secondary uppercase tracking-wider block mb-4">Trust</span>
<p class="text-body-sm font-semibold text-on-surface mb-2">안정적인 서비스를 최우선으로 생각합니다.</p>
<p class="text-body-sm font-body-sm text-on-surface-variant leading-relaxed">
99.99% 가용성 보장 및 전문 선임 엔지니어 24시간 실시간 책임 관제로 무중단 운영을 실현합니다.
</p>
</div>
<div class="mt-6 pt-3 text-code-inline font-code-inline text-on-surface-variant flex items-center gap-1.5 border-t border-outline-variant/20">
<span class="material-symbols-outlined text-body-sm text-secondary">check_circle</span> 가용성 무결성 원칙
</div>
</div>
<!-- Card 2: Security -->
<div class="p-7 rounded-2xl bg-surface-container-lowest shadow-sm hover:shadow-lg transition-all duration-200 flex flex-col justify-between group border border-outline-variant/30">
<div>
<div class="w-14 h-14 rounded-2xl bg-surface-container flex items-center justify-center text-secondary mb-6 group-hover:bg-secondary group-hover:text-on-secondary transition-colors">
<span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">lock</span>
</div>
<h3 class="text-headline-sm font-headline-sm text-on-background mb-1">보안</h3>
<span class="text-label-caps font-label-caps text-secondary uppercase tracking-wider block mb-4">Security</span>
<p class="text-body-sm font-semibold text-on-surface mb-2">데이터와 시스템을 안전하게 보호합니다.</p>
<p class="text-body-sm font-body-sm text-on-surface-variant leading-relaxed">
Zero-Trust 철학 기반의 다중 암호화 레이어 및 글로벌 컴플라이언스 기준을 완벽하게 만족합니다.
</p>
</div>
<div class="mt-6 pt-3 text-code-inline font-code-inline text-on-surface-variant flex items-center gap-1.5 border-t border-outline-variant/20">
<span class="material-symbols-outlined text-body-sm text-secondary">check_circle</span> 데이터 주권 완벽 보호
</div>
</div>
<!-- Card 3: Innovation -->
<div class="p-7 rounded-2xl bg-surface-container-lowest shadow-sm hover:shadow-lg transition-all duration-200 flex flex-col justify-between group border border-outline-variant/30">
<div>
<div class="w-14 h-14 rounded-2xl bg-surface-container flex items-center justify-center text-secondary mb-6 group-hover:bg-secondary group-hover:text-on-secondary transition-colors">
<span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">psychology</span>
</div>
<h3 class="text-headline-sm font-headline-sm text-on-background mb-1">혁신</h3>
<span class="text-label-caps font-label-caps text-secondary uppercase tracking-wider block mb-4">Innovation</span>
<p class="text-body-sm font-semibold text-on-surface mb-2">새로운 기술을 실제 업무에 적용합니다.</p>
<p class="text-body-sm font-body-sm text-on-surface-variant leading-relaxed">
자율형 SentinelOps AI 엔진을 통한 실시간 이상 징후 자동 탐지 및 지능형 자율 완화 파이프라인.
</p>
</div>
<div class="mt-6 pt-3 text-code-inline font-code-inline text-on-surface-variant flex items-center gap-1.5 border-t border-outline-variant/20">
<span class="material-symbols-outlined text-body-sm text-secondary">check_circle</span> AIOps 능동형 인텔리전스
</div>
</div>
<!-- Card 4: Sustainability -->
<div class="p-7 rounded-2xl bg-surface-container-lowest shadow-sm hover:shadow-lg transition-all duration-200 flex flex-col justify-between group border border-outline-variant/30">
<div>
<div class="w-14 h-14 rounded-2xl bg-surface-container flex items-center justify-center text-secondary mb-6 group-hover:bg-secondary group-hover:text-on-secondary transition-colors">
<span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">autorenew</span>
</div>
<h3 class="text-headline-sm font-headline-sm text-on-background mb-1">지속가능성</h3>
<span class="text-label-caps font-label-caps text-secondary uppercase tracking-wider block mb-4">Sustainability</span>
<p class="text-body-sm font-semibold text-on-surface mb-2">장기적인 관점의 시스템을 설계합니다.</p>
<p class="text-body-sm font-body-sm text-on-surface-variant leading-relaxed">
엔터프라이즈 레거시 호환성과 클라우드 네이티브 확장을 유연하게 아우르는 고효율 친환경 인프라.
</p>
</div>
<div class="mt-6 pt-3 text-code-inline font-code-inline text-on-surface-variant flex items-center gap-1.5 border-t border-outline-variant/20">
<span class="material-symbols-outlined text-body-sm text-secondary">check_circle</span> 미래지향적 확장성
</div>
</div>
</div>
</div>
</section>
<!-- SECTION 4: Business Areas (4 Solution Cards) -->
<section class="w-full bg-surface-container-low py-20">
<div class="max-w-[1200px] mx-auto px-gutter-mobile md:px-gutter lg:px-gutter-desktop">
<div class="flex flex-col md:flex-row md:items-end justify-between mb-16 gap-4">
<div>
<div class="text-label-caps font-label-caps text-secondary uppercase tracking-wider mb-3">Enterprise Solutions Portfolio</div>
<h2 class="text-headline-xl-mobile md:text-headline-xl font-headline-xl text-on-background tracking-tight">
사업 분야
</h2>
</div>
<p class="text-body-sm font-body-sm text-on-surface-variant max-w-md leading-relaxed">
NEXORA의 핵심 기술력으로 완성된 4대 엔터프라이즈 솔루션 스위트를 확인하십시오.
</p>
</div>
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
<!-- Solution 1: Web Hosting -->
<div class="flex flex-col justify-between p-7 rounded-2xl bg-surface-container-lowest shadow-sm hover:shadow-md transition-all border border-outline-variant/30">
<div>
<div class="flex items-center justify-between mb-6">
<div class="w-12 h-12 rounded-xl bg-surface-container flex items-center justify-center text-secondary">
<span class="material-symbols-outlined text-headline-sm">cloud_done</span>
</div>
<span class="px-2.5 py-1 rounded-full bg-surface-container text-on-surface text-label-caps font-label-caps">Tier-IV</span>
</div>
<h3 class="text-headline-sm font-headline-sm text-on-background mb-3">Web Hosting</h3>
<p class="text-body-sm font-body-sm text-on-surface-variant mb-6 leading-relaxed">
안정적인 웹 서비스 운영을 위한 Tier-IV 엔터프라이즈 인프라 및 전용 베어메탈 고성능 서버 클러스터.
</p>
<ul class="space-y-2.5 text-body-sm font-body-sm text-on-surface mb-8">
<li class="flex items-center gap-2">
<span class="material-symbols-outlined text-secondary text-sm">check</span> 베어메탈 단독 격리 노드
</li>
<li class="flex items-center gap-2">
<span class="material-symbols-outlined text-secondary text-sm">check</span> NVMe 초고속 스토리지 레이드
</li>
<li class="flex items-center gap-2">
<span class="material-symbols-outlined text-secondary text-sm">check</span> 10Gbps+ 다중 회선 이중화
</li>
</ul>
</div>
<button class="inline-flex items-center gap-1.5 text-body-sm font-semibold text-secondary hover:text-secondary-container transition-colors pt-2" type="button">
솔루션 자세히 보기 <span class="material-symbols-outlined text-body-sm">arrow_forward</span>
</button>
</div>
<!-- Solution 2: Web Security -->
<div class="flex flex-col justify-between p-7 rounded-2xl bg-surface-container-lowest shadow-sm hover:shadow-md transition-all border border-outline-variant/30">
<div>
<div class="flex items-center justify-between mb-6">
<div class="w-12 h-12 rounded-xl bg-surface-container flex items-center justify-center text-secondary">
<span class="material-symbols-outlined text-headline-sm">shield</span>
</div>
<span class="px-2.5 py-1 rounded-full bg-secondary-fixed text-on-secondary-fixed text-label-caps font-label-caps">3.2 Tbps</span>
</div>
<h3 class="text-headline-sm font-headline-sm text-on-background mb-3">Web Security</h3>
<p class="text-body-sm font-body-sm text-on-surface-variant mb-6 leading-relaxed">
대용량 분산 DDoS 방어, 지능형 WAF, 봇 차단 및 실시간 웹 애플리케이션 보안 완화 체계.
</p>
<ul class="space-y-2.5 text-body-sm font-body-sm text-on-surface mb-8">
<li class="flex items-center gap-2">
<span class="material-symbols-outlined text-secondary text-sm">check</span> 3.2Tbps 글로벌 스크러빙 센터
</li>
<li class="flex items-center gap-2">
<span class="material-symbols-outlined text-secondary text-sm">check</span> OWASP Top 10 실시간 차단
</li>
<li class="flex items-center gap-2">
<span class="material-symbols-outlined text-secondary text-sm">check</span> 제로데이 취약점 패치 가상화
</li>
</ul>
</div>
<button class="inline-flex items-center gap-1.5 text-body-sm font-semibold text-secondary hover:text-secondary-container transition-colors pt-2" type="button">
솔루션 자세히 보기 <span class="material-symbols-outlined text-body-sm">arrow_forward</span>
</button>
</div>
<!-- Solution 3: Web Payment -->
<div class="flex flex-col justify-between p-7 rounded-2xl bg-surface-container-lowest shadow-sm hover:shadow-md transition-all border border-outline-variant/30">
<div>
<div class="flex items-center justify-between mb-6">
<div class="w-12 h-12 rounded-xl bg-surface-container flex items-center justify-center text-secondary">
<span class="material-symbols-outlined text-headline-sm">account_balance_wallet</span>
</div>
<span class="px-2.5 py-1 rounded-full bg-surface-container text-on-surface text-label-caps font-label-caps">PCI-DSS L1</span>
</div>
<h3 class="text-headline-sm font-headline-sm text-on-background mb-3">Web Payment</h3>
<p class="text-body-sm font-body-sm text-on-surface-variant mb-6 leading-relaxed">
글로벌 최고 권위 PCI-DSS Level 1 인증 준수, E2E 하드웨어 토큰 암호화 PG 연동 게이트웨이.
</p>
<ul class="space-y-2.5 text-body-sm font-body-sm text-on-surface mb-8">
<li class="flex items-center gap-2">
<span class="material-symbols-outlined text-secondary text-sm">check</span> 초당 10,000 TPS 트랜잭션
</li>
<li class="flex items-center gap-2">
<span class="material-symbols-outlined text-secondary text-sm">check</span> HSM 기반 토큰 암호화
</li>
<li class="flex items-center gap-2">
<span class="material-symbols-outlined text-secondary text-sm">check</span> 금융망 연계 전용선 인터페이스
</li>
</ul>
</div>
<button class="inline-flex items-center gap-1.5 text-body-sm font-semibold text-secondary hover:text-secondary-container transition-colors pt-2" type="button">
솔루션 자세히 보기 <span class="material-symbols-outlined text-body-sm">arrow_forward</span>
</button>
</div>
<!-- Solution 4: SentinelOps -->
<div class="flex flex-col justify-between p-7 rounded-2xl bg-surface-container-lowest shadow-sm hover:shadow-md transition-all border border-outline-variant/30">
<div>
<div class="flex items-center justify-between mb-6">
<div class="w-12 h-12 rounded-xl bg-surface-container flex items-center justify-center text-secondary">
<span class="material-symbols-outlined text-headline-sm">smart_toy</span>
</div>
<span class="px-2.5 py-1 rounded-full bg-secondary-fixed text-on-secondary-fixed text-label-caps font-label-caps">AIOps</span>
</div>
<h3 class="text-headline-sm font-headline-sm text-on-background mb-3">SentinelOps</h3>
<p class="text-body-sm font-body-sm text-on-surface-variant mb-6 leading-relaxed">
시스템 병목과 잠재적 오류를 머신러닝으로 사전에 감지하고 진단하는 AI 자율 모니터링 플랫폼.
</p>
<ul class="space-y-2.5 text-body-sm font-body-sm text-on-surface mb-8">
<li class="flex items-center gap-2">
<span class="material-symbols-outlined text-secondary text-sm">check</span> 사전 이상 징후 조기 경보
</li>
<li class="flex items-center gap-2">
<span class="material-symbols-outlined text-secondary text-sm">check</span> L7 분산 트레이싱 가시성
</li>
<li class="flex items-center gap-2">
<span class="material-symbols-outlined text-secondary text-sm">check</span> 자동 롤백 및 자가 치유(Self-heal)
</li>
</ul>
</div>
<button class="inline-flex items-center gap-1.5 text-body-sm font-semibold text-secondary hover:text-secondary-container transition-colors pt-2" type="button">
솔루션 자세히 보기 <span class="material-symbols-outlined text-body-sm">arrow_forward</span>
</button>
</div>
</div>
</div>
</section>
<!-- SECTION 5: Technology Stack & Enterprise Standards -->
<section class="w-full bg-surface py-20">
<div class="max-w-[1200px] mx-auto px-gutter-mobile md:px-gutter lg:px-gutter-desktop">
<div class="text-center max-w-3xl mx-auto mb-16">
<div class="text-label-caps font-label-caps text-secondary uppercase tracking-wider mb-3">Technology &amp; Architecture</div>
<h2 class="text-headline-xl-mobile md:text-headline-xl font-headline-xl text-on-background tracking-tight mb-4">
엔터프라이즈 기술 역량
</h2>
<p class="text-body-md font-body-md text-on-surface-variant leading-relaxed">
검증된 엔터프라이즈 표준 기술 스택과 엄격한 아키텍처 원칙을 바탕으로 고가용성 시스템을 구축합니다.
</p>
</div>
<!-- Capability Matrix Grid -->
<div class="grid grid-cols-1 md:grid-cols-3 gap-8">
<!-- Group 1: Backend Core & Middleware -->
<div class="p-8 rounded-2xl bg-surface-container-low shadow-sm border border-outline-variant/30">
<div class="flex items-center gap-3 mb-6 pb-2 border-b border-outline-variant/20">
<div class="w-9 h-9 rounded-lg bg-surface-container flex items-center justify-center text-secondary">
<span class="material-symbols-outlined text-xl">terminal</span>
</div>
<h3 class="text-headline-sm font-headline-sm text-on-background">Backend Core</h3>
</div>
<div class="space-y-4">
<div class="p-4 rounded-xl bg-surface-container-lowest shadow-sm border border-outline-variant/20">
<div class="flex items-center justify-between mb-2">
<span class="text-body-md font-semibold text-on-background">Java EE / Jakarta EE</span>
<span class="text-code-inline font-code-inline px-2 py-0.5 rounded bg-surface-container text-on-surface text-xs">Core Platform</span>
</div>
<p class="text-body-sm font-body-sm text-on-surface-variant leading-relaxed">
견고한 스레드 풀 관리와 객체 수명 주기를 보증하는 엔터프라이즈 백엔드 표준 코어.
</p>
</div>
<div class="p-4 rounded-xl bg-surface-container-lowest shadow-sm border border-outline-variant/20">
<div class="flex items-center justify-between mb-2">
<span class="text-body-md font-semibold text-on-background">Servlet / JSP</span>
<span class="text-code-inline font-code-inline px-2 py-0.5 rounded bg-surface-container text-on-surface text-xs">Presentation</span>
</div>
<p class="text-body-sm font-body-sm text-on-surface-variant leading-relaxed">
검증된 고성능 서버사이드 렌더링, 엄격한 세션 제어 및 가벼운 런타임 오버헤드.
</p>
</div>
<div class="p-4 rounded-xl bg-surface-container-lowest shadow-sm border border-outline-variant/20">
<div class="flex items-center justify-between mb-2">
<span class="text-body-md font-semibold text-on-background">REST API &amp; Microservices</span>
<span class="text-code-inline font-code-inline px-2 py-0.5 rounded bg-surface-container text-on-surface text-xs">Interface</span>
</div>
<p class="text-body-sm font-body-sm text-on-surface-variant leading-relaxed">
보안 토큰(JWT/HMAC) 기반 서비스 연계 및 외부 결제 기관과의 무결성 통신 규격.
</p>
</div>
</div>
</div>
<!-- Group 2: Data Fabric & Cloud Mesh -->
<div class="p-8 rounded-2xl bg-surface-container-low shadow-sm border border-outline-variant/30">
<div class="flex items-center gap-3 mb-6 pb-2 border-b border-outline-variant/20">
<div class="w-9 h-9 rounded-lg bg-surface-container flex items-center justify-center text-secondary">
<span class="material-symbols-outlined text-xl">database</span>
</div>
<h3 class="text-headline-sm font-headline-sm text-on-background">Data &amp; Cloud Mesh</h3>
</div>
<div class="space-y-4">
<div class="p-4 rounded-xl bg-surface-container-lowest shadow-sm border border-outline-variant/20">
<div class="flex items-center justify-between mb-2">
<span class="text-body-md font-semibold text-on-background">MySQL Enterprise</span>
<span class="text-code-inline font-code-inline px-2 py-0.5 rounded bg-surface-container text-on-surface text-xs">Transaction</span>
</div>
<p class="text-body-sm font-body-sm text-on-surface-variant leading-relaxed">
Primary-Replica 분리 구성, ACID 완전 트랜잭션 및 자동 장애조치(Failover) 보증.
</p>
</div>
<div class="p-4 rounded-xl bg-surface-container-lowest shadow-sm border border-outline-variant/20">
<div class="flex items-center justify-between mb-2">
<span class="text-body-md font-semibold text-on-background">Hybrid Cloud Infrastructure</span>
<span class="text-code-inline font-code-inline px-2 py-0.5 rounded bg-surface-container text-on-surface text-xs">Virtualization</span>
</div>
<p class="text-body-sm font-body-sm text-on-surface-variant leading-relaxed">
온프레미스 베어메탈과 퍼블릭 멀티클라우드를 아우르는 통합 소프트웨어 정의 네트워크.
</p>
</div>
<div class="p-4 rounded-xl bg-surface-container-lowest shadow-sm border border-outline-variant/20">
<div class="flex items-center justify-between mb-2">
<span class="text-body-md font-semibold text-on-background">High-Speed Caching Layer</span>
<span class="text-code-inline font-code-inline px-2 py-0.5 rounded bg-surface-container text-on-surface text-xs">In-Memory</span>
</div>
<p class="text-body-sm font-body-sm text-on-surface-variant leading-relaxed">
대규모 트래픽 순간 집중에 대비한 분산 인메모리 세션 저장소 및 동적 쿼리 캐시.
</p>
</div>
</div>
</div>
<!-- Group 3: Intelligence & High Defense -->
<div class="p-8 rounded-2xl bg-surface-container-low shadow-sm border border-outline-variant/30">
<div class="flex items-center gap-3 mb-6 pb-2 border-b border-outline-variant/20">
<div class="w-9 h-9 rounded-lg bg-surface-container flex items-center justify-center text-secondary">
<span class="material-symbols-outlined text-xl">shield_lock</span>
</div>
<h3 class="text-headline-sm font-headline-sm text-on-background">Intelligence &amp; Defense</h3>
</div>
<div class="space-y-4">
<div class="p-4 rounded-xl bg-surface-container-lowest shadow-sm border border-outline-variant/20">
<div class="flex items-center justify-between mb-2">
<span class="text-body-md font-semibold text-on-background">SentinelOps AI Telemetry</span>
<span class="text-code-inline font-code-inline px-2 py-0.5 rounded bg-surface-container text-on-surface text-xs">ML Engine</span>
</div>
<p class="text-body-sm font-body-sm text-on-surface-variant leading-relaxed">
시계열 패턴 학습 기반 동적 임계치 산출 및 미세한 응답 지연 변동 사전 포착.
</p>
</div>
<div class="p-4 rounded-xl bg-surface-container-lowest shadow-sm border border-outline-variant/20">
<div class="flex items-center justify-between mb-2">
<span class="text-body-md font-semibold text-on-background">Hardware HSM &amp; Zero Trust</span>
<span class="text-code-inline font-code-inline px-2 py-0.5 rounded bg-surface-container text-on-surface text-xs">Cryptography</span>
</div>
<p class="text-body-sm font-body-sm text-on-surface-variant leading-relaxed">
하드웨어 보안 모듈 기반 키 관리와 모든 엔드포인트 세션 상시 신원 검증 체계.
</p>
</div>
<div class="p-4 rounded-xl bg-surface-container-lowest shadow-sm border border-outline-variant/20">
<div class="flex items-center justify-between mb-2">
<span class="text-body-md font-semibold text-on-background">Full-Stack L7 Monitoring</span>
<span class="text-code-inline font-code-inline px-2 py-0.5 rounded bg-surface-container text-on-surface text-xs">Observability</span>
</div>
<p class="text-body-sm font-body-sm text-on-surface-variant leading-relaxed">
커널 네트워크 스택부터 웹 세션 단위까지 끊김 없이 추적하는 통합 가시성 콘솔.
</p>
</div>
</div>
</div>
</div>
</div>
</section>
<!-- SECTION 6: Consultation CTA Banner -->
<section class="w-full bg-primary-container text-on-primary py-24 relative overflow-hidden">
<!-- Decorative Ambient Glow (Theme Compliant) -->
<div class="absolute -right-24 -top-24 w-96 h-96 rounded-full bg-secondary-container/20 blur-3xl pointer-events-none"></div>
<div class="absolute -left-24 -bottom-24 w-96 h-96 rounded-full bg-tertiary-fixed-dim/10 blur-3xl pointer-events-none"></div>
<div class="max-w-[1200px] mx-auto px-gutter-mobile md:px-gutter lg:px-gutter-desktop relative z-10">
<div class="p-10 md:p-12 rounded-3xl bg-tertiary-container shadow-2xl flex flex-col lg:flex-row lg:items-center justify-between gap-8 border border-white/10">
<div class="max-w-2xl">
<div class="inline-flex items-center gap-2 px-3.5 py-1.5 rounded-full bg-secondary text-on-secondary text-label-caps font-label-caps uppercase tracking-wider mb-5 shadow-sm">
<span class="material-symbols-outlined text-body-sm">support_agent</span>
ENTERPRISE ARCHITECTURE CONSULTING
</div>
<h2 class="text-headline-xl-mobile md:text-headline-xl font-headline-xl text-primary-fixed tracking-tight mb-4">
기업의 IT 환경에 대해 상담해보세요.
</h2>
<p class="text-body-md font-body-md text-on-primary-container leading-relaxed mb-6">
귀사의 서비스 규모와 보안 요구사항에 최적화된 맞춤형 엔터프라이즈 아키텍처를 제안해 드립니다. 1:1 전담 수석 아키텍트가 직접 시스템 진단과 컨설팅을 지원합니다.
</p>
<div class="flex flex-wrap items-center gap-y-3 gap-x-6 text-body-sm font-body-sm text-primary-fixed-dim">
<span class="flex items-center gap-2">
<span class="material-symbols-outlined text-body-sm text-secondary-fixed">call</span>
고객센터: <strong class="text-white font-semibold">1544-6820</strong> (평일 09:00 - 18:00)
</span>
<span class="hidden md:inline text-on-primary-container">|</span>
<span class="flex items-center gap-2">
<span class="material-symbols-outlined text-body-sm text-secondary-fixed">emergency</span>
긴급 기술지원 24/7/365 엔지니어 대기
</span>
</div>
</div>
<div class="flex-shrink-0">
<button class="inline-flex items-center justify-center gap-2 px-8 py-4 rounded-xl bg-secondary text-on-secondary font-headline-sm hover:bg-secondary-container hover:shadow-lg transition-all transform hover:-translate-y-0.5 active:translate-y-0 w-full sm:w-auto shadow-md font-medium" onclick="location.href='#contact'" type="button">
<span>문의하기</span>
<span class="material-symbols-outlined text-headline-sm">arrow_forward</span>
</button>
</div>
</div>
</div>
</section>
</div></main>
<!-- END: MainContent -->
<jsp:include page="/inc/bottom.jsp" />
</body></html>