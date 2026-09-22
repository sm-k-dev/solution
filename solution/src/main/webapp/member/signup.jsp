<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html lang="en"><head><meta charset="utf-8"/><meta content="width=device-width, initial-scale=1.0" name="viewport"/><meta content="web_blank" name="shell-type"/><link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&amp;family=JetBrains+Mono:wght@400;600&amp;display=swap" rel="stylesheet"/><link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/><style>@layer base { html, body { margin: 0; padding: 0; } body { overscroll-behavior: none; } main > :first-child { margin-top: 0 !important; } main > :last-child { margin-bottom: 0 !important; } } ::-webkit-scrollbar { display: none; }</style><script src="https://cdn.tailwindcss.com"></script><script id="tailwind-config">tailwind.config = { darkMode: "class", theme: { extend: { colors: { "secondary-fixed-dim": "#b6c4ff", "outline": "#75777e", "error": "#ba1a1a", "on-surface": "#0b1c30", "tertiary-container": "#001e2f", "on-tertiary-fixed-variant": "#004c6e", "on-secondary-fixed-variant": "#0039b3", "surface-bright": "#f8f9ff", "on-primary-fixed-variant": "#39475f", "surface-container-highest": "#d3e4fe", "on-secondary-container": "#fffbff", "primary-container": "#0d1c32", "surface-container": "#e5eeff", "surface-dim": "#cbdbf5", "primary-fixed-dim": "#b9c7e4", "error-container": "#ffdad6", "tertiary-fixed-dim": "#89ceff", "surface-tint": "#515f78", "primary": "#000000", "primary-fixed": "#d6e3ff", "on-tertiary-fixed": "#001e2f", "on-tertiary": "#ffffff", "surface": "#f8f9ff", "inverse-on-surface": "#eaf1ff", "tertiary": "#000000", "on-primary-fixed": "#0d1c32", "surface-container-low": "#eff4ff", "outline-variant": "#c5c6cd", "inverse-surface": "#213145", "on-primary": "#ffffff", "secondary-container": "#3f69f1", "on-surface-variant": "#44474d", "on-primary-container": "#76849f", "surface-variant": "#d3e4fe", "on-tertiary-container": "#008cc7", "on-secondary-fixed": "#001550", "secondary": "#1c4fd7", "secondary-fixed": "#dce1ff", "surface-container-high": "#dce9ff", "background": "#f8f9ff", "tertiary-fixed": "#c9e6ff", "surface-container-lowest": "#ffffff", "on-error-container": "#93000a", "on-error": "#ffffff", "on-secondary": "#ffffff", "on-background": "#0b1c30", "inverse-primary": "#b9c7e4" }, borderRadius: { "DEFAULT": "0.125rem", "lg": "0.25rem", "xl": "0.5rem", "full": "0.75rem" }, spacing: { "space-lg": "1.5rem", "gutter-mobile": "1rem", "gutter-desktop": "2rem", "space-sm": "0.5rem", "space-md": "1rem", "gutter": "1.5rem", "margin-mobile": "1rem", "space-xs": "0.25rem", "margin": "1.5rem", "space-xl": "2.5rem", "margin-desktop": "2rem" }, fontFamily: { "headline-sm": ["Inter"], "code-inline": ["JetBrains Mono"], "headline-lg": ["Inter"], "display-hero-mobile": ["Inter"], "label-caps": ["Inter"], "body-lg": ["Inter"], "headline-md": ["Inter"], "headline-xl": ["Inter"], "body-sm": ["Inter"], "metric-val": ["JetBrains Mono"], "body-md": ["Inter"], "headline-xl-mobile": ["Inter"], "display-hero": ["Inter"] }, fontSize: { "headline-sm": ["18px", { "lineHeight": "26px", "letterSpacing": "0", "fontWeight": "600" }], "code-inline": ["12px", { "lineHeight": "18px", "letterSpacing": "0", "fontWeight": "400" }], "headline-lg": ["28px", { "lineHeight": "36px", "letterSpacing": "-0.01em", "fontWeight": "600" }], "display-hero-mobile": ["32px", { "lineHeight": "40px", "letterSpacing": "-0.015em", "fontWeight": "700" }], "label-caps": ["11px", { "lineHeight": "16px", "letterSpacing": "0.06em", "fontWeight": "700" }], "body-lg": ["16px", { "lineHeight": "26px", "letterSpacing": "-0.005em", "fontWeight": "400" }], "headline-md": ["22px", { "lineHeight": "30px", "letterSpacing": "-0.005em", "fontWeight": "600" }], "headline-xl": ["36px", { "lineHeight": "44px", "letterSpacing": "-0.02em", "fontWeight": "700" }], "body-sm": ["13px", { "lineHeight": "20px", "letterSpacing": "0", "fontWeight": "400" }], "metric-val": ["20px", { "lineHeight": "28px", "letterSpacing": "-0.02em", "fontWeight": "600" }], "body-md": ["14px", { "lineHeight": "22px", "letterSpacing": "0", "fontWeight": "400" }], "headline-xl-mobile": ["28px", { "lineHeight": "36px", "letterSpacing": "-0.015em", "fontWeight": "700" }], "display-hero": ["44px", { "lineHeight": "56px", "letterSpacing": "-0.02em", "fontWeight": "700" }] } } } };</script></head><body class="bg-surface font-body-md text-body-md text-on-surface min-h-screen">
<jsp:include page="/inc/top.jsp" /><main class="w-full min-h-screen bg-surface flex flex-col justify-center items-center py-space-xl px-gutter-mobile md:px-gutter-desktop"><div class="flex flex-col w-full">
<div class="w-full max-w-[720px] mx-auto py-8 sm:py-12 px-4 sm:px-6">
<!-- Top Back Link -->
<div class="mb-6">
<a class="inline-flex items-center gap-1.5 text-on-surface-variant hover:text-secondary font-body-sm transition-colors group" href="#login">
<span class="material-symbols-outlined text-[18px] transition-transform group-hover:-translate-x-1">arrow_back</span>
<span>로그인으로 돌아가기</span>
</a>
</div>
<!-- Main Registration Card -->
<div class="bg-surface-container-lowest rounded-2xl shadow-sm p-6 sm:p-10">
<!-- Top Brand & Header -->
<div class="flex flex-col gap-2 pb-8">
<div class="inline-flex items-center gap-2 self-start px-3 py-1 bg-surface-container-low rounded-full">
<span class="material-symbols-outlined text-secondary text-[16px]">verified_user</span>
<span class="font-label-caps text-secondary tracking-wide uppercase">NEXORA Enterprise B2B Membership</span>
</div>
<div class="flex flex-col sm:flex-row sm:items-end justify-between gap-2 mt-2">
<div>
<h1 class="font-headline-xl text-headline-xl text-primary-container">회원가입</h1>
<p class="font-body-md text-body-md text-on-surface-variant mt-1">서비스 이용을 위한 엔터프라이즈 계정을 생성해주세요.</p>
</div>
<span class="font-body-sm text-body-sm text-secondary font-semibold whitespace-nowrap">* 표시는 필수 입력 항목입니다.</span>
</div>
</div>
<form class="flex flex-col gap-10" onsubmit="event.preventDefault();">
<!-- SECTION 01: 기본 정보 -->
<section class="flex flex-col gap-6">
<div class="flex items-center gap-3">
<span class="w-7 h-7 rounded-lg bg-surface-container text-secondary flex items-center justify-center font-metric-val text-metric-val font-bold">01</span>
<h2 class="font-headline-md text-headline-md text-primary-container">기본 정보</h2>
</div>
<div class="grid grid-cols-1 gap-5">
<!-- ID Field -->
<div class="flex flex-col gap-2">
<label class="font-body-sm text-body-sm font-semibold text-on-surface" for="userId">
                아이디 <span class="text-error">*</span>
