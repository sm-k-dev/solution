-- ============================================================
-- NEXORA Sample Data v4 - 10 rows per table
-- Based on: 01_schema.sql
-- Target DB: solution
--
-- 주의:
-- 1) 테스트/개발용 더미 데이터입니다.
-- 2) 각 테이블에 10건씩 추가합니다.
-- 3) 기존 데이터가 있어도 AUTO_INCREMENT PK를 직접 지정하지 않아 PK 충돌을 피합니다.
-- 4) FK는 login_id / title / error_message 등 고유한 샘플 값을 SELECT하여 연결합니다.
-- 5) 반복 실행하면 member의 UNIQUE(login_id, email) 때문에 실패합니다.
-- ============================================================

USE solution;

-- ============================================================
-- 1. MEMBER - 10
-- ============================================================
INSERT INTO member
(login_id, password_hash, name, email, phone, postcode, address, address_detail, role, status, withdrawn_at)
VALUES
('sample_admin01', 'REPLACE_WITH_REAL_HASH', '김관리', 'sample_admin01@nexora.local', '010-1000-0001', '06236', '서울특별시 강남구 테헤란로 1', '101호', 'ADMIN', 'ACTIVE', NULL),
('sample_admin02', 'REPLACE_WITH_REAL_HASH', '이관리', 'sample_admin02@nexora.local', '010-1000-0002', '04157', '서울특별시 마포구 마포대로 2', '202호', 'ADMIN', 'ACTIVE', NULL),
('sample_user01',  'REPLACE_WITH_REAL_HASH', '박민준', 'sample_user01@nexora.local',  '010-2000-0001', '21554', '인천광역시 남동구 인주대로 10', '301호', 'USER', 'ACTIVE', NULL),
('sample_user02',  'REPLACE_WITH_REAL_HASH', '최서연', 'sample_user02@nexora.local',  '010-2000-0002', '21998', '인천광역시 연수구 송도과학로 20', '402호', 'USER', 'ACTIVE', NULL),
('sample_user03',  'REPLACE_WITH_REAL_HASH', '정도윤', 'sample_user03@nexora.local',  '010-2000-0003', '16455', '경기도 수원시 팔달구 효원로 30', '503호', 'USER', 'ACTIVE', NULL),
('sample_user04',  'REPLACE_WITH_REAL_HASH', '한지우', 'sample_user04@nexora.local',  '010-2000-0004', '13529', '경기도 성남시 분당구 판교로 40', '604호', 'USER', 'ACTIVE', NULL),
('sample_user05',  'REPLACE_WITH_REAL_HASH', '윤하준', 'sample_user05@nexora.local',  '010-2000-0005', '34126', '대전광역시 유성구 대학로 50', '705호', 'USER', 'SUSPENDED', NULL),
('sample_user06',  'REPLACE_WITH_REAL_HASH', '송예린', 'sample_user06@nexora.local',  '010-2000-0006', '48058', '부산광역시 해운대구 센텀로 60', '806호', 'USER', 'ACTIVE', NULL),
('sample_user07',  'REPLACE_WITH_REAL_HASH', '임시우', 'sample_user07@nexora.local',  '010-2000-0007', '41911', '대구광역시 중구 국채보상로 70', '907호', 'USER', 'ACTIVE', NULL),
('sample_user08',  'REPLACE_WITH_REAL_HASH', '강나은', 'sample_user08@nexora.local',  '010-2000-0008', '61945', '광주광역시 서구 상무대로 80', '1008호', 'USER', 'WITHDRAWN', '2026-09-15 10:00:00');

-- ============================================================
-- 2. BOARD - 10
-- ============================================================
INSERT INTO board
(member_id, category, title, content, tags, view_count, is_deleted, deleted_at)
SELECT member_id, 'NOTICE', '[SAMPLE-01] NEXORA 서비스 점검 안내',
       '정기 점검 일정 안내를 위한 샘플 공지입니다.', '공지,NEXORA,점검', 125, FALSE, NULL
FROM member WHERE login_id='sample_admin01';

INSERT INTO board
(member_id, category, title, content, tags, view_count, is_deleted, deleted_at)
SELECT member_id, 'NOTICE', '[SAMPLE-02] SentinelOps 기능 업데이트',
       'SentinelOps 기능 업데이트 내용을 안내합니다.', '공지,SentinelOps,업데이트', 98, FALSE, NULL
FROM member WHERE login_id='sample_admin02';

INSERT INTO board
(member_id, category, title, content, tags, view_count, is_deleted, deleted_at)
SELECT member_id, 'RESOURCE', '[SAMPLE-03] Java MVC 참고 자료',
       'Servlet/JSP MVC 학습용 참고 자료입니다.', 'Java,MVC,Servlet', 77, FALSE, NULL
FROM member WHERE login_id='sample_user01';

INSERT INTO board
(member_id, category, title, content, tags, view_count, is_deleted, deleted_at)
SELECT member_id, 'RESOURCE', '[SAMPLE-04] MySQL JOIN 정리',
       '프로젝트에서 자주 사용하는 JOIN 예시를 정리했습니다.', 'MySQL,JOIN,DB', 61, FALSE, NULL
FROM member WHERE login_id='sample_user02';

INSERT INTO board
(member_id, category, title, content, tags, view_count, is_deleted, deleted_at)
SELECT member_id, 'FREE', '[SAMPLE-05] SentinelOps 사용 후기',
       'SentinelOps 화면을 테스트한 후기입니다.', 'SentinelOps,후기', 42, FALSE, NULL
FROM member WHERE login_id='sample_user03';

INSERT INTO board
(member_id, category, title, content, tags, view_count, is_deleted, deleted_at)
SELECT member_id, 'FREE', '[SAMPLE-06] 로그인 오류 질문',
       '로그인 중 오류가 발생하여 질문드립니다.', '로그인,오류,질문', 35, FALSE, NULL
FROM member WHERE login_id='sample_user04';

INSERT INTO board
(member_id, category, title, content, tags, view_count, is_deleted, deleted_at)
SELECT member_id, 'FREE', '[SAMPLE-07] 파일 업로드 테스트',
       '게시판 다중 파일 업로드 테스트용 게시글입니다.', '파일,업로드,테스트', 29, FALSE, NULL
FROM member WHERE login_id='sample_user05';

INSERT INTO board
(member_id, category, title, content, tags, view_count, is_deleted, deleted_at)
SELECT member_id, 'RESOURCE', '[SAMPLE-08] Git 협업 명령어 정리',
       '팀 프로젝트에서 사용하는 기본 Git 명령어입니다.', 'Git,GitHub,협업', 88, FALSE, NULL
