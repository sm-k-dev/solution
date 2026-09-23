<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
.dropdown-enter{opacity:0;transform:translateY(-8px) scale(.98);pointer-events:none;transition:all .2s cubic-bezier(.16,1,.3,1)}
.group:hover .dropdown-enter,.dropdown-enter:hover{opacity:1;transform:translateY(0) scale(1);pointer-events:auto}
#mobile-drawer{transition:transform .3s cubic-bezier(.16,1,.3,1),opacity .25s ease}
#mobile-backdrop{transition:opacity .3s ease}
</style>
<header class="sticky top-0 z-50 w-full bg-white border-b border-slate-200/80 shadow-[0_2px_12px_rgba(15,23,42,0.04)] backdrop-blur-md bg-white/95 transition-colors">
<div class="max-w-[1200px] mx-auto px-4 sm:px-6 lg:px-8 h-[72px] flex items-center justify-between">
<!-- Left: Brand Logo -->
<div class="flex items-center gap-8">
<a aria-label="NEXORA 홈으로 이동" class="flex items-center gap-2.5 group py-2 focus:outline-none" href="${pageContext.request.contextPath}/index.jsp">
<!-- Logo Symbol: Geometric Shield & Network Node -->
<div class="w-9 h-9 rounded-lg bg-[#0a192f] flex items-center justify-center text-white shadow-sm group-hover:bg-[#1c4fd7] transition-colors">
<svg class="w-5 h-5 text-sky-400" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.2" viewbox="0 0 24 24">
<path d="M12 2L3 7v6c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V7l-9-5z"></path>
<path d="M9 12l2 2 4-4"></path>
</svg>
</div>
<!-- Wordmark -->
<div class="flex flex-col">
<span class="font-bold tracking-tight text-[21px] text-[#0a192f] leading-none flex items-center gap-1">
              NEXORA
              <span class="w-1.5 h-1.5 rounded-full bg-[#1c4fd7]"></span>
</span>
<span class="text-[10px] font-semibold text-slate-400 tracking-wider uppercase mt-0.5">Enterprise Solutions</span>
</div>
</a>
<!-- Desktop Navigation Bar -->
<nav aria-label="메인 내비게이션" class="hidden lg:flex items-center gap-1 pl-4">
<!-- Item 1: 회사소개 -->
<a class="px-3.5 py-2 text-[15px] font-medium text-slate-700 hover:text-[#1c4fd7] hover:bg-slate-50 rounded-md transition-colors" href="${pageContext.request.contextPath}/company/company.jsp">
            회사소개
          </a>
<!-- Item 2: 솔루션 (Dropdown Mega-Menu) -->
<div class="relative group">
<button aria-expanded="false" aria-haspopup="true" class="px-3.5 py-2 text-[15px] font-medium text-[#1c4fd7] bg-blue-50/60 rounded-md flex items-center gap-1 hover:text-[#1c4fd7] hover:bg-blue-50 transition-colors focus:outline-none" type="button">
<span>솔루션</span>
<span class="material-symbols-outlined text-[18px] transition-transform duration-200 group-hover:rotate-180 text-[#1c4fd7]">expand_more</span>
</button>
<!-- Mega Dropdown Panel -->
<div class="dropdown-enter absolute left-0 top-[calc(100%+8px)] w-[680px] bg-white rounded-xl border border-slate-200/90 shadow-xl p-5 z-50">
<!-- Mega Menu Header Note -->
<div class="flex items-center justify-between pb-3.5 mb-3.5 border-b border-slate-100">
<div class="flex items-center gap-2">
<span class="w-2 h-2 rounded-full bg-[#1c4fd7]"></span>
<span class="text-xs font-bold text-slate-500 uppercase tracking-wider">엔터프라이즈 인프라 및 보안 솔루션</span>
</div>
<a class="text-xs font-semibold text-[#1c4fd7] hover:underline flex items-center gap-0.5" href="${pageContext.request.contextPath}/solutions/solutions.jsp">
                  솔루션 전체보기
                  <span class="material-symbols-outlined text-[14px]">chevron_right</span>
