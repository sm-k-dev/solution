<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0" name="viewport" />
        <meta content="web_blank" name="shell-type" />
        <link
        href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&amp;family=JetBrains+Mono:wght@400;600&amp;display=swap"
        rel="stylesheet" />
        <link
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
        rel="stylesheet" />
        <link
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
        rel="stylesheet" />
        <style>
            @
            layer base {html , body { margin:0;
            padding: 0;
            }

            body {
            overscroll-behavior: none;
            }

            main>:first-child {
            margin-top: 0 !important;
            }

            main>:last-child {
            margin-bottom: 0 !important;
            }

            }
            ::-webkit-scrollbar {
            display: none;
            }
        </style>
        <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets/css/pages/member_signup.css" />
        <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />
        <link rel="stylesheet"
        href="${pageContext.request.contextPath}/assets/css/top.css?v=20261002-4" />
    </head>
    <body
    class="bg-surface font-body-md text-body-md text-on-surface min-h-screen">
    <jsp:include page="/inc/top.jsp" />
    <main
    class="w-full min-h-screen bg-surface flex flex-col justify-center items-center py-space-xl px-gutter-mobile md:px-gutter-desktop">
    <div class="flex flex-col w-full">
        <div class="w-full max-w-[720px] mx-auto py-8 sm:py-12 px-4 sm:px-6">
<!-- Top Back Link -->
            <div class="mb-6">
                <a
                class="inline-flex items-center gap-1.5 text-on-surface-variant hover:text-secondary font-body-sm transition-colors group"
                href="<%=request.getContextPath()%>/member/login.do">
                <span
                class="material-symbols-outlined text-[18px] transition-transform group-hover:-translate-x-1">arrow_back</span>
            <span>로그인으로 돌아가기</span>
        </a>
    </div>
<!-- Main Registration Card -->
    <div
    class="bg-surface-container-lowest rounded-2xl shadow-sm p-6 sm:p-10">
<!-- Top Brand & Header -->
    <div class="flex flex-col gap-2 pb-8">
        <div
        class="inline-flex items-center gap-2 self-start px-3 py-1 bg-surface-container-low rounded-full">
        <span
        class="material-symbols-outlined text-secondary text-[16px]">verified_user</span>
    <span
    class="font-label-caps text-secondary tracking-wide uppercase">NEXORA
    Enterprise B2B Membership</span>
</div>
<div
class="flex flex-col sm:flex-row sm:items-end justify-between gap-2 mt-2">
<div>
    <h1
    class="font-headline-xl text-headline-xl text-primary-container">회원가입</h1>
<p
class="font-body-md text-body-md text-on-surface-variant mt-1">서비스
이용을 위한 엔터프라이즈 계정을 생성해주세요.</p>
</div>
<span
class="font-body-sm text-body-sm text-secondary font-semibold whitespace-nowrap">*
표시는 필수 입력 항목입니다.</span>
</div>
</div>
<form id="signupForm" class="flex flex-col gap-10"
action="<%=request.getContextPath()%>/member/signupPro.do"
method="post">
<%
String signupMessage = (String) request.getAttribute("signupMessage");

if (signupMessage != null && !signupMessage.isEmpty()) {
%>
<div
class="p-4 rounded-xl bg-red-50 text-red-600 text-sm font-semibold">
<%=signupMessage%>
</div>
<%
}
%>
<!-- SECTION 01: 기본 정보 -->
<section class="flex flex-col gap-6">
    <div class="flex items-center gap-3">
        <span
        class="w-7 h-7 rounded-lg bg-surface-container text-secondary flex items-center justify-center font-metric-val text-metric-val font-bold">01</span>
    <h2
    class="font-headline-md text-headline-md text-primary-container">기본
    정보</h2>
