<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="ko"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Nexura Systems - 엔터프라이즈 미션 크리티컬 IT 인프라 &amp; 보안 솔루션</title>
<!-- Tailwind CSS v3 CDN with forms and container-queries -->
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<!-- Tailwind Custom Configuration -->
<script data-purpose="tailwind-config" id="tailwind-config">
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            brand: {
              navy: '#0a192f',
              dark: '#061122',
              surface: '#0b172a',
              card: '#0f2744',
              blue: '#1e50d8',
              cyan: '#00f2fe',
              lightcyan: '#38bdf8',
              accent: '#0284c7'
            }
          },
          fontFamily: {
            sans: ['Pretendard', '-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'sans-serif'],
          }
        }
      }
    }
  </script>
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
<meta content="web_blank" name="shell-type"/></head>
<body class="bg-[#f8f9ff]">
<jsp:include page="/inc/top.jsp" />
<!-- BEGIN: MainContent -->
<!-- Note: Header and Footer are omitted per architecture requirements for JSP inclusion -->
<main class="w-full min-h-screen bg-[#f8f9ff] font-sans antialiased text-[#0b1c30]"><div class="flex flex-col w-full">
<!-- MAIN CONTAINER (1200px Grid Architecture) -->
<div class="w-full max-w-[1200px] mx-auto px-4 sm:px-6 lg:px-8 py-8 md:py-12 space-y-16 md:space-y-24">
<!-- 1. BREADCRUMB & HERO SECTION -->
<section class="flex flex-col space-y-8">
<!-- Breadcrumb Navigation -->
<nav aria-label="Breadcrumb" class="flex items-center space-x-2 text-on-surface-variant font-body-sm text-body-sm">
<span>홈</span>
<span class="material-symbols-outlined text-[16px] text-outline">chevron_right</span>
<span>솔루션</span>
<span class="material-symbols-outlined text-[16px] text-outline">chevron_right</span>
<span class="text-on-surface font-semibold">SentinelOps</span>
</nav>
<!-- Hero Grid Layout -->
<div class="grid grid-cols-1 lg:grid-cols-12 gap-10 lg:gap-8 items-center">
<!-- Hero Left Column -->
<div class="lg:col-span-7 flex flex-col space-y-6">
<div class="inline-flex items-center space-x-2 px-3 py-1 rounded-full bg-surface-container w-fit">
<span class="w-2 h-2 rounded-full bg-secondary-container animate-pulse"></span>
<span class="font-label-caps text-label-caps text-secondary font-bold tracking-wider">AI-ASSISTED SYSTEM MONITORING</span>
</div>
<div class="space-y-4">
<h1 class="font-headline-xl text-headline-xl text-on-surface tracking-tight leading-snug">
              시스템 오류를 발견하는 것에서<br class="hidden sm:inline"/> 끝내지 않습니다.
            </h1>
<p class="font-body-lg text-body-lg text-on-surface-variant max-w-xl">
              오류를 탐지하고, 위험도를 분류하고, 원인을 이해하고, 대응까지 연결합니다. 인프라 다운타임을 근본적으로 차단하는 차세대 능동형 관제 플랫폼.
            </p>
</div>
<!-- Hero Action Group -->
<div class="flex flex-wrap items-center gap-4 pt-2">
<a class="inline-flex items-center justify-center space-x-2 px-6 py-3 rounded-xl bg-secondary hover:bg-secondary-container text-on-secondary font-headline-sm text-headline-sm transition-all shadow-md hover:shadow-lg" href="#demo">
<span class="material-symbols-outlined text-[20px]">play_circle</span>
<span>데모 보기</span>
</a>
<a class="inline-flex items-center justify-center space-x-2 px-6 py-3 rounded-xl bg-surface-container hover:bg-surface-container-high text-on-surface font-headline-sm text-headline-sm transition-colors" href="#contact">
<span class="material-symbols-outlined text-[20px]">contact_support</span>
<span>문의하기</span>
</a>
</div>
<!-- Hero Metrics Strip -->
<div class="grid grid-cols-3 gap-3 pt-6">
<div class="p-4 rounded-xl bg-surface-container-low flex flex-col">
<span class="font-label-caps text-label-caps text-on-surface-variant">MEAN TIME TO DETECT</span>
<span class="font-metric-val text-metric-val text-secondary mt-1">&lt; 1.2s</span>
<span class="font-code-inline text-code-inline text-on-surface-variant mt-0.5">초정밀 eBPF 파이프라인</span>
</div>
<div class="p-4 rounded-xl bg-surface-container-low flex flex-col">
<span class="font-label-caps text-label-caps text-on-surface-variant">RULE-BASED PRECISION</span>
<span class="font-metric-val text-metric-val text-on-surface mt-1">99.9%</span>
<span class="font-code-inline text-code-inline text-on-surface-variant mt-0.5">결정론적 규칙 엔진</span>
</div>
<div class="p-4 rounded-xl bg-surface-container-low flex flex-col">
<span class="font-label-caps text-label-caps text-on-surface-variant">MEAN TRIAGE TIME</span>
<span class="font-metric-val text-metric-val text-on-tertiary-container mt-1">-65%</span>
<span class="font-code-inline text-code-inline text-on-surface-variant mt-0.5">AI 맥락 보조 요약</span>
</div>
</div>
</div>
<!-- Hero Right Column: High-Tech Telemetry Terminal Mockup -->
<div class="lg:col-span-5 w-full">
<div class="w-full bg-primary-container text-inverse-on-surface rounded-xl p-5 shadow-xl flex flex-col space-y-4 font-code-inline text-code-inline">
<!-- Simulated Window Header -->
<div class="flex items-center justify-between pb-3">
<div class="flex items-center space-x-2">
<span class="w-3 h-3 rounded-full bg-error inline-block"></span>
<span class="w-3 h-3 rounded-full bg-surface-dim inline-block"></span>
<span class="w-3 h-3 rounded-full bg-secondary-container inline-block"></span>
<span class="text-inverse-primary ml-2 font-body-sm text-body-sm">SentinelOps Live Telemetry Core</span>
</div>
<div class="flex items-center space-x-1.5 px-2.5 py-0.5 rounded-full bg-tertiary-container">
<span class="w-1.5 h-1.5 rounded-full bg-on-tertiary-container animate-pulse"></span>
<span class="text-[10px] text-tertiary-fixed font-bold tracking-widest uppercase">Live Ingestion</span>
</div>
</div>
<!-- Terminal KPI Mini-grid -->
<div class="grid grid-cols-4 gap-2 py-2 text-center bg-inverse-surface rounded-lg p-2.5">
<div>
<div class="text-on-primary-container text-[10px] uppercase">Error Count</div>
<div class="font-metric-val text-sm text-inverse-on-surface font-bold">1,428</div>
</div>
<div>
<div class="text-on-primary-container text-[10px] uppercase">Critical</div>
<div class="font-metric-val text-sm text-error-container font-bold">2</div>
</div>
<div>
<div class="text-on-primary-container text-[10px] uppercase">Open</div>
<div class="font-metric-val text-sm text-tertiary-fixed font-bold">5</div>
</div>
<div>
<div class="text-on-primary-container text-[10px] uppercase">Resolved</div>
<div class="font-metric-val text-sm text-surface-dim font-bold">124</div>
</div>
</div>
<!-- Active Log Stream Snippet -->
<div class="space-y-2.5 py-1">
<div class="p-2.5 rounded bg-inverse-surface space-y-1">
<div class="flex items-center justify-between text-[11px]">
<span class="text-outline-variant">14:32:11.204 [AUTH-SVC]</span>
<span class="px-1.5 py-0.2 rounded bg-error text-on-error font-bold text-[10px]">CRITICAL</span>
</div>
<div class="text-on-error-container font-code-inline truncate">
                  HTTP 500: AuthTokenExpiredException at /v2/session/verify
                </div>