</a>
</div>
<!-- 2x2 Grid of 4 Core Solution Items -->
<div class="grid grid-cols-2 gap-3">
<!-- 1. Web Hosting -->
<a class="flex items-start gap-3.5 p-3 rounded-lg hover:bg-slate-50 border border-transparent hover:border-slate-200/70 transition-all group/item" href="${pageContext.request.contextPath}/solutions/solutions.jsp#web-hosting">
<div class="w-10 h-10 rounded-lg bg-blue-50 flex items-center justify-center text-[#1c4fd7] group-hover/item:bg-[#1c4fd7] group-hover/item:text-white transition-colors shrink-0 mt-0.5">
<span class="material-symbols-outlined text-[22px]">dns</span>
</div>
<div>
<div class="flex items-center gap-1.5">
<span class="text-[14px] font-semibold text-[#0f172a] group-hover/item:text-[#1c4fd7] transition-colors">Web Hosting</span>
<span class="text-[10px] font-semibold uppercase px-1.5 py-0.2 rounded bg-slate-100 text-slate-600">Tier-IV</span>
</div>
<p class="text-xs text-slate-500 mt-1 leading-relaxed">초고속 NVMe Bare-Metal 서버 및 글로벌 CDN 연동 클라우드 호스팅</p>
</div>
</a>
<!-- 2. Web Security -->
<a class="flex items-start gap-3.5 p-3 rounded-lg hover:bg-slate-50 border border-transparent hover:border-slate-200/70 transition-all group/item" href="${pageContext.request.contextPath}/solutions/solutions.jsp#web-security">
<div class="w-10 h-10 rounded-lg bg-indigo-50 flex items-center justify-center text-indigo-600 group-hover/item:bg-indigo-600 group-hover/item:text-white transition-colors shrink-0 mt-0.5">
<span class="material-symbols-outlined text-[22px]">security</span>
</div>
<div>
<div class="flex items-center gap-1.5">
<span class="text-[14px] font-semibold text-[#0f172a] group-hover/item:text-indigo-600 transition-colors">Web Security</span>
<span class="text-[10px] font-semibold uppercase px-1.5 py-0.2 rounded bg-red-50 text-red-600">3.2Tbps</span>
</div>
<p class="text-xs text-slate-500 mt-1 leading-relaxed">대규모 테라비트 DDoS 방어, Cloud WAF 및 실시간 OWASP 방화벽</p>
</div>
</a>
<!-- 3. Web Payment -->
<a class="flex items-start gap-3.5 p-3 rounded-lg hover:bg-slate-50 border border-transparent hover:border-slate-200/70 transition-all group/item" href="${pageContext.request.contextPath}/solutions/solutions.jsp#web-payment">
<div class="w-10 h-10 rounded-lg bg-emerald-50 flex items-center justify-center text-emerald-600 group-hover/item:bg-emerald-600 group-hover/item:text-white transition-colors shrink-0 mt-0.5">
<span class="material-symbols-outlined text-[22px]">payments</span>
</div>
<div>
<div class="flex items-center gap-1.5">
<span class="text-[14px] font-semibold text-[#0f172a] group-hover/item:text-emerald-600 transition-colors">Web Payment</span>
<span class="text-[10px] font-semibold uppercase px-1.5 py-0.2 rounded bg-emerald-50 text-emerald-700">PCI-DSS</span>
</div>
<p class="text-xs text-slate-500 mt-1 leading-relaxed">금융보안원 가이드라인 준수 전자결제(PG) 및 토큰화 거래 모듈 연동</p>
</div>
</a>
<!-- 4. SentinelOps -->
<a class="flex items-start gap-3.5 p-3 rounded-lg bg-slate-900 text-white hover:bg-slate-800 transition-all group/item shadow-sm" href="${pageContext.request.contextPath}/solutions/sentinelops.jsp">
<div class="w-10 h-10 rounded-lg bg-sky-500/20 flex items-center justify-center text-sky-400 group-hover/item:bg-sky-500 group-hover/item:text-white transition-colors shrink-0 mt-0.5">
<span class="material-symbols-outlined text-[22px]">smart_toy</span>
</div>
<div>
<div class="flex items-center gap-1.5">
<span class="text-[14px] font-semibold text-white group-hover/item:text-sky-300 transition-colors">SentinelOps</span>
<span class="text-[10px] font-bold uppercase px-1.5 py-0.5 rounded bg-sky-500/30 text-sky-300">AI CORE</span>
</div>
<p class="text-xs text-slate-300 mt-1 leading-relaxed">실시간 이상 징후 머신러닝 탐지 및 자동 복구 지능형 모니터링 엔진</p>
</div>
</a>
</div>
<!-- Mega Menu Footer Status Bar -->
<div class="mt-4 pt-3 border-t border-slate-100 flex items-center justify-between text-xs text-slate-500">
<div class="flex items-center gap-2">
<span class="w-2 h-2 rounded-full bg-emerald-500"></span>
<span>모든 글로벌 인프라 정상 운영 중 (SLA 99.99%)</span>
</div>
<span class="text-slate-400">24/7/365 엔터프라이즈 기술 관제 지원</span>
</div>
</div>
</div>
<!-- Item 3: 고객센터 -->
<a class="px-3.5 py-2 text-[15px] font-medium text-slate-700 hover:text-[#1c4fd7] hover:bg-slate-50 rounded-md transition-colors" href="${pageContext.request.contextPath}/inquiry/index.jsp">
            고객센터
          </a>
