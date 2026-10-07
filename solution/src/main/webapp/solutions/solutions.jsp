<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <meta content="web_blank" name="shell-type"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&amp;family=JetBrains+Mono:wght@400;600&amp;display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/common-page-reset.css"/><link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/solutions_solutions.css?v=20261002-3"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/top.css?v=20261002-4"/>
    </head>
    <body class="bg-background font-body-md text-body-md text-on-surface antialiased min-h-screen">
        <jsp:include page="/inc/top.jsp" />
        <main class="w-full bg-background">
            <div class="max-w-[1200px] mx-auto px-gutter-mobile md:px-gutter lg:px-gutter-desktop py-space-xl">
                <div class="flex flex-col w-full">
<!-- Top Breadcrumb & Hero Header -->
                    <section class="w-full mb-space-xl">
<!-- Breadcrumb Row -->
                        <nav aria-label="Breadcrumb" class="flex items-center gap-space-xs text-on-surface-variant font-body-sm text-body-sm mb-space-md">
                            <span class="material-symbols-outlined text-[16px] text-secondary">home</span>
                            <a class="hover:text-secondary transition-colors" href="${pageContext.request.contextPath}/index.jsp">홈</a>
                            <span class="material-symbols-outlined text-[14px] text-outline-variant">chevron_right</span>
                            <span class="font-headline-sm text-on-surface font-semibold text-[13px]">솔루션</span>
                        </nav>
<!-- Hero Titles & Identity Badge -->
                        <div class="flex flex-col md:flex-row md:items-end justify-between gap-space-md mb-space-lg">
                            <div>
                                <div class="inline-flex items-center gap-space-xs px-2.5 py-1 rounded-full bg-surface-container-high text-secondary font-label-caps text-label-caps tracking-wider uppercase mb-space-sm">
                                    <span class="w-1.5 h-1.5 rounded-full bg-secondary">
                                    </span>
                                    Enterprise Solutions Suite
                                </div>
                                <h1 class="font-display-hero text-display-hero text-on-surface tracking-tight">
                                    기업의 IT 환경을 위한 솔루션
                                </h1>
                                <p class="font-body-lg text-body-lg text-on-surface-variant mt-space-xs">
                                    Web + Network + AI Security와 SentinelOps 두 가지 보안 API를 무료 및 유료 구독 플랜으로 제공합니다.
                                </p>
                            </div>
<!-- Key Proof Status Badge -->
                            <div class="flex items-center gap-2 self-start md:self-auto bg-surface-container-lowest px-4 py-2 rounded-xl shadow-sm border border-outline-variant/30">
                                <span class="relative flex h-2 w-2">
                                    <span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-secondary opacity-75">
                                    </span>
                                    <span class="relative inline-flex rounded-full h-2 w-2 bg-secondary">
                                    </span>
                                </span>
                                <span class="font-code-inline text-code-inline text-on-surface-variant font-semibold">2 SECURITY APIS</span>
                            </div>
                        </div>
