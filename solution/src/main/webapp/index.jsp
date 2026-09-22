<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="ko"><head>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>Nexura Systems - 엔터프라이즈 미션 크리티컬 IT 인프라 &amp; 보안 솔루션</title>
<!-- Tailwind CSS v3 CDN with forms and container-queries -->
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<!-- Tailwind Custom Configuration -->
<script data-purpose="tailwind-config">
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
<style data-purpose="custom-animations">
    @keyframes pulseGlow {
      0%, 100% { opacity: 0.8; transform: scale(1); }
      50% { opacity: 1; transform: scale(1.05); }
    }
    .animate-pulse-glow {
      animation: pulseGlow 3s ease-in-out infinite;
    }
  </style>
</head>
<body class="bg-[#f8f9ff]">
<jsp:include page="/inc/top.jsp" />
<!-- BEGIN: MainContent -->
<!-- Note: Header and Footer are omitted per architecture requirements for JSP inclusion -->
<main class="w-full min-h-screen bg-[#f8f9ff] font-sans antialiased text-[#0b1c30]">
<!-- BEGIN: HeroSection -->
<section class="relative overflow-hidden pt-12 pb-20 lg:pt-20 lg:pb-28 border-b border-slate-200" data-purpose="hero-section">
<!-- Background Ambient Glow -->
<div class="absolute -top-32 -left-32 w-96 h-96 bg-blue-200/40 rounded-full blur-3xl pointer-events-none"></div>
<div class="absolute top-1/2 -right-32 w-96 h-96 bg-cyan-100/50 rounded-full blur-3xl pointer-events-none"></div>
<div class="max-w-[1200px] mx-auto px-4 sm:px-6 lg:px-8">
<div class="grid grid-cols-1 lg:grid-cols-12 gap-12 lg:gap-8 items-center">
<!-- Left Column: Copy & CTA -->
<div class="lg:col-span-6 flex flex-col items-start space-y-6">
<!-- Enterprise Badge -->
<div class="inline-flex items-center gap-2.5 px-3.5 py-1.5 rounded-full bg-blue-50/90 border border-blue-200 text-blue-900 text-xs sm:text-sm font-semibold shadow-xs">
<span class="relative flex h-2.5 w-2.5">
<span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75"></span>
<span class="relative inline-flex rounded-full h-2.5 w-2.5 bg-emerald-500"></span>
</span>
              엔터프라이즈 미션 크리티컬 인프라 &amp; 보안 플랫폼
            </div>
<!-- Main Headline -->
<h1 class="text-4xl sm:text-5xl lg:text-[48px] xl:text-[54px] font-bold text-[#0a192f] leading-[1.2] tracking-tight">
              복잡한 IT 환경을 <br class="hidden sm:inline"/>더 단순하고 안전하게
            </h1>
<!-- Subtitle -->
<p class="text-slate-600 text-base sm:text-lg leading-relaxed max-w-xl font-normal">
              웹 인프라부터 보안, 결제, 시스템 모니터링까지<br class="hidden sm:inline"/>
              기업의 안정적인 디지털 환경을 지원합니다.
            </p>
<!-- CTA Action Buttons -->
<div class="flex flex-wrap items-center gap-3.5 pt-2 w-full sm:w-auto">
<a class="w-full sm:w-auto inline-flex items-center justify-center gap-2 px-7 py-3.5 rounded-xl bg-[#0a192f] hover:bg-[#1e50d8] text-white text-base font-semibold transition-all duration-200 shadow-md hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-600" href="#solutions">
<span>솔루션 살펴보기</span>
<span class="material-symbols-outlined text-lg">arrow_forward</span>
</a>
<a class="w-full sm:w-auto inline-flex items-center justify-center px-7 py-3.5 rounded-xl bg-white hover:bg-slate-50 text-[#0a192f] border border-slate-300 hover:border-slate-400 text-base font-semibold transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-slate-300" href="#about">
                회사소개
              </a>