<!-- Item 4: 커뮤니티 -->
<a class="px-3.5 py-2 text-[15px] font-medium text-slate-700 hover:text-[#1c4fd7] hover:bg-slate-50 rounded-md transition-colors" href="${pageContext.request.contextPath}/board/board.jsp">
            커뮤니티
          </a>
</nav>
</div>
<!-- Right: User Actions (Desktop Auth & RFP CTA) -->
<div class="hidden lg:flex items-center gap-3">
<!-- 로그인 -->
<a class="px-3.5 py-2 text-[14px] font-medium text-slate-700 hover:text-[#1c4fd7] transition-colors" href="${pageContext.request.contextPath}/member/login.jsp">
          로그인
        </a>
<span class="w-px h-4 bg-slate-200"></span>
<!-- 회원가입 -->
<a class="px-4 py-2 text-[14px] font-medium text-[#0a192f] border border-slate-300 rounded-lg hover:bg-slate-50 hover:border-slate-400 transition-all" href="${pageContext.request.contextPath}/member/signup.jsp">
          회원가입
        </a>
<!-- Enterprise RFP Quick Button -->
<a class="ml-1 inline-flex items-center gap-1.5 px-4 py-2 text-[14px] font-semibold text-white bg-[#0a192f] hover:bg-[#1c4fd7] rounded-lg shadow-sm hover:shadow transition-all active:scale-[0.98]" href="${pageContext.request.contextPath}/inquiry/write.jsp">
<span>도입문의</span>
<span class="material-symbols-outlined text-[16px]">arrow_forward</span>
</a>
</div>
<!-- Mobile Right: Hamburger Toggle Button -->
<div class="flex items-center gap-2 lg:hidden">
<a class="px-3 py-1.5 text-xs font-semibold text-slate-700 hover:text-[#1c4fd7] border border-slate-200 rounded-md" href="${pageContext.request.contextPath}/member/login.jsp">
          로그인
        </a>