<!-- Proof Value Metrics Bar -->
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-space-md p-space-md bg-surface-container-lowest rounded-xl shadow-sm border border-outline-variant/30">
                            <div class="flex items-center gap-space-md px-space-sm py-1">
                                <div class="w-10 h-10 rounded-lg bg-surface-container-low flex items-center justify-center text-secondary shrink-0">
                                    <span class="material-symbols-outlined text-[20px]">verified_user</span>
                                </div>
                                <div>
                                    <div class="font-headline-sm text-headline-sm text-on-surface font-semibold">Free / Paid API</div>
                                    <div class="font-body-sm text-body-sm text-on-surface-variant">필요한 사용량에 맞춘 구독 플랜</div>
                                </div>
                            </div>
                            <div class="flex items-center gap-space-md px-space-sm py-1 md:border-l border-outline-variant/40">
                                <div class="w-10 h-10 rounded-lg bg-surface-container-low flex items-center justify-center text-secondary shrink-0">
                                    <span class="material-symbols-outlined text-[20px]">speed</span>
                                </div>
                                <div>
                                    <div class="font-headline-sm text-headline-sm text-on-surface font-semibold">Threat API</div>
                                    <div class="font-body-sm text-body-sm text-on-surface-variant">네트워크·웹앱·AI 보안 분석</div>
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
<!-- Two Security Subscription Product Cards -->
                    <section class="w-full mb-space-xl">
                        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                            <div id="security-detail" class="flex flex-col justify-between bg-surface-container-lowest rounded-xl p-space-lg shadow-sm border border-outline-variant/30 hover:border-secondary hover:shadow-md transition-all duration-300">
                                <div>
                                    <div class="flex items-center justify-between mb-space-md">
                                        <span class="font-code-inline text-code-inline text-on-surface-variant font-semibold tracking-wider">01 // WEB SECURITY API</span>
                                        <div class="w-10 h-10 rounded-lg bg-surface-container-low text-secondary flex items-center justify-center">
                                            <span class="material-symbols-outlined text-[22px]">security</span>
                                        </div>
                                    </div>
                                    <h2 class="font-headline-md text-headline-md text-on-surface font-bold mb-space-xs">Web + Network + AI Security</h2>
                                    <p class="font-body-sm text-body-sm font-semibold text-secondary mb-space-sm">네트워크·웹앱·AI 서비스 보안을 위한 구독형 API</p>
                                    <p class="font-body-sm text-body-sm text-on-surface-variant leading-relaxed mb-space-md">보안 이벤트를 API로 수집·분석하고, 웹 애플리케이션과 AI 서비스에 필요한 위협 탐지 및 대응 기능을 제공합니다.</p>
                                    <div class="space-y-space-xs py-space-sm border-t border-outline-variant/20 mb-space-md">
                                        <div class="flex items-start gap-2">
                                            <span class="material-symbols-outlined text-[16px] text-secondary mt-0.5 shrink-0">check_circle</span>
                                            <span class="font-body-sm text-body-sm text-on-surface">네트워크 및 웹 애플리케이션 위협 탐지</span>
                                        </div>
                                        <div class="flex items-start gap-2">
                                            <span class="material-symbols-outlined text-[16px] text-secondary mt-0.5 shrink-0">check_circle</span>
                                            <span class="font-body-sm text-body-sm text-on-surface">AI 입력·출력 보안 점검 및 정책 적용</span>
                                        </div>
                                        <div class="flex items-start gap-2">
                                            <span class="material-symbols-outlined text-[16px] text-secondary mt-0.5 shrink-0">check_circle</span>
                                            <span class="font-body-sm text-body-sm text-on-surface">무료 사용량으로 시작, 유료 구독으로 한도 확장</span>
                                        </div>
                                    </div>
                                </div>
                                <a class="inline-flex items-center justify-between w-full px-4 py-2.5 rounded-lg bg-surface-container-low text-on-surface font-body-sm font-semibold hover:bg-secondary hover:text-on-secondary transition-all" href="${pageContext.request.contextPath}/solutions/web-security.jsp">
                                    <span>자세히 보기</span>
                                    <span class="material-symbols-outlined text-[18px]">arrow_forward</span>
                                </a>
                            </div>
                            <div id="sentinelops-detail" class="relative flex flex-col justify-between bg-primary-container text-on-primary rounded-xl p-space-lg shadow-xl ring-1 ring-tertiary-fixed-dim/40 overflow-hidden">
                                <div class="absolute -top-12 -right-12 w-32 h-32 bg-secondary-container/20 rounded-full blur-2xl pointer-events-none">
                                </div>
                                <div>
                                    <div class="flex items-center justify-between mb-space-sm">
                                        <div class="inline-flex items-center gap-1.5 px-2 py-0.5 rounded-full bg-tertiary-container/80 text-tertiary-fixed font-label-caps text-label-caps border border-tertiary-fixed-dim/30">
                                            <span class="w-1.5 h-1.5 rounded-full bg-tertiary-fixed-dim animate-pulse">
                                            </span>AI-ASSISTED OPERATIONS</div>
                                        <span class="font-code-inline text-code-inline text-on-primary-container font-semibold">02 // SENTINELOPS API</span>
                                    </div>
                                    <div class="flex items-center gap-3 mt-space-sm mb-space-xs">
                                        <div class="w-10 h-10 rounded-lg bg-tertiary-container text-tertiary-fixed-dim flex items-center justify-center border border-tertiary-fixed-dim/40">
                                            <span class="material-symbols-outlined text-[24px]">radar</span>
                                        </div>
                                        <h2 class="font-headline-md text-headline-md text-on-primary font-bold tracking-tight">SentinelOps</h2>
                                    </div>
                                    <p class="font-body-sm text-body-sm text-tertiary-fixed mb-space-sm font-medium">오류 탐지와 장애 대응을 위한 구독형 API</p>
                                    <p class="font-body-sm text-body-sm text-on-primary-container leading-relaxed mb-space-md">애플리케이션 오류와 운영 이벤트를 모아 우선순위를 정하고, 원인 분석과 대응에 필요한 정보를 제공합니다.</p>
                                    <div class="space-y-2 py-space-sm border-t border-on-primary-container/20 mb-space-md text-[13px]">
                                        <div class="flex items-start gap-2">
                                            <span class="material-symbols-outlined text-[16px] text-tertiary-fixed-dim mt-0.5 shrink-0">check_circle</span>
                                            <span class="text-on-primary">오류 이벤트 수집 및 심각도 분류</span>
                                        </div>
                                        <div class="flex items-start gap-2">
                                            <span class="material-symbols-outlined text-[16px] text-tertiary-fixed-dim mt-0.5 shrink-0">check_circle</span>
                                            <span class="text-on-primary">로그 요약과 장애 원인 분석 지원</span>
                                        </div>
                                        <div class="flex items-start gap-2">
                                            <span class="material-symbols-outlined text-[16px] text-tertiary-fixed-dim mt-0.5 shrink-0">check_circle</span>
                                            <span class="text-on-primary">무료 사용량 제공, 유료 구독으로 보존·알림 확장</span>
                                        </div>
                                    </div>
                                </div>
                                <a class="inline-flex items-center justify-between w-full px-4 py-2.5 rounded-lg bg-secondary text-on-secondary font-body-sm font-semibold hover:bg-secondary-container shadow-md transition-all" href="${pageContext.request.contextPath}/solutions/sentinelops.jsp">
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
                                <h3 class="font-headline-lg text-headline-lg text-on-surface font-bold">보안 API 서비스 지표</h3>
                            </div>
                            <div class="flex items-center gap-space-sm">
                                <span class="px-2.5 py-1 rounded bg-surface-container text-on-surface-variant font-code-inline text-[11px]">Sync Rate: 500ms</span>
                                <span class="px-2.5 py-1 rounded bg-surface-container text-secondary font-code-inline text-[11px] font-semibold">APIs: 2 Products</span>
                            </div>
                        </div>