</div>
<!-- Trust Indicators -->
<div class="pt-6 border-t border-slate-200/80 w-full">
<div class="flex flex-wrap items-center gap-y-3 gap-x-6 text-xs sm:text-sm text-slate-500 font-medium">
<div class="flex items-center gap-1.5">
<span class="material-symbols-outlined text-emerald-600 text-lg">verified</span>
<span>ISMS-P &amp; ISO 27001 인증</span>
</div>
<div class="flex items-center gap-1.5">
<span class="material-symbols-outlined text-blue-600 text-lg">account_balance</span>
<span>금융권 및 대규모 이커머스 레퍼런스 보유</span>
</div>
<div class="flex items-center gap-1.5">
<span class="material-symbols-outlined text-cyan-600 text-lg">headset_mic</span>
<span>24/7/365 전담 엔지니어 관제</span>
</div>
</div>
</div>
</div>
<!-- Right Column: Visual Telemetry Visual -->
<div class="lg:col-span-6 relative flex justify-center items-center">
<div class="relative w-full max-w-lg lg:max-w-none rounded-2xl p-2 bg-gradient-to-b from-blue-500/20 via-slate-800/10 to-cyan-500/20 shadow-2xl border border-slate-200/60 backdrop-blur-xs">
<!-- Live Floating Badge 1 (Top Right) -->
<div class="absolute -top-4 -right-2 sm:-right-4 z-20 flex items-center gap-2 bg-[#071326]/95 border border-cyan-400/40 text-cyan-300 px-4 py-2 rounded-xl text-xs sm:text-sm font-semibold shadow-xl backdrop-blur-md">
<span class="h-2 w-2 rounded-full bg-cyan-400 animate-pulse"></span>
<span>3.2 Tbps 디도스 방어망</span>
</div>
<!-- Main SVG Visual Container -->
<div class="w-full aspect-[640/460] rounded-xl overflow-hidden shadow-inner bg-[#0a192f]">
<svg class="w-full h-full object-contain" fill="none" height="100%" viewbox="0 0 640 460" width="100%" xmlns="http://www.w3.org/2000/svg">
<defs>
<lineargradient id="bg-grad" x1="0%" x2="100%" y1="0%" y2="100%">
<stop offset="0%" stop-color="#0a192f"></stop>
<stop offset="60%" stop-color="#0d2144"></stop>
<stop offset="100%" stop-color="#051021"></stop>
</lineargradient>
<lineargradient id="glow-cyan" x1="0%" x2="100%" y1="0%" y2="0%">
<stop offset="0%" stop-color="#00f2fe" stop-opacity="0.8"></stop>
<stop offset="100%" stop-color="#4facfe" stop-opacity="0.8"></stop>
</lineargradient>
<lineargradient id="pulse-blue" x1="0%" x2="0%" y1="0%" y2="100%">
<stop offset="0%" stop-color="#1e50d8"></stop>
<stop offset="100%" stop-color="#0ea5e9"></stop>
</lineargradient>
<filter height="140%" id="neon-glow" width="140%" x="-20%" y="-20%">
<fegaussianblur result="blur" stddeviation="6"></fegaussianblur>
<femerge>
<femergenode in="blur"></femergenode>
<femergenode in="SourceGraphic"></femergenode>
</femerge>
</filter>
</defs>
<!-- Dark Canvas Base -->
<rect fill="url(#bg-grad)" height="460" rx="16" width="640"></rect>
<!-- Subtle Grid Pattern -->
<g opacity="0.15">
<path d="M40 0v460M100 0v460M160 0v460M220 0v460M280 0v460M340 0v460M400 0v460M460 0v460M520 0v460M580 0v460" stroke="#38bdf8" stroke-width="1"></path>
<path d="M0 40h640M0 100h640M0 160h640M0 220h640M0 280h640M0 340h640M0 400h640" stroke="#38bdf8" stroke-width="1"></path>
</g>
<!-- Network Interconnect Mesh Lines -->
<g opacity="0.4" stroke="#1e50d8" stroke-width="2">
<line x1="120" x2="260" y1="140" y2="100"></line>
<line x1="260" x2="420" y1="100" y2="150"></line>
<line x1="420" x2="520" y1="150" y2="110"></line>
<line x1="120" x2="200" y1="140" y2="280"></line>
<line x1="260" x2="340" y1="100" y2="240"></line>
<line x1="420" x2="480" y1="150" y2="300"></line>
<line x1="200" x2="340" y1="280" y2="240"></line>
<line x1="340" x2="480" y1="240" y2="300"></line>
</g>
<!-- Glowing Active Data Streams -->
<path d="M120 140 L260 100 L340 240 L480 300" filter="url(#neon-glow)" stroke="#00f2fe" stroke-dasharray="8 6" stroke-width="2.5"></path>
<path d="M260 100 L420 150 L340 240 L200 280" filter="url(#neon-glow)" stroke="#38bdf8" stroke-dasharray="6 4" stroke-width="2"></path>
<!-- Server Blade Node 1 (Left) -->
<g transform="translate(70, 95)">
<rect fill="#0b172a" height="90" rx="8" stroke="#1e3a8a" stroke-width="1.5" width="100"></rect>
<rect fill="#1e293b" height="12" rx="3" width="80" x="10" y="14"></rect>
<circle cx="20" cy="20" fill="#10b981" r="3"></circle>
<circle cx="28" cy="20" fill="#38bdf8" r="3"></circle>
<rect fill="#1e293b" height="12" rx="3" width="80" x="10" y="34"></rect>
<circle cx="20" cy="40" fill="#10b981" r="3"></circle>
<rect fill="#1e293b" height="12" rx="3" width="80" x="10" y="54"></rect>
<circle cx="20" cy="60" fill="#38bdf8" r="3"></circle>
<text fill="#64748b" font-family="sans-serif" font-size="9" font-weight="bold" x="38" y="77">KR-SEOUL #1</text>
</g>
<!-- Central Cloud Security Cluster (Hub) -->
<g transform="translate(270, 160)">
<circle cx="70" cy="70" fill="#0f2744" filter="url(#neon-glow)" r="64" stroke="#0284c7" stroke-width="2"></circle>
<circle cx="70" cy="70" fill="#0a192f" r="50" stroke="#38bdf8" stroke-dasharray="4 3" stroke-width="1"></circle>
<!-- Shield Icon in Center -->
<path d="M70 42 L88 50 C88 68 79 82 70 88 C61 82 52 68 52 50 Z" fill="#1e50d8" stroke="#00f2fe" stroke-width="2"></path>
<path d="M64 64 L68 68 L76 58" stroke="#ffffff" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
<text fill="#38bdf8" font-family="sans-serif" font-size="10" font-weight="bold" letter-spacing="1" text-anchor="middle" x="70" y="104">ZERO-TRUST</text>
<text fill="#94a3b8" font-family="sans-serif" font-size="8" text-anchor="middle" x="70" y="117">CORE FABRIC</text>
</g>
<!-- Node 2 (Top Center - Edge Scrubbing Node) -->
<g transform="translate(220, 50)">
<rect fill="#0b172a" height="60" rx="8" stroke="#0369a1" stroke-width="1.5" width="80"></rect>
<text fill="#00f2fe" font-family="sans-serif" font-size="10" font-weight="bold" x="14" y="24">3.2 Tbps</text>
<text fill="#94a3b8" font-family="sans-serif" font-size="8" x="14" y="42">DDoS Mitigation</text>
</g>
<!-- Node 3 (Right - Global Anycast PoP) -->
<g transform="translate(440, 70)">
<rect fill="#0b172a" height="75" rx="8" stroke="#1d4ed8" stroke-width="1.5" width="130"></rect>
<circle cx="20" cy="22" fill="#10b981" r="4"></circle>
<text fill="#e2e8f0" font-family="sans-serif" font-size="11" font-weight="bold" x="32" y="26">Global Anycast</text>
<text fill="#38bdf8" font-family="sans-serif" font-size="9" x="20" y="44">36 PoPs Interconnected</text>
<text fill="#64748b" font-family="sans-serif" font-size="8" x="20" y="58">Latency: &lt; 1.8ms Edge</text>
</g>
<!-- Node 4 (Bottom Left - Payment HSM Enclave) -->
<g transform="translate(130, 260)">
<rect fill="#0b172a" height="70" rx="8" stroke="#0284c7" stroke-width="1.5" width="140"></rect>
<text fill="#38bdf8" font-family="sans-serif" font-size="10" font-weight="bold" x="16" y="25">PCI-DSS Level 1</text>
<text fill="#94a3b8" font-family="sans-serif" font-size="9" x="16" y="42">Hardware Token HSM</text>
<rect fill="#1e293b" height="4" rx="2" width="80" x="16" y="50"></rect>
<rect fill="#10b981" height="4" rx="2" width="60" x="16" y="50"></rect>
</g>
<!-- Node 5 (Bottom Right - SentinelOps AI Engine) -->
<g transform="translate(420, 250)">
<rect fill="#071326" filter="url(#neon-glow)" height="95" rx="10" stroke="#00f2fe" stroke-width="1.5" width="160"></rect>
<rect fill="#1e293b" height="18" rx="4" width="60" x="12" y="12"></rect>
<text fill="#38bdf8" font-family="sans-serif" font-size="9" font-weight="bold" x="22" y="25">AI ENGINE</text>
<text fill="#10b981" font-family="sans-serif" font-size="9" x="80" y="25">● ACTIVE</text>
<text fill="#ffffff" font-family="sans-serif" font-size="12" font-weight="bold" x="14" y="48">SentinelOps™ Telemetry</text>
<text fill="#94a3b8" font-family="sans-serif" font-size="9" x="14" y="65">Heuristic Anomaly Detection</text>
<text fill="#38bdf8" font-family="sans-serif" font-size="9" x="14" y="80">MTTD: 1.2s | Zero-Day Patch</text>
</g>
<!-- Floating Telemetry Pills -->
<g transform="translate(60, 380)">
<rect fill="#07111e" height="44" rx="8" stroke="#1e293b" stroke-width="1" width="520"></rect>
<circle cx="24" cy="22" fill="#10b981" r="4"></circle>
<text fill="#f8fafc" font-family="sans-serif" font-size="11" font-weight="bold" x="36" y="26">SLA 99.99% Guaranteed</text>
<path d="M190 12v20" stroke="#1e293b" stroke-width="1"></path>
<text fill="#94a3b8" font-family="sans-serif" font-size="11" x="208" y="26">Scrubbing: <tspan fill="#38bdf8" font-weight="bold">3.2 Tbps</tspan></text>
<path d="M340 12v20" stroke="#1e293b" stroke-width="1"></path>
<text fill="#94a3b8" font-family="sans-serif" font-size="11" x="358" y="26">Incident Response: <tspan fill="#10b981" font-weight="bold">&lt; 15m</tspan></text>
</g>
</svg>
</div>
<!-- Live Floating Badge 2 (Bottom Left) -->
<div class="absolute -bottom-4 -left-2 sm:-left-4 z-20 flex items-center gap-2 bg-[#071326]/95 border border-emerald-500/40 text-emerald-300 px-4 py-2 rounded-xl text-xs sm:text-sm font-semibold shadow-xl backdrop-blur-md">
<span class="h-2 w-2 rounded-full bg-emerald-400"></span>
<span>99.99% 가용성 보장</span>
</div>
</div>
</div>
</div>
</div>
</section>
<!-- END: HeroSection -->
<!-- BEGIN: SolutionOverview -->
<section class="py-20 bg-white" data-purpose="solutions-catalog" id="solutions">
<div class="max-w-[1200px] mx-auto px-4 sm:px-6 lg:px-8">
<!-- Section Heading -->
<div class="text-center max-w-3xl mx-auto mb-14">
<h2 class="text-3xl sm:text-4xl font-bold text-[#0a192f] tracking-tight">기업을 위한 IT 솔루션</h2>
<p class="mt-3.5 text-base sm:text-lg text-slate-600 font-normal">
            클라우드 인프라부터 보안, 결제, 자율 관제까지 원스톱으로 지원하는 엔터프라이즈 솔루션 라인업입니다.
          </p>
