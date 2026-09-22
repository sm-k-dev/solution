<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0" name="viewport"/><meta content="web_blank" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&amp;family=JetBrains+Mono:wght@400;600&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base{html,body{margin:0;padding:0;}body{overscroll-behavior:none;}main>:first-child{margin-top:0!important;}main>:last-child{margin-bottom:0!important;}}::-webkit-scrollbar{display:none;}</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config={darkMode:"class",theme:{extend:{"colors":{"on-tertiary-fixed":"#001e2f","surface-container-highest":"#d3e4fe","background":"#f8f9ff","on-primary-container":"#76849f","tertiary-fixed-dim":"#89ceff","on-secondary":"#ffffff","on-secondary-fixed-variant":"#0039b3","on-error-container":"#93000a","tertiary-fixed":"#c9e6ff","surface":"#f8f9ff","on-surface":"#0b1c30","on-tertiary":"#ffffff","on-primary":"#ffffff","tertiary-container":"#001e2f","inverse-surface":"#213145","on-error":"#ffffff","surface-tint":"#515f78","inverse-primary":"#b9c7e4","primary-fixed":"#d6e3ff","surface-container-low":"#eff4ff","surface-container-high":"#dce9ff","secondary-fixed-dim":"#b6c4ff","surface-bright":"#f8f9ff","on-primary-fixed":"#0d1c32","tertiary":"#000000","primary-container":"#0d1c32","error-container":"#ffdad6","error":"#ba1a1a","surface-container":"#e5eeff","outline-variant":"#c5c6cd","surface-variant":"#d3e4fe","surface-dim":"#cbdbf5","on-tertiary-fixed-variant":"#004c6e","outline":"#75777e","inverse-on-surface":"#eaf1ff","on-background":"#0b1c30","on-surface-variant":"#44474d","on-secondary-fixed":"#001550","secondary-fixed":"#dce1ff","on-primary-fixed-variant":"#39475f","on-secondary-container":"#fffbff","primary":"#000000","primary-fixed-dim":"#b9c7e4","secondary-container":"#3f69f1","surface-container-lowest":"#ffffff","secondary":"#1c4fd7","on-tertiary-container":"#008cc7"},"borderRadius":{"DEFAULT":"0.125rem","lg":"0.25rem","xl":"0.5rem","full":"0.75rem"},"spacing":{"space-lg":"1.5rem","gutter-desktop":"2rem","space-md":"1rem","space-sm":"0.5rem","margin-desktop":"2rem","margin":"1.5rem","space-xs":"0.25rem","margin-mobile":"1rem","space-xl":"2.5rem","gutter-mobile":"1rem","gutter":"1.5rem"},"fontFamily":{"label-caps":["Inter"],"headline-sm":["Inter"],"body-md":["Inter"],"headline-md":["Inter"],"headline-lg":["Inter"],"headline-xl":["Inter"],"body-sm":["Inter"],"headline-xl-mobile":["Inter"],"code-inline":["JetBrains Mono"],"metric-val":["JetBrains Mono"],"body-lg":["Inter"],"display-hero-mobile":["Inter"],"display-hero":["Inter"]},"fontSize":{"label-caps":["11px",{"lineHeight":"16px","letterSpacing":"0.06em","fontWeight":"700"}],"headline-sm":["18px",{"lineHeight":"26px","letterSpacing":"0","fontWeight":"600"}],"body-md":["14px",{"lineHeight":"22px","letterSpacing":"0","fontWeight":"400"}],"headline-md":["22px",{"lineHeight":"30px","letterSpacing":"-0.005em","fontWeight":"600"}],"headline-lg":["28px",{"lineHeight":"36px","letterSpacing":"-0.01em","fontWeight":"600"}],"headline-xl":["36px",{"lineHeight":"44px","letterSpacing":"-0.02em","fontWeight":"700"}],"body-sm":["13px",{"lineHeight":"20px","letterSpacing":"0","fontWeight":"400"}],"headline-xl-mobile":["28px",{"lineHeight":"36px","letterSpacing":"-0.015em","fontWeight":"700"}],"code-inline":["12px",{"lineHeight":"18px","letterSpacing":"0","fontWeight":"400"}],"metric-val":["20px",{"lineHeight":"28px","letterSpacing":"-0.02em","fontWeight":"600"}],"body-lg":["16px",{"lineHeight":"26px","letterSpacing":"-0.005em","fontWeight":"400"}],"display-hero-mobile":["32px",{"lineHeight":"40px","letterSpacing":"-0.015em","fontWeight":"700"}],"display-hero":["44px",{"lineHeight":"56px","letterSpacing":"-0.02em","fontWeight":"700"}]}}}};</script></head><body class="bg-background font-body-md text-body-md text-on-surface antialiased min-h-screen">
<jsp:include page="/inc/top.jsp" /><main class="w-full bg-background"><div class="max-w-[1200px] mx-auto px-gutter-mobile md:px-gutter lg:px-gutter-desktop py-space-xl"><div class="flex flex-col w-full">
<!-- Top Breadcrumb & Hero Header -->
<section class="w-full mb-space-xl">
<!-- Breadcrumb Row -->
<nav aria-label="Breadcrumb" class="flex items-center gap-space-xs text-on-surface-variant font-body-sm text-body-sm mb-space-md">
<span class="material-symbols-outlined text-[16px] text-secondary">home</span>
<a class="hover:text-secondary transition-colors" href="#">홈</a>
<span class="material-symbols-outlined text-[14px] text-outline-variant">chevron_right</span>
<span class="font-headline-sm text-on-surface font-semibold text-[13px]">솔루션</span>
</nav>
<!-- Hero Titles & Identity Badge -->
<div class="flex flex-col md:flex-row md:items-end justify-between gap-space-md mb-space-lg">
<div>
<div class="inline-flex items-center gap-space-xs px-2.5 py-1 rounded-full bg-surface-container-high text-secondary font-label-caps text-label-caps tracking-wider uppercase mb-space-sm">
<span class="w-1.5 h-1.5 rounded-full bg-secondary"></span>
          Enterprise Solutions Suite
        </div>
