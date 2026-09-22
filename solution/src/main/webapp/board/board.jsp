<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0" name="viewport"/><meta content="web_blank" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet"/><link href="https://fonts.googleapis.com" rel="preconnect"/><link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/><link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&amp;family=JetBrains+Mono:wght@400;600&amp;display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base { html, body { margin: 0; padding: 0; } body { overscroll-behavior: none; } main > :first-child { margin-top: 0 !important; } main > :last-child { margin-bottom: 0 !important; } } ::-webkit-scrollbar { display: none; }</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { colors: { "inverse-primary": "#b9c7e4", "on-tertiary-fixed-variant": "#004c6e", "inverse-on-surface": "#eaf1ff", "secondary-fixed-dim": "#b6c4ff", "primary-container": "#0d1c32", "on-secondary": "#ffffff", "surface-container-lowest": "#ffffff", "surface-container-low": "#eff4ff", "surface-container-highest": "#d3e4fe", "primary": "#000000", "error": "#ba1a1a", "outline-variant": "#c5c6cd", "surface-tint": "#515f78", "tertiary-fixed-dim": "#89ceff", "surface-container-high": "#dce9ff", "surface-container": "#e5eeff", "on-surface-variant": "#44474d", "error-container": "#ffdad6", "on-tertiary": "#ffffff", "on-tertiary-fixed": "#001e2f", "surface-bright": "#f8f9ff", "on-primary-fixed": "#0d1c32", "background": "#f8f9ff", "surface-dim": "#cbdbf5", "on-secondary-fixed": "#001550", "tertiary": "#000000", "on-error-container": "#93000a", "on-error": "#ffffff", "inverse-surface": "#213145", "on-secondary-fixed-variant": "#0039b3", "tertiary-container": "#001e2f", "secondary": "#1c4fd7", "secondary-fixed": "#dce1ff", "surface": "#f8f9ff", "tertiary-fixed": "#c9e6ff", "on-primary-fixed-variant": "#39475f", "on-secondary-container": "#fffbff", "on-primary-container": "#76849f", "outline": "#75777e", "primary-fixed": "#d6e3ff", "on-background": "#0b1c30", "secondary-container": "#3f69f1", "on-primary": "#ffffff", "primary-fixed-dim": "#b9c7e4", "on-tertiary-container": "#008cc7", "surface-variant": "#d3e4fe", "on-surface": "#0b1c30" }, borderRadius: { "DEFAULT": "0.125rem", "lg": "0.25rem", "xl": "0.5rem", "full": "0.75rem" }, spacing: { "margin": "1.5rem", "space-xs": "0.25rem", "margin-desktop": "2rem", "space-md": "1rem", "space-sm": "0.5rem", "gutter-desktop": "2rem", "space-lg": "1.5rem", "margin-mobile": "1rem", "gutter-mobile": "1rem", "gutter": "1.5rem", "space-xl": "2.5rem" }, fontFamily: { "headline-xl-mobile": ["Inter"], "body-lg": ["Inter"], "display-hero": ["Inter"], "headline-lg": ["Inter"], "metric-val": ["JetBrains Mono"], "label-caps": ["Inter"], "body-md": ["Inter"], "headline-sm": ["Inter"], "headline-xl": ["Inter"], "headline-md": ["Inter"], "body-sm": ["Inter"], "display-hero-mobile": ["Inter"], "code-inline": ["JetBrains Mono"] }, fontSize: { "headline-xl-mobile": ["28px", { "lineHeight": "36px", "letterSpacing": "-0.015em", "fontWeight": "700" }], "body-lg": ["16px", { "lineHeight": "26px", "letterSpacing": "-0.005em", "fontWeight": "400" }], "display-hero": ["44px", { "lineHeight": "56px", "letterSpacing": "-0.02em", "fontWeight": "700" }], "headline-lg": ["28px", { "lineHeight": "36px", "letterSpacing": "-0.01em", "fontWeight": "600" }], "metric-val": ["20px", { "lineHeight": "28px", "letterSpacing": "-0.02em", "fontWeight": "600" }], "label-caps": ["11px", { "lineHeight": "16px", "letterSpacing": "0.06em", "fontWeight": "700" }], "body-md": ["14px", { "lineHeight": "22px", "letterSpacing": "0", "fontWeight": "400" }], "headline-sm": ["18px", { "lineHeight": "26px", "letterSpacing": "0", "fontWeight": "600" }], "headline-xl": ["36px", { "lineHeight": "44px", "letterSpacing": "-0.02em", "fontWeight": "700" }], "headline-md": ["22px", { "lineHeight": "30px", "letterSpacing": "-0.005em", "fontWeight": "600" }], "body-sm": ["13px", { "lineHeight": "20px", "letterSpacing": "0", "fontWeight": "400" }], "display-hero-mobile": ["32px", { "lineHeight": "40px", "letterSpacing": "-0.015em", "fontWeight": "700" }], "code-inline": ["12px", { "lineHeight": "18px", "letterSpacing": "0", "fontWeight": "400" }] } } } };</script></head><body class="bg-background font-body-md text-on-surface min-h-screen">
<jsp:include page="/inc/top.jsp" /><main class="w-full max-w-[1200px] mx-auto px-gutter py-space-xl"><div class="flex flex-col w-full">
<!-- Breadcrumb Navigation (Mounted directly under inc/top.jsp) -->
<nav aria-label="Breadcrumb" class="flex items-center gap-2 text-on-surface-variant font-body-sm mb- space-md">
<a class="flex items-center gap-1 hover:text-secondary transition-colors" href="${pageContext.request.contextPath}/index.jsp">
<span class="material-symbols-outlined text-[16px]">home</span>
<span>홈</span>
</a>
<span class="material-symbols-outlined text-[14px] text-outline">chevron_right</span>
<span class="text-primary-container font-semibold">커뮤니티</span>
</nav>
<!-- Page Header & Operational Stats -->
<header class="flex flex-col md:flex-row md:items-end justify-between gap- space-md pb-space-lg mb-space-lg border-b border-surface-container-highest">
<div>
<div class="flex items-center gap-space-sm mb-1">
<span class="px-2 py-0.5 rounded-full bg-surface-container-high text-secondary font-label-caps tracking-wider">ENTERPRISE FORUM</span>
<span class="inline-flex items-center gap-1 text-[11px] font-metric-val text-on-surface-variant">
<span class="w-2 h-2 rounded-full bg-secondary-container animate-pulse"></span>
          NODE ID: NX-KR-SE-04
        </span>