<div class="flex items-center space-x-1 text-on-tertiary-container text-[11px]">
<span class="material-symbols-outlined text-[14px]">auto_awesome</span>
<span>AI Assist: 토큰 검증 클러스터 응답 지연 추정 (MTTD 0.9s)</span>
</div>
</div>
<div class="p-2.5 rounded bg-inverse-surface space-y-1">
<div class="flex items-center justify-between text-[11px]">
<span class="text-outline-variant">14:35:02.881 [PAYMENT-GW]</span>
<span class="px-1.5 py-0.2 rounded bg-secondary text-on-secondary font-bold text-[10px]">HIGH</span>
</div>
<div class="text-inverse-primary font-code-inline truncate">
                  PGConnectionTimeout: SocketTimeoutException after 3000ms
                </div>
<div class="flex items-center space-x-1 text-on-tertiary-container text-[11px]">
<span class="material-symbols-outlined text-[14px]">auto_awesome</span>
<span>AI Assist: 외부 PG 통신 세션 일시 적체 감지</span>
</div>
</div>
</div>
<!-- Ingestion Graph Visual (Simulated SVG Stream) -->
<div class="pt-2">
<div class="flex justify-between items-center text-[10px] text-on-primary-container mb-1">
<span>EVENT STREAM INGESTION (EPS: 4.8k)</span>
<span>LATENCY 14ms</span>
</div>
<svg class="w-full h-9 text-secondary-container" fill="none" viewbox="0 0 300 40">
<path d="M0 32 L30 30 L60 25 L90 28 L120 12 L150 18 L180 8 L210 22 L240 14 L270 5 L300 2" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
<path d="M0 32 L30 30 L60 25 L90 28 L120 12 L150 18 L180 8 L210 22 L240 14 L270 5 L300 2 L300 40 L0 40 Z" fill="currentColor" fill-opacity="0.15"></path>
</svg>
</div>
</div>
</div>
</div>
</section>
<!-- 2. PROBLEM SECTION -->
<section class="flex flex-col space-y-8">
<div class="text-center max-w-2xl mx-auto space-y-3">
<span class="font-label-caps text-label-caps text-secondary font-bold tracking-wider">OPERATIONAL BOTTLENECKS</span>
<h2 class="font-headline-xl text-headline-xl text-on-surface tracking-tight">
          시스템 오류가 발생하면 무엇이 문제일까요?
        </h2>
<p class="font-body-md text-body-md text-on-surface-variant">
          기존의 분산 로그 저장소와 단순 임계치 알림 시스템이 야기하는 엔터프라이즈 운영 병목 현상
        </p>
</div>
<div class="grid grid-cols-1 md:grid-cols-3 gap-6">
<!-- Problem Card 1 -->
<div class="p-6 rounded-xl bg-surface-container-lowest shadow-sm flex flex-col space-y-4">
<div class="w-12 h-12 rounded-xl bg-surface-container flex items-center justify-center text-secondary">
<span class="material-symbols-outlined text-[28px]">search_off</span>
</div>
<h3 class="font-headline-sm text-headline-sm text-on-surface">
            오류는 발생했지만<br/>원인을 파악하기 어렵다
          </h3>
<p class="font-body-md text-body-md text-on-surface-variant flex-1">
            수만 줄의 분산 스택트레이스 속에서 실제 근본 원인(Root Cause)을 역추적하는 데 수 시간이 소모되어 골든타임을 놓칩니다.
          </p>
<div class="p-3 rounded-lg bg-surface-container-low text-on-surface-variant font-code-inline text-code-inline">
            Mean Log Drill-down: 4.2 hrs
          </div>
</div>
<!-- Problem Card 2 -->
<div class="p-6 rounded-xl bg-surface-container-lowest shadow-sm flex flex-col space-y-4">
<div class="w-12 h-12 rounded-xl bg-surface-container flex items-center justify-center text-error">
<span class="material-symbols-outlined text-[28px]">notifications_paused</span>
</div>
<h3 class="font-headline-sm text-headline-sm text-on-surface">
            중요한 오류와 단순 오류를<br/>구분하기 어렵다
          </h3>
<p class="font-body-md text-body-md text-on-surface-variant flex-1">
            단순 경고와 결제·인증 중단 치명 오류가 뒤섞여 하루 수백 건의 채널 알림이 쌓이고 극심한 '알림 피로(Alert Fatigue)'를 유발합니다.
          </p>
<div class="p-3 rounded-lg bg-surface-container-low text-on-surface-variant font-code-inline text-code-inline">
            Ignored Alerts Rate: 71.4%
          </div>
</div>
<!-- Problem Card 3 -->
<div class="p-6 rounded-xl bg-surface-container-lowest shadow-sm flex flex-col space-y-4">
<div class="w-12 h-12 rounded-xl bg-surface-container flex items-center justify-center text-secondary-container">
<span class="material-symbols-outlined text-[28px]">support_agent</span>
</div>
<h3 class="font-headline-sm text-headline-sm text-on-surface">
            관리자가 문제를<br/>가장 늦게 발견한다
          </h3>