<h1 class="font-display-hero text-display-hero text-on-surface tracking-tight">
          기업의 IT 환경을 위한 솔루션
        </h1>
<p class="font-body-lg text-body-lg text-on-surface-variant mt-space-xs">
          인프라부터 보안, 결제, 시스템 모니터링까지 전방위 미션 크리티컬 아키텍처를 제공합니다.
        </p>
</div>
<!-- Key Proof Status Badge -->
<div class="flex items-center gap-2 self-start md:self-auto bg-surface-container-lowest px-4 py-2 rounded-xl shadow-sm border border-outline-variant/30">
<span class="relative flex h-2 w-2">
<span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-secondary opacity-75"></span>
<span class="relative inline-flex rounded-full h-2 w-2 bg-secondary"></span>
</span>
<span class="font-code-inline text-code-inline text-on-surface-variant font-semibold">ALL CLUSTERS OPERATIONAL</span>
</div>
</div>
<!-- Proof Value Metrics Bar -->
<div class="grid grid-cols-1 md:grid-cols-3 gap-space-md p-space-md bg-surface-container-lowest rounded-xl shadow-sm border border-outline-variant/30">
<div class="flex items-center gap-space-md px-space-sm py-1">
<div class="w-10 h-10 rounded-lg bg-surface-container-low flex items-center justify-center text-secondary shrink-0">
<span class="material-symbols-outlined text-[20px]">verified_user</span>
</div>
<div>
<div class="font-headline-sm text-headline-sm text-on-surface font-semibold">SLA 99.99%</div>
<div class="font-body-sm text-body-sm text-on-surface-variant">엔터프라이즈 고가용성 무중단 보증</div>
</div>
</div>
<div class="flex items-center gap-space-md px-space-sm py-1 md:border-l border-outline-variant/40">
<div class="w-10 h-10 rounded-lg bg-surface-container-low flex items-center justify-center text-secondary shrink-0">
<span class="material-symbols-outlined text-[20px]">speed</span>
</div>
<div>
<div class="font-headline-sm text-headline-sm text-on-surface font-semibold">3.2Tbps</div>
<div class="font-body-sm text-body-sm text-on-surface-variant">글로벌 Anycast 스크러빙 &amp; 디도스 방어</div>
</div>
</div>
<div class="flex items-center gap-space-md px-space-sm py-1 md:border-l border-outline-variant/40">
<div class="w-10 h-10 rounded-lg bg-surface-container-low flex items-center justify-center text-secondary shrink-0">
<span class="material-symbols-outlined text-[20px]">psychology</span>
</div>
<div>
<div class="font-headline-sm text-headline-sm text-on-surface font-semibold">AIOps Telemetry</div>
<div class="font-body-sm text-body-sm text-on-surface-variant">인공지능 기반 실시간 사전 장애 예측</div>
</div>
</div>
</div>
</section>
<!-- 4-Column Solution Cards -->
<section class="w-full mb-space-xl">
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
<!-- 01 Web Hosting -->
<div class="group flex flex-col justify-between bg-surface-container-lowest rounded-xl p-space-lg shadow-sm border border-outline-variant/30 hover:border-secondary hover:shadow-md transition-all duration-300">
<div>
<div class="flex items-center justify-between mb-space-md">
<span class="font-code-inline text-code-inline text-on-surface-variant font-semibold tracking-wider">01 // INFRA</span>
<div class="w-10 h-10 rounded-lg bg-surface-container-low text-secondary flex items-center justify-center group-hover:bg-secondary group-hover:text-on-secondary transition-colors">
<span class="material-symbols-outlined text-[22px]">dns</span>
</div>
</div>
<h2 class="font-headline-md text-headline-md text-on-surface font-bold mb-space-xs">Web Hosting</h2>
<p class="font-body-sm text-body-sm font-semibold text-secondary mb-space-sm">안정적인 웹 서비스를 위한 서버 및 인프라 환경</p>
<p class="font-body-sm text-body-sm text-on-surface-variant leading-relaxed mb-space-md">
            Tier-IV 무중단 규격의 고성능 NVMe SAN 스토리지와 다중 전력 이중화망을 완비하여 대규모 워크로드를 안정적으로 지탱합니다.
          </p>