</div>
<!-- Solutions 4-Column Grid -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
<!-- Card 1: Web Hosting -->
<div class="group relative flex flex-col justify-between p-7 rounded-2xl bg-[#f8faff] border border-slate-200/90 hover:border-blue-300 hover:shadow-xl transition-all duration-300">
<div>
<div class="w-13 h-13 w-12 h-12 rounded-xl bg-blue-100/70 text-blue-700 flex items-center justify-center mb-5 group-hover:bg-blue-600 group-hover:text-white transition-colors duration-200">
<span class="material-symbols-outlined text-2xl">dns</span>
</div>
<h3 class="text-xl font-bold text-[#0a192f] mb-2.5">Web Hosting</h3>
<p class="text-slate-600 text-sm leading-relaxed mb-4">
                안정적인 웹 서비스 운영을 위한 인프라
              </p>
<p class="text-xs text-slate-500 bg-white/80 p-2.5 rounded-lg border border-slate-200">
                Tier-IV 무중단 서버 및 고성능 NVMe SAN 스토리지 기본 탑재
              </p>
</div>
<div class="pt-6 mt-6 border-t border-slate-200/60">
<a class="inline-flex items-center text-sm font-semibold text-blue-600 group-hover:text-blue-700" href="#contact">
                자세히 보기 <span class="ml-1 transition-transform duration-200 group-hover:translate-x-1">→</span>