<p class="font-body-md text-body-md text-on-surface-variant flex-1">
            인프라 장애를 엔지니어가 선제 감지하지 못하고, 고객센터(VOC)에 민원이 폭주한 뒤에야 비로소 개발팀에 전파되는 악순환이 발생합니다.
          </p>
<div class="p-3 rounded-lg bg-surface-container-low text-on-surface-variant font-code-inline text-code-inline">
            VOC-to-Dev Escalation: 52 mins
          </div>
</div>
</div>
</section>
<!-- 3. HOW SENTINELOPS WORKS (Horizontal Workflow Pipeline) -->
<section class="flex flex-col space-y-8">
<div class="text-center max-w-2xl mx-auto space-y-3">
<span class="font-label-caps text-label-caps text-secondary font-bold tracking-wider">SYSTEM PIPELINE</span>
<h2 class="font-headline-xl text-headline-xl text-on-surface tracking-tight">
          SentinelOps 작동 메커니즘
        </h2>
<p class="font-body-md text-body-md text-on-surface-variant">
          엔드포인트 에러 발생부터 관리자 조치까지 단 1.2초 만에 완결되는 엔드투엔드 파이프라인
        </p>
</div>
<!-- Pipeline Container -->
<div class="p-6 md:p-8 rounded-xl bg-surface-container-lowest shadow-sm">
<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-7 gap-4 relative">
<!-- Step 1 -->
<div class="flex flex-col p-3 rounded-lg bg-surface-container-low relative">
<div class="flex items-center justify-between mb-2">
<span class="font-code-inline text-[11px] font-bold text-secondary">STEP 01</span>
<span class="material-symbols-outlined text-[18px] text-on-surface-variant">devices</span>
</div>
<h4 class="font-headline-sm text-[15px] leading-tight text-on-surface font-semibold mb-1">Application</h4>
<p class="font-body-sm text-[12px] leading-tight text-on-surface-variant">웹/모바일 클라이언트 및 서블릿 서버</p>
</div>
<!-- Step 2 -->
<div class="flex flex-col p-3 rounded-lg bg-surface-container-low relative">
<div class="flex items-center justify-between mb-2">
<span class="font-code-inline text-[11px] font-bold text-secondary">STEP 02</span>
<span class="material-symbols-outlined text-[18px] text-on-surface-variant">terminal</span>
</div>
<h4 class="font-headline-sm text-[15px] leading-tight text-on-surface font-semibold mb-1">Error / Log</h4>
<p class="font-body-sm text-[12px] leading-tight text-on-surface-variant">익셉션 발생 및 원시 로그 실시간 스트림</p>
</div>
<!-- Step 3 -->
<div class="flex flex-col p-3 rounded-lg bg-surface-container-low relative">
<div class="flex items-center justify-between mb-2">
<span class="font-code-inline text-[11px] font-bold text-secondary">STEP 03</span>
<span class="material-symbols-outlined text-[18px] text-on-surface-variant">radar</span>
</div>
<h4 class="font-headline-sm text-[15px] leading-tight text-on-surface font-semibold mb-1">Detection</h4>
<p class="font-body-sm text-[12px] leading-tight text-on-surface-variant">eBPF &amp; 실시간 에이전트 초정밀 감지</p>
</div>
<!-- Step 4 -->
<div class="flex flex-col p-3 rounded-lg bg-surface-container-low relative">
<div class="flex items-center justify-between mb-2">
<span class="font-code-inline text-[11px] font-bold text-secondary">STEP 04</span>
<span class="material-symbols-outlined text-[18px] text-on-surface-variant">rule</span>
</div>
<h4 class="font-headline-sm text-[15px] leading-tight text-on-surface font-semibold mb-1">Classification</h4>
<p class="font-body-sm text-[12px] leading-tight text-on-surface-variant">사전 정의 규칙 엔진 기반 4단계 분류</p>
</div>
<!-- Step 5 (AI ASSIST Highlighted) -->
<div class="flex flex-col p-3 rounded-lg bg-primary-container text-inverse-on-surface relative">
<div class="flex items-center justify-between mb-2">
<span class="font-code-inline text-[11px] font-bold text-on-tertiary-container">STEP 05</span>
<span class="material-symbols-outlined text-[18px] text-on-tertiary-container">auto_awesome</span>
</div>
<h4 class="font-headline-sm text-[15px] leading-tight text-on-secondary font-semibold mb-1">AI Summary</h4>
<p class="font-body-sm text-[12px] leading-tight text-inverse-primary">로그 맥락 분석 및 3줄 핵심 요약 가이드</p>
</div>
<!-- Step 6 -->
<div class="flex flex-col p-3 rounded-lg bg-surface-container-low relative">
<div class="flex items-center justify-between mb-2">
<span class="font-code-inline text-[11px] font-bold text-secondary">STEP 06</span>
<span class="material-symbols-outlined text-[18px] text-on-surface-variant">send</span>
</div>
<h4 class="font-headline-sm text-[15px] leading-tight text-on-surface font-semibold mb-1">Slack Alert</h4>
<p class="font-body-sm text-[12px] leading-tight text-on-surface-variant">웹훅 기반 인시던트 채널 실시간 알림</p>
</div>
<!-- Step 7 -->
<div class="flex flex-col p-3 rounded-lg bg-surface-container-low relative">
<div class="flex items-center justify-between mb-2">
<span class="font-code-inline text-[11px] font-bold text-secondary">STEP 07</span>
<span class="material-symbols-outlined text-[18px] text-on-surface-variant">dashboard</span>
</div>
<h4 class="font-headline-sm text-[15px] leading-tight text-on-surface font-semibold mb-1">Admin Console</h4>
<p class="font-body-sm text-[12px] leading-tight text-on-surface-variant">통합 콘솔에서 심층 분석 및 조치 완료</p>
</div>
</div>
</div>
</section>
<!-- 4. KEY FEATURES (6 Essential Capabilities) -->
<section class="flex flex-col space-y-8">
<div class="text-center max-w-2xl mx-auto space-y-3">
<span class="font-label-caps text-label-caps text-secondary font-bold tracking-wider">CORE CAPABILITIES</span>
<h2 class="font-headline-xl text-headline-xl text-on-surface tracking-tight">
          엔터프라이즈 장애 대응을 위한 6대 핵심 기능
        </h2>