<!-- Telemetry Metric Strip -->
                        <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                            <div class="p-4 rounded-lg bg-surface-container-low">
                                <div class="text-on-surface-variant font-label-caps text-label-caps uppercase">System Throughput</div>
                                <div class="text-metric-val font-metric-val text-on-surface mt-1" id="metric-tps">12,482 <span class="text-body-sm font-normal text-on-surface-variant">req/s</span>
                                </div>
                                <div class="text-code-inline text-[11px] text-secondary mt-1 font-semibold">▲ +4.2% (정상 변동폭)</div>
                            </div>
                            <div class="p-4 rounded-lg bg-surface-container-low">
                                <div class="text-on-surface-variant font-label-caps text-label-caps uppercase">Security Events</div>
                                <div class="text-metric-val font-metric-val text-on-surface mt-1" id="metric-latency">1.84 <span class="text-body-sm font-normal text-on-surface-variant">ms</span>
                                </div>
                                <div class="text-code-inline text-[11px] text-secondary mt-1 font-semibold">위협 이벤트 실시간 분석</div>
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
<!-- Security API Subscription Comparison -->
                    <section id="subscription-overview" class="w-full mb-space-xl">
                        <div class="mb-space-md">
                            <div class="inline-flex items-center gap-1 font-code-inline text-code-inline text-secondary font-semibold uppercase">
                                <span class="material-symbols-outlined text-[15px]">compare_arrows</span> Subscription Overview</div>
                            <h2 class="font-headline-lg text-headline-lg text-on-surface font-bold">필요한 기능부터 시작하는 구독 플랜</h2>
                            <p class="font-body-md text-body-md text-on-surface-variant mt-1">두 API 모두 무료 사용량으로 시작할 수 있으며, 사용량과 운영 요구에 따라 유료 플랜으로 확장할 수 있습니다.</p>
                        </div>
                        <div class="w-full overflow-x-auto rounded-xl shadow-sm border border-outline-variant/30 bg-surface-container-lowest">
                            <table class="w-full text-left border-collapse min-w-[640px]">
                                <thead>
                                    <tr class="bg-surface-container-high/60 border-b border-outline-variant/30">
                                        <th class="p-4 font-label-caps text-label-caps text-on-surface uppercase">구분</th>
                                        <th class="p-4 font-label-caps text-label-caps text-secondary uppercase">Web + Network + AI Security API</th>
                                        <th class="p-4 font-label-caps text-label-caps text-secondary uppercase">SentinelOps API</th>
                                    </tr>
                                </thead>
                                <tbody class="divide-y divide-outline-variant/20 font-body-sm text-body-sm text-on-surface">
                                    <tr>
                                        <td class="p-4 font-semibold bg-surface-container-low/30">핵심 기능</td>
                                        <td class="p-4 text-on-surface-variant">네트워크·웹앱·AI 서비스 위협 탐지와 보안 정책 적용</td>
                                        <td class="p-4 text-on-surface-variant">오류 이벤트 수집, 심각도 분류, 원인 분석 지원</td>
                                    </tr>
                                    <tr>
                                        <td class="p-4 font-semibold bg-surface-container-low/30">무료 플랜</td>
                                        <td class="p-4 text-on-surface-variant">기본 API 사용량과 핵심 탐지 기능 제공</td>
                                        <td class="p-4 text-on-surface-variant">기본 이벤트 수집과 대시보드 제공</td>
                                    </tr>
                                    <tr>
                                        <td class="p-4 font-semibold bg-surface-container-low/30">유료 구독</td>
                                        <td class="p-4 text-on-surface-variant">사용량·정책·분석 기능 확장</td>
                                        <td class="p-4 text-on-surface-variant">이벤트·보존 기간·알림 및 분석 기능 확장</td>
                                    </tr>
                                    <tr>
                                        <td class="p-4 font-semibold bg-surface-container-low/30">연동 방식</td>
                                        <td class="p-4 text-on-surface-variant">REST API 및 보안 이벤트 웹훅</td>
                                        <td class="p-4 text-on-surface-variant">REST API, SDK 및 운영 알림 웹훅</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </section>