</a>
</div>
</div>
<!-- Card 2: Web Security -->
<div class="group relative flex flex-col justify-between p-7 rounded-2xl bg-[#f8faff] border border-slate-200/90 hover:border-blue-300 hover:shadow-xl transition-all duration-300">
<div>
<div class="w-12 h-12 rounded-xl bg-emerald-100/70 text-emerald-700 flex items-center justify-center mb-5 group-hover:bg-emerald-600 group-hover:text-white transition-colors duration-200">
<span class="material-symbols-outlined text-2xl">shield</span>
</div>
<h3 class="text-xl font-bold text-[#0a192f] mb-2.5">Web Security</h3>
<p class="text-slate-600 text-sm leading-relaxed mb-4">
                기업의 서비스와 데이터를 보호하는 보안 솔루션
              </p>
<p class="text-xs text-slate-500 bg-white/80 p-2.5 rounded-lg border border-slate-200">
                3.2Tbps 대용량 DDoS 방어 및 AI 기반 지능형 웹 애플리케이션 방화벽(WAF)
              </p>
</div>
<div class="pt-6 mt-6 border-t border-slate-200/60">
<a class="inline-flex items-center text-sm font-semibold text-blue-600 group-hover:text-blue-700" href="#contact">
                자세히 보기 <span class="ml-1 transition-transform duration-200 group-hover:translate-x-1">→</span>
</a>
</div>
</div>
<!-- Card 3: Web Payment -->
<div class="group relative flex flex-col justify-between p-7 rounded-2xl bg-[#f8faff] border border-slate-200/90 hover:border-blue-300 hover:shadow-xl transition-all duration-300">
<div>
<div class="w-12 h-12 rounded-xl bg-indigo-100/70 text-indigo-700 flex items-center justify-center mb-5 group-hover:bg-indigo-600 group-hover:text-white transition-colors duration-200">
<span class="material-symbols-outlined text-2xl">credit_card</span>
</div>
<h3 class="text-xl font-bold text-[#0a192f] mb-2.5">Web Payment</h3>
<p class="text-slate-600 text-sm leading-relaxed mb-4">
                안전하고 편리한 온라인 결제 시스템
              </p>
<p class="text-xs text-slate-500 bg-white/80 p-2.5 rounded-lg border border-slate-200">
                PCI-DSS Level 1 인증 준수 및 강력한 하드웨어 토큰 암호화 모듈
              </p>
</div>
<div class="pt-6 mt-6 border-t border-slate-200/60">
<a class="inline-flex items-center text-sm font-semibold text-blue-600 group-hover:text-blue-700" href="#contact">
                자세히 보기 <span class="ml-1 transition-transform duration-200 group-hover:translate-x-1">→</span>
</a>
</div>
</div>
<!-- Card 4: SentinelOps (Prominent AI-Powered Card) -->
<div class="group relative flex flex-col justify-between p-7 rounded-2xl bg-gradient-to-b from-[#0c1e38] to-[#071324] border-2 border-cyan-500/60 shadow-xl shadow-cyan-950/20 text-white transition-all duration-300 transform hover:-translate-y-1">
<!-- Floating Badge -->
<div class="absolute -top-3 right-6 bg-cyan-400 text-[#071324] font-extrabold text-[11px] uppercase tracking-wider px-3 py-1 rounded-full shadow-md">
              AI-POWERED CORE
            </div>
