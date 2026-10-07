<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<%
Integer statusValue=(Integer)request.getAttribute("javax.servlet.error.status_code");
int status=statusValue==null?500:statusValue.intValue();
String title,description,label,accent;
switch(status){
case 400:title="요청 내용을 확인해주세요";description="입력값이 올바르지 않거나 처리할 수 없는 요청입니다. 내용을 확인한 뒤 다시 시도해주세요.";label="INVALID REQUEST";accent="400";break;
case 401:title="로그인이 필요한 화면입니다";description="세션이 만료되었거나 인증되지 않은 요청입니다. 다시 로그인한 뒤 이용해주세요.";label="AUTHENTICATION REQUIRED";accent="401";break;
case 403:title="접근이 허용되지 않았습니다";description="현재 계정에는 이 화면을 이용할 권한이 없습니다. 필요한 경우 관리자에게 권한을 요청해주세요.";label="ACCESS DENIED";accent="403";break;
case 404:title="요청한 페이지를 찾지 못했습니다";description="주소가 변경되었거나 삭제된 페이지일 수 있습니다. 메뉴에서 원하는 기능을 다시 선택해주세요.";label="PAGE NOT FOUND";accent="404";break;
case 405:title="지원하지 않는 요청 방식입니다";description="현재 주소에서는 해당 요청 방식을 사용할 수 없습니다. 이전 화면으로 돌아가 다시 진행해주세요.";label="METHOD NOT ALLOWED";accent="405";break;
case 408:title="요청 시간이 초과되었습니다";description="네트워크 지연 또는 긴 처리 시간으로 요청이 종료되었습니다. 연결 상태를 확인한 뒤 다시 시도해주세요.";label="REQUEST TIMEOUT";accent="408";break;
case 429:title="잠시 후 다시 요청해주세요";description="짧은 시간에 요청이 너무 많이 발생해 시스템을 보호하고 있습니다. 잠시 기다린 뒤 다시 이용해주세요.";label="RATE LIMIT";accent="429";break;
case 502:title="연결된 서비스의 응답을 확인하고 있습니다";description="외부 또는 내부 연동 서비스에서 올바른 응답을 받지 못했습니다. 잠시 후 다시 시도해주세요.";label="BAD GATEWAY";accent="502";break;
case 503:title="서비스를 점검하고 있습니다";description="더 안정적인 서비스를 위해 잠시 점검 중입니다. 잠시 후 다시 접속해주세요.";label="MAINTENANCE";accent="503";break;
case 504:title="연결된 서비스의 응답이 지연되고 있습니다";description="연동 서비스의 응답 대기 시간이 초과되었습니다. 요청 상태를 확인한 뒤 다시 시도해주세요.";label="GATEWAY TIMEOUT";accent="504";break;
default:status=500;title="시스템을 안전하게 복구하고 있습니다";description="일시적인 오류가 감지되어 SentinelOps가 기록을 남겼습니다. 잠시 후 다시 시도해주세요.";label="SYSTEM INCIDENT";accent="500";
}
request.setAttribute("errorStatus",Integer.valueOf(status));
request.setAttribute("errorTitle",title);
request.setAttribute("errorDescription",description);
request.setAttribute("errorLabel",label);
request.setAttribute("errorAccent",accent);
String errorUri=(String)request.getAttribute("javax.servlet.error.request_uri");
if(errorUri==null)errorUri=request.getRequestURI();
request.setAttribute("errorUri",errorUri);
response.setStatus(status);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title>
            <c:out value="${errorStatus}"/> | NEXORA</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@700;800&amp;family=JetBrains+Mono:wght@500;600&amp;family=Material+Symbols+Outlined:wght@400..700&amp;display=swap">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/error.css">
    </head>
    <body>
        <div class="error-shell">
            <header class="error-header">
                <a class="error-brand" href="${pageContext.request.contextPath}/index.jsp">
                    <span class="error-brand-mark">
                        <span class="material-symbols-outlined">security</span>
                    </span>
                    <span>
                        <strong>NEXORA</strong>
                        <small>SECURITY &amp; OPERATIONS</small>
                    </span>
                </a>
                <span class="error-header-status">
                    <i>
                    </i>SentinelOps monitoring active</span>
            </header>
            <main class="error-main">
                <section class="error-card">
                    <div class="error-visual">
                        <div class="error-code">
                            <span>
                                <c:out value="${errorAccent}"/>
                            </span>
                        </div>
                        <div class="error-signal" aria-hidden="true">
                            <i style="--h:35%;--d:.1s">
                            </i>
                            <i style="--h:70%;--d:.3s">
                            </i>
                            <i style="--h:45%;--d:.5s">
                            </i>
                            <i style="--h:82%;--d:.2s">
                            </i>
                            <i style="--h:58%;--d:.4s">
                            </i>
                            <i style="--h:74%;--d:.6s">
                            </i>
                            <i style="--h:40%;--d:.2s">
                            </i>
                        </div>
                    </div>
                    <div class="error-content">
                        <div class="error-kicker">
                            <c:out value="${errorLabel}"/>
                        </div>
                        <h1>
                            <c:out value="${errorTitle}"/>
                        </h1>
                        <p>
                            <c:out value="${errorDescription}"/>
                        </p>
                        <div class="error-request">REQUEST · <c:out value="${errorUri}"/>
                        </div>
                        <div class="error-actions">
                            <a class="error-primary" href="${pageContext.request.contextPath}/index.jsp">
                                <span class="material-symbols-outlined">home</span>메인으로 이동</a>
                            <button class="error-secondary" type="button" onclick="history.length>1?history.back():location.href='${pageContext.request.contextPath}/index.jsp'">
                                <span class="material-symbols-outlined">arrow_back</span>이전 화면</button>
                        </div>
                        <div class="error-support">문제가 반복되나요? <a href="${pageContext.request.contextPath}/inquiry/new?category=TECHNICAL&amp;title=오류%20페이지%20문의">기술지원 문의하기</a>
                        </div>
                    </div>
                </section>
            </main>
        </div>
    </body>
</html>