</div>
<div class="grid grid-cols-1 gap-5">
<!-- ID Field -->
    <div class="flex flex-col gap-2">
        <label
        class="font-body-sm text-body-sm font-semibold text-on-surface"
        for="userId"> 아이디 <span class="text-error">*</span>
    </label>
    <div class="flex flex-col sm:flex-row gap-2">
        <div class="relative flex-1">
            <span class="material-symbols-outlined absolute left-3.5 top-1/2 -translate-y-1/2 text-outline text-[20px] pointer-events-none">person</span>
            <input
            class="w-full h-12 pl-11 pr-4 bg-surface-container-low rounded-lg text-on-surface font-body-md text-body-md placeholder:text-outline focus:outline-none focus:bg-surface-container-lowest focus:shadow-[0_0_0_2px_#1c4fd7] transition-all"
            id="userId" name="loginId" maxlength="20"
            value="<%=request.getAttribute("loginId") != null ? request.getAttribute("loginId") : ""%>"
            placeholder="영문 소문자, 숫자 조합 6~20자" type="text" />
        </div>
        <button
        class="h-12 px-5 bg-surface-container text-primary-container font-body-md text-body-md font-semibold rounded-lg hover:bg-surface-container-high transition-colors whitespace-nowrap flex items-center justify-center gap-1.5"
        id="checkLoginIdBtn" type="button">
        <span>중복확인</span>
    </button>
</div>
<div class="flex items-center gap-1.5 text-secondary text-xs">
    <span id="loginIdCheckIcon" style="display: none;"
    class="material-symbols-outlined text-[16px]">check_circle</span>
<span id="loginIdMessage" class="font-body-sm text-body-sm">
</span>
</div>
</div>
<!-- Password Field -->
<div class="flex flex-col gap-2">
    <label
    class="font-body-sm text-body-sm font-semibold text-on-surface"
    for="userPw"> 비밀번호 <span class="text-error">*</span>
</label>
<div class="relative">
    <span
    class="material-symbols-outlined absolute left-3.5 top-1/2 -translate-y-1/2 text-outline text-[20px] pointer-events-none">lock</span>
<input
class="w-full h-12 pl-11 pr-11 bg-surface-container-low rounded-lg text-on-surface font-body-md text-body-md placeholder:text-outline focus:outline-none focus:bg-surface-container-lowest focus:shadow-[0_0_0_2px_#1c4fd7] transition-all"
id="userPw" name="password"
placeholder="영문, 숫자, 특수문자 조합 8자 이상" type="password"
maxlength="50" />
<button
class="absolute right-3.5 top-1/2 -translate-y-1/2 text-outline hover:text-on-surface transition-colors"
onclick="const p = document.getElementById('userPw'); p.type = p.type === 'password' ? 'text' : 'password'; this.firstElementChild.textContent = p.type === 'password' ? 'visibility' : 'visibility_off';"
type="button">
<span class="material-symbols-outlined text-[20px]">visibility</span>
</button>
</div>
<!-- Password Strength Meter -->
<div class="flex flex-col gap-1.5 pt-1">
    <div class="flex gap-1.5 w-full h-1.5">
        <div id="passwordStrength1" class="flex-1 bg-surface-container-high rounded-full">
        </div>
        <div id="passwordStrength2" class="flex-1 bg-surface-container-high rounded-full">
        </div>
        <div id="passwordStrength3" class="flex-1 bg-surface-container-high rounded-full">
        </div>
    </div>
    <div class="flex items-center justify-between text-xs">
        <span id="passwordMessage"
        class="font-body-sm text-body-sm text-secondary font-semibold">보안 단계 표시</span>
    <span class="font-code-inline text-code-inline text-outline">8+
        chars / Mixed</span>
</div>
</div>
</div>
<!-- Confirm Password Field -->
<div class="flex flex-col gap-2">
    <label
    class="font-body-sm text-body-sm font-semibold text-on-surface"
    for="userPwConfirm"> 비밀번호 확인 <span class="text-error">*</span>
</label>
<div class="relative">
    <span
    class="material-symbols-outlined absolute left-3.5 top-1/2 -translate-y-1/2 text-outline text-[20px] pointer-events-none">lock_clock</span>