</div>
<h1 class="font-headline-xl text-primary-container font-bold tracking-tight">커뮤니티</h1>
<p class="font-body-md text-on-surface-variant mt-1">넥서라 엔터프라이즈의 새로운 소식과 검증된 기술 아키텍처 정보를 확인하세요.</p>
</div>
<!-- Quick Stat Badges -->
<div class="flex flex-wrap items-center gap-2">
<div class="flex items-center gap-2 px-3 py-1.5 rounded-lg bg-surface-container-lowest shadow-sm">
<span class="material-symbols-outlined text-[18px] text-secondary">forum</span>
<span class="font-body-sm text-on-surface-variant">전체 게시글 <strong class="font-metric-val text-primary-container font-semibold">1,284</strong>건</span>
</div>
<div class="flex items-center gap-2 px-3 py-1.5 rounded-lg bg-surface-container-lowest shadow-sm">
<span class="material-symbols-outlined text-[18px] text-secondary">support_agent</span>
<span class="font-body-sm text-on-surface-variant">실시간 Q&amp;A 지원</span>
</div>
<div class="flex items-center gap-2 px-3 py-1.5 rounded-lg bg-surface-container-lowest shadow-sm">
<span class="material-symbols-outlined text-[18px] text-secondary">menu_book</span>
<span class="font-body-sm text-on-surface-variant">엔터프라이즈 지식 베이스</span>
</div>
</div>
</header>
<!-- Main Community View Container -->
<div id="board-list" class="flex flex-col gap-space-lg">
<!-- 1. Category Tab Strip & Write CTA -->
<div class="flex flex-col sm:flex-row sm:items-center justify-between gap-space-md">
<!-- Tabs -->
<div class="flex items-center p-1 rounded-xl bg-surface-container-high/60 gap-1 overflow-x-auto" id="boardCategoryTabs">
<button class="tab-btn active-tab flex items-center gap-2 px-4 py-2 rounded-lg font-headline-sm text-[14px] leading-tight transition-all bg-surface-container-lowest text-primary-container shadow-sm font-semibold" id="tab-notice" onclick="switchTab('notice')" type="button">
<span class="material-symbols-outlined text-[18px] text-secondary">campaign</span>
<span>공지사항</span>
<span class="px-1.5 py-0.2 rounded-full bg-secondary-fixed text-secondary font-metric-val text-[11px]">42</span>
</button>
<button class="tab-btn flex items-center gap-2 px-4 py-2 rounded-lg font-headline-sm text-[14px] leading-tight transition-all text-on-surface-variant hover:text-primary-container" id="tab-library" onclick="switchTab('library')" type="button">
<span class="material-symbols-outlined text-[18px]">cloud_download</span>
<span>자료실</span>
<span class="px-1.5 py-0.2 rounded-full bg-surface-container-highest text-on-surface-variant font-metric-val text-[11px]">318</span>
</button>
<button class="tab-btn flex items-center gap-2 px-4 py-2 rounded-lg font-headline-sm text-[14px] leading-tight transition-all text-on-surface-variant hover:text-primary-container" id="tab-forum" onclick="switchTab('forum')" type="button">
<span class="material-symbols-outlined text-[18px]">forum</span>
<span>자유게시판</span>
<span class="px-1.5 py-0.2 rounded-full bg-surface-container-highest text-on-surface-variant font-metric-val text-[11px]">924</span>
</button>
</div>
<!-- Quick Write Action Button -->
<div class="flex items-center gap-2">
<a class="inline-flex items-center gap-1.5 px-4 py-2 rounded-lg bg-surface-container-high hover:bg-surface-container-highest text-primary-container font-body-sm font-semibold transition-all" href="#detail-preview-section">
<span class="material-symbols-outlined text-[18px]">preview</span>
<span>상세보기 미리보기</span>
</a>
<button class="inline-flex items-center gap-1.5 px-4 py-2 rounded-lg bg-primary-container hover:bg-secondary text-on-primary font-body-sm font-semibold shadow-sm transition-all transform active:scale-95" onclick="location.href='${pageContext.request.contextPath}/board/write.jsp?category=notice'" type="button">
<span class="material-symbols-outlined text-[18px]">edit</span>
<span>글쓰기</span>
</button>
</div>
</div>
<!-- 2. Controls & Search Filter Bar -->
<div class="flex flex-col lg:flex-row lg:items-center justify-between gap- space-md p-4 rounded-xl bg-surface-container-lowest shadow-sm">
<!-- Total count & Sort Selector -->
<div class="flex items-center gap-3">
<span class="font-body-sm text-on-surface-variant">
          총 <strong class="font-metric-val text-primary-container font-semibold" id="currentCategoryCount">42</strong>개의 게시글
        </span>
