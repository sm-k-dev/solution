<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Web + Network + AI Security | NEXORA</title>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" rel="stylesheet" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/solutions_solutions.css?v=20261002-4" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/top.css?v=20261002-4" />
    </head>
    <body class="bg-background font-body-md text-body-md text-on-surface antialiased min-h-screen">
        <jsp:include page="/inc/top.jsp" />
        <main class="w-full bg-background">
            <div class="max-w-[1200px] mx-auto px-gutter-mobile md:px-gutter lg:px-gutter-desktop py-space-xl">
                <nav aria-label="Breadcrumb" class="flex items-center gap-space-xs text-on-surface-variant font-body-sm mb-space-lg">
                    <a class="hover:text-secondary" href="${pageContext.request.contextPath}/index.jsp">홈</a>
                    <span class="material-symbols-outlined text-[15px]">chevron_right</span>
                    <a class="hover:text-secondary" href="${pageContext.request.contextPath}/solutions/solutions.jsp">솔루션</a>
                    <span class="material-symbols-outlined text-[15px]">chevron_right</span>
                    <span class="text-on-surface font-semibold">Web + Network + AI Security</span>
                </nav>
                <section id="security-detail" class="security-hero-layout grid grid-cols-1 lg:grid-cols-12 gap-8 items-stretch mb-space-xl">
                    <div class="security-hero-copy rounded-2xl bg-primary-container text-on-primary p-space-lg md:p-space-xl flex flex-col justify-center relative overflow-hidden">
                        <div class="absolute -top-24 -right-12 w-72 h-72 rounded-full bg-secondary-container/20 blur-3xl pointer-events-none">
                        </div>
                        <div class="relative z-10">
                            <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-surface-container-lowest/10 border border-white/10 text-tertiary-fixed font-label-caps text-label-caps tracking-wider">
                                <span class="w-2 h-2 rounded-full bg-tertiary-fixed-dim animate-pulse">
                                </span> SECURITY API SUBSCRIPTION
                            </div>
                            <h1 class="font-display-hero text-display-hero font-bold tracking-tight leading-tight mt-5">Web + Network +<br class="hidden sm:block" /> AI Security</h1>
                            <p class="font-body-lg text-body-lg text-on-primary-container max-w-2xl mt-5 leading-relaxed">네트워크 경계부터 웹 애플리케이션, AI 입력과 출력까지. 보안 이벤트와 정책을 API로 연결해 한곳에서 살펴보고 대응하는 보안 플랫폼입니다.</p>
                            <div class="flex flex-wrap gap-2 mt-6">
                                <span class="px-3 py-1.5 rounded-full bg-white/10 text-sm">Network Security</span>
                                <span class="px-3 py-1.5 rounded-full bg-white/10 text-sm">Web App Security</span>
                                <span class="px-3 py-1.5 rounded-full bg-white/10 text-sm">AI Security</span>
                            </div>
                            <div class="flex flex-wrap gap-3 mt-8">
                                <a class="inline-flex items-center gap-2 px-5 py-3 rounded-lg bg-secondary text-on-secondary font-semibold hover:bg-secondary-container transition-colors" href="#security-layers">보안 영역 살펴보기 <span class="material-symbols-outlined">arrow_downward</span>
                                </a>
                                <a class="inline-flex items-center gap-2 px-5 py-3 rounded-lg bg-white/10 text-on-primary font-semibold hover:bg-white/15 transition-colors" href="${pageContext.request.contextPath}/inquiry/new">도입 문의 <span class="material-symbols-outlined">arrow_forward</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="security-hero-visual rounded-2xl p-6 md:p-8 shadow-xl flex flex-col justify-between min-h-[420px]">
                        <div class="flex items-center justify-between border-b border-slate-700/70 pb-4">
                            <div>
                                <p class="font-code-inline text-xs security-accent tracking-widest">SECURITY EVENT FABRIC</p>
                                <h2 class="font-headline-sm text-headline-sm font-bold mt-1">통합 위협 분석 흐름</h2>
                            </div>
                            <span class="inline-flex items-center gap-2 text-xs text-emerald-300">
                                <i class="w-2 h-2 rounded-full bg-emerald-400">
                                </i> API READY</span>
                        </div>
                        <div class="security-pipeline mt-4">
                            <div class="security-pipeline-node">
                                <span class="material-symbols-outlined">lan</span>
                                <span>Network</span>
                            </div>
                            <span class="material-symbols-outlined text-cyan-400">arrow_forward</span>
                            <div class="security-pipeline-node">
                                <span class="material-symbols-outlined">language</span>
                                <span>Web App</span>
                            </div>
                            <span class="material-symbols-outlined text-cyan-400">arrow_forward</span>
                            <div class="security-pipeline-node">
                                <span class="material-symbols-outlined">psychology</span>
                                <span>AI</span>
                            </div>
                        </div>
                        <div class="security-event-panel mt-4 rounded-xl p-4">
                            <div class="flex items-center justify-between text-xs">
                                <span class="text-slate-400">EVENT → POLICY → RESPONSE</span>
                                <span class="security-accent font-mono">REST API</span>
                            </div>
                            <div class="mt-4 space-y-3">
                                <div class="flex items-start gap-3">
                                    <span class="security-step-index">01</span>
                                    <div>
                                        <b class="text-sm">이벤트 수집</b>
                                        <p class="text-xs text-slate-400 mt-1">서비스와 네트워크의 위험 신호를 전달</p>
                                    </div>
                                </div>
                                <div class="flex items-start gap-3">
                                    <span class="security-step-index">02</span>
                                    <div>
                                        <b class="text-sm">정책 기반 분석</b>
                                        <p class="text-xs text-slate-400 mt-1">규칙과 위험 맥락을 바탕으로 결과 분류</p>
                                    </div>
                                </div>
                                <div class="flex items-start gap-3">
                                    <span class="security-step-index">03</span>
                                    <div>
                                        <b class="text-sm">대응 정보 반환</b>
                                        <p class="text-xs text-slate-400 mt-1">연동 서비스가 활용할 수 있는 응답 제공</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="security-layers" class="mb-space-xl">
                    <div class="max-w-3xl mb-space-lg">
                        <p class="font-label-caps text-label-caps text-secondary font-bold tracking-widest">THREE SECURITY LAYERS</p>
                        <h2 class="font-headline-xl text-headline-xl text-on-surface font-bold tracking-tight mt-2">서로 다른 공격 표면을<br class="hidden sm:block" /> 하나의 보안 흐름으로</h2>
                        <p class="font-body-md text-body-md text-on-surface-variant mt-3">필요한 보안 영역부터 연결하고, 공통 이벤트와 정책 관리로 확장할 수 있도록 설계합니다.</p>
                    </div>
                    <div class="security-module-grid">
                        <article class="security-layer-card">
                            <div class="security-layer-top">
                                <span class="material-symbols-outlined">lan</span>
                                <span class="security-layer-number">LAYER 01</span>
                            </div>
                            <h3>Network Security</h3>
                            <p>접속과 통신의 맥락을 확인하고, IP·도메인 위험 정보와 네트워크 이벤트를 정책에 따라 분류합니다.</p>
                            <ul>
                                <li>IP·도메인 평판 조회</li>
                                <li>네트워크 이벤트 분류</li>
                                <li>접근 정책 연동</li>
                            </ul>
                            <div class="security-api-example">
                                <span>DESIGN EXAMPLE</span>
                                <code>GET /api/v1/network/threats</code>
                            </div>
                        </article>
                        <article class="security-layer-card security-layer-card-featured">
                            <div class="security-layer-top">
                                <span class="material-symbols-outlined">language</span>
                                <span class="security-layer-number">LAYER 02</span>
                            </div>
                            <h3>Web App Security</h3>
                            <p>웹과 API 요청을 점검하고 애플리케이션 보안 정책, 자산 점검 결과 및 관련 이벤트를 연결합니다.</p>
                            <ul>
                                <li>요청 검증 및 정책 관리</li>
                                <li>웹 취약점 점검 결과 연동</li>
                                <li>보안 이벤트 통합 조회</li>
                            </ul>
                            <div class="security-api-example">
                                <span>DESIGN EXAMPLE</span>
                                <code>POST /api/v1/web/policies</code>
                            </div>
                        </article>
                        <article class="security-layer-card">
                            <div class="security-layer-top">
                                <span class="material-symbols-outlined">psychology</span>
                                <span class="security-layer-number">LAYER 03</span>
                            </div>
                            <h3>AI Security</h3>
                            <p>AI 기능의 입력과 출력을 정책으로 검사하고, 위험 판단 결과와 감사 이벤트를 남기는 영역입니다.</p>
                            <ul>
                                <li>프롬프트 위험 신호 검사</li>
                                <li>민감 정보 노출 정책</li>
                                <li>판단 결과 및 감사 기록</li>
                            </ul>
                            <div class="security-api-example">
                                <span>DESIGN EXAMPLE</span>
                                <code>POST /api/v1/ai/inspect</code>
                            </div>
                        </article>
                    </div>
                </section>
                <section class="security-architecture-section mb-space-xl rounded-2xl p-space-lg md:p-space-xl">
                    <div class="grid grid-cols-1 lg:grid-cols-12 gap-8 items-center">
                        <div class="security-architecture-copy">
                            <p class="font-label-caps text-label-caps security-accent font-bold tracking-widest">POLICY-CENTERED ARCHITECTURE</p>
                            <h2 class="font-headline-xl text-headline-xl text-white font-bold mt-3">탐지 결과를<br />실행 가능한 대응으로</h2>
                            <p class="security-architecture-description mt-4 leading-relaxed">각 보안 계층에서 들어온 이벤트는 공통 정책을 거쳐 일관된 응답으로 정리됩니다. 서비스는 API 응답을 바탕으로 알림, 차단 또는 추가 검토 절차를 선택할 수 있습니다.</p>
                        </div>
                        <div class="security-architecture-visual">
                            <div class="security-architecture-flow">
                                <div>
                                    <span class="material-symbols-outlined">sensors</span>
                                    <b>수집</b>
                                    <small>Events</small>
                                </div>
                                <span class="material-symbols-outlined flow-arrow">arrow_forward</span>
                                <div>
                                    <span class="material-symbols-outlined">rule</span>
                                    <b>정책 평가</b>
                                    <small>Policy Engine</small>
                                </div>
                                <span class="material-symbols-outlined flow-arrow">arrow_forward</span>
                                <div>
                                    <span class="material-symbols-outlined">shield</span>
                                    <b>응답</b>
                                    <small>API Result</small>
                                </div>
                            </div>
                            <div class="security-audit-line">
                                <span class="material-symbols-outlined">verified_user</span>
                                <span>모든 판단은 추적 가능한 보안 이벤트로 연결하도록 설계</span>
                                <span class="font-mono security-accent">AUDIT TRAIL</span>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="mb-space-xl">
                    <div class="flex flex-col md:flex-row md:items-end justify-between gap-4 mb-space-lg">
                        <div>
                            <p class="font-label-caps text-label-caps text-secondary font-bold tracking-widest">SUBSCRIPTION MODEL</p>
                            <h2 class="font-headline-xl text-headline-xl text-on-surface font-bold mt-2">작게 시작하고, 필요한 만큼 확장하세요</h2>
                        </div>
                        <a class="inline-flex items-center gap-1 text-secondary font-semibold" href="${pageContext.request.contextPath}/solutions/solutions.jsp#subscription-overview">두 솔루션 구독 플랜 비교 <span class="material-symbols-outlined">arrow_forward</span>
                        </a>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <article class="security-plan-card">
                            <div class="flex items-center justify-between">
                                <span class="security-plan-label">STARTER</span>
                                <span class="material-symbols-outlined text-secondary">rocket_launch</span>
                            </div>
                            <h3>무료 플랜</h3>
                            <p>보안 API 연동을 시작하고 기본 기능과 사용 흐름을 확인하는 단계입니다.</p>
                            <ul>
                                <li>핵심 API 및 기본 이벤트 조회</li>
                                <li>개발·테스트 환경 연동</li>
                                <li>기본 사용량 범위 제공</li>
                            </ul>
                            <a href="${pageContext.request.contextPath}/inquiry/new">시작 방법 문의 <span class="material-symbols-outlined">arrow_forward</span>
                            </a>
                        </article>
                        <article class="security-plan-card security-plan-card-paid">
                            <div class="flex items-center justify-between">
                                <span class="security-plan-label">GROWTH</span>
                                <span class="material-symbols-outlined">query_stats</span>
                            </div>
                            <h3>유료 구독</h3>
                            <p>운영 규모가 커지면 사용량과 정책, 분석 및 지원 범위를 확장합니다.</p>
                            <ul>
                                <li>확장된 API 사용량과 보존 기간</li>
                                <li>세분화된 정책 및 분석 기능</li>
                                <li>조직·서비스 단위 운영 관리</li>
                            </ul>
                            <a href="${pageContext.request.contextPath}/inquiry/new">도입 상담하기 <span class="material-symbols-outlined">arrow_forward</span>
                            </a>
                        </article>
                    </div>
                </section>
                <section class="security-status-note mb-space-xl">
                    <span class="material-symbols-outlined">info</span>
                    <div>
                        <b>제품 구현 상태 안내</b>
                        <p>보안 영역과 API 경로는 현재 제품 기획 예시입니다. 실제 트래픽 차단, 웹 취약점 점검, AI 입력·출력 검사는 별도 API 구현과 검증을 거쳐 제공됩니다.</p>
                    </div>
                </section>
                <section class="flex flex-col md:flex-row items-start md:items-center justify-between gap-6 rounded-2xl bg-surface-container-low p-space-lg">
                    <div>
                        <p class="font-label-caps text-label-caps text-secondary font-bold tracking-widest">NEXORA SECURITY API</p>
                        <h2 class="font-headline-lg text-headline-lg text-on-surface font-bold mt-2">우리 서비스에 맞는 보안 구성을 상담해보세요.</h2>
                        <p class="text-body-sm text-on-surface-variant mt-2">Network, Web App, AI Security 중 필요한 영역부터 시작할 수 있습니다.</p>
                    </div>
                    <a class="inline-flex items-center gap-2 px-5 py-3 rounded-lg bg-secondary text-on-secondary font-semibold" href="${pageContext.request.contextPath}/inquiry/new">보안 도입 문의 <span class="material-symbols-outlined">arrow_forward</span>
                    </a>
                </section>
            </div>
        </main>
        <jsp:include page="/inc/bottom.jsp" />
    </body>
</html>