<p class="font-body-md text-body-md text-on-surface-variant">
          규칙 기반의 확실성과 AI 보조 분석의 신속성을 결합한 통합 인시던트 프레임워크
        </p>
</div>
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
<!-- Feature 1 -->
<div class="p-6 rounded-xl bg-surface-container-lowest shadow-sm flex flex-col space-y-3">
<div class="flex items-center justify-between">
<span class="font-code-inline text-label-caps text-secondary font-bold">CAPABILITY 01</span>
<span class="material-symbols-outlined text-[24px] text-on-surface-variant">bolt</span>
</div>
<h3 class="font-headline-sm text-headline-sm text-on-surface">초정밀 실시간 에러 탐지</h3>
<p class="font-body-md text-body-md text-on-surface-variant">
            서버 사이드 로그와 클라이언트 예외를 1초 이내에 무손실 수집하여 마이크로서비스 간 트랜잭션 흐름을 실시간으로 추적합니다.
          </p>
</div>
<!-- Feature 2 -->
<div class="p-6 rounded-xl bg-surface-container-lowest shadow-sm flex flex-col space-y-3">
<div class="flex items-center justify-between">
<span class="font-code-inline text-label-caps text-secondary font-bold">CAPABILITY 02</span>
<span class="material-symbols-outlined text-[24px] text-on-surface-variant">filter_alt</span>
</div>
<h3 class="font-headline-sm text-headline-sm text-on-surface">규칙 기반 위험도 4단계 분류</h3>
<p class="font-body-md text-body-md text-on-surface-variant">
            사전 정의된 정책 엔진으로 LOW, MEDIUM, HIGH, CRITICAL 등급을 부여하여 불필요한 알림 노이즈를 완벽하게 차단합니다.
          </p>
</div>
<!-- Feature 3 -->
<div class="p-6 rounded-xl bg-surface-container-lowest shadow-sm flex flex-col space-y-3">
<div class="flex items-center justify-between">
<span class="font-code-inline text-label-caps text-secondary font-bold">CAPABILITY 03</span>
<span class="material-symbols-outlined text-[24px] text-secondary">auto_awesome</span>
</div>
<h3 class="font-headline-sm text-headline-sm text-on-surface">AI 보조 로그 요약 및 분석</h3>
<p class="font-body-md text-body-md text-on-surface-variant">
            방대한 스택트레이스를 인공지능이 즉각 분석하여 예상 원인과 영향도를 3줄 자연어 리포트로 요약 가이드합니다.
          </p>
</div>
<!-- Feature 4 -->
<div class="p-6 rounded-xl bg-surface-container-lowest shadow-sm flex flex-col space-y-3">
<div class="flex items-center justify-between">
<span class="font-code-inline text-label-caps text-secondary font-bold">CAPABILITY 04</span>
<span class="material-symbols-outlined text-[24px] text-on-surface-variant">notifications_active</span>
</div>
<h3 class="font-headline-sm text-headline-sm text-on-surface">다채널 즉각 전파 (Slack/Teams)</h3>
<p class="font-body-md text-body-md text-on-surface-variant">
            슬랙, 마이크로소프트 팀즈, 카카오 알림톡 등 기업 커뮤니케이션 도구와 웹훅으로 실시간 동기화되어 즉각적인 인지가 가능합니다.
          </p>
</div>
<!-- Feature 5 -->
<div class="p-6 rounded-xl bg-surface-container-lowest shadow-sm flex flex-col space-y-3">
<div class="flex items-center justify-between">
<span class="font-code-inline text-label-caps text-secondary font-bold">CAPABILITY 05</span>
<span class="material-symbols-outlined text-[24px] text-on-surface-variant">checklist</span>
</div>
<h3 class="font-headline-sm text-headline-sm text-on-surface">인시던트 라이프사이클 관리</h3>
<p class="font-body-md text-body-md text-on-surface-variant">
            OPEN → ACKNOWLEDGED → RESOLVED 상태 전환을 체계적으로 트래킹하며, 담당 엔지니어 배정과 히스토리를 보존합니다.
          </p>
</div>
<!-- Feature 6 -->
<div class="p-6 rounded-xl bg-surface-container-lowest shadow-sm flex flex-col space-y-3">
<div class="flex items-center justify-between">
<span class="font-code-inline text-label-caps text-secondary font-bold">CAPABILITY 06</span>
<span class="material-symbols-outlined text-[24px] text-on-surface-variant">analytics</span>
</div>
<h3 class="font-headline-sm text-headline-sm text-on-surface">엔터프라이즈 통합 대시보드</h3>
<p class="font-body-md text-body-md text-on-surface-variant">
            서비스별 가용성 매트릭스, 에러 발생 추세, 사용자 세션 상관분석 차트를 단일 인터페이스에서 투명하게 조망합니다.
          </p>
</div>
</div>
</section>
<!-- 5. MONITORING DASHBOARD PREVIEW (Full High-Fidelity UI Mockup) -->
<section class="flex flex-col space-y-8">
<div class="flex flex-col md:flex-row md:items-end justify-between gap-4">
<div class="space-y-2">
<span class="font-label-caps text-label-caps text-secondary font-bold tracking-wider">LIVE OPERATIONAL VIEW</span>
<h2 class="font-headline-xl text-headline-xl text-on-surface tracking-tight">
            실시간 엔터프라이즈 모니터링 대시보드
          </h2>
<p class="font-body-md text-body-md text-on-surface-variant">
            운영팀과 엔지니어가 한 화면에서 시스템 건강도를 완벽히 장악합니다.
          </p>