<div class="h-3 w-[1px] bg-surface-container-highest"></div>
<div class="flex items-center gap-1.5">
<label class="sr-only" for="boardSort">정렬 방식</label>
<select class="bg-surface-container-low text-primary-container font-body-sm rounded-lg px-2.5 py-1.5 focus:outline-none focus:bg-surface-container-lowest" id="boardSort">
<option selected="" value="latest">최신순</option>
<option value="views">조회순</option>
<option value="comments">댓글순</option>
</select>
</div>
</div>
<!-- Search Form (Simulated Servlet/JSP Model 2 Action) -->
<form action="boardList.do" class="flex flex-wrap sm:flex-nowrap items-center gap-2 w-full lg:w-auto" method="GET" onsubmit="event.preventDefault(); executeSearch();">
<label class="sr-only" for="searchKey">검색 분류</label>
<select class="h-10 bg-surface-container-low text-primary-container font-body-sm rounded-lg px-3 focus:outline-none focus:bg-surface-container-lowest" id="searchKey" name="searchKey">
<option value="titleContent">제목+내용</option>
<option value="title">제목</option>
<option value="writer">작성자</option>
</select>
<div class="relative flex-grow sm:w-72">
<label class="sr-only" for="searchWord">검색어 입력</label>
<input class="w-full h-10 pl-3 pr-9 rounded-lg bg-surface-container-low text-primary-container placeholder:text-outline font-body-sm focus:outline-none focus:bg-surface-container-lowest" id="searchWord" name="searchWord" placeholder="기술 주제, 아키텍처, 검색어 입력" type="text"/>
<button class="absolute right-2 top-1/2 -translate-y-1/2 text-on-surface-variant hover:text-secondary p-1" type="submit">
<span class="material-symbols-outlined text-[20px]">search</span>
</button>
</div>
<button class="h-10 px-4 rounded-lg bg-primary-container hover:bg-secondary text-on-primary font-body-sm font-semibold transition-all" type="submit">
          검색
        </button>
</form>
</div>
<!-- 3. Enterprise Board Table -->
<div class="rounded-xl overflow-hidden shadow-sm bg-surface-container-lowest">
<!-- Desktop Table Header -->
<div class="hidden md:grid grid-cols-12 gap-2 px-6 py-3.5 bg-surface-container font-label-caps text-on-surface-variant tracking-wider">
<div class="col-span-1 text-center">번호</div>
<div class="col-span-6">제목</div>
<div class="col-span-2 text-center">작성자</div>
<div class="col-span-2 text-center">등록일</div>
<div class="col-span-1 text-center">조회수</div>
</div>
<!-- Table Body / List Rows -->
<div class="divide-y divide-surface-container-high/40" id="boardRowContainer">
<!-- Row 1: Notice (Pinned / Attachment) -->
<div class="group flex flex-col md:grid md:grid-cols-12 gap-2 px-4 md:px-6 py-4 items-start md:items-center hover:bg-surface-container-low/60 transition-colors bg-surface-container-high/20">
<div class="hidden md:flex col-span-1 justify-center">
<span class="px-2 py-0.5 rounded-full bg-error-container text-on-error-container font-label-caps">공지</span>
</div>
<div class="w-full md:col-span-6 flex items-center gap-2">
<span class="md:hidden px-2 py-0.5 rounded-full bg-error-container text-on-error-container font-label-caps text-[10px]">공지</span>
<span class="material-symbols-outlined text-error text-[18px] flex-shrink-0">campaign</span>
<a class="font-headline-sm text-[15px] font-semibold text-primary-container hover:text-secondary transition-colors line-clamp-1" href="#detail-preview-section">
              [공지] 2026년 상반기 SentinelOps v4.2 기술 아키텍처 백서 배포
            </a>
<span class="material-symbols-outlined text-[16px] text-outline flex-shrink-0" title="첨부파일 포함">attach_file</span>
<span class="px-1.5 py-0.5 rounded-full bg-surface-container-highest text-secondary font-metric-val text-[11px] font-semibold">3</span>
<span class="px-1.5 py-0.2 rounded bg-secondary-fixed-dim/50 text-secondary font-label-caps text-[9px]">NEW</span>
</div>
<div class="w-full md:col-span-2 flex items-center md:justify-center gap-2 mt-2 md:mt-0">
<span class="text-on-surface-variant font-body-sm text-[13px] flex items-center gap-1">
<span class="material-symbols-outlined text-[15px] text-secondary">verified_user</span>
              Nexura 기술지원팀
            </span>
</div>
<div class="w-full md:col-span-2 flex items-center justify-between md:justify-center text-outline font-metric-val text-[13px] mt-1 md:mt-0">
<span class="md:hidden font-body-sm text-on-surface-variant">등록일</span>
<span>2026-03-29</span>
</div>
<div class="w-full md:col-span-1 flex items-center justify-between md:justify-center text-outline font-metric-val text-[13px] mt-1 md:mt-0">
<span class="md:hidden font-body-sm text-on-surface-variant">조회수</span>
<span class="text-primary-container font-semibold">1,420</span>
</div>
</div>
<!-- Row 2: Notice (Zero-Trust) -->
<div class="group flex flex-col md:grid md:grid-cols-12 gap-2 px-4 md:px-6 py-4 items-start md:items-center hover:bg-surface-container-low/60 transition-colors bg-surface-container-high/20">
<div class="hidden md:flex col-span-1 justify-center">
<span class="px-2 py-0.5 rounded-full bg-error-container text-on-error-container font-label-caps">공지</span>
</div>
<div class="w-full md:col-span-6 flex items-center gap-2">
<span class="md:hidden px-2 py-0.5 rounded-full bg-error-container text-on-error-container font-label-caps text-[10px]">공지</span>
<span class="material-symbols-outlined text-secondary text-[18px] flex-shrink-0">shield</span>
<a class="font-headline-sm text-[15px] font-semibold text-primary-container hover:text-secondary transition-colors line-clamp-1" href="#detail-preview-section">
              [공지] Zero-Trust WAF 침해 대응 룰셋 업데이트 내역 및 적용 가이드
            </a>