<div>
<div class="w-12 h-12 rounded-xl bg-cyan-500/20 border border-cyan-400/30 text-cyan-300 flex items-center justify-center mb-5 group-hover:bg-cyan-400 group-hover:text-slate-900 transition-colors duration-200">
<span class="material-symbols-outlined text-2xl">psychology</span>
</div>
<h3 class="text-xl font-bold text-white mb-2.5 flex items-center gap-2">
                SentinelOps
                <span class="inline-block w-2 h-2 rounded-full bg-cyan-400 animate-ping"></span>
</h3>
<p class="text-slate-300 text-sm leading-relaxed mb-4">
                시스템 오류를 탐지하고 분석하는 AI-assisted monitoring solution
              </p>
<p class="text-xs text-cyan-200/80 bg-cyan-950/40 p-2.5 rounded-lg border border-cyan-500/30">
                장애 사전 감지율 98.4% &amp; 실시간 AI 원클릭 근본원인 분석 지원
              </p>
</div>
<div class="pt-6 mt-6 border-t border-cyan-500/30">
<a class="inline-flex items-center text-sm font-semibold text-cyan-400 group-hover:text-cyan-300" href="#sentinelops">
                자세히 보기 <span class="ml-1 transition-transform duration-200 group-hover:translate-x-1">→</span>
</a>
</div>
</div>
</div>
</div>
</section>
<!-- END: SolutionOverview -->
<!-- BEGIN: SentinelOpsDeepDive -->
<section class="py-24 bg-[#0a192f] text-white relative overflow-hidden" data-purpose="sentinelops-section" id="sentinelops">
<!-- Ambient Decorative Backdrop -->
<div class="absolute top-0 right-0 -mr-40 -mt-40 w-96 h-96 bg-cyan-500/10 rounded-full blur-3xl pointer-events-none"></div>
<div class="absolute bottom-0 left-0 -ml-40 -mb-40 w-96 h-96 bg-blue-600/10 rounded-full blur-3xl pointer-events-none"></div>
<div class="max-w-[1200px] mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
<!-- Section Header -->
<div class="max-w-3xl mb-16">
<div class="inline-block text-xs sm:text-sm font-bold tracking-widest text-[#00f2fe] uppercase mb-2">
            AI-POWERED AUTONOMOUS MONITORING
          </div>
<h2 class="text-3xl sm:text-4xl lg:text-[42px] font-bold text-white tracking-tight leading-tight">
            문제가 발생하기 전에 <br class="hidden sm:inline"/>시스템을 이해하세요.
          </h2>
<p class="mt-4 text-slate-400 text-base sm:text-lg">
            SentinelOps는 단순한 임계치 알림을 넘어 인공지능이 시스템 맥락을 해석하고 능동적으로 대응 방안을 제시합니다.
          </p>
</div>
<!-- 2-Column Grid: Breakdown & Interactive Visual Dashboard -->
<div class="grid grid-cols-1 lg:grid-cols-12 gap-12 items-center">
<!-- Left Column: 5 Feature Breakdown -->
<div class="lg:col-span-6 space-y-6">
<!-- Item 1 -->
<div class="flex items-start gap-4 p-4 rounded-xl bg-slate-800/40 border border-slate-700/60 hover:border-cyan-500/50 transition-colors">
<div class="flex-shrink-0 w-10 h-10 rounded-lg bg-blue-900/50 text-cyan-400 flex items-center justify-center font-bold text-sm">
                01
              </div>
<div>
<h3 class="text-lg font-bold text-white flex items-center gap-2">
                  초정밀 에러 탐지 <span class="text-xs font-normal text-cyan-300">(Error Detection)</span>
</h3>
<p class="text-sm text-slate-300 mt-1 leading-relaxed">
                  마이크로서비스 및 분산 서버 환경에서 발생하는 비정상 트래픽 및 런타임 익셉션을 1초 이내 실시간 탐지.
                </p>
</div>
</div>
<!-- Item 2 -->
<div class="flex items-start gap-4 p-4 rounded-xl bg-slate-800/40 border border-slate-700/60 hover:border-cyan-500/50 transition-colors">
<div class="flex-shrink-0 w-10 h-10 rounded-lg bg-blue-900/50 text-cyan-400 flex items-center justify-center font-bold text-sm">
                02
              </div>
<div>
<h3 class="text-lg font-bold text-white flex items-center gap-2">
                  심각도 자동 분류 <span class="text-xs font-normal text-cyan-300">(Severity Classification)</span>
</h3>
<p class="text-sm text-slate-300 mt-1 leading-relaxed">
                  P1(긴급 서비스 장애)부터 P4(단순 마이너 경고)까지 고도화된 AI 모델이 비즈니스 영향도를 스스로 판별.
                </p>
