<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="adminPageTitle" scope="request" value="대시보드"/>
<jsp:include page="/inc/admin-top.jsp"/>

<!-- Database-backed summary status -->
<div class="w-full bg-primary-container text-on-primary px-space-md py-space-xs rounded-xl shadow-sm flex items-center justify-between mb-space-lg">
<div class="flex items-center gap-space-sm min-w-0">
<span class="flex h-2.5 w-2.5 relative shrink-0">
<span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-secondary-fixed opacity-75"></span>
<span class="relative inline-flex rounded-full h-2.5 w-2.5 bg-secondary"></span>
</span>
<span class="font-label-caps text-label-caps uppercase tracking-wider text-surface-variant font-code-inline shrink-0">DB SUMMARY</span>
<div class="h-3 w-[1px] bg-outline-variant/30 hidden sm:block shrink-0"></div>
<p class="font-body-sm text-body-sm truncate text-on-primary-fixed-variant">
        회원·게시판·문의·인시던트 DB 요약을 요청 시 조회합니다.
</p>
</div>
<div class="flex items-center gap-space-xs shrink-0 font-code-inline text-code-inline text-surface-variant">
<span class="material-symbols-outlined text-[16px] text-secondary-fixed">sync_alt</span>
<span class="hidden md:inline">jdbc/jspdb</span>
<span class="px-space-xs py-0.5 rounded bg-surface-container/20 text-on-primary font-semibold">CONNECTED</span>
</div>
</div>
<!-- Operational Header Zone -->
<div class="flex flex-col md:flex-row md:items-end justify-between gap-space-md mb-space-lg">
<div>
<div class="flex items-center gap-space-xs text-secondary font-label-caps text-label-caps tracking-widest uppercase mb-1">
<span class="material-symbols-outlined text-[16px]">shield_with_heart</span>
<span>Mission-Critical Telemetry Surface</span>
</div>
<h2 class="font-headline-lg text-headline-lg text-on-surface font-bold tracking-tight">통합 관제 및 인시던트 조사 콘솔</h2>
<p class="font-body-md text-body-md text-on-surface-variant">
        NEXORA IT Solutions 인프라 전역의 이벤트 감지, 이상 징후 분석 및 실시간 장애 대응 워크스페이스입니다.
      </p>
</div>
<div class="flex items-center gap-space-sm shrink-0">
<div class="flex items-center gap-space-xs bg-surface-container-low px-space-md py-space-xs rounded-xl shadow-sm">
<span class="material-symbols-outlined text-secondary text-[18px]">update</span>
<span class="font-code-inline text-code-inline text-on-surface-variant">요청 시 DB 조회</span>
</div>
<button class="flex items-center gap-space-xs bg-primary hover:bg-secondary text-on-primary px-space-md py-space-xs rounded-xl shadow-sm transition-all duration-150" onclick="window.location.reload()">
<span class="material-symbols-outlined text-[16px]">refresh</span>
<span class="font-body-sm text-body-sm font-semibold">수동 새로고침</span>
</button>
</div>
</div>
<!-- Section 1: KPI Summary Cards (4 Cards Grid) -->
<section class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-space-md mb-space-xl">
<!-- KPI 1: 전체 회원 -->
<a aria-label="회원 목록 관리로 이동" href="${pageContext.request.contextPath}/admin/members" class="bg-surface-container-lowest p-space-md rounded-xl shadow-sm flex flex-col justify-between hover:shadow-md transition-shadow focus:outline-none focus:ring-2 focus:ring-secondary">
<div class="flex items-start justify-between mb-space-sm">
<div class="flex flex-col">
<span class="font-label-caps text-label-caps uppercase text-on-surface-variant tracking-wider font-semibold">전체 회원 (Total Members)</span>
<span class="font-headline-md text-headline-md font-metric-val text-on-surface font-bold mt-1"><c:out value="${memberCount}"/>명</span>
</div>
<div class="w-10 h-10 rounded-xl bg-surface-container-low flex items-center justify-center text-secondary">
<span class="material-symbols-outlined text-[24px]">group</span>
</div>
</div>
<div class="flex items-center gap-1 font-body-sm text-body-sm text-on-surface-variant pt-space-xs">
<span class="inline-flex items-center font-semibold text-secondary">
<span class="material-symbols-outlined text-[16px]">database</span>DB 조회
        </span>