<input
class="w-full h-12 pl-11 pr-11 bg-surface-container-low rounded-lg text-on-surface font-body-md text-body-md placeholder:text-outline focus:outline-none focus:bg-surface-container-lowest focus:shadow-[0_0_0_2px_#1c4fd7] transition-all"
id="userPwConfirm" name="passwordConfirm" maxlength="50"
placeholder="비밀번호를 재입력하세요" type="password" />
<span id="passwordConfirmCheckIcon" class="material-symbols-outlined absolute right-3.5 top-1/2 -translate-y-1/2 text-secondary text-[20px]" style="display: none;">check</span>
</div>
<div class="flex items-center gap-1.5 text-secondary text-xs">
    <span class="material-symbols-outlined text-[16px]"
    style="display: none;">check_circle</span>
<span
id="passwordConfirmMessage" class="font-body-sm text-body-sm">
</span>
</div>
</div>
<!-- Name & Mobile Grid -->
<div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
<!-- Name -->
    <div class="flex flex-col gap-2">
        <label
        class="font-body-sm text-body-sm font-semibold text-on-surface"
        for="userName"> 담당자 성명 <span class="text-error">*</span>
    </label>
    <div class="relative">
        <span
        class="material-symbols-outlined absolute left-3.5 top-1/2 -translate-y-1/2 text-outline text-[20px] pointer-events-none">badge</span>
    <input
    class="w-full h-12 pl-11 pr-4 bg-surface-container-low rounded-lg text-on-surface font-body-md text-body-md placeholder:text-outline focus:outline-none focus:bg-surface-container-lowest focus:shadow-[0_0_0_2px_#1c4fd7] transition-all"
    id="userName" name="name" maxlength="50"
    value="<%=request.getAttribute("name") != null ? request.getAttribute("name") : ""%>"
    placeholder="홍길동" type="text" />
</div>
</div>
<!-- Mobile Phone -->
<div class="flex flex-col gap-2">
    <label
    class="font-body-sm text-body-sm font-semibold text-on-surface"
    for="userPhone"> 휴대폰 번호 <span class="text-error">*</span>
</label>
<div class="relative">
    <span
    class="material-symbols-outlined absolute left-3.5 top-1/2 -translate-y-1/2 text-outline text-[20px] pointer-events-none">smartphone</span>
<input
class="w-full h-12 pl-11 pr-4 bg-surface-container-low rounded-lg text-on-surface font-body-md text-body-md placeholder:text-outline focus:outline-none focus:bg-surface-container-lowest focus:shadow-[0_0_0_2px_#1c4fd7] transition-all font-code-inline text-code-inline"
id="userPhone" name="phone" maxlength="30"
value="<%=request.getAttribute("phone") != null ? request.getAttribute("phone") : ""%>"
placeholder="010-0000-0000" type="tel" />
</div>
</div>
</div>
<!-- Corporate Email -->
<div class="flex flex-col gap-2">
    <label
    class="font-body-sm text-body-sm font-semibold text-on-surface"
    for="userEmail"> 기업 이메일 <span class="text-error">*</span>
</label>
<div class="flex flex-col sm:flex-row gap-2">
    <div class="relative flex-1">
        <span
        class="material-symbols-outlined absolute left-3.5 top-1/2 -translate-y-1/2 text-outline text-[20px] pointer-events-none">
        mail </span>
    <input
    class="w-full h-12 pl-11 pr-4 bg-surface-container-low rounded-lg text-on-surface font-body-md text-body-md placeholder:text-outline focus:outline-none focus:bg-surface-container-lowest focus:shadow-[0_0_0_2px_#1c4fd7] transition-all"
    id="userEmail" name="email" maxlength="150"
    value="<%=request.getAttribute("email") != null ? request.getAttribute("email") : ""%>"
    placeholder="name@company.com" type="email" />