<span class="px-1.5 py-0.2 rounded bg-surface-container-highest text-on-surface-variant font-label-caps text-[9px]">긴급</span>
</div>
<div class="w-full md:col-span-2 flex items-center md:justify-center gap-2 mt-2 md:mt-0">
<span class="text-on-surface-variant font-body-sm text-[13px] flex items-center gap-1">
<span class="material-symbols-outlined text-[15px] text-secondary">security</span>
              보안운영센터
            </span>
</div>
<div class="w-full md:col-span-2 flex items-center justify-between md:justify-center text-outline font-metric-val text-[13px] mt-1 md:mt-0">
<span class="md:hidden font-body-sm text-on-surface-variant">등록일</span>
<span>2026-03-27</span>
</div>
<div class="w-full md:col-span-1 flex items-center justify-between md:justify-center text-outline font-metric-val text-[13px] mt-1 md:mt-0">
<span class="md:hidden font-body-sm text-on-surface-variant">조회수</span>
<span class="text-primary-container font-semibold">890</span>
</div>
</div>
<!-- Row 3: Tech Post (eBPF) -->
<div class="group flex flex-col md:grid md:grid-cols-12 gap-2 px-4 md:px-6 py-4 items-start md:items-center hover:bg-surface-container-low/60 transition-colors">
<div class="hidden md:flex col-span-1 justify-center text-outline font-metric-val text-[13px]">
            1282
          </div>
<div class="w-full md:col-span-6 flex items-center gap-2">
<span class="px-2 py-0.5 rounded-full bg-surface-container-high text-on-surface font-label-caps text-[10px]">기술</span>
<a class="font-headline-sm text-[15px] text-on-surface group-hover:text-secondary transition-colors line-clamp-1" href="#detail-preview-section">
              멀티클라우드 환경에서의 eBPF 커널 텔레메트리 최적화 사례
            </a>
<span class="px-1.5 py-0.5 rounded-full bg-surface-container text-secondary font-metric-val text-[11px]">8</span>
</div>
<div class="w-full md:col-span-2 flex items-center md:justify-center gap-2 mt-2 md:mt-0">
<span class="text-on-surface-variant font-body-sm text-[13px]">김민석 수석아키텍트</span>
<span class="px-1.5 py-0.2 rounded bg-surface-container text-on-surface-variant text-[10px]">인프라</span>
</div>
<div class="w-full md:col-span-2 flex items-center justify-between md:justify-center text-outline font-metric-val text-[13px] mt-1 md:mt-0">
<span class="md:hidden font-body-sm text-on-surface-variant">등록일</span>
<span>2026-03-25</span>
</div>
<div class="w-full md:col-span-1 flex items-center justify-between md:justify-center text-outline font-metric-val text-[13px] mt-1 md:mt-0">
<span class="md:hidden font-body-sm text-on-surface-variant">조회수</span>
<span>650</span>
</div>
</div>
<!-- Row 4: Library Post (PCI-DSS) -->
<div class="group flex flex-col md:grid md:grid-cols-12 gap-2 px-4 md:px-6 py-4 items-start md:items-center hover:bg-surface-container-low/60 transition-colors">
<div class="hidden md:flex col-span-1 justify-center text-outline font-metric-val text-[13px]">
            1281
          </div>
<div class="w-full md:col-span-6 flex items-center gap-2">
<span class="px-2 py-0.5 rounded-full bg-surface-container-high text-on-surface font-label-caps text-[10px]">자료</span>
<a class="font-headline-sm text-[15px] text-on-surface group-hover:text-secondary transition-colors line-clamp-1" href="#detail-preview-section">
              PCI-DSS v4.0 준수 하드웨어 토큰 HSM 연동 기술 규격서
            </a>
<span class="material-symbols-outlined text-[16px] text-outline flex-shrink-0" title="PDF 문서">picture_as_pdf</span>
</div>
<div class="w-full md:col-span-2 flex items-center md:justify-center gap-2 mt-2 md:mt-0">
<span class="text-on-surface-variant font-body-sm text-[13px]">결제플랫폼팀</span>
<span class="px-1.5 py-0.2 rounded bg-surface-container text-on-surface-variant text-[10px]">PG</span>
</div>
<div class="w-full md:col-span-2 flex items-center justify-between md:justify-center text-outline font-metric-val text-[13px] mt-1 md:mt-0">
<span class="md:hidden font-body-sm text-on-surface-variant">등록일</span>
<span>2026-03-24</span>
</div>
<div class="w-full md:col-span-1 flex items-center justify-between md:justify-center text-outline font-metric-val text-[13px] mt-1 md:mt-0">
<span class="md:hidden font-body-sm text-on-surface-variant">조회수</span>
<span>920</span>
</div>
</div>
<!-- Row 5: Q&A Post (NVMe SAN) -->
<div class="group flex flex-col md:grid md:grid-cols-12 gap-2 px-4 md:px-6 py-4 items-start md:items-center hover:bg-surface-container-low/60 transition-colors">
<div class="hidden md:flex col-span-1 justify-center text-outline font-metric-val text-[13px]">
            1280
          </div>