<div class="space-y-space-xs py-space-sm border-t border-outline-variant/20 mb-space-md">
<div class="flex items-start gap-2">
<span class="material-symbols-outlined text-[16px] text-secondary mt-0.5 shrink-0">check_circle</span>
<span class="font-body-sm text-body-sm text-on-surface">Tier-IV 무중단 고가용성 환경</span>
</div>
<div class="flex items-start gap-2">
<span class="material-symbols-outlined text-[16px] text-secondary mt-0.5 shrink-0">check_circle</span>
<span class="font-body-sm text-body-sm text-on-surface">오토스케일링 및 하이브리드 연동</span>
</div>
<div class="flex items-start gap-2">
<span class="material-symbols-outlined text-[16px] text-secondary mt-0.5 shrink-0">check_circle</span>
<span class="font-body-sm text-body-sm text-on-surface">24/7/365 하드웨어 리소스 관제</span>
</div>
</div>
</div>
<a class="inline-flex items-center justify-between w-full px-4 py-2.5 rounded-lg bg-surface-container-low text-on-surface font-body-sm font-semibold hover:bg-secondary hover:text-on-secondary transition-all" href="#infra-detail">
<span>자세히 보기</span>
<span class="material-symbols-outlined text-[18px]">arrow_forward</span>
</a>
</div>
<!-- 02 Web Security -->
<div class="group flex flex-col justify-between bg-surface-container-lowest rounded-xl p-space-lg shadow-sm border border-outline-variant/30 hover:border-secondary hover:shadow-md transition-all duration-300">
<div>
<div class="flex items-center justify-between mb-space-md">
<span class="font-code-inline text-code-inline text-on-surface-variant font-semibold tracking-wider">02 // DEFENSE</span>
<div class="w-10 h-10 rounded-lg bg-surface-container-low text-secondary flex items-center justify-center group-hover:bg-secondary group-hover:text-on-secondary transition-colors">
<span class="material-symbols-outlined text-[22px]">security</span>
</div>
</div>
<h2 class="font-headline-md text-headline-md text-on-surface font-bold mb-space-xs">Web Security</h2>
<p class="font-body-sm text-body-sm font-semibold text-secondary mb-space-sm">웹 서비스와 데이터 자산을 보호하는 방어망</p>
<p class="font-body-sm text-body-sm text-on-surface-variant leading-relaxed mb-space-md">
            OWASP Top 10 공격 차단 및 3.2Tbps 대용량 DDoS 유입을 실시간 격리하며 가상 패칭으로 제로데이 위협을 무력화합니다.
          </p>