</label>
<div class="flex flex-col sm:flex-row gap-2">
<div class="relative flex-1">
<span class="material-symbols-outlined absolute left-3.5 top-1/2 -translate-y-1/2 text-outline text-[20px] pointer-events-none">person</span>
<input class="w-full h-12 pl-11 pr-4 bg-surface-container-low rounded-lg text-on-surface font-body-md text-body-md placeholder:text-outline focus:outline-none focus:bg-surface-container-lowest focus:shadow-[0_0_0_2px_#1c4fd7] transition-all" id="userId" placeholder="영문 소문자, 숫자 조합 6~20자" type="text" value="nexora_admin"/>
</div>
<button class="h-12 px-5 bg-surface-container text-primary-container font-body-md text-body-md font-semibold rounded-lg hover:bg-surface-container-high transition-colors whitespace-nowrap flex items-center justify-center gap-1.5" type="button">
<span>중복확인</span>
</button>
</div>
<div class="flex items-center gap-1.5 text-secondary text-xs">
<span class="material-symbols-outlined text-[16px]">check_circle</span>
<span class="font-body-sm text-body-sm">사용 가능한 아이디입니다.</span>
</div>
</div>
<!-- Password Field -->
<div class="flex flex-col gap-2">
<label class="font-body-sm text-body-sm font-semibold text-on-surface" for="userPw">
                비밀번호 <span class="text-error">*</span>