<div class="w-full md:col-span-6 flex items-center gap-2">
<span class="px-2 py-0.5 rounded-full bg-secondary-fixed text-secondary font-label-caps text-[10px]">질의</span>
<a class="font-headline-sm text-[15px] text-on-surface group-hover:text-secondary transition-colors line-clamp-1" href="#detail-preview-section">
              베어메탈 NVMe SAN 스토리지 고가용성 구성 시 I/O 병목 문의
            </a>
<span class="px-1.5 py-0.5 rounded-full bg-surface-container text-secondary font-metric-val text-[11px]">4</span>
</div>
<div class="w-full md:col-span-2 flex items-center md:justify-center gap-2 mt-2 md:mt-0">
<span class="text-on-surface-variant font-body-sm text-[13px]">핀테크 코어인프라팀</span>
</div>
<div class="w-full md:col-span-2 flex items-center justify-between md:justify-center text-outline font-metric-val text-[13px] mt-1 md:mt-0">
<span class="md:hidden font-body-sm text-on-surface-variant">등록일</span>
<span>2026-03-22</span>
</div>
<div class="w-full md:col-span-1 flex items-center justify-between md:justify-center text-outline font-metric-val text-[13px] mt-1 md:mt-0">
<span class="md:hidden font-body-sm text-on-surface-variant">조회수</span>
<span>410</span>
</div>
</div>
<!-- Row 6: Discussion (DNS TTL) -->
<div class="group flex flex-col md:grid md:grid-cols-12 gap-2 px-4 md:px-6 py-4 items-start md:items-center hover:bg-surface-container-low/60 transition-colors">
<div class="hidden md:flex col-span-1 justify-center text-outline font-metric-val text-[13px]">
            1279
          </div>
<div class="w-full md:col-span-6 flex items-center gap-2">
<span class="px-2 py-0.5 rounded-full bg-surface-container-high text-on-surface font-label-caps text-[10px]">토론</span>
<a class="font-headline-sm text-[15px] text-on-surface group-hover:text-secondary transition-colors line-clamp-1" href="#detail-preview-section">
              24/7 무중단 마이그레이션 시 DNS CNAME TTL 설정 노하우 공유
            </a>
<span class="px-1.5 py-0.5 rounded-full bg-secondary-fixed text-secondary font-metric-val text-[11px] font-semibold">12</span>
</div>
<div class="w-full md:col-span-2 flex items-center md:justify-center gap-2 mt-2 md:mt-0">
<span class="text-on-surface-variant font-body-sm text-[13px]">클라우드 엔지니어</span>
</div>
<div class="w-full md:col-span-2 flex items-center justify-between md:justify-center text-outline font-metric-val text-[13px] mt-1 md:mt-0">
<span class="md:hidden font-body-sm text-on-surface-variant">등록일</span>
<span>2026-03-20</span>
</div>
<div class="w-full md:col-span-1 flex items-center justify-between md:justify-center text-outline font-metric-val text-[13px] mt-1 md:mt-0">
<span class="md:hidden font-body-sm text-on-surface-variant">조회수</span>
<span>1,180</span>
</div>
</div>
</div>
</div>
<!-- 4. Pagination & Bottom Write Control -->
<div class="flex flex-col sm:flex-row items-center justify-between gap-space-md pt-2">
<div class="w-24 hidden sm:block"></div> <!-- Spacer balance -->
<!-- Pagination Component -->
<nav aria-label="Page navigation" class="flex items-center gap-1.5">
<a class="w-9 h-9 flex items-center justify-center rounded-lg bg-surface-container-lowest text-on-surface-variant hover:bg-surface-container-high transition-colors shadow-sm" href="#board-list" title="첫 페이지">
<span class="material-symbols-outlined text-[18px]">keyboard_double_arrow_left</span>
</a>
<a class="w-9 h-9 flex items-center justify-center rounded-lg bg-surface-container-lowest text-on-surface-variant hover:bg-surface-container-high transition-colors shadow-sm" href="#board-list" title="이전 페이지">
<span class="material-symbols-outlined text-[18px]">chevron_left</span>
</a>
<a class="w-9 h-9 flex items-center justify-center rounded-lg bg-primary-container text-on-primary font-metric-val text-[13px] font-semibold shadow-sm" href="#board-list">1</a>
<a class="w-9 h-9 flex items-center justify-center rounded-lg bg-surface-container-lowest text-on-surface hover:bg-surface-container-high font-metric-val text-[13px] transition-colors shadow-sm" href="#board-list">2</a>
<a class="w-9 h-9 flex items-center justify-center rounded-lg bg-surface-container-lowest text-on-surface hover:bg-surface-container-high font-metric-val text-[13px] transition-colors shadow-sm" href="#board-list">3</a>
<a class="w-9 h-9 flex items-center justify-center rounded-lg bg-surface-container-lowest text-on-surface hover:bg-surface-container-high font-metric-val text-[13px] transition-colors shadow-sm" href="#board-list">4</a>
<a class="w-9 h-9 flex items-center justify-center rounded-lg bg-surface-container-lowest text-on-surface hover:bg-surface-container-high font-metric-val text-[13px] transition-colors shadow-sm" href="#board-list">5</a>
<a class="w-9 h-9 flex items-center justify-center rounded-lg bg-surface-container-lowest text-on-surface-variant hover:bg-surface-container-high transition-colors shadow-sm" href="#board-list" title="다음 페이지">
<span class="material-symbols-outlined text-[18px]">chevron_right</span>
</a>
<a class="w-9 h-9 flex items-center justify-center rounded-lg bg-surface-container-lowest text-on-surface-variant hover:bg-surface-container-high transition-colors shadow-sm" href="#board-list" title="마지막 페이지">
<span class="material-symbols-outlined text-[18px]">keyboard_double_arrow_right</span>
</a>
</nav>
<!-- Write Action Button -->
<button class="inline-flex items-center gap-1.5 px-4 py-2 rounded-lg bg-primary-container hover:bg-secondary text-on-primary font-body-sm font-semibold shadow-sm transition-all" onclick="location.href='${pageContext.request.contextPath}/board/write.jsp'" type="button">
<span class="material-symbols-outlined text-[18px]">edit</span>
<span>글쓰기</span>
</button>
</div>
<!-- 5. Board Detail View Preview (Dedicated Section - Model 2 JSP View State) -->
<section class="mt-space-xl pt-space-lg border-t border-surface-container-highest" id="detail-preview-section">
<!-- Section Label -->
<div class="flex items-center justify-between mb-4">
<div class="flex items-center gap-2">
<span class="w-2.5 h-2.5 rounded-full bg-secondary"></span>
<h2 class="font-headline-lg text-[20px] text-primary-container font-semibold">게시글 상세 보기 (Board Detail View - JSP View State)</h2>
</div>
<span class="text-outline font-label-caps tracking-wider">MAPPING: boardView.do?boardId=NX-1284</span>
</div>
<!-- Single Post Container Card -->
<article class="bg-surface-container-lowest rounded-xl shadow-md overflow-hidden">
<!-- Post Header -->
<div class="p-6 md:p-8 bg-surface-container-low/50 border-b border-surface-container-highest">
<div class="flex flex-wrap items-center gap-2 mb-3">
<span class="px-2.5 py-0.5 rounded-full bg-error-container text-on-error-container font-label-caps">공지사항</span>
<span class="px-2 py-0.5 rounded bg-secondary-fixed text-secondary font-label-caps text-[11px]">SentinelOps</span>
<span class="text-outline text-[12px] font-metric-val">NO. NX-1284</span>
</div>
<h3 class="font-headline-lg text-primary-container font-bold mb-4 leading-snug">
            [공지] 2026년 상반기 SentinelOps v4.2 기술 아키텍처 백서 배포
          </h3>