<div class="space-y-space-xs py-space-sm border-t border-outline-variant/20 mb-space-md">
<div class="flex items-start gap-2">
<span class="material-symbols-outlined text-[16px] text-secondary mt-0.5 shrink-0">check_circle</span>
<span class="font-body-sm text-body-sm text-on-surface">Zero-Trust ID 및 세분화 ACL</span>
</div>
<div class="flex items-start gap-2">
<span class="material-symbols-outlined text-[16px] text-secondary mt-0.5 shrink-0">check_circle</span>
<span class="font-body-sm text-body-sm text-on-surface">실시간 L7 패킷 심층 분석 (DPI)</span>
</div>
<div class="flex items-start gap-2">
<span class="material-symbols-outlined text-[16px] text-secondary mt-0.5 shrink-0">check_circle</span>
<span class="font-body-sm text-body-sm text-on-surface">침해 긴급 자동 격리 및 가상 패치</span>
</div>
</div>
</div>
<a class="inline-flex items-center justify-between w-full px-4 py-2.5 rounded-lg bg-surface-container-low text-on-surface font-body-sm font-semibold hover:bg-secondary hover:text-on-secondary transition-all" href="#security-detail">
<span>자세히 보기</span>
<span class="material-symbols-outlined text-[18px]">arrow_forward</span>
</a>
</div>
<!-- 03 Web Payment -->
<div class="group flex flex-col justify-between bg-surface-container-lowest rounded-xl p-space-lg shadow-sm border border-outline-variant/30 hover:border-secondary hover:shadow-md transition-all duration-300">
<div>
<div class="flex items-center justify-between mb-space-md">
<span class="font-code-inline text-code-inline text-on-surface-variant font-semibold tracking-wider">03 // GATEWAY</span>
<div class="w-10 h-10 rounded-lg bg-surface-container-low text-secondary flex items-center justify-center group-hover:bg-secondary group-hover:text-on-secondary transition-colors">
<span class="material-symbols-outlined text-[22px]">credit_card</span>
</div>
</div>
<h2 class="font-headline-md text-headline-md text-on-surface font-bold mb-space-xs">Web Payment</h2>
<p class="font-body-sm text-body-sm font-semibold text-secondary mb-space-sm">안전하고 중단 없는 엔터프라이즈 결제 엔진</p>
<p class="font-body-sm text-body-sm text-on-surface-variant leading-relaxed mb-space-md">
            글로벌 최고 권위 PCI-DSS Level 1 인증 환경과 하드웨어 HSM 토큰화 체계로 국내외 결제 인프라를 신속하게 통합합니다.
          </p>
<div class="space-y-space-xs py-space-sm border-t border-outline-variant/20 mb-space-md">
<div class="flex items-start gap-2">
<span class="material-symbols-outlined text-[16px] text-secondary mt-0.5 shrink-0">check_circle</span>
<span class="font-body-sm text-body-sm text-on-surface">10,000 TPS 대용량 동시 트랜잭션</span>
</div>
<div class="flex items-start gap-2">
<span class="material-symbols-outlined text-[16px] text-secondary mt-0.5 shrink-0">check_circle</span>
<span class="font-body-sm text-body-sm text-on-surface">실시간 정산 및 불변 감사 추적</span>
</div>
<div class="flex items-start gap-2">
<span class="material-symbols-outlined text-[16px] text-secondary mt-0.5 shrink-0">check_circle</span>
<span class="font-body-sm text-body-sm text-on-surface">E2E 하드웨어 암호화 토큰화</span>
</div>
</div>
</div>
<a class="inline-flex items-center justify-between w-full px-4 py-2.5 rounded-lg bg-surface-container-low text-on-surface font-body-sm font-semibold hover:bg-secondary hover:text-on-secondary transition-all" href="#payment-detail">
<span>자세히 보기</span>
<span class="material-symbols-outlined text-[18px]">arrow_forward</span>
</a>
</div>
<!-- 04 SentinelOps (Prominent Distinguishing Style) -->
<div class="relative flex flex-col justify-between bg-primary-container text-on-primary rounded-xl p-space-lg shadow-xl ring-1 ring-tertiary-fixed-dim/40 overflow-hidden">
<!-- Subtle Glow Background Accent -->
<div class="absolute -top-12 -right-12 w-32 h-32 bg-secondary-container/20 rounded-full blur-2xl pointer-events-none"></div>
<div>
<!-- Top Badge & Number -->
<div class="flex items-center justify-between mb-space-sm">
<div class="inline-flex items-center gap-1.5 px-2 py-0.5 rounded-full bg-tertiary-container/80 text-tertiary-fixed font-label-caps text-label-caps border border-tertiary-fixed-dim/30">
<span class="w-1.5 h-1.5 rounded-full bg-tertiary-fixed-dim animate-pulse"></span>
              AI-Assisted Monitoring
            </div>
