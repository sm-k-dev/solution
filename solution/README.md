# NEXORA Stitch JSP v4

## Fixed in v4
- Header login -> `/member/login.jsp`
- Header signup -> `/member/signup.jsp`
- Header/CTA 도입문의 -> `/inquiry/write.jsp`
- Customer Center 문의하기 -> `/inquiry/write.jsp`
- Footer internal links converted to `${pageContext.request.contextPath}` paths
- Added `inquiry/write.jsp`
- Added `legal/legal.jsp` and `legal/sitemap.jsp` so footer policy links no longer 404
- Fixed `board.jsp` JSP compilation collision caused by JavaScript template-literal `${...}` being parsed as JSP EL
- Board prototype links that require unimplemented controllers now stay inside the prototype instead of producing immediate 404s
- Fixed the same JavaScript `${...}` JSP-EL collision in `solutions.jsp`

## Important
Login submit, real board CRUD/search/download, signup processing, and inquiry persistence are backend MVC work and are not implemented by this design package. The inquiry form currently prevents submission and displays a prototype notice.

After replacing files in Eclipse, clean/restart Tomcat if `board.jsp` still shows the old compiled 500 page, because Tomcat may have cached the previously failed JSP class.

## v5 추가
- `board/write.jsp` 게시글 작성 화면 추가
- `board/board.jsp`의 두 `글쓰기` 버튼을 `/board/write.jsp`로 연결
- 작성 화면은 분류/제목/작성자/이메일/내용/첨부파일 UI 포함
- 실제 DB 등록은 아직 연결하지 않았으며 이후 Board Servlet/DAO action으로 교체 가능