</div>
<div class="flex items-center space-x-2">
<span class="inline-flex items-center space-x-1.5 px-3 py-1 rounded-full bg-surface-container-high text-on-surface font-code-inline text-[12px]">
<span class="w-2 h-2 rounded-full bg-secondary animate-ping"></span>
<span>Cluster: Seoul-IDC-01</span>
</span>
</div>
</div>
<!-- High-Fidelity Mockup Window -->
<div class="rounded-xl bg-surface-container-lowest shadow-lg overflow-hidden flex flex-col">
<!-- Top Filter Bar -->
<div class="p-4 bg-surface-container flex flex-wrap items-center justify-between gap-4 font-body-sm text-body-sm">
<div class="flex flex-wrap items-center gap-3">
<div class="flex items-center space-x-2 bg-surface-container-lowest px-3 py-1.5 rounded-lg text-on-surface">
<span class="text-on-surface-variant">Env:</span>
<span class="font-semibold">Production</span>
</div>
<div class="flex items-center space-x-2 bg-surface-container-lowest px-3 py-1.5 rounded-lg text-on-surface">
<span class="text-on-surface-variant">Timeframe:</span>
<span class="font-semibold">Last 24 Hours</span>
</div>
<div class="flex items-center space-x-2 bg-surface-container-lowest px-3 py-1.5 rounded-lg text-on-surface">
<span class="text-on-surface-variant">Service:</span>
<span class="font-semibold">All Microservices (14)</span>
</div>
</div>
<div class="flex items-center space-x-2 bg-surface-container-lowest px-3 py-1.5 rounded-lg w-full sm:w-64">
<span class="material-symbols-outlined text-[18px] text-outline">search</span>
<input class="bg-transparent border-0 p-0 text-sm focus:ring-0 text-on-surface placeholder-outline w-full" placeholder="오류 코드 또는 세션 검색..." readonly="" type="text" value="Error: 500 / Exception"/>
</div>
</div>
<!-- Metrics Strip Inside Dashboard -->
<div class="grid grid-cols-2 lg:grid-cols-4 gap-4 p-4 md:p-6 bg-surface-container-low">
<div class="p-4 rounded-xl bg-surface-container-lowest shadow-sm flex flex-col">
<span class="font-label-caps text-label-caps text-on-surface-variant">TOTAL INGESTION RATE</span>
<span class="font-metric-val text-metric-val text-on-surface mt-1">4,821 <span class="text-xs font-normal">EPS</span></span>
<span class="font-code-inline text-code-inline text-secondary mt-1">↑ +4.2% 안정화</span>
</div>
<div class="p-4 rounded-xl bg-surface-container-lowest shadow-sm flex flex-col">
<span class="font-label-caps text-label-caps text-on-surface-variant">OPEN CRITICAL INCIDENTS</span>
<span class="font-metric-val text-metric-val text-error mt-1">2 <span class="text-xs font-normal">Active</span></span>
<span class="font-code-inline text-code-inline text-error mt-1">• 긴급 조치 대기</span>
</div>
<div class="p-4 rounded-xl bg-surface-container-lowest shadow-sm flex flex-col">
<span class="font-label-caps text-label-caps text-on-surface-variant">MEAN TIME TO DETECT (MTTD)</span>
<span class="font-metric-val text-metric-val text-on-surface mt-1">1.2s</span>
<span class="font-code-inline text-code-inline text-on-surface-variant mt-1">SLA 목표 대비 92% 우수</span>
</div>
<div class="p-4 rounded-xl bg-surface-container-lowest shadow-sm flex flex-col">
<span class="font-label-caps text-label-caps text-on-surface-variant">MEAN TIME TO RESOLVE (MTTR)</span>
<span class="font-metric-val text-metric-val text-secondary mt-1">8.4m</span>
<span class="font-code-inline text-code-inline text-secondary mt-1">↓ -65% (AI 가이드 도입 전후)</span>
</div>
</div>
<!-- 2-Column Split: Chart & Incidents Feed -->
<div class="grid grid-cols-1 lg:grid-cols-12 gap-6 p-4 md:p-6">
<!-- Left: Incident Trend Chart & Severity Distribution -->
<div class="lg:col-span-7 flex flex-col space-y-4">
<div class="flex items-center justify-between">
<h4 class="font-headline-sm text-headline-sm text-on-surface">인시던트 발생 추세 및 위험도 분포</h4>
<span class="font-code-inline text-[12px] text-on-surface-variant">Real-time Ingest: Active</span>
</div>
<!-- CSS Bar Graph -->
<div class="p-4 rounded-xl bg-surface-container-low flex flex-col space-y-3">
<div class="h-36 flex items-end justify-between gap-1.5 pt-4">
<!-- Bar columns -->
<div class="w-full flex flex-col items-center gap-1">
<div class="w-full bg-surface-variant rounded-t" style="height: 35%"></div>
<span class="text-[10px] text-on-surface-variant font-code-inline">04:00</span>
</div>
<div class="w-full flex flex-col items-center gap-1">
<div class="w-full bg-surface-variant rounded-t" style="height: 25%"></div>
<span class="text-[10px] text-on-surface-variant font-code-inline">08:00</span>
</div>
<div class="w-full flex flex-col items-center gap-1">
<div class="w-full bg-surface-variant rounded-t" style="height: 48%"></div>
<span class="text-[10px] text-on-surface-variant font-code-inline">12:00</span>
</div>
<div class="w-full flex flex-col items-center gap-1">
<div class="w-full bg-error rounded-t" style="height: 85%"></div>
<span class="text-[10px] text-error font-code-inline font-bold">14:00</span>
</div>
<div class="w-full flex flex-col items-center gap-1">
<div class="w-full bg-secondary-container rounded-t" style="height: 52%"></div>
<span class="text-[10px] text-on-surface-variant font-code-inline">16:00</span>
</div>
<div class="w-full flex flex-col items-center gap-1">
<div class="w-full bg-surface-variant rounded-t" style="height: 30%"></div>
<span class="text-[10px] text-on-surface-variant font-code-inline">20:00</span>
</div>
<div class="w-full flex flex-col items-center gap-1">
<div class="w-full bg-surface-variant rounded-t" style="height: 18%"></div>
<span class="text-[10px] text-on-surface-variant font-code-inline">24:00</span>
</div>
</div>
<!-- Severity Breakdown Progress Bar -->
<div class="pt-2 space-y-2">
<div class="flex justify-between text-[11px] font-code-inline text-on-surface-variant">
<span>SEVERITY RATIO:</span>
<span>Critical (3%) | High (12%) | Medium (28%) | Low (57%)</span>
</div>
<div class="h-2 w-full rounded-full bg-surface-container flex overflow-hidden">
<div class="bg-error" style="width: 3%"></div>
<div class="bg-secondary" style="width: 12%"></div>
<div class="bg-surface-tint" style="width: 28%"></div>
<div class="bg-surface-variant" style="width: 57%"></div>
</div>
</div>
</div>
</div>
<!-- Right: Recent Incidents Mini-Table -->
<div class="lg:col-span-5 flex flex-col space-y-4">
<div class="flex items-center justify-between">
<h4 class="font-headline-sm text-headline-sm text-on-surface">실시간 인시던트 피드</h4>
<span class="font-code-inline text-[12px] text-secondary">Live Stream</span>
</div>
<div class="overflow-x-auto rounded-xl bg-surface-container-low">
<table class="w-full text-left font-body-sm text-body-sm">
<thead>
<tr class="text-[11px] text-on-surface-variant uppercase font-label-caps bg-surface-container">
<th class="py-2.5 px-3">ID / Time</th>
<th class="py-2.5 px-3">Severity</th>
<th class="py-2.5 px-3">Service</th>
<th class="py-2.5 px-3 text-right">Status</th>
</tr>
</thead>
<tbody class="divide-y-0">
<tr class="hover:bg-surface-container-high transition-colors">
<td class="py-2.5 px-3 font-code-inline text-[12px]">
<div class="font-bold text-on-surface">#INC-9821</div>
<div class="text-on-surface-variant text-[10px]">14:35:21</div>
</td>
<td class="py-2.5 px-3">
<span class="px-2 py-0.5 rounded text-[10px] font-bold bg-error text-on-error">CRITICAL</span>
</td>
<td class="py-2.5 px-3 text-on-surface">Payment API</td>
<td class="py-2.5 px-3 text-right">
<span class="px-2 py-0.5 rounded text-[10px] font-bold bg-error-container text-on-error-container">OPEN</span>
</td>
</tr>
<tr class="hover:bg-surface-container-high transition-colors">
<td class="py-2.5 px-3 font-code-inline text-[12px]">
<div class="font-bold text-on-surface">#INC-9820</div>
<div class="text-on-surface-variant text-[10px]">14:32:11</div>
</td>
<td class="py-2.5 px-3">
<span class="px-2 py-0.5 rounded text-[10px] font-bold bg-secondary text-on-secondary">HIGH</span>
</td>
<td class="py-2.5 px-3 text-on-surface">Auth Gateway</td>
<td class="py-2.5 px-3 text-right">
<span class="px-2 py-0.5 rounded text-[10px] font-bold bg-error-container text-on-error-container">OPEN</span>
</td>
</tr>
<tr class="hover:bg-surface-container-high transition-colors">
<td class="py-2.5 px-3 font-code-inline text-[12px]">
<div class="font-bold text-on-surface">#INC-9818</div>
<div class="text-on-surface-variant text-[10px]">14:28:44</div>
</td>
<td class="py-2.5 px-3">
<span class="px-2 py-0.5 rounded text-[10px] font-bold bg-surface-tint text-on-primary">MEDIUM</span>
</td>
<td class="py-2.5 px-3 text-on-surface">Cart Service</td>
<td class="py-2.5 px-3 text-right">
<span class="px-2 py-0.5 rounded text-[10px] font-bold bg-surface-container text-on-surface-variant">ACK</span>
</td>
</tr>
<tr class="hover:bg-surface-container-high transition-colors">
<td class="py-2.5 px-3 font-code-inline text-[12px]">
<div class="font-bold text-on-surface">#INC-9814</div>
<div class="text-on-surface-variant text-[10px]">14:10:02</div>
</td>
<td class="py-2.5 px-3">
<span class="px-2 py-0.5 rounded text-[10px] font-bold bg-surface-variant text-on-surface">LOW</span>
</td>
<td class="py-2.5 px-3 text-on-surface">Search Node</td>
<td class="py-2.5 px-3 text-right">
<span class="px-2 py-0.5 rounded text-[10px] font-bold bg-surface-container text-on-surface-variant">RESOLVED</span>
</td>
</tr>
</tbody>
</table>
</div>
</div>
</div>
</div>
</section>
<!-- 6. INCIDENT DETAIL EXAMPLE (Side-by-Side Deep Dive) -->
<section class="flex flex-col space-y-8">
<div class="text-center max-w-2xl mx-auto space-y-3">
<span class="font-label-caps text-label-caps text-secondary font-bold tracking-wider">INCIDENT TRIAGE SPEC</span>
<h2 class="font-headline-xl text-headline-xl text-on-surface tracking-tight">
          인시던트 상세 분석 &amp; AI 보조 요약
        </h2>