<span class="font-code-inline text-code-inline text-on-primary-container font-semibold">04 // AI-OPS</span>
</div>
<!-- Icon & Header -->
<div class="flex items-center gap-3 mt-space-sm mb-space-xs">
<div class="w-10 h-10 rounded-lg bg-tertiary-container text-tertiary-fixed-dim flex items-center justify-center border border-tertiary-fixed-dim/40">
<span class="material-symbols-outlined text-[24px]">radar</span>
</div>
<div>
<h2 class="font-headline-md text-headline-md text-on-primary font-bold tracking-tight">SentinelOps™</h2>
</div>
</div>
<p class="font-body-sm text-body-sm text-tertiary-fixed mb-space-sm font-medium">지능형 런타임 이상 탐지 및 자동 대응</p>
<p class="font-body-sm text-body-sm text-on-primary-container leading-relaxed mb-space-md">
            시스템 오류를 1초 내 식별하고 수만 줄의 로그를 3줄 요약하여 운영자가 원인과 솔루션을 즉각 도출하도록 지원합니다.
          </p>
<!-- SentinelOps Key Specialized Points -->
<div class="space-y-2 py-space-sm border-t border-on-primary-container/20 mb-space-md text-[13px]">
<div class="flex items-start gap-2">
<span class="material-symbols-outlined text-[16px] text-tertiary-fixed-dim mt-0.5 shrink-0">check_circle</span>
<span class="text-on-primary"><strong class="text-tertiary-fixed font-medium">Error Detection:</strong> 분산 환경 1초 내 감지</span>
</div>
<div class="flex items-start gap-2">
<span class="material-symbols-outlined text-[16px] text-tertiary-fixed-dim mt-0.5 shrink-0">check_circle</span>
<span class="text-on-primary"><strong class="text-tertiary-fixed font-medium">Severity:</strong> 비즈니스 영향도 P1~P4 자동 분류</span>
</div>
<div class="flex items-start gap-2">
<span class="material-symbols-outlined text-[16px] text-tertiary-fixed-dim mt-0.5 shrink-0">check_circle</span>
<span class="text-on-primary"><strong class="text-tertiary-fixed font-medium">AI Summary:</strong> 스택트레이스 3줄 핵심 요약</span>
</div>
<div class="flex items-start gap-2">
<span class="material-symbols-outlined text-[16px] text-tertiary-fixed-dim mt-0.5 shrink-0">check_circle</span>
<span class="text-on-primary"><strong class="text-tertiary-fixed font-medium">Slack Alert:</strong> 웹훅 채널 실시간 긴급 전파</span>
</div>
<div class="flex items-start gap-2">
<span class="material-symbols-outlined text-[16px] text-tertiary-fixed-dim mt-0.5 shrink-0">check_circle</span>
<span class="text-on-primary"><strong class="text-tertiary-fixed font-medium">Post-Mortem:</strong> 장애 타임라인 자동 리포트</span>
</div>
</div>
</div>
<a class="inline-flex items-center justify-between w-full px-4 py-2.5 rounded-lg bg-secondary text-on-secondary font-body-sm font-semibold hover:bg-secondary-container shadow-md transition-all" href="#sentinelops">
<span>SentinelOps 보기</span>
<span class="material-symbols-outlined text-[18px]">terminal</span>
</a>
</div>
</div>
</section>
<!-- Interactive Live Telemetry Demonstration Preview -->
<section class="w-full mb-space-xl p-space-lg bg-surface-container-lowest rounded-xl shadow-sm border border-outline-variant/30">
<div class="flex flex-col lg:flex-row items-start lg:items-center justify-between gap-space-md mb-space-lg pb-space-sm border-b border-outline-variant/20">
<div>
<div class="inline-flex items-center gap-1 font-code-inline text-code-inline text-secondary font-semibold uppercase">
<span class="material-symbols-outlined text-[15px]">sensors</span> Realtime Matrix
        </div>