<span class="text-outline">회원 목록 관리 →</span>
</div>
</a>
<!-- KPI 2: 신규 문의 -->
<a aria-label="문의 관리로 이동" href="${pageContext.request.contextPath}/admin/inquiry/list" class="bg-surface-container-lowest p-space-md rounded-xl shadow-sm flex flex-col justify-between hover:shadow-md transition-shadow focus:outline-none focus:ring-2 focus:ring-secondary">
<div class="flex items-start justify-between mb-space-sm">
<div class="flex flex-col">
<span class="font-label-caps text-label-caps uppercase text-on-surface-variant tracking-wider font-semibold">접수 문의 (New Inquiries)</span>
<span class="font-headline-md text-headline-md font-metric-val text-on-surface font-bold mt-1"><c:out value="${newInquiryCount}"/>건</span>
</div>
<div class="w-10 h-10 rounded-xl bg-surface-container-high flex items-center justify-center text-on-tertiary-container">
<span class="material-symbols-outlined text-[24px]">contact_support</span>
</div>
</div>
<div class="flex items-center justify-between font-body-sm text-body-sm text-on-surface-variant pt-space-xs">
<span class="text-on-surface">미처리 대기 중</span>
<span class="px-space-xs py-0.5 rounded-full bg-surface-container font-code-inline font-semibold text-secondary"><c:out value="${pendingInquiryCount}"/>건 대기 중</span>
</div>
</a>
<!-- KPI 3: OPEN Incidents -->
<a aria-label="인시던트 센터로 이동" href="${pageContext.request.contextPath}/sentinel/incidents" class="bg-surface-container-lowest p-space-md rounded-xl shadow-sm flex flex-col justify-between hover:shadow-md transition-shadow focus:outline-none focus:ring-2 focus:ring-secondary">
<div class="flex items-start justify-between mb-space-sm">
<div class="flex flex-col">
<span class="font-label-caps text-label-caps uppercase text-on-surface-variant tracking-wider font-semibold">OPEN Incidents</span>
<span class="font-headline-md text-headline-md font-metric-val text-on-surface font-bold mt-1"><c:out value="${openIncidentCount}"/>건</span>
</div>
<div class="w-10 h-10 rounded-xl bg-surface-container-highest flex items-center justify-center text-on-surface">
<span class="material-symbols-outlined text-[24px]">warning</span>
</div>
</div>
<div class="flex items-center gap-1 font-body-sm text-body-sm text-on-surface-variant pt-space-xs">
<span class="material-symbols-outlined text-[16px] text-outline">timelapse</span>
<span>현재 미해결: <strong class="font-code-inline text-on-surface"><c:out value="${openIncidentCount}"/>건</strong></span>
</div>
</a>
<!-- KPI 4: CRITICAL Incidents -->
<a aria-label="인시던트 센터의 심각 장애 현황으로 이동" href="${pageContext.request.contextPath}/sentinel/incidents" class="bg-error-container p-space-md rounded-xl shadow-sm flex flex-col justify-between hover:shadow-md transition-shadow focus:outline-none focus:ring-2 focus:ring-error">
<div class="flex items-start justify-between mb-space-sm">
<div class="flex flex-col">
<div class="flex items-center gap-1.5">
<span class="font-label-caps text-label-caps uppercase text-on-error-container tracking-wider font-bold">CRITICAL Incidents</span>
<span class="flex h-2 w-2 relative">
<span class="animate-ping absolute inline-flex h-full w-full rounded-full bg-error opacity-75"></span>
<span class="relative inline-flex rounded-full h-2 w-2 bg-error"></span>
</span>
</div>
<span class="font-headline-md text-headline-md font-metric-val text-error font-bold mt-1"><c:out value="${criticalIncidentCount}"/>건</span>
</div>
<div class="w-10 h-10 rounded-xl bg-error flex items-center justify-center text-on-error shadow-sm">
<span class="material-symbols-outlined text-[24px]">error</span>
</div>
</div>
<div class="flex items-center justify-between font-body-sm text-body-sm pt-space-xs">
<span class="font-bold text-on-error-container">즉각 대응 필요</span>
<span class="px-space-xs py-0.5 rounded-full bg-error text-on-error font-code-inline text-code-inline font-bold">HIGH PRIORITY</span>
</div>
</a>
</section>
<section class="mb-space-xl"><a class="flex items-center justify-between gap-space-md rounded-xl bg-surface-container-lowest px-space-lg py-space-md shadow-sm hover:shadow-md transition-shadow" href="${pageContext.request.contextPath}/admin/boards?category=FREE"><span class="flex items-center gap-space-sm"><span class="w-10 h-10 rounded-xl bg-surface-container-low flex items-center justify-center text-secondary"><span class="material-symbols-outlined">forum</span></span><span><strong class="block text-primary-container">게시판 관리</strong><span class="text-on-surface-variant text-body-sm">공지사항 · 자료실 · 자유게시판 게시글 확인</span></span></span><span class="font-headline-sm font-bold text-primary-container"><c:out value="${boardCount}"/>건 <span class="material-symbols-outlined align-middle">chevron_right</span></span></a></section>
<!-- Section 2: Incident Overview Analytics (2 Columns) -->
<section class="grid grid-cols-1 lg:grid-cols-12 gap-space-md mb-space-xl">
<!-- Left Chart: Daily Error Traffic Trend (7-day) -->
<div class="lg:col-span-7 bg-surface-container-lowest p-space-lg rounded-xl shadow-sm flex flex-col justify-between">
<div class="flex items-center justify-between mb-space-md">
<div>
<div class="font-label-caps text-label-caps text-secondary uppercase font-bold tracking-wider">Telemetry Telemetry Feed</div>
<h3 class="font-headline-sm text-headline-sm text-on-surface font-semibold">주간 일별 에러 트래픽 발생 추이 (7-Day)</h3>
</div>
<div class="flex items-center gap-space-xs text-on-surface-variant font-code-inline text-code-inline">
<span class="w-2.5 h-2.5 rounded-sm bg-secondary"></span>
<span>전체 인시던트 수치</span>
</div>
</div>
<div class="grid grid-cols-7 gap-2 h-48 items-end pt-4">
<c:forEach var="day" items="${dailyIncidentStats}"><div class="h-full flex flex-col items-center justify-end gap-2"><span class="font-code-inline text-code-inline text-on-surface-variant"><c:out value="${day.count}"/></span><div class="w-full max-w-10 rounded-t-md bg-secondary" style="height:<c:out value='${day.height}'/>%;"></div><span class="font-code-inline text-[10px] text-on-surface-variant"><c:out value="${day.label}"/></span></div></c:forEach>
</div>
<div class="mt-space-md p-space-sm bg-surface-container-low rounded-lg flex items-center justify-between font-body-sm text-body-sm"><span class="text-on-surface-variant">최근 7일간 DB에 저장된 인시던트 수</span><a class="font-semibold text-secondary" href="${pageContext.request.contextPath}/sentinel/incidents">인시던트 센터 보기 →</a></div>
</div>
<!-- Right Chart: Severity Distribution -->
<div class="lg:col-span-5 bg-surface-container-lowest p-space-lg rounded-xl shadow-sm flex flex-col justify-between">
<div class="flex items-center justify-between mb-space-md">
<div>
<div class="font-label-caps text-label-caps text-secondary uppercase font-bold tracking-wider">Classification Matrix</div>
<h3 class="font-headline-sm text-headline-sm text-on-surface font-semibold">인시던트 심각도 분포 (Severity)</h3>
</div>
<span class="font-label-caps text-label-caps bg-surface-container px-space-xs py-0.5 rounded text-on-surface-variant">총 <c:out value="${incidentCount}"/>건</span>
</div>
<!-- Segmented Bar Visual -->
<div class="w-full flex h-4 rounded-full overflow-hidden bg-surface-container mb-space-md shadow-inner">
<div class="bg-surface-dim hover:opacity-90 transition-opacity" style="width: ${lowIncidentPercent}%;" title="LOW: ${lowIncidentPercent}%"></div>
<div class="bg-secondary-container hover:opacity-90 transition-opacity" style="width: ${mediumIncidentPercent}%;" title="MEDIUM: ${mediumIncidentPercent}%"></div>
<div class="bg-on-tertiary-container hover:opacity-90 transition-opacity" style="width: ${highIncidentPercent}%;" title="HIGH: ${highIncidentPercent}%"></div>
<div class="bg-error hover:opacity-90 transition-opacity" style="width: ${criticalIncidentPercent}%;" title="CRITICAL: ${criticalIncidentPercent}%"></div>
</div>
<!-- Severity Badges Grid -->
<div class="grid grid-cols-2 gap-space-sm mb-space-sm">
<!-- LOW -->
<div class="p-space-sm rounded-lg bg-surface-container-low flex flex-col justify-between">
<div class="flex items-center justify-between">
<span class="px-2 py-0.5 rounded text-[11px] font-bold font-code-inline bg-surface-container text-on-surface-variant">LOW</span>
<span class="font-code-inline text-code-inline text-outline font-semibold"><c:out value="${lowIncidentPercent}"/>%</span>
</div>
<div class="mt-2 flex items-baseline gap-1">
<span class="font-headline-sm text-headline-sm font-metric-val font-bold text-on-surface"><c:out value="${lowIncidentCount}"/></span>
<span class="font-body-sm text-body-sm text-on-surface-variant">건</span>
</div>
</div>
<!-- MEDIUM -->
<div class="p-space-sm rounded-lg bg-surface-container-low flex flex-col justify-between">
<div class="flex items-center justify-between">
<span class="px-2 py-0.5 rounded text-[11px] font-bold font-code-inline bg-secondary-fixed text-on-secondary-fixed">MEDIUM</span>
<span class="font-code-inline text-code-inline text-secondary font-semibold"><c:out value="${mediumIncidentPercent}"/>%</span>
</div>
<div class="mt-2 flex items-baseline gap-1">
<span class="font-headline-sm text-headline-sm font-metric-val font-bold text-on-surface"><c:out value="${mediumIncidentCount}"/></span>
<span class="font-body-sm text-body-sm text-on-surface-variant">건</span>
</div>
</div>
<!-- HIGH -->
<div class="p-space-sm rounded-lg bg-surface-container-low flex flex-col justify-between">
<div class="flex items-center justify-between">
<span class="px-2 py-0.5 rounded text-[11px] font-bold font-code-inline bg-primary-fixed text-on-primary-fixed">HIGH</span>
<span class="font-code-inline text-code-inline text-on-primary-container font-semibold"><c:out value="${highIncidentPercent}"/>%</span>
</div>
<div class="mt-2 flex items-baseline gap-1">
<span class="font-headline-sm text-headline-sm font-metric-val font-bold text-on-surface"><c:out value="${highIncidentCount}"/></span>
<span class="font-body-sm text-body-sm text-on-surface-variant">건</span>
</div>
</div>
<!-- CRITICAL -->
<div class="p-space-sm rounded-lg bg-error-container flex flex-col justify-between">
<div class="flex items-center justify-between">
<span class="px-2 py-0.5 rounded text-[11px] font-bold font-code-inline bg-error text-on-error flex items-center gap-1">
<span class="w-1.5 h-1.5 rounded-full bg-on-error animate-ping"></span>
              CRITICAL
            </span>
