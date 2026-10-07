<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title>서비스 이용약관 | NEXORA</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/top.css?v=20261002-4">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/legal_document.css">
    </head>
    <body>
        <jsp:include page="/inc/top.jsp"/>
        <main class="legal-doc-main">
            <nav class="legal-doc-breadcrumb">
                <a href="${pageContext.request.contextPath}/index.jsp">홈</a>
                <span>›</span>
                <a href="${pageContext.request.contextPath}/member/signup.do">회원가입</a>
                <span>›</span>
                <strong>서비스 이용약관</strong>
            </nav>
            <header class="legal-doc-hero">
                <span class="legal-doc-kicker">REQUIRED · SERVICE TERMS</span>
                <h1>NEXORA 엔터프라이즈 서비스 이용약관</h1>
                <p>Web + Network + AI Security와 SentinelOps API를 이용하는 회원의 권리, 의무 및 서비스 운영 기준을 안내합니다.</p>
                <div class="legal-doc-meta">
                    <span>시행 예정일 2026-10-07</span>
                    <span>버전 1.0</span>
                    <span>필수 동의</span>
                </div>
            </header>
            <div class="legal-doc-alert">
                <strong>안내</strong>
                <span>본 문서는 팀 프로젝트 시연을 위한 약관 초안입니다. 실제 상용 서비스 적용 전 법률 전문가의 검토와 사업 정보 확정이 필요합니다.</span>
            </div>
            <div class="legal-doc-layout">
                <aside class="legal-doc-nav">
                    <strong>CONTENTS</strong>
                    <a href="#purpose">목적 및 정의</a>
                    <a href="#account">계정과 가입</a>
                    <a href="#service">서비스 이용</a>
                    <a href="#security">보안 의무</a>
                    <a href="#restriction">이용 제한</a>
                    <a href="#liability">책임과 분쟁</a>
                </aside>
                <article class="legal-doc-content">
                    <section class="legal-section" id="purpose">
                        <h2>제1조 목적 및 용어</h2>
                        <p>이 약관은 주식회사 넥소라 시스템즈(이하 “회사”)가 제공하는 보안 API 및 장애 대응 서비스의 이용 조건과 회사와 회원 간 권리·의무를 정하는 것을 목적으로 합니다.</p>
                        <ul>
                            <li>“회원”은 약관에 동의하고 기업 계정을 생성한 이용자를 의미합니다.</li>
                            <li>“서비스”는 Web + Network + AI Security, SentinelOps 및 이에 부수되는 대시보드·알림·기술지원 기능을 의미합니다.</li>
                            <li>“API 키”는 회원의 서비스 요청을 식별하고 권한을 검증하기 위한 인증정보를 의미합니다.</li>
                        </ul>
                    </section>
                    <section class="legal-section" id="account">
                        <h2>제2조 계정 등록 및 관리</h2>
                        <ol>
                            <li>회원은 정확하고 최신의 담당자 및 기업 정보를 제공해야 합니다.</li>
                            <li>계정과 인증정보는 제3자에게 양도하거나 공유할 수 없으며, 유출이 의심되면 즉시 회사에 알려야 합니다.</li>
                            <li>허위 정보, 타인의 정보 도용 또는 서비스 악용 목적이 확인되면 가입이 거절되거나 이용이 제한될 수 있습니다.</li>
                        </ol>
                    </section>
                    <section class="legal-section" id="service">
                        <h2>제3조 서비스 제공 및 변경</h2>
                        <p>회사는 무료 플랜과 유료 구독 플랜별로 요청량, 보관기간, 분석 기능 및 기술지원 범위를 다르게 제공할 수 있습니다. 보안 또는 운영상 긴급한 경우 사전 고지 없이 일부 기능을 제한한 뒤 사후 안내할 수 있습니다.</p>
                        <h3>서비스 데이터</h3>
                        <p>위협 탐지와 장애 분석을 위해 요청 메타데이터, 오류 정보 및 위협 징후가 수집될 수 있으며, 비밀번호·인증 토큰 등 민감정보는 전송하지 않아야 합니다.</p>
                    </section>
                    <section class="legal-section" id="security">
                        <h2>제4조 회원의 보안 의무</h2>
                        <ul>
                            <li>API 키를 공개 저장소, 클라이언트 코드 또는 게시글에 노출하지 않습니다.</li>
                            <li>탐지 결과는 보조 자료로 활용하며 실제 차단·복구 조치는 담당자가 검증합니다.</li>
                            <li>타 시스템을 무단 공격하거나 취약점을 악용하는 목적으로 서비스를 사용하지 않습니다.</li>
                        </ul>
                    </section>
                    <section class="legal-section" id="restriction">
                        <h2>제5조 이용 제한 및 해지</h2>
                        <p>법령 위반, 비정상 트래픽, 서비스 방해, 요금 미납 또는 보안 위험이 확인되면 회사는 사전 안내 후 계정을 정지할 수 있습니다. 긴급한 침해사고가 예상되는 경우에는 우선 제한한 뒤 사유와 복구 절차를 안내합니다.</p>
                    </section>
                    <section class="legal-section" id="liability">
                        <h2>제6조 책임, 준거법 및 문의</h2>
                        <p>회사는 합리적인 수준의 보안과 안정성을 유지하도록 노력하지만 모든 공격·오류의 탐지나 완전한 무중단을 보장하지 않습니다. 본 약관과 관련된 분쟁은 대한민국 법령을 따르며, 문의는 고객센터 또는 contact@nexora.co.kr로 접수할 수 있습니다.</p>
                    </section>
                </article>
            </div>
            <div class="legal-doc-actions">
                <a class="primary" href="${pageContext.request.contextPath}/member/signup.do">회원가입으로 돌아가기</a>
                <a class="secondary" href="${pageContext.request.contextPath}/legal/legal.jsp">전체 정책 보기</a>
            </div>
        </main>
        <jsp:include page="/inc/bottom.jsp"/>
    </body>
</html>
