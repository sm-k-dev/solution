<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title>마케팅 정보 수신 동의 | NEXORA</title>
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
                <strong>마케팅 수신 동의</strong>
            </nav>
            <header class="legal-doc-hero">
                <span class="legal-doc-kicker">OPTIONAL · MARKETING CONSENT</span>
                <h1>기술·보안 정보 및 마케팅 수신 동의</h1>
                <p>기술 백서, 보안 인텔리전스, 웨비나와 제품 업데이트 등 선택 정보의 수신 기준을 안내합니다.</p>
                <div class="legal-doc-meta">
                    <span>시행 예정일 2026-10-07</span>
                    <span>버전 1.0</span>
                    <span>선택 동의</span>
                </div>
            </header>
            <div class="legal-doc-alert">
                <strong>선택 사항</strong>
                <span>동의하지 않아도 회원가입과 핵심 서비스 이용에는 아무런 제한이 없습니다. 서비스 장애·보안 사고 등 필수 안내는 본 동의와 관계없이 발송될 수 있습니다.</span>
            </div>
            <div class="legal-doc-layout">
                <aside class="legal-doc-nav">
                    <strong>CONTENTS</strong>
                    <a href="#content">수신 정보</a>
                    <a href="#channel">발송 채널</a>
                    <a href="#period">이용 기간</a>
                    <a href="#withdraw">철회 방법</a>
                </aside>
                <article class="legal-doc-content">
                    <section class="legal-section" id="content">
                        <h2>1. 안내하는 정보</h2>
                        <ul>
                            <li>Web·Network·AI Security 기술 백서와 보안 권고</li>
                            <li>SentinelOps 기능 업데이트, 활용 사례 및 데모 안내</li>
                            <li>온라인 세미나, 교육, 이벤트 및 구독 플랜 혜택</li>
                            <li>신규 제품과 프로모션 정보</li>
                        </ul>
                    </section>
                    <section class="legal-section" id="channel">
                        <h2>2. 수집 항목 및 발송 채널</h2>
                        <table class="legal-table">
                            <tr>
                                <th>이용 항목</th>
                                <td>담당자명, 기업 이메일, 휴대폰 번호</td>
                            </tr>
                            <tr>
                                <th>발송 채널</th>
                                <td>이메일을 기본 채널로 사용하며, 문자 발송 기능 도입 시 별도 설정을 제공합니다.</td>
                            </tr>
                            <tr>
                                <th>발송 빈도</th>
                                <td>중요 기술 업데이트 또는 캠페인 발생 시 비정기적으로 발송합니다.</td>
                            </tr>
                        </table>
                    </section>
                    <section class="legal-section" id="period">
                        <h2>3. 보유 및 이용 기간</h2>
                        <p>동의일로부터 회원 탈퇴 또는 마케팅 수신 동의 철회 시까지 이용합니다. 철회 처리 후에는 법령상 보관 의무가 없는 한 마케팅 발송 대상에서 지체 없이 제외합니다.</p>
                    </section>
                    <section class="legal-section" id="withdraw">
                        <h2>4. 동의 철회 방법</h2>
                        <p>수신 이메일의 거부 링크 또는 고객센터 문의를 통해 언제든지 동의를 철회할 수 있습니다. 철회 요청의 처리에는 시스템 반영을 위한 짧은 시간이 소요될 수 있습니다.</p>
                    </section>
                </article>
            </div>
            <div class="legal-doc-actions">
                <a class="primary" href="${pageContext.request.contextPath}/member/signup.do">회원가입으로 돌아가기</a>
                <a class="secondary" href="${pageContext.request.contextPath}/inquiry/new?category=ACCOUNT&amp;title=마케팅%20수신%20동의%20문의">동의 관련 문의</a>
            </div>
        </main>
        <jsp:include page="/inc/bottom.jsp"/>
    </body>
</html>