<span class="font-code-inline text-code-inline text-error font-bold"><c:out value="${criticalIncidentPercent}"/>%</span>
</div>
<div class="mt-2 flex items-baseline gap-1">
<span class="font-headline-sm text-headline-sm font-metric-val font-bold text-error"><c:out value="${criticalIncidentCount}"/></span>
<span class="font-body-sm text-body-sm text-on-error-container font-semibold">건</span>
</div>
</div>
</div>
<div class="font-code-inline text-code-inline text-on-surface-variant flex items-center gap-space-xs bg-surface-container-high/40 p-2 rounded">
<span class="material-symbols-outlined text-[16px] text-secondary">verified</span>
<span>심각도 비율은 삭제되지 않은 DB 인시던트 기준으로 계산합니다.</span>
</div>
</div>
</section>
<!-- Section 3: Recent Incidents Table -->
<section class="bg-surface-container-lowest rounded-xl shadow-sm p-space-md mb-space-xl">
<div class="flex flex-col md:flex-row md:items-center justify-between gap-space-sm mb-space-md">
<div>
<div class="flex items-center gap-space-xs">
<h3 class="font-headline-sm text-headline-sm text-on-surface font-bold">최근 발생 인시던트 로그 (Recent Incidents)</h3>
<span class="px-2 py-0.5 rounded bg-surface-container font-code-inline text-code-inline text-on-surface font-semibold">Live Buffer</span>
</div>
<p class="font-body-sm text-body-sm text-on-surface-variant">실시간 수집된 트레이스 및 에러 콜백 스택 (상세 분석 버튼 클릭 시 조사 모달 활성화)</p>
</div>
<a class="font-body-sm text-secondary font-semibold" href="${pageContext.request.contextPath}/sentinel/incidents">인시던트 목록 전체 보기 →</a>
</div>
<!-- Responsive Table Container -->
<div class="w-full overflow-x-auto">
<table class="w-full text-left font-body-md text-body-md border-collapse">
<thead>
<tr class="bg-surface-container-low text-on-surface-variant font-label-caps text-label-caps uppercase tracking-wider h-10">
<th class="px-space-md rounded-l-lg">Time</th>
<th class="px-space-md">Service</th>
<th class="px-space-md">Error Definition</th>
<th class="px-space-md">Severity</th>
<th class="px-space-md">Status</th>
<th class="px-space-md text-right rounded-r-lg">Action</th>
</tr>
</thead>
<tbody class="divide-y-0">
<c:forEach var="incident" items="${recentIncidents}" begin="0" end="4"><tr class="h-14 hover:bg-surface-container-low transition-colors">
<td class="px-space-md font-code-inline text-code-inline text-on-surface-variant"><fmt:formatDate value="${incident.occurredAt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
<td class="px-space-md font-semibold text-on-surface"><c:out value="${incident.serviceName}"/></td>
<td class="px-space-md"><div class="flex flex-col"><span class="font-code-inline text-code-inline font-semibold"><c:out value="${incident.errorType}"/></span><span class="font-body-sm text-body-sm text-on-surface-variant"><c:out value="${incident.errorMessage}"/></span></div></td>
<td class="px-space-md"><span class="px-2.5 py-1 rounded-full font-code-inline text-[11px] font-bold ${incident.severity eq 'CRITICAL' ? 'bg-error text-on-error' : (incident.severity eq 'HIGH' ? 'bg-primary-fixed text-on-primary-fixed' : (incident.severity eq 'MEDIUM' ? 'bg-secondary-fixed text-on-secondary-fixed' : 'bg-surface-dim text-on-surface-variant'))}"><c:out value="${incident.severity}"/></span></td>
<td class="px-space-md"><span class="px-2.5 py-1 rounded-full font-code-inline text-[11px] font-bold bg-surface-container-high text-on-surface w-max inline-block"><c:out value="${incident.status}"/></span></td>
<td class="px-space-md text-right"><a class="px-space-sm py-1.5 rounded-lg bg-surface-container hover:bg-surface-container-high text-on-surface font-body-sm text-body-sm font-semibold inline-flex items-center gap-1" href="${pageContext.request.contextPath}/sentinel/incident?id=${incident.incidentId}">상세 보기</a></td></tr></c:forEach>
<c:if test="${empty recentIncidents}"><tr><td colspan="6" class="px-space-md py-10 text-center text-on-surface-variant">저장된 인시던트가 없습니다.</td></tr></c:if>
</tbody>
</table>
</div>
</section>
<!-- Section 4 & Section 5: Asymmetric Dual Column (Customer Support & System Health) -->
<div class="grid grid-cols-1 lg:grid-cols-12 gap-space-md mb-space-xl">
<!-- Section 4: Recent Customer Support (최근 고객 문의 연계) (7 Cols) -->
<section class="lg:col-span-7 bg-surface-container-lowest p-space-md rounded-xl shadow-sm flex flex-col justify-between">
<div>
<div class="flex items-center justify-between mb-space-sm">
<div class="flex items-center gap-space-xs">
<div class="w-8 h-8 rounded-lg bg-surface-container-high flex items-center justify-center text-secondary">
<span class="material-symbols-outlined text-[20px]">support_agent</span>
</div>
<div>
<h3 class="font-headline-sm text-headline-sm text-on-surface font-bold">최근 고객 문의 (Customer Support)</h3>
<p class="font-body-sm text-body-sm text-on-surface-variant">최근 접수된 문의와 처리 상태를 확인합니다.</p>
</div>
</div>
<a class="font-body-sm text-body-sm text-secondary font-semibold hover:underline flex items-center" href="${pageContext.request.contextPath}/admin/inquiry/list">
            전체 보기 <span class="material-symbols-outlined text-[16px]">chevron_right</span>