<h3 class="font-headline-lg text-headline-lg text-on-surface font-bold">통합 인프라 관제 가용 지표</h3>
</div>
<div class="flex items-center gap-space-sm">
<span class="px-2.5 py-1 rounded bg-surface-container text-on-surface-variant font-code-inline text-[11px]">Sync Rate: 500ms</span>
<span class="px-2.5 py-1 rounded bg-surface-container text-secondary font-code-inline text-[11px] font-semibold">Edge-Nodes: 48 Active</span>
</div>
</div>
<!-- Telemetry Metric Strip -->
<div class="grid grid-cols-2 md:grid-cols-4 gap-4">
<div class="p-4 rounded-lg bg-surface-container-low">
<div class="text-on-surface-variant font-label-caps text-label-caps uppercase">System Throughput</div>
<div class="text-metric-val font-metric-val text-on-surface mt-1" id="metric-tps">12,482 <span class="text-body-sm font-normal text-on-surface-variant">req/s</span></div>
<div class="text-code-inline text-[11px] text-secondary mt-1 font-semibold">▲ +4.2% (정상 변동폭)</div>
</div>
<div class="p-4 rounded-lg bg-surface-container-low">
<div class="text-on-surface-variant font-label-caps text-label-caps uppercase">Global Packet Latency</div>
<div class="text-metric-val font-metric-val text-on-surface mt-1" id="metric-latency">1.84 <span class="text-body-sm font-normal text-on-surface-variant">ms</span></div>
<div class="text-code-inline text-[11px] text-secondary mt-1 font-semibold">Anycast 최적 경로 유지</div>
</div>
<div class="p-4 rounded-lg bg-surface-container-low">
<div class="text-on-surface-variant font-label-caps text-label-caps uppercase">Threat Filter Ratio</div>
<div class="text-metric-val font-metric-val text-on-surface mt-1">99.98%</div>
<div class="text-code-inline text-[11px] text-secondary mt-1 font-semibold">2,190 건 자동 차단/h</div>
</div>
<div class="p-4 rounded-lg bg-surface-container-low">
<div class="text-on-surface-variant font-label-caps text-label-caps uppercase">Sentinel ML Confidence</div>
<div class="text-metric-val font-metric-val text-on-surface mt-1">99.4%</div>
<div class="text-code-inline text-[11px] text-secondary mt-1 font-semibold">허위 경보(FP) 0.01% 미만</div>
</div>
</div>
</section>
<!-- Objective Solution Comparison Table -->
<section class="w-full mb-space-xl">
<div class="mb-space-md">
<div class="inline-flex items-center gap-1 font-code-inline text-code-inline text-secondary font-semibold uppercase">
<span class="material-symbols-outlined text-[15px]">compare_arrows</span> Architectural Comparison
      </div>
<h2 class="font-headline-lg text-headline-lg text-on-surface font-bold">
        솔루션별 핵심 스펙 및 영역 비교
      </h2>
<p class="font-body-md text-body-md text-on-surface-variant mt-1">
        주관적 평가나 단순 순위를 배제하고, 비즈니스 요건에 부합하는 객관적 아키텍처 기준을 제시합니다.
      </p>