</div>
</div>
<!-- Item 3 -->
<div class="flex items-start gap-4 p-4 rounded-xl bg-slate-800/40 border border-slate-700/60 hover:border-cyan-500/50 transition-colors">
<div class="flex-shrink-0 w-10 h-10 rounded-lg bg-blue-900/50 text-cyan-400 flex items-center justify-center font-bold text-sm">
                03
              </div>
<div>
<h3 class="text-lg font-bold text-white flex items-center gap-2">
                  AI 로그 요약 &amp; 원인 진단 <span class="text-xs font-normal text-cyan-300">(AI Log Summary)</span>
</h3>
<p class="text-sm text-slate-300 mt-1 leading-relaxed">
                  수만 줄의 복잡한 스택트레이스를 분석하여 3줄 핵심 요약 및 권장 조치 가이드라인 즉각 제시.
                </p>
</div>
</div>
<!-- Item 4 -->
<div class="flex items-start gap-4 p-4 rounded-xl bg-slate-800/40 border border-slate-700/60 hover:border-cyan-500/50 transition-colors">
<div class="flex-shrink-0 w-10 h-10 rounded-lg bg-blue-900/50 text-cyan-400 flex items-center justify-center font-bold text-sm">
                04
              </div>
<div>
<h3 class="text-lg font-bold text-white flex items-center gap-2">
                  실시간 팀 알림 &amp; 웹훅 <span class="text-xs font-normal text-cyan-300">(Slack &amp; NOC Alerts)</span>
</h3>
<p class="text-sm text-slate-300 mt-1 leading-relaxed">
                  슬랙, 잔디, 카카오 알림톡 및 24시간 Nexura 전담 NOC 관제실에 실시간 즉각 동기화.
                </p>
</div>
</div>
<!-- Item 5 -->
<div class="flex items-start gap-4 p-4 rounded-xl bg-slate-800/40 border border-slate-700/60 hover:border-cyan-500/50 transition-colors">
<div class="flex-shrink-0 w-10 h-10 rounded-lg bg-blue-900/50 text-cyan-400 flex items-center justify-center font-bold text-sm">
                05
              </div>
<div>
<h3 class="text-lg font-bold text-white flex items-center gap-2">
                  원클릭 인시던트 관리 <span class="text-xs font-normal text-cyan-300">(Incident Management)</span>
</h3>
<p class="text-sm text-slate-300 mt-1 leading-relaxed">
                  장애 발생부터 조치 복구까지 전체 타임라인 기록 및 사후 재발방지 포스트모텀 보고서 자동 생성.
                </p>
</div>
</div>
<div class="pt-4">
<a class="inline-flex items-center gap-2 px-8 py-4 rounded-xl bg-gradient-to-r from-cyan-400 to-blue-500 text-slate-950 font-bold text-base hover:opacity-95 shadow-lg shadow-cyan-500/20 transition-all" href="#contact">
<span>SentinelOps 알아보기</span>
<span class="material-symbols-outlined text-lg">arrow_outward</span>
</a>
</div>
</div>
<!-- Right Column: Realistic Modern Glassmorphic Dashboard -->
<div class="lg:col-span-6" data-purpose="telemetry-dashboard-mockup">
<div class="rounded-2xl bg-[#081528]/95 border border-cyan-500/30 p-5 sm:p-7 shadow-2xl backdrop-blur-xl relative">
<!-- Dashboard Top Window Controls -->
<div class="flex items-center justify-between pb-5 border-b border-slate-800">
<div class="flex items-center gap-2">
<div class="w-3 h-3 rounded-full bg-rose-500/80"></div>
<div class="w-3 h-3 rounded-full bg-amber-500/80"></div>
<div class="w-3 h-3 rounded-full bg-emerald-500/80"></div>
<span class="ml-2 text-xs font-mono text-slate-400">SentinelOps Live Monitoring Core</span>
</div>
<div class="flex items-center gap-2 bg-emerald-500/10 border border-emerald-500/30 px-2.5 py-1 rounded-full">
<span class="w-2 h-2 rounded-full bg-emerald-400 animate-pulse"></span>
<span class="text-[11px] font-mono font-bold text-emerald-400 uppercase tracking-wide">ACTIVE</span>
</div>
</div>
<!-- Top Telemetry 3 Metrics -->
<div class="grid grid-cols-3 gap-3 my-5">
<div class="bg-slate-900/80 border border-slate-800 p-3 rounded-xl">
<div class="text-[11px] text-slate-400 font-mono">MTTD (Mean Time)</div>
<div class="text-lg sm:text-xl font-bold text-cyan-400 mt-1">1.2s</div>
</div>
<div class="bg-slate-900/80 border border-slate-800 p-3 rounded-xl">
<div class="text-[11px] text-slate-400 font-mono">Anomaly Score</div>
<div class="text-lg sm:text-xl font-bold text-emerald-400 mt-1">Normal 99.4%</div>
</div>
<div class="bg-slate-900/80 border border-slate-800 p-3 rounded-xl">
<div class="text-[11px] text-slate-400 font-mono">Daily Purged</div>
<div class="text-lg sm:text-xl font-bold text-white mt-1">12,480 req</div>
</div>
</div>
<!-- Realtime Simulated Incident Card -->
<div class="bg-slate-900/90 rounded-xl border border-rose-500/40 p-4 mb-4 relative overflow-hidden">
<div class="absolute left-0 top-0 bottom-0 w-1 bg-rose-500"></div>
<div class="flex items-center justify-between mb-2">
<div class="flex items-center gap-2">
<span class="px-2 py-0.5 rounded bg-rose-500/20 text-rose-400 text-xs font-bold font-mono">P1 CRITICAL</span>
<span class="text-xs text-slate-300 font-semibold">ICN-02 Auth Service latency spike detected</span>
</div>
<span class="text-[11px] font-mono text-slate-400">Just Now</span>
</div>
<!-- Simulated AI Summary -->
<div class="bg-[#050f1d] p-3 rounded-lg border border-slate-800 text-xs font-mono text-slate-300 space-y-1.5">
<div class="flex items-center gap-1.5 text-cyan-400 font-semibold">
<span class="material-symbols-outlined text-sm">auto_awesome</span>
<span>AI Copilot Analysis:</span>
</div>
<p class="text-slate-300 leading-normal pl-4">
                    ● Connection Pool Exhaustion on Node #4. Auto-scaled 4 additional pods.
                  </p>