<!-- Architecture Consultation CTA Section -->
                    <section class="w-full">
                        <div class="relative bg-primary-container text-on-primary rounded-2xl p-space-lg md:p-space-xl overflow-hidden shadow-xl">
<!-- Ambient Gradient Accents -->
                            <div class="absolute -bottom-24 -left-24 w-64 h-64 bg-secondary-container/30 rounded-full blur-3xl pointer-events-none">
                            </div>
                            <div class="absolute top-0 right-0 w-80 h-80 bg-secondary/15 rounded-full blur-3xl pointer-events-none">
                            </div>
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
                                    <a class="inline-flex items-center justify-center gap-2 px-6 py-3.5 rounded-lg bg-secondary text-on-secondary font-headline-sm text-body-md font-semibold hover:bg-secondary-container transition-all shadow-md" href="${pageContext.request.contextPath}/inquiry/new?category=GENERAL&amp;title=%EC%86%94%EB%A3%A8%EC%85%98%20%EB%8F%84%EC%9E%85%20%EC%83%81%EB%8B%B4">
                                        <span class="material-symbols-outlined text-[20px]">chat</span>
                                        <span>전문 아키텍트 상담 문의</span>
                                    </a>
                                    <a class="inline-flex items-center justify-center gap-2 px-6 py-3.5 rounded-lg bg-white/10 text-on-primary font-body-md font-semibold hover:bg-white/15 transition-all border border-white/15" href="${pageContext.request.contextPath}/board/list?category=RESOURCE">
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
                </div>
            </div>
        </main>
        <jsp:include page="/inc/bottom.jsp" />
    </body>
</html>
