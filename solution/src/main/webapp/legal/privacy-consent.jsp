<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title>개인정보 수집 및 이용 동의 | NEXORA</title>
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
                <strong>개인정보 동의</strong>
            </nav>
            <header class="legal-doc-hero">
                <span class="legal-doc-kicker">REQUIRED · PRIVACY CONSENT</span>
                <h1>개인정보 수집 및 이용 동의</h1>
                <p>회원가입, 계정 운영, 고객지원 및 서비스 보안을 위해 처리하는 개인정보의 항목과 보유기간을 안내합니다.</p>
                <div class="legal-doc-meta">
                    <span>시행 예정일 2026-10-07</span>
                    <span>버전 1.0</span>
                    <span>필수 동의</span>
                </div>
            </header>
            <div class="legal-doc-alert">
                <strong>동의 안내</strong>
                <span>필수 항목 수집에 동의하지 않을 권리가 있으나, 동의하지 않으면 회원 계정 생성과 인증이 제한됩니다.</span>
            </div>
            <div class="legal-doc-layout">
                <aside class="legal-doc-nav">
                    <strong>CONTENTS</strong>
                    <a href="#items">수집 항목</a>
                    <a href="#purpose">이용 목적</a>
                    <a href="#retention">보유 기간</a>
                    <a href="#rights">이용자 권리</a>
                    <a href="#contact">보호책임자</a>
                </aside>
                <article class="legal-doc-content">
                    <section class="legal-section" id="items">
                        <h2>1. 수집하는 개인정보</h2>
                        <table class="legal-table">
                            <tr>
                                <th>필수 항목</th>
                                <td>로그인 아이디, 비밀번호, 담당자명, 기업 이메일, 휴대폰 번호</td>
                            </tr>
                            <tr>
                                <th>선택 항목</th>
                                <td>우편번호, 기본 주소, 상세 주소</td>
                            </tr>
                            <tr>
                                <th>자동 생성 정보</th>
                                <td>접속 일시, IP 주소, 사용자 에이전트, 서비스 이용 및 보안 이벤트 기록</td>
                            </tr>
                        </table>
                        <p>비밀번호는 PBKDF2-HMAC-SHA256 단방향 해시로 저장하여 원문을 복구할 수 없도록 처리합니다.</p>
                    </section>
                    <section class="legal-section" id="purpose">
                        <h2>2. 개인정보 이용 목적</h2>
                        <ul>
                            <li>회원 식별, 로그인 인증 및 계정 관리</li>
                            <li>보안 API와 SentinelOps 서비스 제공 및 이용량 관리</li>
                            <li>고객 문의 접수, 답변 및 장애 지원</li>
                            <li>비정상 접근과 보안 위협 탐지, 감사 기록 유지</li>
                            <li>서비스 변경, 장애 및 보안 관련 필수 안내</li>
                        </ul>
                    </section>
                    <section class="legal-section" id="retention">
                        <h2>3. 보유 및 이용 기간</h2>
                        <table class="legal-table">
                            <tr>
                                <th>회원 정보</th>
                                <td>회원 탈퇴 시까지. 단, 법령상 의무 또는 분쟁 대응이 필요한 정보는 해당 기간까지 분리 보관합니다.</td>
                            </tr>
                            <tr>
                                <th>문의 기록</th>
                                <td>접수 완료 후 3년 또는 관련 법령에서 정한 기간</td>
                            </tr>
                            <tr>
                                <th>보안·접속 기록</th>
                                <td>수집일로부터 최대 1년. 실제 운영 정책에 따라 단축될 수 있습니다.</td>
                            </tr>
                        </table>
                    </section>
                    <section class="legal-section" id="rights">
                        <h2>4. 이용자의 권리 및 행사 방법</h2>
                        <p>회원은 마이페이지에서 개인정보를 조회·수정하거나 회원 탈퇴를 신청할 수 있습니다. 추가적인 열람·정정·삭제·처리정지 요청은 고객센터를 통해 접수할 수 있으며, 본인 확인 후 처리됩니다.</p>
                    </section>
                    <section class="legal-section" id="contact">
                        <h2>5. 개인정보 관련 문의</h2>
                        <p>개인정보보호책임자: 이준호 정보보안실 이사<br>이메일: privacy@nexora.co.kr<br>고객센터: 1544-6820 (평일 09:00–18:00)</p>
                    </section>
                </article>
            </div>
            <div class="legal-doc-actions">
                <a class="primary" href="${pageContext.request.contextPath}/member/signup.do">회원가입으로 돌아가기</a>
                <a class="secondary" href="${pageContext.request.contextPath}/legal/legal.jsp#privacy">개인정보처리방침 보기</a>
            </div>
        </main>
        <jsp:include page="/inc/bottom.jsp"/>
    </body>
</html>