<p class="font-body-md text-body-md text-on-surface-variant">
          규칙 기반 엄격한 트리거와 AI의 다차원 원인 보조 요약이 함께 결합된 티켓 화면
        </p>
</div>
<!-- High-Fidelity Incident Detail Modal Container -->
<div class="p-6 md:p-8 rounded-xl bg-surface-container-lowest shadow-md max-w-3xl mx-auto w-full space-y-6">
<!-- Incident Ticket Header -->
<div class="flex flex-wrap items-center justify-between gap-4 pb-4">
<div class="space-y-1">
<div class="flex items-center space-x-2">
<span class="font-code-inline text-label-caps text-secondary font-bold">INCIDENT #SEC-AUTH-04</span>
<span class="px-2 py-0.5 rounded text-[11px] font-bold bg-secondary text-on-secondary">HIGH</span>
<span class="px-2 py-0.5 rounded text-[11px] font-bold bg-error-container text-on-error-container">OPEN</span>
</div>
<h3 class="font-headline-lg text-headline-lg text-on-surface">LoginException</h3>
</div>
<div class="text-right font-code-inline text-body-sm text-on-surface-variant">
<div>Timestamp: <span class="text-on-surface font-semibold">14:32:11</span></div>
<div>User: <span class="text-on-surface font-semibold">user@example.com</span></div>
</div>
</div>
<!-- Rule Match Badge Info -->
<div class="p-3 rounded-lg bg-surface-container-low flex items-center space-x-3 text-body-sm">
<span class="material-symbols-outlined text-secondary text-[20px]">verified_user</span>
<div class="text-on-surface">
<span class="font-semibold text-secondary">규칙 엔진 일치:</span>
<span>사전 정의 보안 규칙 <code class="font-code-inline bg-surface px-1.5 py-0.5 rounded text-secondary font-bold">Rule #SEC-AUTH-04</code>에 의해 자동 HIGH 등급 책정됨</span>
</div>
</div>
<!-- AI Assistant Analysis Box (Distinctive UI Box) -->
<div class="p-5 rounded-xl bg-surface-container space-y-4">
<div class="flex items-center space-x-2">
<div class="flex items-center space-x-1.5 px-2.5 py-1 rounded bg-secondary text-on-secondary font-label-caps text-[11px] font-bold">
<span class="material-symbols-outlined text-[14px]">auto_awesome</span>
<span>AI ASSISTANT ANALYSIS - 보조 진단 결과</span>
</div>
<span class="text-[11px] text-on-surface-variant font-code-inline">Model: Ops-Telemetry-v4</span>
</div>
<div class="space-y-3">
<div>
<div class="font-label-caps text-label-caps text-on-surface-variant uppercase">Summary</div>
<p class="font-body-md text-body-md text-on-surface font-semibold mt-0.5">
                "로그인 요청 처리 과정에서 인증 관련 예외가 발생했습니다."
              </p>