FROM member WHERE login_id='sample_user06';

INSERT INTO board
(member_id, category, title, content, tags, view_count, is_deleted, deleted_at)
SELECT member_id, 'FREE', '[SAMPLE-09] 자유게시판 인사',
       'NEXORA 자유게시판 테스트 게시글입니다.', '자유,인사', 12, FALSE, NULL
FROM member WHERE login_id='sample_user07';

INSERT INTO board
(member_id, category, title, content, tags, view_count, is_deleted, deleted_at)
SELECT member_id, 'FREE', '[SAMPLE-10] 삭제된 게시글 테스트',
       'Soft Delete 조회 제외 테스트를 위한 게시글입니다.', '삭제,테스트', 3, TRUE, '2026-09-20 15:30:00'
FROM member WHERE login_id='sample_user08';

-- ============================================================
-- 3. BOARD_COMMENT - 10
-- 일반 댓글 7 + 답글 3
-- ============================================================
INSERT INTO board_comment (board_id, member_id, parent_comment_id, content, is_deleted, deleted_at)
SELECT b.board_id, m.member_id, NULL, '점검 일정 확인했습니다.', FALSE, NULL
FROM board b JOIN member m ON m.login_id='sample_user01'
WHERE b.title='[SAMPLE-01] NEXORA 서비스 점검 안내';

INSERT INTO board_comment (board_id, member_id, parent_comment_id, content, is_deleted, deleted_at)
SELECT b.board_id, m.member_id, NULL, '업데이트 내용이 기대됩니다.', FALSE, NULL
FROM board b JOIN member m ON m.login_id='sample_user02'
WHERE b.title='[SAMPLE-02] SentinelOps 기능 업데이트';

INSERT INTO board_comment (board_id, member_id, parent_comment_id, content, is_deleted, deleted_at)
SELECT b.board_id, m.member_id, NULL, 'MVC 공부에 참고하겠습니다.', FALSE, NULL
FROM board b JOIN member m ON m.login_id='sample_user03'
WHERE b.title='[SAMPLE-03] Java MVC 참고 자료';

INSERT INTO board_comment (board_id, member_id, parent_comment_id, content, is_deleted, deleted_at)
SELECT b.board_id, m.member_id, NULL, 'JOIN 예제가 이해하기 좋네요.', FALSE, NULL
FROM board b JOIN member m ON m.login_id='sample_user04'
WHERE b.title='[SAMPLE-04] MySQL JOIN 정리';

INSERT INTO board_comment (board_id, member_id, parent_comment_id, content, is_deleted, deleted_at)
SELECT b.board_id, m.member_id, NULL, '저도 SentinelOps 기능을 테스트해봤습니다.', FALSE, NULL
FROM board b JOIN member m ON m.login_id='sample_user05'
WHERE b.title='[SAMPLE-05] SentinelOps 사용 후기';

INSERT INTO board_comment (board_id, member_id, parent_comment_id, content, is_deleted, deleted_at)
SELECT b.board_id, m.member_id, NULL, '오류 로그도 같이 확인해보세요.', FALSE, NULL
FROM board b JOIN member m ON m.login_id='sample_admin01'
WHERE b.title='[SAMPLE-06] 로그인 오류 질문';

INSERT INTO board_comment (board_id, member_id, parent_comment_id, content, is_deleted, deleted_at)
SELECT b.board_id, m.member_id, NULL, '첨부파일 테스트 완료했습니다.', TRUE, '2026-09-21 13:10:00'
FROM board b JOIN member m ON m.login_id='sample_user06'
WHERE b.title='[SAMPLE-07] 파일 업로드 테스트';

-- reply 1
INSERT INTO board_comment (board_id, member_id, parent_comment_id, content)
SELECT p.board_id, m.member_id, p.comment_id, '확인해주셔서 감사합니다.'
FROM board_comment p
JOIN board b ON b.board_id=p.board_id
JOIN member m ON m.login_id='sample_admin01'
WHERE b.title='[SAMPLE-01] NEXORA 서비스 점검 안내'
  AND p.content='점검 일정 확인했습니다.'
ORDER BY p.comment_id DESC LIMIT 1;

-- reply 2
INSERT INTO board_comment (board_id, member_id, parent_comment_id, content)
SELECT p.board_id, m.member_id, p.comment_id, '관련 자료도 추가로 공유하겠습니다.'
FROM board_comment p
JOIN board b ON b.board_id=p.board_id
JOIN member m ON m.login_id='sample_user01'
WHERE b.title='[SAMPLE-03] Java MVC 참고 자료'
  AND p.content='MVC 공부에 참고하겠습니다.'
ORDER BY p.comment_id DESC LIMIT 1;

-- reply 3
INSERT INTO board_comment (board_id, member_id, parent_comment_id, content)
SELECT p.board_id, m.member_id, p.comment_id, '관리자 로그도 함께 확인해보겠습니다.'
FROM board_comment p
JOIN board b ON b.board_id=p.board_id
JOIN member m ON m.login_id='sample_user04'
WHERE b.title='[SAMPLE-06] 로그인 오류 질문'
  AND p.content='오류 로그도 같이 확인해보세요.'
ORDER BY p.comment_id DESC LIMIT 1;

-- ============================================================
-- 4. BOARD_FILE - 10
-- ============================================================
INSERT INTO board_file
(board_id, original_name, saved_name, file_path, file_size, file_type, is_deleted, deleted_at)
SELECT board_id, 'maintenance.pdf', 'sample_board_01.pdf', '/upload/board/sample_board_01.pdf', 102400, 'application/pdf', FALSE, NULL
FROM board WHERE title='[SAMPLE-01] NEXORA 서비스 점검 안내';

INSERT INTO board_file
(board_id, original_name, saved_name, file_path, file_size, file_type, is_deleted, deleted_at)
SELECT board_id, 'sentinelops-update.pdf', 'sample_board_02.pdf', '/upload/board/sample_board_02.pdf', 204800, 'application/pdf', FALSE, NULL
FROM board WHERE title='[SAMPLE-02] SentinelOps 기능 업데이트';

INSERT INTO board_file
(board_id, original_name, saved_name, file_path, file_size, file_type, is_deleted, deleted_at)
SELECT board_id, 'mvc-guide.pdf', 'sample_board_03.pdf', '/upload/board/sample_board_03.pdf', 307200, 'application/pdf', FALSE, NULL
FROM board WHERE title='[SAMPLE-03] Java MVC 참고 자료';