</label>
<div class="relative">
<span class="material-symbols-outlined absolute left-3.5 top-1/2 -translate-y-1/2 text-outline text-[20px] pointer-events-none">lock</span>
<input class="w-full h-12 pl-11 pr-11 bg-surface-container-low rounded-lg text-on-surface font-body-md text-body-md placeholder:text-outline focus:outline-none focus:bg-surface-container-lowest focus:shadow-[0_0_0_2px_#1c4fd7] transition-all" id="userPw" placeholder="영문, 숫자, 특수문자 조합 8자 이상" type="password" value="Enterprise@2025#"/>
<button class="absolute right-3.5 top-1/2 -translate-y-1/2 text-outline hover:text-on-surface transition-colors" onclick="const p = document.getElementById('userPw'); p.type = p.type === 'password' ? 'text' : 'password'; this.firstElementChild.textContent = p.type === 'password' ? 'visibility' : 'visibility_off';" type="button">
<span class="material-symbols-outlined text-[20px]">visibility</span>
</button>
</div>
<!-- Password Strength Meter -->
<div class="flex flex-col gap-1.5 pt-1">
<div class="flex gap-1.5 w-full h-1.5">
<div class="flex-1 bg-secondary rounded-full"></div>
<div class="flex-1 bg-secondary rounded-full"></div>
<div class="flex-1 bg-secondary rounded-full"></div>
</div>
<div class="flex items-center justify-between text-xs">
<span class="font-body-sm text-body-sm text-secondary font-semibold">안전 (보안 기준을 충족합니다)</span>
<span class="font-code-inline text-code-inline text-outline">8+ chars / Mixed</span>
</div>
</div>
</div>
<!-- Confirm Password Field -->
<div class="flex flex-col gap-2">
<label class="font-body-sm text-body-sm font-semibold text-on-surface" for="userPwConfirm">
                비밀번호 확인 <span class="text-error">*</span>
</label>
<div class="relative">
<span class="material-symbols-outlined absolute left-3.5 top-1/2 -translate-y-1/2 text-outline text-[20px] pointer-events-none">lock_clock</span>
<input class="w-full h-12 pl-11 pr-11 bg-surface-container-low rounded-lg text-on-surface font-body-md text-body-md placeholder:text-outline focus:outline-none focus:bg-surface-container-lowest focus:shadow-[0_0_0_2px_#1c4fd7] transition-all" id="userPwConfirm" placeholder="비밀번호를 재입력하세요" type="password" value="Enterprise@2025#"/>
<span class="material-symbols-outlined absolute right-3.5 top-1/2 -translate-y-1/2 text-secondary text-[20px]">check</span>
</div>
<div class="flex items-center gap-1.5 text-secondary text-xs">
<span class="material-symbols-outlined text-[16px]">check_circle</span>
<span class="font-body-sm text-body-sm">비밀번호가 일치합니다.</span>
</div>
</div>
<!-- Name & Mobile Grid -->
<div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
<!-- Name -->
<div class="flex flex-col gap-2">
<label class="font-body-sm text-body-sm font-semibold text-on-surface" for="userName">
                  담당자 성명 <span class="text-error">*</span>
</label>
<div class="relative">
<span class="material-symbols-outlined absolute left-3.5 top-1/2 -translate-y-1/2 text-outline text-[20px] pointer-events-none">badge</span>
<input class="w-full h-12 pl-11 pr-4 bg-surface-container-low rounded-lg text-on-surface font-body-md text-body-md placeholder:text-outline focus:outline-none focus:bg-surface-container-lowest focus:shadow-[0_0_0_2px_#1c4fd7] transition-all" id="userName" placeholder="홍길동" type="text"/>
</div>
</div>
<!-- Mobile Phone -->
<div class="flex flex-col gap-2">
<label class="font-body-sm text-body-sm font-semibold text-on-surface" for="userPhone">
                  휴대폰 번호 <span class="text-error">*</span>
