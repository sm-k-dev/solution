<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html><html lang="ko"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1.0"><title>사이트맵 | NEXORA</title><link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/pages/legal_sitemap.css"/></head><body class="bg-slate-50 text-slate-900"><jsp:include page="/inc/top.jsp" /><main class="max-w-[1000px] mx-auto px-4 py-12"><h1 class="text-3xl font-bold mb-8">사이트맵</h1><div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-5">
<a class="bg-white border rounded-xl p-5 hover:border-blue-500" href="${pageContext.request.contextPath}/company/company.jsp"><b>회사소개</b></a>
<a class="bg-white border rounded-xl p-5 hover:border-blue-500" href="${pageContext.request.contextPath}/solutions/solutions.jsp"><b>솔루션</b></a>
<a class="bg-white border rounded-xl p-5 hover:border-blue-500" href="${pageContext.request.contextPath}/solutions/sentinelops.jsp"><b>SentinelOps</b></a>
<a class="bg-white border rounded-xl p-5 hover:border-blue-500" href="${pageContext.request.contextPath}/customer/customer.jsp"><b>고객센터</b></a>
<a class="bg-white border rounded-xl p-5 hover:border-blue-500" href="${pageContext.request.contextPath}/board/board.jsp"><b>커뮤니티</b></a>
<a class="bg-white border rounded-xl p-5 hover:border-blue-500" href="${pageContext.request.contextPath}/customer/inquiry.jsp"><b>도입문의</b></a>
<a class="bg-white border rounded-xl p-5 hover:border-blue-500" href="${pageContext.request.contextPath}/member/login.jsp"><b>로그인</b></a>
<a class="bg-white border rounded-xl p-5 hover:border-blue-500" href="${pageContext.request.contextPath}/member/signup.jsp"><b>회원가입</b></a>
</div></main><jsp:include page="/inc/bottom.jsp" /></body></html>