INSERT INTO board_file
(board_id, original_name, saved_name, file_path, file_size, file_type, is_deleted, deleted_at)
SELECT board_id, 'join-example.sql', 'sample_board_04.sql', '/upload/board/sample_board_04.sql', 4096, 'application/sql', FALSE, NULL
FROM board WHERE title='[SAMPLE-04] MySQL JOIN 정리';

INSERT INTO board_file
(board_id, original_name, saved_name, file_path, file_size, file_type, is_deleted, deleted_at)
SELECT board_id, 'sentinelops-screen.png', 'sample_board_05.png', '/upload/board/sample_board_05.png', 512000, 'image/png', FALSE, NULL
FROM board WHERE title='[SAMPLE-05] SentinelOps 사용 후기';

INSERT INTO board_file
(board_id, original_name, saved_name, file_path, file_size, file_type, is_deleted, deleted_at)
SELECT board_id, 'login-error.log', 'sample_board_06.log', '/upload/board/sample_board_06.log', 8192, 'text/plain', FALSE, NULL
FROM board WHERE title='[SAMPLE-06] 로그인 오류 질문';

INSERT INTO board_file
(board_id, original_name, saved_name, file_path, file_size, file_type, is_deleted, deleted_at)
SELECT board_id, 'upload-test.txt', 'sample_board_07.txt', '/upload/board/sample_board_07.txt', 1024, 'text/plain', FALSE, NULL
FROM board WHERE title='[SAMPLE-07] 파일 업로드 테스트';

INSERT INTO board_file
(board_id, original_name, saved_name, file_path, file_size, file_type, is_deleted, deleted_at)
SELECT board_id, 'git-guide.pdf', 'sample_board_08.pdf', '/upload/board/sample_board_08.pdf', 156000, 'application/pdf', FALSE, NULL
FROM board WHERE title='[SAMPLE-08] Git 협업 명령어 정리';

INSERT INTO board_file
(board_id, original_name, saved_name, file_path, file_size, file_type, is_deleted, deleted_at)
SELECT board_id, 'hello.png', 'sample_board_09.png', '/upload/board/sample_board_09.png', 220000, 'image/png', FALSE, NULL
FROM board WHERE title='[SAMPLE-09] 자유게시판 인사';

INSERT INTO board_file
(board_id, original_name, saved_name, file_path, file_size, file_type, is_deleted, deleted_at)
SELECT board_id, 'deleted-file.txt', 'sample_board_10.txt', '/upload/board/sample_board_10.txt', 512, 'text/plain', TRUE, '2026-09-20 15:30:00'
FROM board WHERE title='[SAMPLE-10] 삭제된 게시글 테스트';

-- ============================================================
-- 5. INQUIRY - 10
-- ============================================================
INSERT INTO inquiry
(member_id, assigned_admin_id, contact_name, contact_email, company_name, category, title, content, status, admin_answer, answered_at, is_deleted, deleted_at)
SELECT u.member_id, a.member_id, u.name, u.email, '알파테크', 'TECHNICAL',
       '[SAMPLE-Q01] 로그인 오류 문의', '로그인 시 인증 오류가 발생합니다.',
       'IN_PROGRESS', NULL, NULL, FALSE, NULL
FROM member u JOIN member a ON a.login_id='sample_admin01'
WHERE u.login_id='sample_user01';

INSERT INTO inquiry
(member_id, assigned_admin_id, contact_name, contact_email, company_name, category, title, content, status, admin_answer, answered_at, is_deleted, deleted_at)
SELECT u.member_id, a.member_id, u.name, u.email, '베타솔루션', 'ACCOUNT',
       '[SAMPLE-Q02] 계정 정보 변경 문의', '회사 이메일 변경 방법을 문의합니다.',
       'COMPLETED', '회원정보 메뉴에서 이메일을 변경할 수 있습니다.', '2026-09-18 11:00:00', FALSE, NULL
FROM member u JOIN member a ON a.login_id='sample_admin02'
WHERE u.login_id='sample_user02';

INSERT INTO inquiry
(member_id, assigned_admin_id, contact_name, contact_email, company_name, category, title, content, status, admin_answer, answered_at, is_deleted, deleted_at)
SELECT u.member_id, a.member_id, u.name, u.email, '감마네트웍스', 'PAYMENT',
       '[SAMPLE-Q03] 결제 내역 문의', '최근 결제 내역을 확인하고 싶습니다.',
       'RECEIVED', NULL, NULL, FALSE, NULL
FROM member u JOIN member a ON a.login_id='sample_admin01'
WHERE u.login_id='sample_user03';

INSERT INTO inquiry
(member_id, assigned_admin_id, contact_name, contact_email, company_name, category, title, content, status, admin_answer, answered_at, is_deleted, deleted_at)
SELECT u.member_id, a.member_id, u.name, u.email, '델타시스템', 'SECURITY',
       '[SAMPLE-Q04] 보안 경고 문의', '관리 화면에서 보안 경고가 표시됩니다.',
       'IN_PROGRESS', NULL, NULL, FALSE, NULL
FROM member u JOIN member a ON a.login_id='sample_admin02'
WHERE u.login_id='sample_user04';

INSERT INTO inquiry
(member_id, assigned_admin_id, contact_name, contact_email, company_name, category, title, content, status, admin_answer, answered_at, is_deleted, deleted_at)
SELECT u.member_id, a.member_id, u.name, u.email, '에코클라우드', 'GENERAL',
       '[SAMPLE-Q05] 서비스 이용 문의', 'NEXORA 서비스 이용 범위를 문의합니다.',
       'COMPLETED', '서비스별 안내 페이지를 확인해 주세요.', '2026-09-19 14:00:00', FALSE, NULL
FROM member u JOIN member a ON a.login_id='sample_admin01'
WHERE u.login_id='sample_user05';

INSERT INTO inquiry
(member_id, assigned_admin_id, contact_name, contact_email, company_name, category, title, content, status, admin_answer, answered_at, is_deleted, deleted_at)
SELECT u.member_id, a.member_id, u.name, u.email, '파인소프트', 'TECHNICAL',
       '[SAMPLE-Q06] 파일 업로드 실패', '첨부파일 업로드 시 오류가 발생합니다.',
       'RECEIVED', NULL, NULL, FALSE, NULL
FROM member u JOIN member a ON a.login_id='sample_admin02'
WHERE u.login_id='sample_user06';

INSERT INTO inquiry
(member_id, assigned_admin_id, contact_name, contact_email, company_name, category, title, content, status, admin_answer, answered_at, is_deleted, deleted_at)
SELECT u.member_id, a.member_id, u.name, u.email, '그린데이터', 'OTHER',
       '[SAMPLE-Q07] 기타 기능 제안', '대시보드 필터 기능을 제안합니다.',
       'RECEIVED', NULL, NULL, FALSE, NULL