</div>
<button
class="h-12 px-5 bg-surface-container text-primary-container font-body-md text-body-md font-semibold rounded-lg hover:bg-surface-container-high transition-colors whitespace-nowrap flex items-center justify-center gap-1.5"
id="checkEmailBtn" type="button">
<span>중복확인</span>
</button>
</div>
<p
class="font-body-sm text-body-sm text-on-surface-variant flex items-center gap-1.5">
<span id="emailMessage">
</span>
</p>
<p
class="font-body-sm text-body-sm text-on-surface-variant flex items-center gap-1.5">
<span
class="material-symbols-outlined text-[16px] text-outline">info</span>
<span>업무용 기업 이메일을 입력해주세요. (보안 승인 메일이 발송됩니다)</span>
</p>
</div>
</section>
<!-- SECTION 02: 사업장 / 주소 -->
<section class="flex flex-col gap-6">
    <div class="flex items-center gap-3">
        <span
        class="w-7 h-7 rounded-lg bg-surface-container text-secondary flex items-center justify-center font-metric-val text-metric-val font-bold">02</span>
    <h2
    class="font-headline-md text-headline-md text-primary-container">사업장
    / 주소</h2>
</div>
<div class="flex flex-col gap-4">
<!-- Postal Code -->
    <div class="flex flex-col gap-2">
        <label
        class="font-body-sm text-body-sm font-semibold text-on-surface"
        for="postalCode"> 우편번호 </label>
    <div class="flex gap-2">
        <input
        class="w-36 h-12 px-4 bg-surface-container-high rounded-lg text-on-surface font-code-inline text-code-inline font-medium cursor-default focus:outline-none"
        id="postalCode" name="postcode" maxlength="10"
        value="<%=request.getAttribute("postcode") != null ? request.getAttribute("postcode") : ""%>"
        readonly="" type="text" />
        <button id="searchPostcodeBtn"
        class="h-12 px-5 bg-surface-container text-primary-container font-body-md text-body-md font-semibold rounded-lg hover:bg-surface-container-high transition-colors whitespace-nowrap flex items-center justify-center gap-1.5"
        type="button">
        <span class="material-symbols-outlined text-[18px]">search</span>
        <span>우편번호 검색</span>
    </button>
</div>
</div>
<!-- Street Address -->
<div class="flex flex-col gap-2">
    <label
    class="font-body-sm text-body-sm font-semibold text-on-surface"
    for="addressMain"> 기본 주소 </label>
<input
class="w-full h-12 px-4 bg-surface-container-high rounded-lg text-on-surface font-body-md text-body-md cursor-default focus:outline-none"
id="addressMain" name="address" maxlength="255"
value="<%=request.getAttribute("address") != null ? request.getAttribute("address") : ""%>"
readonly="" type="text" />
</div>
<!-- Detailed Address -->
<div class="flex flex-col gap-2">
    <label
    class="font-body-sm text-body-sm font-semibold text-on-surface"
    for="addressDetail"> 상세 주소 </label>
<input
class="w-full h-12 px-4 bg-surface-container-low rounded-lg text-on-surface font-body-md text-body-md placeholder:text-outline focus:outline-none focus:bg-surface-container-lowest focus:shadow-[0_0_0_2px_#1c4fd7] transition-all"
id="addressDetail" name="addressDetail" maxlength="255"
value="<%=request.getAttribute("addressDetail") != null ? request.getAttribute("addressDetail") : ""%>"
placeholder="상세 주소 및 건물 동/호수를 입력하세요 (예: 아셈타워 28층)" type="text"
disabled />
</div>
</div>
</section>
<!-- SECTION 03: 약관 동의 -->
<section class="flex flex-col gap-6">
    <div class="flex items-center gap-3">
        <span
        class="w-7 h-7 rounded-lg bg-surface-container text-secondary flex items-center justify-center font-metric-val text-metric-val font-bold">03</span>
    <h2
    class="font-headline-md text-headline-md text-primary-container">약관
    동의</h2>
