<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="common.web.ErrorPageModel" %>
<% ErrorPageModel.populate(request, response); %>
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
                            <a class="error-primary" href="${pageContext.request.contextPath}${errorStatus eq 401 ? '/member/login.jsp' : '/index.jsp'}">
                                <span class="material-symbols-outlined">${errorStatus eq 401 ? 'login' : 'home'}</span>${errorStatus eq 401 ? '로그인' : '메인으로 이동'}</a>
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