FROM member u JOIN member a ON a.login_id='sample_admin01'
WHERE u.login_id='sample_user07';

-- 비회원 문의
INSERT INTO inquiry
(member_id, assigned_admin_id, contact_name, contact_email, company_name, category, title, content, status, admin_answer, answered_at, is_deleted, deleted_at)
SELECT NULL, a.member_id, '비회원고객1', 'guest01@example.com', '게스트컴퍼니', 'GENERAL',
       '[SAMPLE-Q08] 도입 상담 문의', 'NEXORA 도입 상담을 받고 싶습니다.',
       'IN_PROGRESS', NULL, NULL, FALSE, NULL
FROM member a WHERE a.login_id='sample_admin01';

INSERT INTO inquiry
(member_id, assigned_admin_id, contact_name, contact_email, company_name, category, title, content, status, admin_answer, answered_at, is_deleted, deleted_at)
SELECT NULL, a.member_id, '비회원고객2', 'guest02@example.com', NULL, 'SECURITY',
       '[SAMPLE-Q09] 보안 서비스 문의', '보안 솔루션 기능이 궁금합니다.',
       'COMPLETED', '담당자가 별도로 안내드렸습니다.', '2026-09-20 16:00:00', FALSE, NULL
FROM member a WHERE a.login_id='sample_admin02';

INSERT INTO inquiry
(member_id, assigned_admin_id, contact_name, contact_email, company_name, category, title, content, status, admin_answer, answered_at, is_deleted, deleted_at)
SELECT u.member_id, a.member_id, u.name, u.email, '탈퇴고객사', 'ACCOUNT',
       '[SAMPLE-Q10] 삭제된 문의 테스트', 'Soft Delete 테스트 문의입니다.',
       'COMPLETED', '처리 완료된 테스트 문의입니다.', '2026-09-20 10:00:00', TRUE, '2026-09-21 09:00:00'
FROM member u JOIN member a ON a.login_id='sample_admin01'
WHERE u.login_id='sample_user08';

-- ============================================================
-- 6. INQUIRY_FILE - 10
-- ============================================================
INSERT INTO inquiry_file
(inquiry_id, original_name, saved_name, file_path, file_size, file_type, is_deleted, deleted_at)
SELECT inquiry_id, 'login-error.png', 'sample_inquiry_01.png', '/upload/inquiry/sample_inquiry_01.png', 120000, 'image/png', FALSE, NULL
FROM inquiry WHERE title='[SAMPLE-Q01] 로그인 오류 문의';

INSERT INTO inquiry_file
(inquiry_id, original_name, saved_name, file_path, file_size, file_type, is_deleted, deleted_at)
SELECT inquiry_id, 'account-info.pdf', 'sample_inquiry_02.pdf', '/upload/inquiry/sample_inquiry_02.pdf', 240000, 'application/pdf', FALSE, NULL
FROM inquiry WHERE title='[SAMPLE-Q02] 계정 정보 변경 문의';

INSERT INTO inquiry_file
(inquiry_id, original_name, saved_name, file_path, file_size, file_type, is_deleted, deleted_at)
SELECT inquiry_id, 'payment-list.pdf', 'sample_inquiry_03.pdf', '/upload/inquiry/sample_inquiry_03.pdf', 180000, 'application/pdf', FALSE, NULL
FROM inquiry WHERE title='[SAMPLE-Q03] 결제 내역 문의';

INSERT INTO inquiry_file
(inquiry_id, original_name, saved_name, file_path, file_size, file_type, is_deleted, deleted_at)
SELECT inquiry_id, 'security-warning.png', 'sample_inquiry_04.png', '/upload/inquiry/sample_inquiry_04.png', 320000, 'image/png', FALSE, NULL
FROM inquiry WHERE title='[SAMPLE-Q04] 보안 경고 문의';

INSERT INTO inquiry_file
(inquiry_id, original_name, saved_name, file_path, file_size, file_type, is_deleted, deleted_at)
SELECT inquiry_id, 'service-question.txt', 'sample_inquiry_05.txt', '/upload/inquiry/sample_inquiry_05.txt', 2048, 'text/plain', FALSE, NULL
FROM inquiry WHERE title='[SAMPLE-Q05] 서비스 이용 문의';

INSERT INTO inquiry_file
(inquiry_id, original_name, saved_name, file_path, file_size, file_type, is_deleted, deleted_at)
SELECT inquiry_id, 'upload-error.log', 'sample_inquiry_06.log', '/upload/inquiry/sample_inquiry_06.log', 9000, 'text/plain', FALSE, NULL
FROM inquiry WHERE title='[SAMPLE-Q06] 파일 업로드 실패';

INSERT INTO inquiry_file
(inquiry_id, original_name, saved_name, file_path, file_size, file_type, is_deleted, deleted_at)
SELECT inquiry_id, 'feature-request.pdf', 'sample_inquiry_07.pdf', '/upload/inquiry/sample_inquiry_07.pdf', 140000, 'application/pdf', FALSE, NULL
FROM inquiry WHERE title='[SAMPLE-Q07] 기타 기능 제안';

INSERT INTO inquiry_file
(inquiry_id, original_name, saved_name, file_path, file_size, file_type, is_deleted, deleted_at)
SELECT inquiry_id, 'proposal.docx', 'sample_inquiry_08.docx', '/upload/inquiry/sample_inquiry_08.docx', 450000, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', FALSE, NULL
FROM inquiry WHERE title='[SAMPLE-Q08] 도입 상담 문의';

INSERT INTO inquiry_file
(inquiry_id, original_name, saved_name, file_path, file_size, file_type, is_deleted, deleted_at)
SELECT inquiry_id, 'security-service.pdf', 'sample_inquiry_09.pdf', '/upload/inquiry/sample_inquiry_09.pdf', 280000, 'application/pdf', FALSE, NULL
FROM inquiry WHERE title='[SAMPLE-Q09] 보안 서비스 문의';

INSERT INTO inquiry_file
(inquiry_id, original_name, saved_name, file_path, file_size, file_type, is_deleted, deleted_at)
SELECT inquiry_id, 'deleted-inquiry.txt', 'sample_inquiry_10.txt', '/upload/inquiry/sample_inquiry_10.txt', 1024, 'text/plain', TRUE, '2026-09-21 09:00:00'
FROM inquiry WHERE title='[SAMPLE-Q10] 삭제된 문의 테스트';

