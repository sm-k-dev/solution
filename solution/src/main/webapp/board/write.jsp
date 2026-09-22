<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<title>글쓰기 | NEXORA Community</title>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&family=JetBrains+Mono:wght@400;600&display=swap" rel="stylesheet"/>
<script src="https://cdn.tailwindcss.com"></script>
<script>
tailwind.config={theme:{extend:{colors:{navy:'#0d1c32',blue:'#1c4fd7',page:'#f8f9ff',line:'#d3e4fe',muted:'#5c6678'},fontFamily:{sans:['Inter','sans-serif'],mono:['JetBrains Mono','monospace']}}}};
</script>
</head>
<body class="bg-page text-navy font-sans min-h-screen">
<jsp:include page="/inc/top.jsp" />
<main class="w-full max-w-[1200px] mx-auto px-4 md:px-8 py-10">
  <nav class="flex items-center gap-2 text-sm text-muted mb-7">
    <a class="hover:text-blue flex items-center gap-1" href="${pageContext.request.contextPath}/index.jsp"><span class="material-symbols-outlined text-[17px]">home</span>홈</a>
    <span class="material-symbols-outlined text-[15px]">chevron_right</span>
    <a class="hover:text-blue" href="${pageContext.request.contextPath}/board/board.jsp">커뮤니티</a>
    <span class="material-symbols-outlined text-[15px]">chevron_right</span><strong>글쓰기</strong>
  </nav>

  <section class="mb-7 border-b border-line pb-6">
    <div class="flex items-center gap-2 mb-2"><span class="px-2 py-1 rounded bg-blue/10 text-blue text-[11px] font-bold tracking-wider">ENTERPRISE FORUM</span><span class="font-mono text-[11px] text-muted">NEW POST</span></div>
    <h1 class="text-3xl md:text-4xl font-bold tracking-tight">게시글 작성</h1>
    <p class="mt-2 text-muted">NEXORA 커뮤니티에 새로운 글을 작성합니다.</p>
  </section>

  <form id="boardWriteForm" class="bg-white border border-line rounded-xl shadow-sm overflow-hidden" action="#" method="post" enctype="multipart/form-data" onsubmit="return demoSubmit(event)">
    <div class="p-5 md:p-7 space-y-6">
      <div class="grid md:grid-cols-[220px_1fr] gap-5">
        <div><label class="block text-sm font-semibold mb-2" for="category">게시판 분류 <span class="text-red-600">*</span></label><select id="category" name="category" class="w-full rounded-lg border border-line bg-white px-3 py-3 outline-none focus:ring-2 focus:ring-blue/20 focus:border-blue"><option value="notice">공지사항</option><option value="library">자료실</option><option value="forum" selected>자유게시판</option></select></div>
        <div><label class="block text-sm font-semibold mb-2" for="subject">제목 <span class="text-red-600">*</span></label><input id="subject" name="subject" required maxlength="120" class="w-full rounded-lg border border-line px-4 py-3 outline-none focus:ring-2 focus:ring-blue/20 focus:border-blue" placeholder="게시글 제목을 입력하세요"/></div>
      </div>

      <div class="grid md:grid-cols-2 gap-5">
        <div><label class="block text-sm font-semibold mb-2" for="writer">작성자</label><input id="writer" name="writer" class="w-full rounded-lg border border-line bg-slate-50 px-4 py-3" placeholder="작성자 이름"/></div>
        <div><label class="block text-sm font-semibold mb-2" for="email">이메일</label><input type="email" id="email" name="email" class="w-full rounded-lg border border-line px-4 py-3 outline-none focus:ring-2 focus:ring-blue/20 focus:border-blue" placeholder="name@example.com"/></div>
      </div>

      <div><div class="flex items-center justify-between mb-2"><label class="text-sm font-semibold" for="content">내용 <span class="text-red-600">*</span></label><span class="text-xs text-muted">최대 5,000자</span></div><textarea id="content" name="content" required maxlength="5000" rows="14" class="w-full resize-y rounded-lg border border-line px-4 py-4 leading-7 outline-none focus:ring-2 focus:ring-blue/20 focus:border-blue" placeholder="내용을 입력하세요."></textarea></div>

      <div><label class="block text-sm font-semibold mb-2" for="file">첨부파일</label><label class="flex flex-col md:flex-row md:items-center justify-between gap-3 border border-dashed border-line rounded-xl px-5 py-5 hover:border-blue transition cursor-pointer"><span class="flex items-center gap-3"><span class="material-symbols-outlined text-blue">attach_file</span><span><strong class="block text-sm">파일 선택</strong><span class="text-xs text-muted">문서 또는 이미지 파일을 첨부할 수 있습니다.</span></span></span><span id="fileName" class="text-xs font-mono text-muted">선택된 파일 없음</span><input class="hidden" type="file" id="file" name="file" onchange="document.getElementById('fileName').textContent=this.files.length?this.files[0].name:'선택된 파일 없음'"/></label></div>
    </div>

    <div class="flex flex-col-reverse sm:flex-row sm:justify-between gap-3 px-5 md:px-7 py-5 bg-slate-50 border-t border-line">
      <a href="${pageContext.request.contextPath}/board/board.jsp" class="inline-flex justify-center items-center gap-2 px-5 py-3 rounded-lg border border-line bg-white font-semibold hover:bg-slate-100"><span class="material-symbols-outlined text-[18px]">arrow_back</span>목록으로</a>
      <div class="flex gap-3"><button type="reset" class="flex-1 sm:flex-none px-5 py-3 rounded-lg border border-line bg-white font-semibold hover:bg-slate-100">초기화</button><button type="submit" class="flex-1 sm:flex-none inline-flex justify-center items-center gap-2 px-6 py-3 rounded-lg bg-navy text-white font-semibold hover:bg-blue"><span class="material-symbols-outlined text-[18px]">edit_square</span>등록하기</button></div>
    </div>
  </form>
  <p class="mt-4 text-xs text-muted">현재는 디자인 확인용 화면입니다. 실제 등록 기능은 팀의 Board Servlet/DAO와 연결하면 됩니다.</p>
</main>
<jsp:include page="/inc/bottom.jsp" />
<script>
const params=new URLSearchParams(location.search); const cat=params.get('category'); if(cat && document.getElementById('category').querySelector('option[value="'+cat+'"]')) document.getElementById('category').value=cat;
function demoSubmit(e){e.preventDefault(); alert('화면 연결 완료: 실제 게시글 등록은 Board Servlet/DAO와 연결하면 됩니다.'); return false;}
</script>
</body></html>