<button aria-label="모바일 메뉴 열기" class="w-10 h-10 flex items-center justify-center rounded-lg text-slate-700 hover:bg-slate-100 focus:outline-none" id="mobile-menu-btn" onclick="toggleMobileDrawer()" type="button">
<span class="material-symbols-outlined text-[26px]">menu</span>
</button>
</div>
</div>
<!-- ========================================================================= -->
<!-- Mobile Navigation Drawer & Backdrop                                       -->
<!-- ========================================================================= -->
<div class="fixed inset-0 bg-slate-900/50 backdrop-blur-sm z-40 hidden opacity-0 transition-opacity lg:hidden" id="mobile-backdrop" onclick="toggleMobileDrawer()"></div>
<div class="fixed top-0 right-0 bottom-0 w-[84%] max-w-[360px] bg-white z-50 shadow-2xl flex flex-col translate-x-full transition-transform lg:hidden" id="mobile-drawer">
<!-- Drawer Header -->
<div class="h-[72px] px-5 flex items-center justify-between border-b border-slate-100">
<div class="flex items-center gap-2">
<div class="w-8 h-8 rounded bg-[#0a192f] flex items-center justify-center text-white">
<svg class="w-4 h-4 text-sky-400" fill="none" stroke="currentColor" stroke-width="2.2" viewbox="0 0 24 24">
<path d="M12 2L3 7v6c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V7l-9-5z"></path>
</svg>
</div>
<span class="font-bold text-lg text-[#0a192f] tracking-tight">NEXORA</span>
</div>
<button aria-label="메뉴 닫기" class="w-9 h-9 flex items-center justify-center rounded-lg text-slate-500 hover:bg-slate-100" onclick="toggleMobileDrawer()" type="button">
<span class="material-symbols-outlined text-[24px]">close</span>
</button>
</div>
<!-- Drawer Scrollable Body -->
<div class="flex-1 overflow-y-auto p-5 flex flex-col gap-6">
<!-- Mobile Auth Banner -->
<div class="p-4 rounded-xl bg-slate-50 border border-slate-200/80 flex flex-col gap-3">
<div class="flex items-center justify-between">
<span class="text-xs font-semibold text-slate-500">NEXORA 계정 서비스</span>
<span class="text-[11px] text-[#1c4fd7] font-semibold">기업 회원</span>
</div>
<div class="grid grid-cols-2 gap-2">
<a class="w-full py-2.5 rounded-lg bg-white border border-slate-200 text-center text-xs font-bold text-slate-800 hover:bg-slate-100 transition-colors" href="${pageContext.request.contextPath}/member/login.jsp">
              로그인
            </a>
<a class="w-full py-2.5 rounded-lg bg-[#0a192f] text-center text-xs font-bold text-white hover:bg-[#1c4fd7] transition-colors" href="${pageContext.request.contextPath}/member/signup.jsp">
              회원가입
            </a>