-- ============================================================
-- 7. INCIDENT - 10
-- ============================================================
INSERT INTO incident
(member_id, service_name, error_type, error_message, stack_trace, severity, status, request_uri, http_method, ip_address, acknowledged_at, resolved_at, is_deleted, deleted_at)
SELECT member_id, 'MEMBER', 'LoginException', '[SAMPLE-I01] Authentication processing failed',
       'LoginException at MemberLoginServlet.doPost(MemberLoginServlet.java:72)',
       'HIGH', 'ACKNOWLEDGED', '/member/login.do', 'POST', '192.168.10.11', '2026-09-23 09:05:00', NULL, FALSE, NULL
FROM member WHERE login_id='sample_user01';

INSERT INTO incident
(member_id, service_name, error_type, error_message, stack_trace, severity, status, request_uri, http_method, ip_address, acknowledged_at, resolved_at, is_deleted, deleted_at)
SELECT member_id, 'BOARD', 'SQLException', '[SAMPLE-I02] Board list query failed',
       'SQLException at BoardDAO.findBoardList(BoardDAO.java:145)',
       'MEDIUM', 'RESOLVED', '/board/list.do', 'GET', '192.168.10.12', '2026-09-22 10:10:00', '2026-09-22 10:35:00', FALSE, NULL
FROM member WHERE login_id='sample_user02';

INSERT INTO incident
(member_id, service_name, error_type, error_message, stack_trace, severity, status, request_uri, http_method, ip_address, acknowledged_at, resolved_at, is_deleted, deleted_at)
SELECT member_id, 'BOARD', 'FileUploadException', '[SAMPLE-I03] Attachment upload failed',
       'FileUploadException at BoardWriteServlet.doPost(BoardWriteServlet.java:98)',
       'MEDIUM', 'OPEN', '/board/write.do', 'POST', '192.168.10.13', NULL, NULL, FALSE, NULL
FROM member WHERE login_id='sample_user03';

INSERT INTO incident
(member_id, service_name, error_type, error_message, stack_trace, severity, status, request_uri, http_method, ip_address, acknowledged_at, resolved_at, is_deleted, deleted_at)
SELECT member_id, 'CUSTOMER', 'InquirySaveException', '[SAMPLE-I04] Inquiry persistence failed',
       'InquirySaveException at InquiryServlet.doPost(InquiryServlet.java:61)',
       'HIGH', 'ACKNOWLEDGED', '/customer/inquiry.do', 'POST', '192.168.10.14', '2026-09-23 11:15:00', NULL, FALSE, NULL
FROM member WHERE login_id='sample_user04';

INSERT INTO incident
(member_id, service_name, error_type, error_message, stack_trace, severity, status, request_uri, http_method, ip_address, acknowledged_at, resolved_at, is_deleted, deleted_at)
SELECT member_id, 'ADMIN', 'AccessDeniedException', '[SAMPLE-I05] Unauthorized admin access',
       'AccessDeniedException at AdminFilter.doFilter(AdminFilter.java:45)',
       'CRITICAL', 'RESOLVED', '/admin/admin.do', 'GET', '192.168.10.15', '2026-09-21 14:01:00', '2026-09-21 14:20:00', FALSE, NULL
FROM member WHERE login_id='sample_user05';

INSERT INTO incident
(member_id, service_name, error_type, error_message, stack_trace, severity, status, request_uri, http_method, ip_address, acknowledged_at, resolved_at, is_deleted, deleted_at)
SELECT member_id, 'MEMBER', 'ValidationException', '[SAMPLE-I06] Invalid signup request',
       'ValidationException at MemberSignupServlet.doPost(MemberSignupServlet.java:80)',
       'LOW', 'RESOLVED', '/member/signup.do', 'POST', '192.168.10.16', '2026-09-20 09:20:00', '2026-09-20 09:25:00', FALSE, NULL
FROM member WHERE login_id='sample_user06';

INSERT INTO incident
(member_id, service_name, error_type, error_message, stack_trace, severity, status, request_uri, http_method, ip_address, acknowledged_at, resolved_at, is_deleted, deleted_at)
SELECT member_id, 'DATABASE', 'ConnectionTimeoutException', '[SAMPLE-I07] Database connection timed out',
       'ConnectionTimeoutException at DataSource.getConnection(DataSource.java:120)',
       'CRITICAL', 'OPEN', '/board/list.do', 'GET', '192.168.10.17', NULL, NULL, FALSE, NULL
FROM member WHERE login_id='sample_user07';

INSERT INTO incident
(member_id, service_name, error_type, error_message, stack_trace, severity, status, request_uri, http_method, ip_address, acknowledged_at, resolved_at, is_deleted, deleted_at)
SELECT NULL, 'SYSTEM', 'NullPointerException', '[SAMPLE-I08] Unexpected null value',
       'NullPointerException at ErrorCollector.collect(ErrorCollector.java:33)',
       'MEDIUM', 'ACKNOWLEDGED', '/index.jsp', 'GET', '192.168.10.18', '2026-09-23 13:30:00', NULL, FALSE, NULL;

INSERT INTO incident
(member_id, service_name, error_type, error_message, stack_trace, severity, status, request_uri, http_method, ip_address, acknowledged_at, resolved_at, is_deleted, deleted_at)
SELECT member_id, 'CUSTOMER', 'MailSendException', '[SAMPLE-I09] Inquiry notification mail failed',
       'MailSendException at NotificationService.send(NotificationService.java:55)',
       'LOW', 'OPEN', '/customer/inquiry.do', 'POST', '192.168.10.19', NULL, NULL, FALSE, NULL
FROM member WHERE login_id='sample_user08';

INSERT INTO incident
(member_id, service_name, error_type, error_message, stack_trace, severity, status, request_uri, http_method, ip_address, acknowledged_at, resolved_at, is_deleted, deleted_at)
SELECT member_id, 'BOARD', 'DeletedTestException', '[SAMPLE-I10] Soft deleted incident test',
       'DeletedTestException at BoardServlet.doGet(BoardServlet.java:20)',
       'LOW', 'RESOLVED', '/board/test.do', 'GET', '192.168.10.20', '2026-09-19 08:10:00', '2026-09-19 08:20:00', TRUE, '2026-09-20 08:00:00'
FROM member WHERE login_id='sample_user01';

-- ============================================================
-- 8. INCIDENT_ANALYSIS - 10
-- ============================================================
INSERT INTO incident_analysis
(incident_id, summary, possible_cause, suggested_action, model_name, is_deleted, deleted_at)
SELECT incident_id, '로그인 인증 처리 중 예외가 발생했습니다.', '인증 정보 또는 세션 처리 문제 가능성', '로그인 요청과 인증 로그를 확인하세요.', 'sample-ai-model', FALSE, NULL
FROM incident WHERE error_message='[SAMPLE-I01] Authentication processing failed';