</div>
<!-- Comparison Table Container -->
<div class="w-full overflow-x-auto rounded-xl shadow-sm border border-outline-variant/30 bg-surface-container-lowest">
<table class="w-full text-left border-collapse min-w-[760px]">
<thead>
<tr class="bg-surface-container-high/60 border-b border-outline-variant/30">
<th class="p-4 font-label-caps text-label-caps text-on-surface uppercase w-1/5">항목 및 비교 기준</th>
<th class="p-4 font-label-caps text-label-caps text-secondary uppercase w-1/5">인프라 (Web Hosting)</th>
<th class="p-4 font-label-caps text-label-caps text-secondary uppercase w-1/5">보안 (Web Security)</th>
<th class="p-4 font-label-caps text-label-caps text-secondary uppercase w-1/5">결제 (Web Payment)</th>
<th class="p-4 font-label-caps text-label-caps text-on-surface uppercase w-1/5 bg-surface-container-high">모니터링 (SentinelOps)</th>
</tr>
</thead>
<tbody class="divide-y divide-outline-variant/20 font-body-sm text-body-sm text-on-surface">
<!-- Row 1 -->
<tr class="hover:bg-surface-container-low/50 transition-colors">
<td class="p-4 font-semibold text-on-surface bg-surface-container-low/30">주요 적용 대상</td>
<td class="p-4 text-on-surface-variant">엔터프라이즈 포털, 대규모 웹 애플리케이션, 고성능 API 백본</td>
<td class="p-4 text-on-surface-variant">금융권 웹앱, 공공 포털, 디도스 노출 빈도가 높은 공용 엔드포인트</td>
<td class="p-4 text-on-surface-variant">이커머스, 구독 서비스, 정기 자동 과금 체계 보유 플랫폼</td>
<td class="p-4 text-on-surface bg-surface-container-low/40 font-medium">분산 마이크로서비스(MSA), 쿠버네티스 클러스터, 미션 크리티컬 DB</td>
</tr>
<!-- Row 2 -->
<tr class="hover:bg-surface-container-low/50 transition-colors">
<td class="p-4 font-semibold text-on-surface bg-surface-container-low/30">핵심 아키텍처</td>
<td class="p-4 text-on-surface-variant">베어메탈 전용 노드 + All-NVMe SAN + 다중 그리드 전력 회선</td>
<td class="p-4 text-on-surface-variant">글로벌 Anycast BGP 라우팅 + WAF + 실시간 DPI 엔진</td>
<td class="p-4 text-on-surface-variant">PCI-DSS L1 인증 HSM + 다중 PG 스마트 폴백 라우터</td>
<td class="p-4 text-on-surface bg-surface-container-low/40 font-medium">비동기 eBPF 커널 에이전트 + 시계열 Vector DB + AI 분석 엔진</td>
</tr>
<!-- Row 3 -->
<tr class="hover:bg-surface-container-low/50 transition-colors">
<td class="p-4 font-semibold text-on-surface bg-surface-container-low/30">가용성 &amp; 규격</td>
<td class="p-4 text-on-surface-variant">SLA 99.99% 보증, K-ISMS 관리체계 준수</td>
<td class="p-4 text-on-surface-variant">3.2Tbps 스크러빙 케파, OWASP Top 10 완벽 대응</td>
<td class="p-4 text-on-surface-variant">PCI-DSS v4.0 최상위 적격성, 전자금융감독규정 충족</td>
<td class="p-4 text-on-surface bg-surface-container-low/40 font-medium">장애 인지 지연 1초 이내, 비즈니스 P1~P4 자동 라벨링</td>
</tr>
<!-- Row 4 -->
<tr class="hover:bg-surface-container-low/50 transition-colors">
<td class="p-4 font-semibold text-on-surface bg-surface-container-low/30">운영 지원 체계</td>
<td class="p-4 text-on-surface-variant">24/7/365 전담 엔지니어 On-Site 상주 관제</td>
<td class="p-4 text-on-surface-variant">보안관제센터(SOC) 전문 분석가 위협 인텔리전스</td>
<td class="p-4 text-on-surface-variant">결제 장애 전용 핫라인 및 일일 자동 정산 리포트</td>
<td class="p-4 text-on-surface bg-surface-container-low/40 font-medium">Slack / Teams 즉시 웹훅 알림 + 포스트모텀 리포트 자동 생성</td>
</tr>
<!-- Row 5 -->
<tr class="hover:bg-surface-container-low/50 transition-colors">
<td class="p-4 font-semibold text-on-surface bg-surface-container-low/30">연동 및 배포 방식</td>
<td class="p-4 text-on-surface-variant">물리 전용선 구성, VPN 터널링, 프라이빗 클라우드 피어링</td>
<td class="p-4 text-on-surface-variant">DNS CNAME 전환 방식 (무중단 5분 적용 가능)</td>
<td class="p-4 text-on-surface-variant">RESTful API / SDK (JavaScript, Java, Python, Go)</td>
<td class="p-4 text-on-surface bg-surface-container-low/40 font-medium">원클릭 데몬셋(DaemonSet) 에이전트 및 OpenTelemetry 호환</td>
</tr>
</tbody>
</table>
</div>
</section>
<!-- Architecture Consultation CTA Section -->
<section class="w-full">
<div class="relative bg-primary-container text-on-primary rounded-2xl p-space-lg md:p-space-xl overflow-hidden shadow-xl">
<!-- Ambient Gradient Accents -->
<div class="absolute -bottom-24 -left-24 w-64 h-64 bg-secondary-container/30 rounded-full blur-3xl pointer-events-none"></div>
<div class="absolute top-0 right-0 w-80 h-80 bg-secondary/15 rounded-full blur-3xl pointer-events-none"></div>
<div class="relative z-10 flex flex-col lg:flex-row items-start lg:items-center justify-between gap-space-lg">
<div class="max-w-2xl">
<div class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-surface-container-lowest/10 text-tertiary-fixed font-code-inline text-code-inline mb-space-sm border border-white/10">
<span class="material-symbols-outlined text-[16px]">support_agent</span>
            ENTERPRISE ARCHITECTURE CONSULTING
          </div>