<!-- Post Metadata Bar -->
<div class="flex flex-wrap items-center justify-between gap-3 text-on-surface-variant font-body-sm pt-4 border-t border-surface-container-high/60">
<div class="flex flex-wrap items-center gap-4">
<div class="flex items-center gap-2">
<span class="w-8 h-8 rounded-full bg-secondary-fixed flex items-center justify-center text-secondary font-bold text-xs">NX</span>
<div>
<span class="font-semibold text-primary-container">Nexura 기술지원팀</span>
<span class="text-[11px] text-secondary ml-1.5 px-1.5 py-0.5 rounded bg-surface-container font-label-caps">시스템 관리자</span>
</div>
</div>
<span class="text-surface-container-highest">|</span>
<div class="flex items-center gap-1.5 text-outline">
<span class="material-symbols-outlined text-[16px]">schedule</span>
<span class="font-metric-val">2026-03-29 10:30</span>
</div>
</div>
<div class="flex items-center gap-4 font-metric-val text-[13px] text-outline">
<span class="flex items-center gap-1">
<span class="material-symbols-outlined text-[16px]">visibility</span>
<span>1,420</span>
</span>
<span class="flex items-center gap-1">
<span class="material-symbols-outlined text-[16px]">chat_bubble_outline</span>
<span class="text-secondary font-semibold">3</span>
</span>
</div>
</div>
</div>
<!-- Attachment Download Box -->
<div class="mx-6 md:mx-8 my-6 p-4 rounded-xl bg-surface-container-low flex flex-col sm:flex-row items-start sm:items-center justify-between gap-3">
<div class="flex items-center gap-3">
<div class="w-10 h-10 rounded-lg bg-surface-container-highest flex items-center justify-center text-secondary flex-shrink-0">
<span class="material-symbols-outlined text-[24px]">description</span>
</div>
<div>
<div class="flex items-center gap-2">
<span class="font-body-md font-semibold text-primary-container">SentinelOps_v4.2_Architecture_Whitepaper.pdf</span>
<span class="text-outline font-metric-val text-[12px]">(14.2 MB)</span>
</div>
<div class="font-code-inline text-[11px] text-outline mt-0.5">
                SHA256: c98ae4b5749f50e82c1626f25bbdd89c1b748281144f77c381c8c5bb71c22e4f
              </div>
</div>
</div>
<a class="inline-flex items-center gap-1.5 px-4 py-2 rounded-lg bg-surface-container-lowest hover:bg-secondary hover:text-on-secondary text-primary-container font-body-sm font-semibold shadow-sm transition-all flex-shrink-0" id="attachment-preview" href="#attachment-preview">
<span class="material-symbols-outlined text-[18px]">download</span>
<span>다운로드</span>
</a>
</div>
<!-- Post Content (Technical Announcement Body) -->
<div class="px-6 md:px-8 py-4 space-y-6 text-on-surface font-body-lg leading-relaxed">
<p>
            넥서라 엔터프라이즈 파트너 및 IT 운영팀 여러분, 안녕하십니까.
          </p>
<p>
            2026년 1분기 기준 전방위적인 분산 클라우드 환경에 대응하기 위해 강화된 <strong>SentinelOps v4.2 기술 아키텍처 백서</strong>가 공식 배포되었습니다. 이번 릴리즈에서는 eBPF 기반 커널 인텔리전스 레이어와 무중단 트랜잭션 암호화 동기화 규격이 대폭 고도화되었습니다.
          </p>