</label>
<div class="relative">
<span class="material-symbols-outlined absolute left-3.5 top-1/2 -translate-y-1/2 text-outline text-[20px] pointer-events-none">smartphone</span>
<input class="w-full h-12 pl-11 pr-4 bg-surface-container-low rounded-lg text-on-surface font-body-md text-body-md placeholder:text-outline focus:outline-none focus:bg-surface-container-lowest focus:shadow-[0_0_0_2px_#1c4fd7] transition-all font-code-inline text-code-inline" id="userPhone" placeholder="010-0000-0000" type="tel"/>
</div>
</div>
</div>
<!-- Corporate Email -->
<div class="flex flex-col gap-2">
<label class="font-body-sm text-body-sm font-semibold text-on-surface" for="userEmail">
                기업 이메일 <span class="text-error">*</span>
</label>
<div class="relative">
<span class="material-symbols-outlined absolute left-3.5 top-1/2 -translate-y-1/2 text-outline text-[20px] pointer-events-none">mail</span>
<input class="w-full h-12 pl-11 pr-4 bg-surface-container-low rounded-lg text-on-surface font-body-md text-body-md placeholder:text-outline focus:outline-none focus:bg-surface-container-lowest focus:shadow-[0_0_0_2px_#1c4fd7] transition-all" id="userEmail" placeholder="name@company.com" type="email"/>
</div>
<p class="font-body-sm text-body-sm text-on-surface-variant flex items-center gap-1.5">
<span class="material-symbols-outlined text-[16px] text-outline">info</span>
<span>업무용 기업 이메일을 입력해주세요. (보안 승인 메일이 발송됩니다)</span>
</p>
</div>
</div>
</section>
<!-- SECTION 02: 사업장 / 주소 -->
<section class="flex flex-col gap-6">
<div class="flex items-center gap-3">
<span class="w-7 h-7 rounded-lg bg-surface-container text-secondary flex items-center justify-center font-metric-val text-metric-val font-bold">02</span>
<h2 class="font-headline-md text-headline-md text-primary-container">사업장 / 주소</h2>
</div>
<div class="flex flex-col gap-4">
<!-- Postal Code -->
<div class="flex flex-col gap-2">
<label class="font-body-sm text-body-sm font-semibold text-on-surface" for="postalCode">
                우편번호
              </label>
<div class="flex gap-2">
<input class="w-36 h-12 px-4 bg-surface-container-high rounded-lg text-on-surface font-code-inline text-code-inline font-medium cursor-default focus:outline-none" id="postalCode" readonly="" type="text" value="06164"/>
<button class="h-12 px-5 bg-surface-container text-primary-container font-body-md text-body-md font-semibold rounded-lg hover:bg-surface-container-high transition-colors whitespace-nowrap flex items-center justify-center gap-1.5" type="button">
<span class="material-symbols-outlined text-[18px]">search</span>
<span>우편번호 검색</span>
</button>
</div>
</div>
<!-- Street Address -->
<div class="flex flex-col gap-2">
<label class="font-body-sm text-body-sm font-semibold text-on-surface" for="addressMain">
                기본 주소
              </label>
<input class="w-full h-12 px-4 bg-surface-container-high rounded-lg text-on-surface font-body-md text-body-md cursor-default focus:outline-none" id="addressMain" readonly="" type="text" value="서울특별시 강남구 영동대로 517 (삼성동)"/>
</div>
<!-- Detailed Address -->
<div class="flex flex-col gap-2">
<label class="font-body-sm text-body-sm font-semibold text-on-surface" for="addressDetail">
                상세 주소
              </label>
