-- NEXORA Sample Data v4
USE solution;

-- 실제 앱에서는 BCrypt 등으로 생성한 비밀번호 해시를 저장하세요.
INSERT INTO member
(login_id, password_hash, name, email, phone, role)
VALUES
('admin', 'REPLACE_WITH_REAL_HASH', '관리자', 'admin@nexora.local', '010-0000-0000', 'ADMIN'),
('demo01', 'REPLACE_WITH_REAL_HASH', '김사용자', 'demo01@nexora.local', '010-1111-2222', 'USER');

INSERT INTO board (member_id, category, title, content, tags)
SELECT member_id, 'NOTICE', 'NEXORA 서비스 안내',
       'NEXORA 프로젝트 공지사항 샘플입니다.',
       '공지,NEXORA'
FROM member WHERE login_id = 'admin';

INSERT INTO board (member_id, category, title, content, tags)
SELECT member_id, 'FREE', 'SentinelOps 사용 문의',
       'SentinelOps 기능에 대해 궁금합니다.',
       'SentinelOps,기술,질의'
FROM member WHERE login_id = 'demo01';

INSERT INTO board_comment (board_id, member_id, content)
SELECT b.board_id, m.member_id, '댓글 기능 테스트입니다.'
FROM board b
JOIN member m ON m.login_id = 'admin'
WHERE b.category = 'FREE'
ORDER BY b.board_id DESC
LIMIT 1;

INSERT INTO inquiry
(member_id, contact_name, contact_email, company_name, category, title, content)
SELECT member_id, name, email, 'NEXORA Demo Client', 'TECHNICAL',
       '로그인이 정상적으로 되지 않습니다.',
       '오후 로그인 요청 중 오류가 발생했습니다.'
FROM member WHERE login_id = 'demo01';

INSERT INTO incident
(member_id, service_name, error_type, error_message, severity,
 request_uri, http_method, ip_address)
SELECT member_id, 'MEMBER', 'LoginException',
       'Authentication processing failed',
       'HIGH', '/member/login.do', 'POST', '127.0.0.1'
FROM member WHERE login_id = 'demo01';

INSERT INTO incident_analysis
(incident_id, summary, possible_cause, suggested_action, model_name)
SELECT incident_id,
       '로그인 인증 처리 과정에서 예외가 발생했습니다.',
       '인증 정보 검증 또는 인증 처리 과정의 문제일 가능성이 있습니다.',
       '동일 시간대 인증 로그와 요청 정보를 우선 확인하세요.',
       'demo-model'
FROM incident
ORDER BY incident_id DESC
LIMIT 1;

INSERT INTO incident_history
(incident_id, changed_by, previous_status, new_status, note)
SELECT i.incident_id, m.member_id, NULL, 'OPEN', 'Incident 최초 생성'
FROM incident i
JOIN member m ON m.login_id = 'admin'
ORDER BY i.incident_id DESC
LIMIT 1;

INSERT INTO incident_inquiry
(incident_id, inquiry_id, linked_by, link_reason)
SELECT i.incident_id, q.inquiry_id, a.member_id,
       '사용자와 발생 시간이 일치하여 관련 건으로 연결'
FROM incident i
JOIN inquiry q ON q.member_id = i.member_id
JOIN member a ON a.login_id = 'admin'
ORDER BY i.incident_id DESC, q.inquiry_id DESC
LIMIT 1;