</div>
</div>
<!-- Mobile Nav Links -->
<nav aria-label="모바일 내비게이션" class="flex flex-col gap-1 text-[15px]">
<a class="px-3 py-2.5 font-medium text-slate-700 hover:bg-slate-50 rounded-lg flex items-center justify-between" href="${pageContext.request.contextPath}/company/company.jsp">
<span>회사소개</span>
<span class="material-symbols-outlined text-[18px] text-slate-400">chevron_right</span>
</a>
<!-- Mobile Solutions Accordion -->
<div class="flex flex-col">
<button class="w-full px-3 py-2.5 font-semibold text-[#1c4fd7] bg-blue-50/50 rounded-lg flex items-center justify-between focus:outline-none" onclick="toggleMobileSubmenu()" type="button">
<span class="flex items-center gap-2">
<span class="material-symbols-outlined text-[20px] text-[#1c4fd7]">apps</span>
<span>솔루션</span>
</span>
<span class="material-symbols-outlined text-[20px] transition-transform text-[#1c4fd7]" id="mobile-sub-chevron">expand_more</span>
</button>
<!-- Submenu Items -->
<div class="pl-4 pr-1 py-2 flex flex-col gap-1" id="mobile-sub-menu">
<a class="p-2 rounded-lg hover:bg-slate-50 flex items-center gap-2.5" href="${pageContext.request.contextPath}/solutions/solutions.jsp#web-hosting">
<span class="material-symbols-outlined text-[18px] text-[#1c4fd7]">dns</span>
<div>
<div class="text-xs font-semibold text-slate-800">Web Hosting</div>
<div class="text-[11px] text-slate-400">클라우드 인프라 및 베어메탈</div>
</div>
</a>
<a class="p-2 rounded-lg hover:bg-slate-50 flex items-center gap-2.5" href="${pageContext.request.contextPath}/solutions/solutions.jsp#web-security">
<span class="material-symbols-outlined text-[18px] text-indigo-600">security</span>
<div>
<div class="text-xs font-semibold text-slate-800">Web Security</div>
<div class="text-[11px] text-slate-400">DDoS 방어 및 웹 방화벽(WAF)</div>
</div>
</a>
<a class="p-2 rounded-lg hover:bg-slate-50 flex items-center gap-2.5" href="${pageContext.request.contextPath}/solutions/solutions.jsp#web-payment">
<span class="material-symbols-outlined text-[18px] text-emerald-600">payments</span>
<div>
<div class="text-xs font-semibold text-slate-800">Web Payment</div>
<div class="text-[11px] text-slate-400">PCI-DSS 준수 PG 결제 연동</div>
</div>
</a>
<a class="p-2 rounded-lg bg-slate-900 text-white flex items-center gap-2.5 mt-1" href="${pageContext.request.contextPath}/solutions/sentinelops.jsp">
<span class="material-symbols-outlined text-[18px] text-sky-400">smart_toy</span>
<div>
<div class="text-xs font-semibold text-white flex items-center gap-1.5">
<span>SentinelOps</span>
<span class="text-[9px] px-1 py-0.2 bg-sky-500/30 text-sky-300 rounded font-mono">AI CORE</span>
</div>
<div class="text-[10px] text-slate-300">AI 기반 지능형 관제 모니터링</div>
</div>
</a>
</div>
</div>
<a class="px-3 py-2.5 font-medium text-slate-700 hover:bg-slate-50 rounded-lg flex items-center justify-between" href="${pageContext.request.contextPath}/inquiry/index.jsp">
<span>고객센터</span>
<span class="material-symbols-outlined text-[18px] text-slate-400">chevron_right</span>
</a>
<a class="px-3 py-2.5 font-medium text-slate-700 hover:bg-slate-50 rounded-lg flex items-center justify-between" href="${pageContext.request.contextPath}/board/board.jsp">
<span>커뮤니티</span>
<span class="material-symbols-outlined text-[18px] text-slate-400">chevron_right</span>
</a>
</nav>
<!-- Mobile Tech Support Hotline -->
<div class="mt-auto pt-4 border-t border-slate-100 flex flex-col gap-2">
<span class="text-[11px] font-bold uppercase tracking-wider text-slate-400">NOC &amp; SOC 통합 관제 센터</span>
<div class="flex items-center gap-2 text-slate-800 font-bold text-sm">
<span class="material-symbols-outlined text-[18px] text-[#1c4fd7]">support_agent</span>
<span>1544-6820</span>
<span class="text-[11px] font-normal text-slate-500">(24/7/365 긴급대응)</span>
</div>
<a class="w-full mt-2 py-3 rounded-xl bg-[#1c4fd7] text-white text-center text-xs font-bold shadow-sm hover:bg-[#0a192f] transition-colors" href="${pageContext.request.contextPath}/inquiry/write.jsp">
            기술 도입 상담 신청
          </a>
</div>
</div>
</div>
</header>
<script>
    let mobileDrawerOpen = false;

    function toggleMobileDrawer() {
      const drawer = document.getElementById('mobile-drawer');
      const backdrop = document.getElementById('mobile-backdrop');
      mobileDrawerOpen = !mobileDrawerOpen;

      if (mobileDrawerOpen) {
        backdrop.classList.remove('hidden');
        setTimeout(() => {
          backdrop.classList.remove('opacity-0');
          backdrop.classList.add('opacity-100');
          drawer.classList.remove('translate-x-full');
        }, 10);
        document.body.style.overflow = 'hidden';
      } else {
        backdrop.classList.remove('opacity-100');
        backdrop.classList.add('opacity-0');
        drawer.classList.add('translate-x-full');
        setTimeout(() => {
          backdrop.classList.add('hidden');
        }, 300);
        document.body.style.overflow = '';
      }
    }

    let mobileSubOpen = true;
    function toggleMobileSubmenu() {
      const menu = document.getElementById('mobile-sub-menu');
      const chevron = document.getElementById('mobile-sub-chevron');
      mobileSubOpen = !mobileSubOpen;

      if (mobileSubOpen) {
        menu.classList.remove('hidden');
        chevron.style.transform = 'rotate(0deg)';
      } else {
        menu.classList.add('hidden');
        chevron.style.transform = 'rotate(-90deg)';
      }
    }
  </script>