<input class="w-full h-12 px-4 bg-surface-container-low rounded-lg text-on-surface font-body-md text-body-md placeholder:text-outline focus:outline-none focus:bg-surface-container-lowest focus:shadow-[0_0_0_2px_#1c4fd7] transition-all" id="addressDetail" placeholder="상세 주소 및 건물 동/호수를 입력하세요 (예: 아셈타워 28층)" type="text"/>
</div>
</div>
</section>
<!-- SECTION 03: 약관 동의 -->
<section class="flex flex-col gap-6">
<div class="flex items-center gap-3">
<span class="w-7 h-7 rounded-lg bg-surface-container text-secondary flex items-center justify-center font-metric-val text-metric-val font-bold">03</span>
<h2 class="font-headline-md text-headline-md text-primary-container">약관 동의</h2>
</div>
<div class="flex flex-col gap-3">
<!-- Master Checkbox Card -->
<label class="bg-surface-container-low hover:bg-surface-container p-4 rounded-xl flex items-center gap-3.5 cursor-pointer transition-colors">
<input checked="" class="w-5 h-5 rounded text-secondary accent-secondary cursor-pointer" id="checkAll" onchange="const c = this.checked; document.querySelectorAll('.sub-check').forEach(i =&gt; i.checked = c);" type="checkbox"/>
<div class="flex flex-col">
<span class="font-body-md text-body-md font-bold text-primary-container">전체 동의</span>
<span class="font-body-sm text-body-sm text-on-surface-variant">모든 필수 약관 및 선택 수신 항목에 동의합니다.</span>
</div>
</label>
<!-- Sub Checkboxes -->
<div class="flex flex-col gap-2.5 px-2 pt-1">
<!-- Terms 1 -->
<div class="flex items-center justify-between py-1.5">
<label class="flex items-center gap-3 cursor-pointer">
<input checked="" class="sub-check w-4 h-4 rounded text-secondary accent-secondary cursor-pointer" required="" type="checkbox"/>
<span class="font-body-sm text-body-sm text-on-surface">
<span class="font-semibold text-secondary">[필수]</span> NEXORA 엔터프라이즈 이용약관 동의
                  </span>
</label>
<button class="text-xs text-outline hover:text-secondary font-body-sm underline transition-colors whitespace-nowrap" type="button">
                  전문보기 &gt;
                </button>
</div>
<!-- Terms 2 -->
<div class="flex items-center justify-between py-1.5">
<label class="flex items-center gap-3 cursor-pointer">
<input checked="" class="sub-check w-4 h-4 rounded text-secondary accent-secondary cursor-pointer" required="" type="checkbox"/>
<span class="font-body-sm text-body-sm text-on-surface">
<span class="font-semibold text-secondary">[필수]</span> 개인정보 수집 및 이용 동의
                  </span>
</label>
<button class="text-xs text-outline hover:text-secondary font-body-sm underline transition-colors whitespace-nowrap" type="button">
                  전문보기 &gt;
                </button>
</div>
<!-- Terms 3 -->
<div class="flex items-center justify-between py-1.5">
<label class="flex items-center gap-3 cursor-pointer">
<input class="sub-check w-4 h-4 rounded text-secondary accent-secondary cursor-pointer" type="checkbox"/>
<span class="font-body-sm text-body-sm text-on-surface">
<span class="text-outline-variant font-medium">[선택]</span> 기술 백서, 보안 인텔리전스 세미나 및 제품 뉴스 수신 동의
                  </span>
</label>
<button class="text-xs text-outline hover:text-secondary font-body-sm underline transition-colors whitespace-nowrap" type="button">
                  전문보기 &gt;
                </button>
</div>
</div>
</div>
</section>
<!-- SECTION 04: Action Buttons -->
<div class="flex flex-col-reverse sm:flex-row gap-3 pt-4">
<button class="sm:w-1/3 h-12 rounded-xl bg-surface-container hover:bg-surface-container-high text-on-surface font-semibold font-body-md text-body-md transition-colors flex items-center justify-center" type="button">
            취소
          </button>
<button class="sm:w-2/3 h-12 rounded-xl bg-secondary hover:bg-secondary-container text-on-secondary font-semibold font-body-md text-body-md transition-all shadow-sm hover:shadow flex items-center justify-center gap-2" type="submit">
<span class="material-symbols-outlined text-[20px]">person_add</span>
<span>회원가입 완료</span>
</button>
</div>
</form>
<!-- Bottom Compliance & Security Notice -->
<div class="mt-10 pt-6 flex items-start gap-3 text-on-surface-variant bg-surface-container-low/60 rounded-xl p-4">
<span class="material-symbols-outlined text-secondary text-[20px] shrink-0 mt-0.5">lock</span>
<p class="font-body-sm text-body-sm leading-relaxed text-outline">
          NEXORA는 기업 고객의 소중한 정보를 256-bit SSL 암호화 및 정보보호 관리체계(ISMS-P) 표준 기준에 따라 안전하게 보호하고 있으며, 법령에 정한 목적 외로 무단 수집·활용하지 않습니다.
        </p>
</div>
</div>
</div>
</div></main><jsp:include page="/inc/bottom.jsp" />
</body></html>