</div>
<div class="flex flex-col gap-3">
<!-- Master Checkbox Card -->
    <label
    class="bg-surface-container-low hover:bg-surface-container p-4 rounded-xl flex items-center gap-3.5 cursor-pointer transition-colors">
    <input class="w-5 h-5 rounded text-secondary accent-secondary cursor-pointer" id="checkAll"
    onchange="const c = this.checked; document.querySelectorAll('.sub-check').forEach(i =&gt; i.checked = c);" type="checkbox" />
    <div class="flex flex-col">
        <span
        class="font-body-md text-body-md font-bold text-primary-container">전체
        동의</span>
    <span
    class="font-body-sm text-body-sm text-on-surface-variant">모든
    필수 약관 및 선택 수신 항목에 동의합니다.</span>
</div>
</label>
<!-- Sub Checkboxes -->
<div class="flex flex-col gap-2.5 px-2 pt-1">
<!-- Terms 1 -->
    <div class="flex items-center justify-between py-1.5">
        <label class="flex items-center gap-3 cursor-pointer">
            <input class="sub-check w-4 h-4 rounded text-secondary accent-secondary cursor-pointer" required="" name="termsService" value="Y" type="checkbox" />
            <span class="font-body-sm text-body-sm text-on-surface">
                <span class="font-semibold text-secondary">[필수]</span>
                NEXORA 엔터프라이즈 이용약관 동의
            </span>
        </label>
        <a
        class="text-xs text-outline hover:text-secondary font-body-sm underline transition-colors whitespace-nowrap"
        href="<%=request.getContextPath()%>/legal/terms-service.jsp"
        target="_blank" rel="noopener noreferrer">전문보기 &gt;</a>
</div>
<!-- Terms 2 -->
<div class="flex items-center justify-between py-1.5">
    <label class="flex items-center gap-3 cursor-pointer">
        <input class="sub-check w-4 h-4 rounded text-secondary accent-secondary cursor-pointer" name="termsPrivacy" value="Y" required="" type="checkbox" />
        <span class="font-body-sm text-body-sm text-on-surface">
            <span class="font-semibold text-secondary">[필수]</span>
            개인정보 수집 및 이용 동의
        </span>
    </label>
    <a
    class="text-xs text-outline hover:text-secondary font-body-sm underline transition-colors whitespace-nowrap"
    href="<%=request.getContextPath()%>/legal/privacy-consent.jsp"
    target="_blank" rel="noopener noreferrer">전문보기 &gt;</a>
</div>
<!-- Terms 3 -->
<div class="flex items-center justify-between py-1.5">
    <label class="flex items-center gap-3 cursor-pointer">
        <input
        class="sub-check w-4 h-4 rounded text-secondary accent-secondary cursor-pointer"
        name="termsMarketing" value="Y" type="checkbox" />
        <span class="font-body-sm text-body-sm text-on-surface">
            <span class="text-outline-variant font-medium">[선택]</span> 기술 백서, 보안 인텔리전스 세미나 및 제품 뉴스 수신 동의
        </span>
    </label>
    <a
    class="text-xs text-outline hover:text-secondary font-body-sm underline transition-colors whitespace-nowrap"
    href="<%=request.getContextPath()%>/legal/marketing-consent.jsp"
    target="_blank" rel="noopener noreferrer">전문보기 &gt;</a>
</div>
</div>
</div>
</section>
<!-- SECTION 04: Action Buttons -->
<div class="flex flex-col-reverse sm:flex-row gap-3 pt-4">
    <button
    class="sm:w-1/3 h-12 rounded-xl bg-surface-container hover:bg-surface-container-high text-on-surface font-semibold font-body-md text-body-md transition-colors flex items-center justify-center"
    type="button" onclick="location.href='<%=request.getContextPath()%>/member/login.do'">
    취소
</button>
<button class="sm:w-2/3 h-12 rounded-xl bg-secondary hover:bg-secondary-container text-on-secondary font-semibold font-body-md text-body-md transition-all shadow-sm hover:shadow flex items-center justify-center gap-2" type="submit">
    <span class="material-symbols-outlined text-[20px]">person_add</span>
    <span>회원가입 완료</span>