</div>
<div>
<div class="font-label-caps text-label-caps text-on-surface-variant uppercase">Possible Cause (AI Estimated)</div>
<div class="font-code-inline text-code-inline text-on-surface mt-0.5 bg-surface-container-lowest p-2.5 rounded">
                Authentication service or credential validation issue (세션 저장소 Redis 클러스터 인스턴스 타임아웃 추정)
              </div>
</div>
</div>
<!-- Explicit Required Disclaimer -->
<div class="pt-2 text-on-surface-variant font-body-sm text-body-sm flex items-start space-x-2">
<span class="material-symbols-outlined text-[16px] text-outline mt-0.5">info</span>
<span>※ AI 분석 결과는 운영자의 신속한 원인 파악을 돕기 위한 보조 지표이며, 시스템 최종 변경 및 조치 권한은 관리자에게 있습니다.</span>
</div>
</div>
<!-- Action Buttons -->
<div class="flex items-center justify-end space-x-3 pt-2">
<button class="px-4 py-2 rounded-lg bg-surface-container hover:bg-surface-container-high text-on-surface font-body-sm font-semibold transition-colors">
            Runbook 조회
          </button>
<button class="px-4 py-2 rounded-lg bg-secondary hover:bg-secondary-container text-on-secondary font-body-sm font-semibold transition-colors">
            인시던트 승인 (Acknowledge)
          </button>
</div>
</div>
</section>
<!-- 7. SLACK ALERT EXAMPLE -->
<section class="flex flex-col space-y-8">
<div class="text-center max-w-2xl mx-auto space-y-3">
<span class="font-label-caps text-label-caps text-secondary font-bold tracking-wider">INSTANT NOTIFICATION</span>
<h2 class="font-headline-xl text-headline-xl text-on-surface tracking-tight">
          실시간 슬랙(Slack) 연동 알림
        </h2>
<p class="font-body-md text-body-md text-on-surface-variant">
          모니터링 콘솔을 열지 않아도, 담당 팀 채널로 즉시 전달되는 고밀도 구조화 알림
        </p>
</div>
<!-- Slack Simulated Card -->
<div class="max-w-2xl mx-auto w-full p-6 rounded-xl bg-surface-container-lowest shadow-md">
<div class="flex items-start space-x-3">
<!-- Bot Avatar -->
<div class="w-10 h-10 rounded-lg bg-primary flex items-center justify-center text-on-primary flex-shrink-0">
<span class="material-symbols-outlined text-[22px]">shield</span>
</div>
<!-- Message Body -->
<div class="flex-1 space-y-2">
<div class="flex items-center space-x-2">
<span class="font-headline-sm text-[15px] font-bold text-on-surface">SentinelOps Bot</span>
<span class="px-1.5 py-0.2 rounded bg-surface-container text-[10px] text-on-surface-variant font-bold">APP</span>
<span class="text-on-surface-variant text-body-sm text-[12px]">14:35</span>
</div>
<!-- Slack Attachment Box (with Red border bar) -->
<div class="pl-4 rounded-r-lg bg-surface-container-low p-4 space-y-3 relative overflow-hidden" style="box-shadow: inset 4px 0 0 #ba1a1a;">
<div class="flex items-center justify-between">
<div class="font-headline-sm text-headline-sm text-error font-bold flex items-center space-x-1.5">
<span class="material-symbols-outlined text-[20px]">warning</span>
<span>[CRITICAL] Payment Service Error</span>
</div>
<span class="font-code-inline text-xs text-on-surface-variant">Cluster: Prod-KR</span>
</div>
<!-- Slack Key-Value Grid -->
<div class="grid grid-cols-2 gap-2 text-body-sm font-code-inline text-code-inline">
<div>
<span class="text-on-surface-variant block text-[11px]">SERVICE</span>
<span class="font-semibold text-on-surface">Payment API</span>
</div>
<div>
<span class="text-on-surface-variant block text-[11px]">TIMESTAMP</span>
<span class="font-semibold text-on-surface">14:35:21</span>
</div>
<div>
<span class="text-on-surface-variant block text-[11px]">STATUS</span>
<span class="font-semibold text-error">OPEN (Unassigned)</span>
</div>
<div>
<span class="text-on-surface-variant block text-[11px]">IMPACT</span>
<span class="font-semibold text-on-surface">42 Requests throttled</span>
</div>
</div>
<!-- AI Quick Note Box in Slack -->
<div class="p-2.5 rounded bg-surface-container-high text-body-sm space-y-1">
<div class="flex items-center space-x-1 text-secondary font-label-caps text-[11px] font-bold">
<span class="material-symbols-outlined text-[14px]">auto_awesome</span>
<span>AI QUICK DIAGNOSIS</span>
</div>
<p class="text-on-surface text-[13px] leading-relaxed">
                  결제 게이트웨이 핸드셰이크 타임아웃 감지. PG사 통신망 응답 지연 가능성.
                </p>
</div>
<!-- Slack Action Buttons -->
<div class="flex flex-wrap items-center gap-2 pt-1">
<button class="px-3 py-1.5 rounded bg-secondary hover:bg-secondary-container text-on-secondary text-xs font-semibold">
                  View Incident
                </button>
<button class="px-3 py-1.5 rounded bg-surface-container hover:bg-surface-container-highest text-on-surface text-xs font-semibold">
                  Acknowledge
                </button>
<button class="px-3 py-1.5 rounded bg-surface-container hover:bg-surface-container-highest text-on-surface text-xs font-semibold">
                  Open Runbook
                </button>
</div>
</div>
</div>
</div>
</div>
</section>
<!-- 8. CUSTOMER SUPPORT CONNECTION (VOC & Incident Correlation) -->
<section class="flex flex-col space-y-8">
<div class="text-center max-w-2xl mx-auto space-y-3">
<span class="font-label-caps text-label-caps text-secondary font-bold tracking-wider">VOC &amp; TELEMETRY INTEGRATION</span>
<h2 class="font-headline-xl text-headline-xl text-on-surface tracking-tight">
          고객 지원(CS)과 시스템 인시던트의 유기적 연계
        </h2>