<p class="text-slate-300 leading-normal pl-4">
                    ● WAF Rule #804 applied to block malicious credential stuffing pattern.
                  </p>
<div class="text-emerald-400 font-semibold pl-4 pt-1 flex items-center gap-1">
<span class="material-symbols-outlined text-sm">check_circle</span>
<span>Status: Auto-mitigated &amp; Resolved in 420ms</span>
</div>
</div>
</div>
<!-- Live Integration Pill -->
<div class="flex items-center justify-between p-3 rounded-xl bg-slate-900/60 border border-slate-800 text-xs">
<div class="flex items-center gap-2.5 text-slate-300">
<div class="w-6 h-6 rounded bg-[#4a154b] flex items-center justify-center font-bold text-white text-xs">#</div>
<span>Sent notification to <span class="text-cyan-400 font-mono font-medium">#devops-alert</span> via Slack Webhook</span>
</div>
<span class="text-emerald-400 font-mono">Delivered</span>
</div>
<!-- Console Activity Trace -->
<div class="mt-4 pt-4 border-t border-slate-800/80 font-mono text-[11px] text-slate-500 space-y-1">
<div>[14:20:01 UTC] Ingested 148,290 telemetry events across 36 Edge POPs.</div>
<div>[14:20:02 UTC] TLS handshake cert validation check 100% OK.</div>
</div>
</div>
</div>
</div>
</div>
</section>
<!-- END: SentinelOpsDeepDive -->
<!-- BEGIN: WhyNexuraSection -->
<section class="py-20 bg-slate-50 border-b border-slate-200" data-purpose="why-us-section" id="about">
<div class="max-w-[1200px] mx-auto px-4 sm:px-6 lg:px-8">
<!-- Section Header -->
<div class="text-center max-w-3xl mx-auto mb-16">
<h2 class="text-3xl sm:text-4xl font-bold text-[#0a192f] tracking-tight">
            왜 글로벌 기업들이 NEXORA를 선택할까요?
          </h2>
<p class="mt-3 text-base sm:text-lg text-slate-600 font-normal">
            타협 없는 가용성과 검증된 엔지니어링 기술력으로 고객사의 핵심 비즈니스를 지켜냅니다.
          </p>
</div>
<!-- 4 Grid Points -->
<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
<!-- Card 1 -->
<div class="bg-white p-7 rounded-2xl border border-slate-200/80 shadow-xs hover:shadow-md transition-shadow">
<div class="w-12 h-12 rounded-xl bg-blue-50 text-blue-700 flex items-center justify-center mb-5">
<span class="material-symbols-outlined text-2xl">verified_user</span>
</div>
<h3 class="text-xl font-bold text-[#0a192f] mb-2">안정적인 인프라</h3>
<p class="text-slate-600 text-sm leading-relaxed">
              99.99% 금융권 수준 가용성 SLA를 법적으로 보장하며 국내외 Tier-IV 규격 데이터센터 다중 이중화를 제공합니다.
            </p>
</div>
<!-- Card 2 -->
<div class="bg-white p-7 rounded-2xl border border-slate-200/80 shadow-xs hover:shadow-md transition-shadow">
<div class="w-12 h-12 rounded-xl bg-emerald-50 text-emerald-700 flex items-center justify-center mb-5">
<span class="material-symbols-outlined text-2xl">lock</span>
</div>
<h3 class="text-xl font-bold text-[#0a192f] mb-2">보안 중심 설계</h3>
<p class="text-slate-600 text-sm leading-relaxed">
              Zero-Trust 철학 기반의 하드웨어 레벨 암호화 모듈 적용 및 ISMS-P, ISO 27001 등 글로벌 컴플라이언스를 상시 준수합니다.
            </p>
</div>
<!-- Card 3 -->
<div class="bg-white p-7 rounded-2xl border border-slate-200/80 shadow-xs hover:shadow-md transition-shadow">
<div class="w-12 h-12 rounded-xl bg-indigo-50 text-indigo-700 flex items-center justify-center mb-5">
<span class="material-symbols-outlined text-2xl">speed</span>
</div>
<h3 class="text-xl font-bold text-[#0a192f] mb-2">운영 효율성</h3>
<p class="text-slate-600 text-sm leading-relaxed">
              복잡한 서버 패치 및 인프라 프로비저닝을 전자동화하여 고객사 개발 인력이 비즈니스 개발에만 전념하도록 지원합니다.
            </p>