<!-- Highlight Block -->
<div class="p-5 rounded-xl bg-surface-container-high/40">
<h4 class="font-headline-sm text-primary-container font-semibold mb-2 flex items-center gap-2">
<span class="material-symbols-outlined text-secondary text-[20px]">verified</span>
              핵심 아키텍처 개편 및 주요 반영 사항
            </h4>
<ul class="space-y-2 font-body-md text-on-surface-variant list-disc pl-5">
<li><strong>eBPF 커널 바이패스 가속화:</strong> 40Gbps+ 대역폭 네트워크 환경에서의 텔레메트리 패킷 인스펙션 레이턴시를 0.12ms 미만으로 제어</li>
<li><strong>Zero-Trust Dynamic WAF Rule Engine:</strong> 실시간 분산 원격 세션 상태 변경 시 룰셋 자동 전파 시간 1.2초 달성</li>
<li><strong>PCI-DSS v4.0 HSM 직접 연동 모듈:</strong> SafeNet 및 Thales 하드웨어 보안 모듈과의 암호화 키 직접 교환 프로토콜 채택</li>
</ul>
</div>
<p class="font-body-md">
            자세한 아키텍처 다이어그램 및 컨피그레이션 샘플은 상단 첨부파일의 <strong>Chapter 4 (Cluster Orchestration)</strong> 및 <strong>Chapter 7 (Kernel-Level Telemetry)</strong>을 참조해 주시기 바랍니다. 운영 시스템 마이그레이션과 관련한 지원은 언제든 기술지원 포털 또는 본 게시글 댓글로 문의하여 주십시오.
          </p>
</div>
<!-- Post Prev / Next Navigation Strip -->
<div class="mx-6 md:mx-8 my-6 rounded-xl bg-surface-container-low overflow-hidden divide-y divide-surface-container-highest">
<div class="flex items-center px-4 py-3 text-on-surface-variant font-body-sm hover:bg-surface-container transition-colors">
<span class="flex items-center gap-1 font-label-caps text-outline w-20 flex-shrink-0">
<span class="material-symbols-outlined text-[16px]">expand_less</span>
              이전글
            </span>
<a class="text-primary-container hover:text-secondary truncate font-medium" href="#detail-preview-section">
              Zero-Trust WAF 침해 대응 룰셋 업데이트 내역 및 적용 가이드
            </a>
</div>
<div class="flex items-center px-4 py-3 text-on-surface-variant font-body-sm hover:bg-surface-container transition-colors">
<span class="flex items-center gap-1 font-label-caps text-outline w-20 flex-shrink-0">
<span class="material-symbols-outlined text-[16px]">expand_more</span>
              다음글
            </span>
<a class="text-primary-container hover:text-secondary truncate font-medium" href="#detail-preview-section">
              멀티클라우드 환경에서의 eBPF 커널 텔레메트리 최적화 사례
            </a>
</div>
</div>
<!-- Post Action Controls -->
<div class="p-6 md:p-8 bg-surface-container-low/30 border-t border-surface-container-highest flex items-center justify-between">
<a class="inline-flex items-center gap-1.5 px-4 py-2 rounded-lg bg-surface-container hover:bg-surface-container-high text-primary-container font-body-sm font-semibold transition-colors" href="#boardRowContainer">
<span class="material-symbols-outlined text-[18px]">format_list_bulleted</span>
<span>목록으로</span>
</a>
<div class="flex items-center gap-2">
<button class="inline-flex items-center gap-1.5 px-4 py-2 rounded-lg bg-surface-container hover:bg-surface-container-high text-primary-container font-body-sm font-semibold transition-colors" onclick="confirmAction('edit')" type="button">
<span class="material-symbols-outlined text-[18px]">edit_note</span>
<span>수정</span>
</button>
<button class="inline-flex items-center gap-1.5 px-4 py-2 rounded-lg bg-error-container/40 hover:bg-error-container text-on-error-container font-body-sm font-semibold transition-colors" onclick="confirmAction('delete')" type="button">
<span class="material-symbols-outlined text-[18px]">delete</span>
<span>삭제</span>
</button>
</div>
</div>
<!-- 6. Comment Section -->
<div class="p-6 md:p-8 bg-surface-container-lowest border-t border-surface-container-highest">
<!-- Comments Header -->
<div class="flex items-center justify-between mb-6">
<div class="flex items-center gap-2">
<span class="material-symbols-outlined text-secondary text-[22px]">comment</span>
<h4 class="font-headline-sm text-primary-container font-semibold">댓글 <span class="text-secondary font-metric-val">3</span>개</h4>
</div>
<span class="text-outline font-label-caps">INTERNAL TECH FORUM</span>
</div>
<!-- New Comment Input Box -->
<form class="mb-8" onsubmit="event.preventDefault(); addComment();">
<div class="rounded-xl bg-surface-container-low p-3.5 focus-within:bg-surface-container-lowest transition-all">
<label class="sr-only" for="commentContent">댓글 작성</label>
<textarea class="w-full bg-transparent text-primary-container placeholder:text-outline font-body-sm focus:outline-none resize-none" id="commentContent" placeholder="기술 피드백 또는 의견을 작성해 주세요. (인프라 계정 연동)" rows="3"></textarea>
<div class="flex items-center justify-between pt-2 border-t border-surface-container-high/60 mt-2">
<span class="text-outline font-body-sm text-[12px]">작성자: Nexura 엔터프라이즈 인증회원</span>
<button class="px-4 py-1.5 rounded-lg bg-primary-container hover:bg-secondary text-on-primary font-body-sm font-semibold shadow-sm transition-all" type="submit">
                  댓글 등록
                </button>