</button>
</div>
</form>
<!-- Bottom Compliance & Security Notice -->
<div
class="mt-10 pt-6 flex items-start gap-3 text-on-surface-variant bg-surface-container-low/60 rounded-xl p-4">
<span
class="material-symbols-outlined text-secondary text-[20px] shrink-0 mt-0.5">lock</span>
<p class="font-body-sm text-body-sm leading-relaxed text-outline">
    NEXORA는 기업 고객의 소중한 정보를 256-bit SSL 암호화 및 정보보호 관리체계(ISMS-P) 표준 기준에
    따라 안전하게 보호하고 있으며, 법령에 정한 목적 외로 무단 수집·활용하지 않습니다.</p>
</div>
</div>
</div>
</div>
</main>
<jsp:include page="/inc/bottom.jsp" />

<script
src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

    let loginIdChecked = false;
    let emailChecked = false;

    const checkLoginIdBtn = document.getElementById("checkLoginIdBtn");
    const userIdInput = document.getElementById("userId");
    const loginIdMessage = document.getElementById("loginIdMessage");
    const loginIdCheckIcon = document.getElementById("loginIdCheckIcon");
    const signupForm = document.getElementById("signupForm");
    const userPwInput = document.getElementById("userPw");
    const passwordMessage = document.getElementById("passwordMessage");
    const passwordStrength1 = document.getElementById("passwordStrength1");
    const passwordStrength2 = document.getElementById("passwordStrength2");
    const passwordStrength3 = document.getElementById("passwordStrength3");
    const userPwConfirmInput = document.getElementById("userPwConfirm");
    const passwordConfirmMessage = document.getElementById("passwordConfirmMessage");
    const passwordConfirmCheckIcon = document.getElementById("passwordConfirmCheckIcon");
    const userPhoneInput = document.getElementById("userPhone");
    const userEmailInput = document.getElementById("userEmail");
    const emailMessage = document.getElementById("emailMessage");
    const checkEmailBtn = document.getElementById("checkEmailBtn");
    const searchPostcodeBtn = document.getElementById("searchPostcodeBtn");
    const postalCodeInput = document.getElementById("postalCode");
    const addressMainInput = document.getElementById("addressMain");
    const addressDetailInput = document.getElementById("addressDetail");
    const userNameInput = document.getElementById("userName");
    const checkAll = document.getElementById("checkAll");
    const subChecks = document.querySelectorAll(".sub-check");

    subChecks.forEach(function(check) {

    check.addEventListener("change", function() {

    let allChecked = true;

    subChecks.forEach(function(item) {

    if(!item.checked) {
    allChecked = false;
    }
    });

    checkAll.checked = allChecked;
    });
    });

    userNameInput.addEventListener("blur", function() {

    userNameInput.value = userNameInput.value.trim();
    });

    if(postalCodeInput.value.trim() !== "" && addressMainInput.value.trim() !== "") {

    addressDetailInput.disabled = false;
    }

    userIdInput.addEventListener("input", function() {

    let loginId = userIdInput.value.toLowerCase();

    loginId = loginId.replace(/[^a-z0-9]/g, "");

    if(loginId.length > 20) {
    loginId = loginId.substring(0, 20);
    }

    userIdInput.value = loginId;

    loginIdChecked = false;
    loginIdMessage.textContent = "";
    loginIdCheckIcon.style.display = "none";
    });

    checkLoginIdBtn.addEventListener("click", function() {

    loginIdChecked = false;

    const loginId = userIdInput.value.trim();

    fetch("<%=request.getContextPath()%>/member/checkLoginId.do?loginId="
    + encodeURIComponent(loginId))
    .then(function(response) {

    return response.text();
    })
    .then(function(result) {

    result = result.trim();

    if(result === "EMPTY") {

    loginIdMessage.textContent = "아이디를 입력해주세요.";
    loginIdMessage.style.color = "red";
    loginIdCheckIcon.style.display = "none";

    } else if(result === "INVALID") {

    loginIdMessage.textContent = "아이디는 영문 소문자와 숫자를 조합하여 6~20자로 입력해주세요.";
    loginIdMessage.style.color = "red";
    loginIdCheckIcon.style.display = "none";

    } else if(result === "DUPLICATE") {

    loginIdMessage.textContent = "이미 사용 중인 아이디입니다.";
    loginIdMessage.style.color = "red";
    loginIdCheckIcon.style.display = "none";

    } else if(result === "AVAILABLE") {

    loginIdChecked = true;
    loginIdMessage.textContent = "사용 가능한 아이디입니다.";
    loginIdMessage.style.color = "";
    loginIdCheckIcon.style.display = "";

    } else {

    loginIdMessage.textContent = "아이디 중복 확인 중 오류가 발생했습니다.";
    loginIdMessage.style.color = "red";
    loginIdCheckIcon.style.display = "none";
    }
    })
    .catch(function(error) {

    console.error(error);
    alert("아이디 중복 확인 중 오류가 발생했습니다.");
    });
    });

    signupForm.addEventListener("submit", function(event) {

    if(!loginIdChecked) {

    event.preventDefault();

    loginIdMessage.textContent = "아이디 중복확인을 해주세요.";
    loginIdMessage.style.color = "red";
    loginIdCheckIcon.style.display = "none";

    userIdInput.focus();

    return;
    }

    if(!emailChecked) {

    event.preventDefault();

    emailMessage.textContent = "이메일 중복확인을 해주세요.";
    emailMessage.style.color = "red";

    userEmailInput.focus();

    return;
    }
    });

    userPwInput.addEventListener("input", function() {

    const password = userPwInput.value;

    const hasLetter = /[A-Za-z]/.test(password);
    const hasNumber = /\d/.test(password);
    const hasSpecial = /[^A-Za-z0-9]/.test(password);
    const hasLength = password.length >= 8;

    let strength = 0;

    if(hasLetter) {
    strength++;
    }

    if(hasNumber) {
    strength++;
    }

    if(hasSpecial) {
    strength++;
    }

    if(hasLength) {
    strength++;
    }

    passwordStrength1.classList.remove("bg-secondary");
    passwordStrength2.classList.remove("bg-secondary");
    passwordStrength3.classList.remove("bg-secondary");

    passwordStrength1.classList.add("bg-surface-container-high");
    passwordStrength2.classList.add("bg-surface-container-high");
    passwordStrength3.classList.add("bg-surface-container-high");

    if(strength >= 1) {
    passwordStrength1.classList.remove("bg-surface-container-high");
    passwordStrength1.classList.add("bg-secondary");
    }

    if(strength >= 3) {
    passwordStrength2.classList.remove("bg-surface-container-high");
    passwordStrength2.classList.add("bg-secondary");
    }

    if(strength === 4) {
    passwordStrength3.classList.remove("bg-surface-container-high");
    passwordStrength3.classList.add("bg-secondary");
    }

    if(password.length === 0) {

    passwordMessage.textContent = "";
    passwordMessage.style.color = "";

    } else if(hasLetter && hasNumber && hasSpecial && hasLength) {

    passwordMessage.textContent = "안전 (보안 기준을 충족합니다)";
    passwordMessage.style.color = "";

    } else {

    passwordMessage.textContent = "영문, 숫자, 특수문자를 포함하여 8자 이상 입력해주세요.";
    passwordMessage.style.color = "red";
    }
    });

    userPwInput.addEventListener("input", function() {

    const password = userPwInput.value;
    const passwordConfirm = userPwConfirmInput.value;

    if(passwordConfirm.length === 0) {

    passwordConfirmMessage.textContent = "";
    passwordConfirmMessage.style.color = "";
    passwordConfirmCheckIcon.style.display = "none";

    } else if(password === passwordConfirm) {

    passwordConfirmMessage.textContent = "비밀번호가 일치합니다.";
    passwordConfirmMessage.style.color = "";
    passwordConfirmCheckIcon.style.display = "";

    } else {

    passwordConfirmMessage.textContent = "비밀번호가 일치하지 않습니다.";
    passwordConfirmMessage.style.color = "red";
    passwordConfirmCheckIcon.style.display = "none";
    }
    });

    userPwConfirmInput.addEventListener("input", function() {

    const password = userPwInput.value;
    const passwordConfirm = userPwConfirmInput.value;

    if(passwordConfirm.length === 0) {

    passwordConfirmMessage.textContent = "";
    passwordConfirmMessage.style.color = "";
    passwordConfirmCheckIcon.style.display = "none";

    } else if(userPwInput.value === passwordConfirm) {

    passwordConfirmMessage.textContent = "비밀번호가 일치합니다.";
    passwordConfirmMessage.style.color = "";
    passwordConfirmCheckIcon.style.display = "";

    } else {

    passwordConfirmMessage.textContent = "비밀번호가 일치하지 않습니다.";
    passwordConfirmMessage.style.color = "red";
    passwordConfirmCheckIcon.style.display = "none";
    }
    });

    userPhoneInput.addEventListener("input", function() {

    let phone = userPhoneInput.value.replace(/[^0-9]/g, "");

    if(phone.length > 11) {
    phone = phone.substring(0, 11);
    }

    if(phone.length <= 3) {

    userPhoneInput.value = phone;

    } else if(phone.length <= 7) {

    userPhoneInput.value =
    phone.substring(0, 3)
    + "-"
    + phone.substring(3);

    } else {

    userPhoneInput.value =
    phone.substring(0, 3)
    + "-"
    + phone.substring(3, 7)
    + "-"
    + phone.substring(7);
    }
    });

    userEmailInput.addEventListener("input", function() {

    emailChecked = false;

    const email = userEmailInput.value.trim();
    const emailPattern = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;

    if(email.length === 0) {

    emailMessage.textContent = "";
    emailMessage.style.color = "";

    } else if(emailPattern.test(email)) {

    emailMessage.textContent = "올바른 이메일 형식입니다.";
    emailMessage.style.color = "#1d4ed8";

    } else {

    emailMessage.textContent = "올바른 이메일 형식으로 입력해주세요.";
    emailMessage.style.color = "red";
    }
    });

    checkEmailBtn.addEventListener("click", function() {

    emailChecked = false;

    const email = userEmailInput.value.trim();

    fetch("<%=request.getContextPath()%>/member/checkEmail.do?email="
    + encodeURIComponent(email))
    .then(function(response) {

    return response.text();
    })
    .then(function(result) {

    result = result.trim();

    if(result === "EMPTY") {

    emailMessage.textContent = "이메일을 입력해주세요.";
    emailMessage.style.color = "red";

    } else if(result === "INVALID") {

    emailMessage.textContent = "올바른 이메일 형식으로 입력해주세요.";
    emailMessage.style.color = "red";

    } else if(result === "DUPLICATE") {

    emailMessage.textContent = "이미 사용 중인 이메일입니다.";
    emailMessage.style.color = "red";

    } else if(result === "AVAILABLE") {

    emailChecked = true;
    emailMessage.textContent = "사용 가능한 이메일입니다.";
    emailMessage.style.color = "1d4ed8";

    } else {

    emailMessage.textContent = "이메일 중복 확인 중 오류가 발생했습니다.";
    emailMessage.style.color = "red";
    }
    })
    .catch(function(error) {

    console.error(error);

    emailMessage.textContent = "이메일 중복 확인 중 오류가 발생했습니다.";
    emailMessage.style.color = "red";
    });
    });

    searchPostcodeBtn.addEventListener("click", function() {

    new daum.Postcode({

    oncomplete: function(data) {

    postalCodeInput.value = data.zonecode;
    addressMainInput.value = data.address;

    addressDetailInput.value = "";
    addressDetailInput.disabled = false;
    addressDetailInput.focus();
    }

    }).open();
    });

</script>

</body>
</html>