</div>
<!-- Card 4 -->
<div class="bg-white p-7 rounded-2xl border border-slate-200/80 shadow-xs hover:shadow-md transition-shadow">
<div class="w-12 h-12 rounded-xl bg-cyan-50 text-cyan-700 flex items-center justify-center mb-5">
<span class="material-symbols-outlined text-2xl">insights</span>
</div>
<h3 class="text-xl font-bold text-[#0a192f] mb-2">데이터 기반 모니터링</h3>
<p class="text-slate-600 text-sm leading-relaxed">
              SentinelOps 고유 AI 분석 엔진을 통해 장애 징후를 사전에 탐지하고 실시간 심층 텔레메트리 인사이트를 제공합니다.
            </p>
</div>
</div>
</div>
</section>
<!-- END: WhyNexuraSection -->
<!-- BEGIN: CustomerSupportCTA -->
<section class="py-16 bg-[#eff4ff] border-b border-blue-100" data-purpose="customer-support-cta">
<div class="max-w-[1200px] mx-auto px-4 sm:px-6 lg:px-8">
<div class="flex flex-col md:flex-row items-center justify-between gap-8 bg-white p-8 sm:p-10 rounded-3xl border border-blue-200/80 shadow-sm">
<div class="space-y-2 text-center md:text-left">
<div class="inline-flex items-center gap-1.5 text-xs font-bold text-blue-700 uppercase tracking-wide bg-blue-50 px-2.5 py-1 rounded-md mb-1">
<span class="material-symbols-outlined text-sm">support_agent</span>
              24/7 Dedicated Support
            </div>
<h2 class="text-2xl sm:text-3xl font-bold text-[#0a192f]">
              서비스 이용 중 문제가 발생했나요?
            </h2>
<p class="text-slate-600 text-sm sm:text-base max-w-xl">
              전담 엔지니어가 24시간 365일 실시간 관제 및 기술지원을 제공합니다. 평균 응답 시간 15분 이내.
            </p>
<div class="pt-2 text-blue-900 font-bold text-base flex items-center justify-center md:justify-start gap-2">
<span class="material-symbols-outlined text-xl text-blue-600">call</span>
<span>1544-6820 <span class="text-slate-500 font-normal text-xs sm:text-sm">(기술지원 &amp; 관제 긴급 핫라인)</span></span>
</div>
</div>
<!-- Buttons Group -->
<div class="flex flex-col sm:flex-row gap-3 w-full sm:w-auto shrink-0">
<a class="px-7 py-3.5 rounded-xl bg-[#0a192f] hover:bg-[#1e50d8] text-white text-sm font-semibold transition-colors text-center shadow-md" href="#contact">
              문의하기
            </a>
<a class="px-7 py-3.5 rounded-xl bg-white hover:bg-slate-50 text-slate-800 border border-slate-300 text-sm font-semibold transition-colors text-center" href="#support">
              고객센터
            </a>
</div>
</div>
</div>
</section>
<!-- END: CustomerSupportCTA -->
<!-- BEGIN: FinalCTA -->
<section class="py-20 bg-[#061122] text-white relative overflow-hidden" data-purpose="final-call-to-action" id="contact">
<!-- Background subtle glow -->
<div class="absolute inset-0 bg-[radial-gradient(#1e50d8_1px,transparent_1px)] [background-size:24px_24px] opacity-10 pointer-events-none"></div>
<div class="max-w-[1200px] mx-auto px-4 sm:px-6 lg:px-8 relative z-10 text-center">
<h2 class="text-3xl sm:text-4xl lg:text-[40px] font-bold tracking-tight text-white mb-4">
          기업의 IT 운영을 더 안정적으로
        </h2>
<p class="text-slate-300 text-base sm:text-lg max-w-2xl mx-auto mb-8 font-normal leading-relaxed">
          지금 Nexura의 클라우드 인프라와 SentinelOps로 안정적인 디지털 비즈니스를 시작하세요.
        </p>
<div class="flex flex-col sm:flex-row justify-center items-center gap-4">
<a class="w-full sm:w-auto inline-flex items-center justify-center gap-2 px-9 py-4 rounded-xl bg-gradient-to-r from-blue-600 to-cyan-500 hover:from-blue-500 hover:to-cyan-400 text-white font-bold text-base shadow-xl shadow-cyan-900/30 transition-all" href="#contact-form">
<span>문의하기</span>
<span class="material-symbols-outlined text-lg">arrow_forward</span>
</a>
</div>
<p class="mt-5 text-xs sm:text-sm text-cyan-300/80 font-medium">
          ✓ 초기 아키텍처 진단 컨설팅 및 30일 SentinelOps PoC 무료 제공
        </p>
</div>
</section>
<!-- END: FinalCTA -->
</main>
<!-- END: MainContent -->
<jsp:include page="/inc/bottom.jsp" />
</body></html>