<h2 class="font-headline-xl text-headline-xl font-bold tracking-tight text-on-primary mb-space-xs">
            우리 회사에 필요한 최적의 솔루션을 상담해보세요
          </h2>
<p class="font-body-lg text-body-lg text-on-primary-container leading-relaxed">
            현재 운영 중인 서비스 환경과 향후 트래픽 계획에 적합한 1:1 맞춤형 아키텍처 설계와 PoC(개념증명) 일정을 엔지니어와 직접 상의하세요.
          </p>
<!-- Contact details block -->
<div class="flex flex-wrap items-center gap-y-2 gap-x-space-lg mt-space-md pt-space-md border-t border-white/10 text-body-sm font-body-sm text-on-primary-container">
<div class="flex items-center gap-2">
<span class="material-symbols-outlined text-tertiary-fixed-dim text-[18px]">call</span>
<span class="text-on-primary font-semibold">전화 상담: 1544-6820</span>
<span class="text-white/60">(평일 09:00 - 18:00)</span>
</div>
<div class="flex items-center gap-2">
<span class="material-symbols-outlined text-tertiary-fixed-dim text-[18px]">headset_mic</span>
<span class="text-on-primary font-semibold">24/7/365 기술지원 NOC 운영</span>
</div>
</div>
</div>
<!-- Action Buttons -->
<div class="flex flex-col sm:flex-row lg:flex-col gap-3 w-full sm:w-auto shrink-0">
<a class="inline-flex items-center justify-center gap-2 px-6 py-3.5 rounded-lg bg-secondary text-on-secondary font-headline-sm text-body-md font-semibold hover:bg-secondary-container transition-all shadow-md" href="#consult-form">
<span class="material-symbols-outlined text-[20px]">chat</span>
<span>전문 아키텍트 상담 문의</span>
</a>
<a class="inline-flex items-center justify-center gap-2 px-6 py-3.5 rounded-lg bg-white/10 text-on-primary font-body-md font-semibold hover:bg-white/15 transition-all border border-white/15" href="#download-spec">
<span class="material-symbols-outlined text-[20px]">file_download</span>
<span>솔루션 브로슈어 다운로드</span>
</a>
</div>
</div>
</div>
</section>
<!-- Telemetry Live Updates Simulation Micro-interaction -->
<script>
    (function() {
      const tpsEl = document.getElementById('metric-tps');
      const latEl = document.getElementById('metric-latency');
      if (tpsEl && latEl) {
        setInterval(() => {
          const delta = (Math.random() * 120 - 60).toFixed(0);
          const baseTps = 12480;
          const currentTps = (baseTps + parseInt(delta)).toLocaleString();
          tpsEl.innerHTML = currentTps + ' <span class="text-body-sm font-normal text-on-surface-variant">req/s</span>';

          const currentLat = (1.80 + (Math.random() * 0.08)).toFixed(2);
          latEl.innerHTML = currentLat + ' <span class="text-body-sm font-normal text-on-surface-variant">ms</span>';
        }, 3000);
      }
    })();
  </script>
</div></div></main><jsp:include page="/inc/bottom.jsp" />
</body></html>