INSERT INTO incident_analysis
(incident_id, summary, possible_cause, suggested_action, model_name, is_deleted, deleted_at)
SELECT incident_id, '게시판 목록 조회 SQL 실행에 실패했습니다.', 'SQL 또는 DB 연결 문제 가능성', '쿼리와 DB 연결 상태를 확인하세요.', 'sample-ai-model', FALSE, NULL
FROM incident WHERE error_message='[SAMPLE-I02] Board list query failed';

INSERT INTO incident_analysis
(incident_id, summary, possible_cause, suggested_action, model_name, is_deleted, deleted_at)
SELECT incident_id, '게시글 첨부파일 업로드에 실패했습니다.', '파일 크기 또는 저장 경로 문제 가능성', '업로드 제한과 디렉터리 권한을 확인하세요.', 'sample-ai-model', FALSE, NULL
FROM incident WHERE error_message='[SAMPLE-I03] Attachment upload failed';

INSERT INTO incident_analysis
(incident_id, summary, possible_cause, suggested_action, model_name, is_deleted, deleted_at)
SELECT incident_id, '고객 문의 저장 과정에서 오류가 발생했습니다.', 'INSERT 처리 또는 입력값 검증 문제 가능성', '문의 DAO와 요청 파라미터를 확인하세요.', 'sample-ai-model', FALSE, NULL
FROM incident WHERE error_message='[SAMPLE-I04] Inquiry persistence failed';

INSERT INTO incident_analysis
(incident_id, summary, possible_cause, suggested_action, model_name, is_deleted, deleted_at)
SELECT incident_id, '관리자 페이지에 허가되지 않은 접근이 감지되었습니다.', '권한 검증 실패 또는 비정상 접근 가능성', '세션 role과 접근 로그를 확인하세요.', 'sample-ai-model', FALSE, NULL
FROM incident WHERE error_message='[SAMPLE-I05] Unauthorized admin access';

INSERT INTO incident_analysis
(incident_id, summary, possible_cause, suggested_action, model_name, is_deleted, deleted_at)
SELECT incident_id, '회원가입 입력값 검증에 실패했습니다.', '필수값 또는 형식 오류 가능성', '입력 validation 규칙을 확인하세요.', 'sample-ai-model', FALSE, NULL
FROM incident WHERE error_message='[SAMPLE-I06] Invalid signup request';

INSERT INTO incident_analysis
(incident_id, summary, possible_cause, suggested_action, model_name, is_deleted, deleted_at)
SELECT incident_id, 'DB 연결 시간이 초과되었습니다.', '네트워크 또는 connection pool 문제 가능성', 'DB 상태와 pool 사용량을 확인하세요.', 'sample-ai-model', FALSE, NULL
FROM incident WHERE error_message='[SAMPLE-I07] Database connection timed out';

INSERT INTO incident_analysis
(incident_id, summary, possible_cause, suggested_action, model_name, is_deleted, deleted_at)
SELECT incident_id, '시스템 처리 중 null 참조가 발생했습니다.', 'null 검사 누락 가능성', 'stack trace 위치의 객체 초기화를 확인하세요.', 'sample-ai-model', FALSE, NULL
FROM incident WHERE error_message='[SAMPLE-I08] Unexpected null value';

INSERT INTO incident_analysis
(incident_id, summary, possible_cause, suggested_action, model_name, is_deleted, deleted_at)
SELECT incident_id, '문의 알림 메일 전송에 실패했습니다.', '메일 서버 또는 설정 문제 가능성', '메일 설정과 전송 로그를 확인하세요.', 'sample-ai-model', FALSE, NULL
FROM incident WHERE error_message='[SAMPLE-I09] Inquiry notification mail failed';

INSERT INTO incident_analysis
(incident_id, summary, possible_cause, suggested_action, model_name, is_deleted, deleted_at)
SELECT incident_id, '삭제 데이터 필터 테스트용 분석입니다.', '테스트 데이터', '일반 조회에서 제외되는지 확인하세요.', 'sample-ai-model', TRUE, '2026-09-20 08:00:00'
FROM incident WHERE error_message='[SAMPLE-I10] Soft deleted incident test';

-- ============================================================
-- 9. INCIDENT_ALERT - 10
-- ============================================================
INSERT INTO incident_alert (incident_id, alert_type, channel_name, message, send_status, error_message, sent_at)
SELECT incident_id, 'INCIDENT', '#nexora-alerts', '[SAMPLE-A01] 로그인 오류 알림', 'SUCCESS', NULL, '2026-09-23 09:06:00'
FROM incident WHERE error_message='[SAMPLE-I01] Authentication processing failed';

INSERT INTO incident_alert (incident_id, alert_type, channel_name, message, send_status, error_message, sent_at)
SELECT incident_id, 'INCIDENT', '#nexora-alerts', '[SAMPLE-A02] 게시판 DB 오류 알림', 'SUCCESS', NULL, '2026-09-22 10:11:00'
FROM incident WHERE error_message='[SAMPLE-I02] Board list query failed';

INSERT INTO incident_alert (incident_id, alert_type, channel_name, message, send_status, error_message, sent_at)
SELECT incident_id, 'INCIDENT', '#nexora-alerts', '[SAMPLE-A03] 파일 업로드 오류 알림', 'PENDING', NULL, NULL
FROM incident WHERE error_message='[SAMPLE-I03] Attachment upload failed';

INSERT INTO incident_alert (incident_id, alert_type, channel_name, message, send_status, error_message, sent_at)
SELECT incident_id, 'INCIDENT', '#nexora-alerts', '[SAMPLE-A04] 문의 저장 오류 알림', 'FAILED', 'Slack API timeout', NULL
FROM incident WHERE error_message='[SAMPLE-I04] Inquiry persistence failed';

INSERT INTO incident_alert (incident_id, alert_type, channel_name, message, send_status, error_message, sent_at)
SELECT incident_id, 'CRITICAL_ALERT', '#nexora-critical', '[SAMPLE-A05] 관리자 접근 보안 경고', 'SUCCESS', NULL, '2026-09-21 14:02:00'
FROM incident WHERE error_message='[SAMPLE-I05] Unauthorized admin access';

INSERT INTO incident_alert (incident_id, alert_type, channel_name, message, send_status, error_message, sent_at)
SELECT incident_id, 'INCIDENT', '#nexora-alerts', '[SAMPLE-A06] 회원가입 검증 오류', 'SUCCESS', NULL, '2026-09-20 09:21:00'
FROM incident WHERE error_message='[SAMPLE-I06] Invalid signup request';