</a>
</div>
<div class="w-full overflow-x-auto mt-space-sm">
<table class="w-full text-left font-body-sm text-body-sm">
<thead>
<tr class="bg-surface-container-low text-on-surface-variant font-label-caps text-label-caps uppercase h-9">
<th class="px-space-sm rounded-l">문의 제목</th>
<th class="px-space-sm">작성자</th>
<th class="px-space-sm">접수 시간</th>
<th class="px-space-sm text-right rounded-r">상태</th>
</tr>
</thead>
<tbody class="divide-y-0">
<c:forEach var="item" items="${recentInquiries}">
<tr class="h-12 hover:bg-surface-container-low transition-colors">
<td class="px-space-sm py-2"><a class="font-semibold text-secondary hover:underline truncate max-w-xs block" href="${pageContext.request.contextPath}/admin/inquiry/detail?id=${item.inquiryId}"><c:out value="${item.title}"/></a></td>
<td class="px-space-sm text-on-surface-variant"><c:out value="${item.contactName}"/></td>
<td class="px-space-sm font-code-inline text-code-inline text-on-surface-variant"><fmt:formatDate value="${item.createdAt}" pattern="MM-dd HH:mm"/></td>
<td class="px-space-sm text-right"><span class="px-2 py-0.5 rounded-full bg-surface-container text-on-surface font-code-inline text-code-inline font-semibold"><c:out value="${item.status}"/></span></td>
</tr>
</c:forEach>
<c:if test="${empty recentInquiries}"><tr><td colspan="4" class="px-space-sm py-8 text-center text-on-surface-variant">접수된 문의가 없습니다.</td></tr></c:if>
</tbody>
</table>
</div>
</div>
<div class="pt-space-sm flex items-center justify-between font-label-caps text-label-caps text-on-surface-variant">
<span>답변 등록과 상태 변경은 문의 상세 화면에서 처리합니다.</span>
<span class="text-secondary font-code-inline font-bold">문의 관리 열기 →</span>
</div>
</section>
<section class="lg:col-span-5 bg-surface-container-lowest p-space-md rounded-xl shadow-sm"><div class="mb-space-md"><div class="font-label-caps text-label-caps text-secondary uppercase font-bold tracking-wider">OPERATIONS</div><h3 class="font-headline-sm text-headline-sm text-on-surface font-bold mt-1">관리자 바로가기</h3><p class="font-body-sm text-body-sm text-on-surface-variant mt-1">프로젝트에서 연결된 운영 기능을 엽니다.</p></div><div class="flex flex-col gap-2"><a class="p-space-sm rounded-lg bg-surface-container-low flex items-center justify-between text-on-surface no-underline" href="${pageContext.request.contextPath}/admin/members"><span>회원 검색 및 이용 상태</span><span class="material-symbols-outlined">chevron_right</span></a><a class="p-space-sm rounded-lg bg-surface-container-low flex items-center justify-between text-on-surface no-underline" href="${pageContext.request.contextPath}/admin/boards?category=FREE"><span>게시판 모니터링</span><span class="material-symbols-outlined">chevron_right</span></a><a class="p-space-sm rounded-lg bg-surface-container-low flex items-center justify-between text-on-surface no-underline" href="${pageContext.request.contextPath}/admin/inquiry/list"><span>고객 문의 처리</span><span class="material-symbols-outlined">chevron_right</span></a><a class="p-space-sm rounded-lg bg-surface-container-low flex items-center justify-between text-on-surface no-underline" href="${pageContext.request.contextPath}/sentinel/incidents"><span>SentinelOps 인시던트</span><span class="material-symbols-outlined">chevron_right</span></a></div></section>
</div>
<jsp:include page="/inc/admin-bottom.jsp"/>