</div>
</div>
</form>
<!-- Existing Comments Thread -->
<div class="space-y-4" id="commentThread">
<!-- Comment 1 -->
<div class="p-4 rounded-xl bg-surface-container-low/50">
<div class="flex items-center justify-between mb-2">
<div class="flex items-center gap-2">
<span class="font-semibold text-primary-container font-body-sm">박태준 팀장</span>
<span class="text-outline text-xs">(클라우드 인프라팀)</span>
<span class="text-outline font-metric-val text-xs ml-2">2026-03-29 11:15</span>
</div>
<div class="flex items-center gap-2 text-xs text-outline">
<button class="hover:text-secondary" type="button">답글</button>
<span>·</span>
<button class="hover:text-error" type="button">삭제</button>
</div>
</div>
<p class="font-body-md text-on-surface">
                v4.2에서 eBPF 필터링 오버헤드가 전작 대비 크게 개선되었네요. 실서버 적용 검토 중입니다.
              </p>
<!-- Nested Reply (Indented) -->
<div class="mt-3 ml-6 pl-4 border-l-2 border-secondary-fixed-dim bg-surface-container-lowest p-3.5 rounded-lg">
<div class="flex items-center justify-between mb-1.5">
<div class="flex items-center gap-2">
<span class="font-semibold text-primary-container font-body-sm">Nexura 기술지원팀</span>
<span class="px-1.5 py-0.2 rounded bg-secondary text-on-secondary font-label-caps text-[10px]">관리자</span>
<span class="text-outline font-metric-val text-xs ml-1">2026-03-29 11:28</span>
</div>
<button class="text-xs text-outline hover:text-secondary" type="button">답글</button>
</div>
<p class="font-body-md text-on-surface-variant text-[13px]">
                  네 맞습니다. 벤치마크 리포트 14페이지의 커널 메모리 점유율 수치를 참고하시면 도입 검토에 도움되실 것입니다.
                </p>
</div>
</div>
<!-- Comment 2 -->
<div class="p-4 rounded-xl bg-surface-container-low/50">
<div class="flex items-center justify-between mb-2">
<div class="flex items-center gap-2">
<span class="font-semibold text-primary-container font-body-sm">최선우 선임</span>
<span class="text-outline text-xs">(보안관제파트)</span>
<span class="text-outline font-metric-val text-xs ml-2">2026-03-29 14:02</span>
</div>
<div class="flex items-center gap-2 text-xs text-outline">
<button class="hover:text-secondary" type="button">답글</button>
<span>·</span>
<button class="hover:text-error" type="button">삭제</button>
</div>
</div>
<p class="font-body-md text-on-surface">
                WAF 룰셋 동기화 주기 설정 관련하여 세부 매뉴얼도 자료실에 등록 부탁드립니다.
              </p>
</div>
</div>
</div>
</article>
</section>
</div>
</div>
<script>
  // Category switching simulation
  function switchTab(categoryKey) {
    const tabs = ['notice', 'library', 'forum'];
    tabs.forEach(tab => {
      const btn = document.getElementById('tab-' + tab);
      if (btn) {
        if (tab === categoryKey) {
          btn.classList.add('bg-surface-container-lowest', 'text-primary-container', 'shadow-sm', 'font-semibold');
          btn.classList.remove('text-on-surface-variant');
        } else {
          btn.classList.remove('bg-surface-container-lowest', 'text-primary-container', 'shadow-sm', 'font-semibold');
          btn.classList.add('text-on-surface-variant');
        }
      }
    });

    const countMap = {
      notice: '42',
      library: '318',
      forum: '924'
    };
    const countEl = document.getElementById('currentCategoryCount');
    if (countEl && countMap[categoryKey]) {
      countEl.textContent = countMap[categoryKey];
    }
  }

  // Search execution simulation
  function executeSearch() {
    const key = document.getElementById('searchKey').value;
    const word = document.getElementById('searchWord').value.trim();
    if (!word) {
      alert('검색어를 입력해 주세요.');
      document.getElementById('searchWord').focus();
      return;
    }
    // Forward to JSP Servlet mapping
    console.log("Searching [" + key + "]: " + word);
  }

  // Confirm delete or edit
  function confirmAction(type) {
    if (type === 'delete') {
      if (confirm('해당 게시글을 정말 삭제하시겠습니까?\n삭제 후 복구할 수 없습니다.')) {
        location.href = 'boardDelete.do?boardId=NX-1284';
      }
    } else if (type === 'edit') {
      location.href = 'boardEdit.do?boardId=NX-1284';
    }
  }

  // Simulated dynamic comment addition
  function addComment() {
    const textarea = document.getElementById('commentContent');
    const text = textarea.value.trim();
    if (!text) {
      alert('댓글 내용을 입력해 주세요.');
      textarea.focus();
      return;
    }

    const container = document.getElementById('commentThread');
    const newComment = document.createElement('div');
    newComment.className = 'p-4 rounded-xl bg-surface-container-low/50';
    newComment.innerHTML = `
      <div class="flex items-center justify-between mb-2">
        <div class="flex items-center gap-2">
          <span class="font-semibold text-primary-container font-body-sm">엔터프라이즈 파트너</span>
          <span class="text-outline text-xs">(방금 전)</span>
        </div>
        <div class="flex items-center gap-2 text-xs text-outline">
          <button type="button" class="hover:text-error" onclick="this.closest('.p-4').remove()">삭제</button>
        </div>
      </div>
      <p class="font-body-md text-on-surface">` + text.replace(/</g, '&lt;').replace(/>/g, '&gt;') + `</p>
    `;
    container.prepend(newComment);
    textarea.value = '';
  }
</script></main><jsp:include page="/inc/bottom.jsp" />
</body></html>