INSERT INTO incident_alert (incident_id, alert_type, channel_name, message, send_status, error_message, sent_at)
SELECT incident_id, 'CRITICAL_ALERT', '#nexora-critical', '[SAMPLE-A07] DB 연결 타임아웃', 'FAILED', 'Webhook connection failed', NULL
FROM incident WHERE error_message='[SAMPLE-I07] Database connection timed out';

INSERT INTO incident_alert (incident_id, alert_type, channel_name, message, send_status, error_message, sent_at)
SELECT incident_id, 'INCIDENT', '#nexora-alerts', '[SAMPLE-A08] NullPointerException 감지', 'SUCCESS', NULL, '2026-09-23 13:31:00'
FROM incident WHERE error_message='[SAMPLE-I08] Unexpected null value';

INSERT INTO incident_alert (incident_id, alert_type, channel_name, message, send_status, error_message, sent_at)
SELECT incident_id, 'INCIDENT', '#nexora-alerts', '[SAMPLE-A09] 메일 전송 오류', 'PENDING', NULL, NULL
FROM incident WHERE error_message='[SAMPLE-I09] Inquiry notification mail failed';

-- incident_id NULL이 허용되는 일일 요약
INSERT INTO incident_alert
(incident_id, alert_type, channel_name, message, send_status, error_message, sent_at)
VALUES
(NULL, 'DAILY_SUMMARY', '#nexora-daily', '[SAMPLE-A10] 오늘의 SentinelOps 일일 오류 요약입니다.', 'SUCCESS', NULL, '2026-09-23 08:00:00');

-- ============================================================
-- 10. INCIDENT_HISTORY - 10
-- ============================================================
INSERT INTO incident_history (incident_id, changed_by, previous_status, new_status, note, changed_at)
SELECT i.incident_id, a.member_id, 'OPEN', 'ACKNOWLEDGED', '관리자가 로그인 오류를 확인함', '2026-09-23 09:05:00'
FROM incident i JOIN member a ON a.login_id='sample_admin01'
WHERE i.error_message='[SAMPLE-I01] Authentication processing failed';

INSERT INTO incident_history (incident_id, changed_by, previous_status, new_status, note, changed_at)
SELECT i.incident_id, a.member_id, 'ACKNOWLEDGED', 'RESOLVED', '게시판 SQL 수정 후 해결', '2026-09-22 10:35:00'
FROM incident i JOIN member a ON a.login_id='sample_admin02'
WHERE i.error_message='[SAMPLE-I02] Board list query failed';

INSERT INTO incident_history (incident_id, changed_by, previous_status, new_status, note, changed_at)
SELECT i.incident_id, NULL, NULL, 'OPEN', '시스템이 Incident를 최초 생성함', '2026-09-23 10:00:00'
FROM incident i WHERE i.error_message='[SAMPLE-I03] Attachment upload failed';

INSERT INTO incident_history (incident_id, changed_by, previous_status, new_status, note, changed_at)
SELECT i.incident_id, a.member_id, 'OPEN', 'ACKNOWLEDGED', '고객 문의 저장 오류 확인', '2026-09-23 11:15:00'
FROM incident i JOIN member a ON a.login_id='sample_admin01'
WHERE i.error_message='[SAMPLE-I04] Inquiry persistence failed';

INSERT INTO incident_history (incident_id, changed_by, previous_status, new_status, note, changed_at)
SELECT i.incident_id, a.member_id, 'ACKNOWLEDGED', 'RESOLVED', '비정상 접근 차단 및 세션 검증 완료', '2026-09-21 14:20:00'
FROM incident i JOIN member a ON a.login_id='sample_admin02'
WHERE i.error_message='[SAMPLE-I05] Unauthorized admin access';

INSERT INTO incident_history (incident_id, changed_by, previous_status, new_status, note, changed_at)
SELECT i.incident_id, a.member_id, 'ACKNOWLEDGED', 'RESOLVED', '입력 검증 처리 완료', '2026-09-20 09:25:00'
FROM incident i JOIN member a ON a.login_id='sample_admin01'
WHERE i.error_message='[SAMPLE-I06] Invalid signup request';

INSERT INTO incident_history (incident_id, changed_by, previous_status, new_status, note, changed_at)
SELECT i.incident_id, NULL, NULL, 'OPEN', 'DB 연결 타임아웃 자동 감지', '2026-09-23 12:00:00'
FROM incident i WHERE i.error_message='[SAMPLE-I07] Database connection timed out';

INSERT INTO incident_history (incident_id, changed_by, previous_status, new_status, note, changed_at)
SELECT i.incident_id, a.member_id, 'OPEN', 'ACKNOWLEDGED', 'NullPointerException 확인', '2026-09-23 13:30:00'
FROM incident i JOIN member a ON a.login_id='sample_admin02'
WHERE i.error_message='[SAMPLE-I08] Unexpected null value';

INSERT INTO incident_history (incident_id, changed_by, previous_status, new_status, note, changed_at)
SELECT i.incident_id, NULL, NULL, 'OPEN', '메일 전송 실패 자동 감지', '2026-09-23 14:00:00'
FROM incident i WHERE i.error_message='[SAMPLE-I09] Inquiry notification mail failed';

INSERT INTO incident_history (incident_id, changed_by, previous_status, new_status, note, changed_at)
SELECT i.incident_id, a.member_id, 'ACKNOWLEDGED', 'RESOLVED', 'Soft Delete 테스트 완료', '2026-09-19 08:20:00'
FROM incident i JOIN member a ON a.login_id='sample_admin01'
WHERE i.error_message='[SAMPLE-I10] Soft deleted incident test';

-- ============================================================
-- 11. INCIDENT_INQUIRY - 10
-- 10개의 Incident와 10개의 Inquiry를 1:1 샘플 연결
-- ============================================================
INSERT INTO incident_inquiry (incident_id, inquiry_id, linked_by, link_reason, is_deleted, deleted_at)
SELECT i.incident_id, q.inquiry_id, a.member_id, '로그인 장애와 고객 문의의 증상이 일치함', FALSE, NULL
FROM incident i JOIN inquiry q ON q.title='[SAMPLE-Q01] 로그인 오류 문의'
JOIN member a ON a.login_id='sample_admin01'
WHERE i.error_message='[SAMPLE-I01] Authentication processing failed';

INSERT INTO incident_inquiry (incident_id, inquiry_id, linked_by, link_reason, is_deleted, deleted_at)
SELECT i.incident_id, q.inquiry_id, a.member_id, 'DB 조회 오류와 계정 문의 확인을 위한 샘플 연결', FALSE, NULL
FROM incident i JOIN inquiry q ON q.title='[SAMPLE-Q02] 계정 정보 변경 문의'
JOIN member a ON a.login_id='sample_admin02'
WHERE i.error_message='[SAMPLE-I02] Board list query failed';