<p class="font-body-md text-body-md text-on-surface-variant">
          사용자 장애 문의 접수 시점과 SentinelOps 인시던트 로그를 1:1로 매핑하여 원인을 즉시 규명합니다.
        </p>
</div>
<!-- Correlation Flow Steps -->
<div class="p-6 md:p-8 rounded-xl bg-surface-container-lowest shadow-sm space-y-6">
<div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-6 gap-4 text-center">
<div class="p-3 rounded-lg bg-surface-container-low flex flex-col items-center">
<span class="w-8 h-8 rounded-full bg-secondary text-on-secondary flex items-center justify-center font-bold text-xs mb-2">1</span>
<div class="font-headline-sm text-[14px] font-semibold text-on-surface mb-1">User Reports Problem</div>
<p class="font-body-sm text-[11px] text-on-surface-variant">고객센터 결제/로그인 오류 문의 등록</p>
</div>
<div class="p-3 rounded-lg bg-surface-container-low flex flex-col items-center">
<span class="w-8 h-8 rounded-full bg-secondary text-on-secondary flex items-center justify-center font-bold text-xs mb-2">2</span>
<div class="font-headline-sm text-[14px] font-semibold text-on-surface mb-1">Support Board</div>
<p class="font-body-sm text-[11px] text-on-surface-variant">접수 화면에 문의 시간 및 계정 기록</p>
</div>
<div class="p-3 rounded-lg bg-surface-container-low flex flex-col items-center">
<span class="w-8 h-8 rounded-full bg-secondary text-on-secondary flex items-center justify-center font-bold text-xs mb-2">3</span>
<div class="font-headline-sm text-[14px] font-semibold text-on-surface mb-1">Admin Investigates</div>
<p class="font-body-sm text-[11px] text-on-surface-variant">발생 시각 및 계정으로 인시던트 조회</p>
</div>
<div class="p-3 rounded-lg bg-surface-container-low flex flex-col items-center">
<span class="w-8 h-8 rounded-full bg-secondary text-on-secondary flex items-center justify-center font-bold text-xs mb-2">4</span>
<div class="font-headline-sm text-[14px] font-semibold text-on-surface mb-1">SentinelOps Logs</div>
<p class="font-body-sm text-[11px] text-on-surface-variant">동일 시점 LoginException 즉각 매칭</p>
</div>
<div class="p-3 rounded-lg bg-surface-container-low flex flex-col items-center">
<span class="w-8 h-8 rounded-full bg-secondary text-on-secondary flex items-center justify-center font-bold text-xs mb-2">5</span>
<div class="font-headline-sm text-[14px] font-semibold text-on-surface mb-1">Incident Correlation</div>
<p class="font-body-sm text-[11px] text-on-surface-variant">시간대, 사용자, 에러 코드 다차원 상관 분석</p>
</div>
<div class="p-3 rounded-lg bg-surface-container-low flex flex-col items-center">
<span class="w-8 h-8 rounded-full bg-secondary text-on-secondary flex items-center justify-center font-bold text-xs mb-2">6</span>
<div class="font-headline-sm text-[14px] font-semibold text-on-surface mb-1">Resolution</div>
<p class="font-body-sm text-[11px] text-on-surface-variant">원인 규명 및 고객 맞춤 안내 완료</p>
</div>
</div>
<!-- Highlight Callout Box -->
<div class="p-4 rounded-xl bg-surface-container-high flex items-center space-x-3 text-on-surface">
<span class="material-symbols-outlined text-secondary text-[24px] flex-shrink-0">hub</span>
<p class="font-body-md text-body-md">
<strong>통합 추적 엔진:</strong> 관리자가 발생 시간(Time), 사용자(User), 오류 유형(Error Type)을 기반으로 언제든 손쉽게 장애 상관관계를 추적할 수 있습니다.
          </p>
</div>
</div>
</section>
<!-- 9. FINAL CALL TO ACTION (CTA) -->
<section class="flex flex-col">
<div class="p-8 md:p-14 rounded-2xl bg-primary-container text-inverse-on-surface shadow-xl flex flex-col space-y-8 relative overflow-hidden">
<div class="max-w-2xl space-y-4">
<span class="font-label-caps text-label-caps text-on-tertiary-container font-bold tracking-widest uppercase">READY FOR MISSION-CRITICAL STABILITY</span>
<h2 class="font-headline-xl text-headline-xl text-on-secondary tracking-tight">
            시스템 운영의 다음 단계를 시작하세요.
          </h2>
<p class="font-body-lg text-body-lg text-inverse-primary">
            사후 처리에 머물던 장애 대응을 AI 보조 능동형 관제로 전환하세요. 30일 무료 엔터프라이즈 PoC를 제공합니다.
          </p>
</div>
<div class="flex flex-wrap items-center gap-4">
<a class="inline-flex items-center justify-center space-x-2 px-6 py-3 rounded-xl bg-secondary hover:bg-secondary-container text-on-secondary font-headline-sm text-headline-sm transition-all shadow-md" href="#contact">
<span>문의하기</span>
<span class="material-symbols-outlined text-[18px]">arrow_forward</span>
</a>
<a class="inline-flex items-center justify-center space-x-2 px-6 py-3 rounded-xl bg-inverse-surface hover:bg-surface-variant text-inverse-on-surface font-headline-sm text-headline-sm transition-colors" href="#docs">
<span>솔루션 살펴보기</span>
</a>
</div>
<!-- SLA & Compliance Proof Pills -->
<div class="pt-6 flex flex-wrap items-center gap-3 text-body-sm font-code-inline text-code-inline text-on-primary-container">
<div class="flex items-center space-x-1.5 px-3 py-1 rounded bg-inverse-surface">
<span class="material-symbols-outlined text-[16px] text-on-tertiary-container">support_agent</span>
<span>24/7/365 NOC Hotline (1544-6820)</span>
</div>
<div class="flex items-center space-x-1.5 px-3 py-1 rounded bg-inverse-surface">
<span class="material-symbols-outlined text-[16px] text-on-tertiary-container">verified</span>
<span>ISMS-P 준수</span>
</div>
<div class="flex items-center space-x-1.5 px-3 py-1 rounded bg-inverse-surface">
<span class="material-symbols-outlined text-[16px] text-on-tertiary-container">dns</span>
<span>맞춤 온프레미스 / 멀티클라우드 지원</span>
</div>
</div>
</div>
</section>
</div>
</div></main>
<!-- END: MainContent -->
<jsp:include page="/inc/bottom.jsp" />
</body></html>