INSERT INTO incident_inquiry (incident_id, inquiry_id, linked_by, link_reason, is_deleted, deleted_at)
SELECT i.incident_id, q.inquiry_id, a.member_id, '파일 관련 장애와 문의를 연결함', FALSE, NULL
FROM incident i JOIN inquiry q ON q.title='[SAMPLE-Q03] 결제 내역 문의'
JOIN member a ON a.login_id='sample_admin01'
WHERE i.error_message='[SAMPLE-I03] Attachment upload failed';

INSERT INTO incident_inquiry (incident_id, inquiry_id, linked_by, link_reason, is_deleted, deleted_at)
SELECT i.incident_id, q.inquiry_id, a.member_id, '문의 저장 오류와 보안 문의를 테스트 연결함', FALSE, NULL
FROM incident i JOIN inquiry q ON q.title='[SAMPLE-Q04] 보안 경고 문의'
JOIN member a ON a.login_id='sample_admin02'
WHERE i.error_message='[SAMPLE-I04] Inquiry persistence failed';

INSERT INTO incident_inquiry (incident_id, inquiry_id, linked_by, link_reason, is_deleted, deleted_at)
SELECT i.incident_id, q.inquiry_id, a.member_id, '보안 Incident와 서비스 문의를 연결함', FALSE, NULL
FROM incident i JOIN inquiry q ON q.title='[SAMPLE-Q05] 서비스 이용 문의'
JOIN member a ON a.login_id='sample_admin01'
WHERE i.error_message='[SAMPLE-I05] Unauthorized admin access';

INSERT INTO incident_inquiry (incident_id, inquiry_id, linked_by, link_reason, is_deleted, deleted_at)
SELECT i.incident_id, q.inquiry_id, a.member_id, '입력 검증 오류와 파일 업로드 문의를 테스트 연결함', FALSE, NULL
FROM incident i JOIN inquiry q ON q.title='[SAMPLE-Q06] 파일 업로드 실패'
JOIN member a ON a.login_id='sample_admin02'
WHERE i.error_message='[SAMPLE-I06] Invalid signup request';

INSERT INTO incident_inquiry (incident_id, inquiry_id, linked_by, link_reason, is_deleted, deleted_at)
SELECT i.incident_id, q.inquiry_id, a.member_id, 'DB 장애와 기능 제안 문의를 테스트 연결함', FALSE, NULL
FROM incident i JOIN inquiry q ON q.title='[SAMPLE-Q07] 기타 기능 제안'
JOIN member a ON a.login_id='sample_admin01'
WHERE i.error_message='[SAMPLE-I07] Database connection timed out';

INSERT INTO incident_inquiry (incident_id, inquiry_id, linked_by, link_reason, is_deleted, deleted_at)
SELECT i.incident_id, q.inquiry_id, a.member_id, '시스템 오류와 비회원 도입 문의를 테스트 연결함', FALSE, NULL
FROM incident i JOIN inquiry q ON q.title='[SAMPLE-Q08] 도입 상담 문의'
JOIN member a ON a.login_id='sample_admin02'
WHERE i.error_message='[SAMPLE-I08] Unexpected null value';

INSERT INTO incident_inquiry (incident_id, inquiry_id, linked_by, link_reason, is_deleted, deleted_at)
SELECT i.incident_id, q.inquiry_id, a.member_id, '알림 장애와 보안 서비스 문의를 테스트 연결함', FALSE, NULL
FROM incident i JOIN inquiry q ON q.title='[SAMPLE-Q09] 보안 서비스 문의'
JOIN member a ON a.login_id='sample_admin01'
WHERE i.error_message='[SAMPLE-I09] Inquiry notification mail failed';

INSERT INTO incident_inquiry (incident_id, inquiry_id, linked_by, link_reason, is_deleted, deleted_at)
SELECT i.incident_id, q.inquiry_id, a.member_id, 'Soft Delete 관계 조회 테스트', TRUE, '2026-09-21 09:00:00'
FROM incident i JOIN inquiry q ON q.title='[SAMPLE-Q10] 삭제된 문의 테스트'
JOIN member a ON a.login_id='sample_admin01'
WHERE i.error_message='[SAMPLE-I10] Soft deleted incident test';

-- ============================================================
-- 확인용: 이번 SAMPLE 데이터가 테이블별 10건씩 생성되었는지 확인
-- 기존 sample 데이터와 구분하기 위해 식별 가능한 값으로 집계합니다.
-- ============================================================
SELECT 'member' AS table_name, COUNT(*) AS sample_count
FROM member WHERE login_id LIKE 'sample_%'
UNION ALL
SELECT 'board', COUNT(*) FROM board WHERE title LIKE '[SAMPLE-%'
UNION ALL
SELECT 'board_comment', COUNT(*)
FROM board_comment bc
JOIN board b ON b.board_id=bc.board_id
WHERE b.title LIKE '[SAMPLE-%'
UNION ALL
SELECT 'board_file', COUNT(*)
FROM board_file bf
JOIN board b ON b.board_id=bf.board_id
WHERE b.title LIKE '[SAMPLE-%'
UNION ALL
SELECT 'inquiry', COUNT(*) FROM inquiry WHERE title LIKE '[SAMPLE-Q%'
UNION ALL
SELECT 'inquiry_file', COUNT(*)
FROM inquiry_file f JOIN inquiry q ON q.inquiry_id=f.inquiry_id
WHERE q.title LIKE '[SAMPLE-Q%'
UNION ALL
SELECT 'incident', COUNT(*) FROM incident WHERE error_message LIKE '[SAMPLE-I%'
UNION ALL
SELECT 'incident_analysis', COUNT(*)
FROM incident_analysis a JOIN incident i ON i.incident_id=a.incident_id
WHERE i.error_message LIKE '[SAMPLE-I%'
UNION ALL
SELECT 'incident_alert', COUNT(*) FROM incident_alert WHERE message LIKE '[SAMPLE-A%'
UNION ALL
SELECT 'incident_history', COUNT(*)
FROM incident_history h JOIN incident i ON i.incident_id=h.incident_id
WHERE i.error_message LIKE '[SAMPLE-I%'
UNION ALL
SELECT 'incident_inquiry', COUNT(*)
FROM incident_inquiry ii JOIN incident i ON i.incident_id=ii.incident_id
WHERE i.error_message LIKE '[SAMPLE-I%';
