-- ============================================================
-- NEXORA Database Schema v4
-- Target: MySQL 8.4.x
-- Team-friendly naming / JSP requirements / Soft Delete
-- v4: board tags + board/comment/file structure finalized
-- ============================================================

CREATE DATABASE IF NOT EXISTS nexora
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;

USE nexora;

-- 1. MEMBER
CREATE TABLE member (
    member_id       BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    login_id        VARCHAR(50)  NOT NULL UNIQUE,
    password_hash   VARCHAR(255) NOT NULL,
    name            VARCHAR(50)  NOT NULL,
    email           VARCHAR(150) NOT NULL UNIQUE,
    phone           VARCHAR(30),
    postcode        VARCHAR(10),
    address         VARCHAR(255),
    address_detail  VARCHAR(255),
    role            ENUM('USER', 'ADMIN') NOT NULL DEFAULT 'USER',
    status          ENUM('ACTIVE', 'SUSPENDED', 'WITHDRAWN') NOT NULL DEFAULT 'ACTIVE',
    created_at      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '가입일자',
    updated_at      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    withdrawn_at    DATETIME NULL COMMENT '탈퇴일자',
    INDEX idx_member_role_status (role, status)
) ENGINE=InnoDB;

-- 2. BOARD
-- 회원만 작성 가능. 비회원은 조회만 허용하는 구조.
CREATE TABLE board (
    board_id        BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    member_id       BIGINT UNSIGNED NOT NULL,
    category        ENUM('NOTICE', 'RESOURCE', 'FREE') NOT NULL DEFAULT 'FREE',
    title           VARCHAR(200) NOT NULL,
    content         LONGTEXT NOT NULL COMMENT '게시글 내용',
    tags            VARCHAR(500) NULL COMMENT '쉼표로 구분한 태그 예: Java,MVC,질의',
    view_count      INT UNSIGNED NOT NULL DEFAULT 0,
    is_deleted      BOOLEAN NOT NULL DEFAULT FALSE,
    created_at      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일',
    updated_at      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at      DATETIME NULL COMMENT '삭제일',
    CONSTRAINT fk_board_member
        FOREIGN KEY (member_id) REFERENCES member(member_id),
    INDEX idx_board_list (category, is_deleted, created_at),
    INDEX idx_board_member (member_id)
) ENGINE=InnoDB;

-- 3. BOARD COMMENT
CREATE TABLE board_comment (
    comment_id          BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    board_id            BIGINT UNSIGNED NOT NULL,
    member_id           BIGINT UNSIGNED NOT NULL,
    parent_comment_id   BIGINT UNSIGNED NULL COMMENT '일반 댓글 NULL / 답글은 부모 댓글 ID',
    content             VARCHAR(2000) NOT NULL COMMENT '댓글 내용',
    is_deleted          BOOLEAN NOT NULL DEFAULT FALSE,
    created_at          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '작성일',
    updated_at          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at          DATETIME NULL COMMENT '삭제일',
    CONSTRAINT fk_comment_board
        FOREIGN KEY (board_id) REFERENCES board(board_id),
    CONSTRAINT fk_comment_member
        FOREIGN KEY (member_id) REFERENCES member(member_id),
    CONSTRAINT fk_comment_parent
        FOREIGN KEY (parent_comment_id) REFERENCES board_comment(comment_id),
    INDEX idx_comment_board (board_id, is_deleted, created_at)
) ENGINE=InnoDB;

-- 4. BOARD FILE
CREATE TABLE board_file (
    file_id          BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    board_id         BIGINT UNSIGNED NOT NULL,
    original_name    VARCHAR(255) NOT NULL COMMENT '사용자가 업로드한 원본 파일명',
    saved_name       VARCHAR(255) NOT NULL COMMENT '서버에 실제 저장된 파일명',
    file_path        VARCHAR(500) NOT NULL,
    file_size        BIGINT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Byte',
    file_type        VARCHAR(100) NULL COMMENT 'MIME type 또는 파일 형식',
    is_deleted       BOOLEAN NOT NULL DEFAULT FALSE,
    created_at       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '업로드일',
    deleted_at       DATETIME NULL,
    CONSTRAINT fk_board_file_board
        FOREIGN KEY (board_id) REFERENCES board(board_id),
    INDEX idx_board_file (board_id, is_deleted)
) ENGINE=InnoDB;

-- 5. INQUIRY
CREATE TABLE inquiry (
    inquiry_id          BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    member_id           BIGINT UNSIGNED NULL,
    assigned_admin_id   BIGINT UNSIGNED NULL,
    contact_name        VARCHAR(100) NOT NULL COMMENT '문의 당시 담당자명',
    contact_email       VARCHAR(150) NOT NULL COMMENT '문의 당시 이메일',
    company_name        VARCHAR(150) NULL COMMENT '회사명',
    category            ENUM('GENERAL', 'TECHNICAL', 'ACCOUNT', 'PAYMENT', 'SECURITY', 'OTHER')
                        NOT NULL DEFAULT 'GENERAL',
    title               VARCHAR(200) NOT NULL,
    content             LONGTEXT NOT NULL,
    status              ENUM('RECEIVED', 'IN_PROGRESS', 'COMPLETED')
                        NOT NULL DEFAULT 'RECEIVED',
    admin_answer        LONGTEXT NULL,
    is_deleted          BOOLEAN NOT NULL DEFAULT FALSE,
    created_at          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    answered_at         DATETIME NULL,
    deleted_at          DATETIME NULL,
    CONSTRAINT fk_inquiry_member
        FOREIGN KEY (member_id) REFERENCES member(member_id),
    CONSTRAINT fk_inquiry_admin
        FOREIGN KEY (assigned_admin_id) REFERENCES member(member_id),
    INDEX idx_inquiry_list (is_deleted, status, created_at),
    INDEX idx_inquiry_member (member_id)
) ENGINE=InnoDB;

-- 6. INQUIRY FILE
CREATE TABLE inquiry_file (
    file_id          BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    inquiry_id       BIGINT UNSIGNED NOT NULL,
    original_name    VARCHAR(255) NOT NULL,
    saved_name       VARCHAR(255) NOT NULL,
    file_path        VARCHAR(500) NOT NULL,
    file_size        BIGINT UNSIGNED NOT NULL DEFAULT 0,
    file_type        VARCHAR(100) NULL,
    is_deleted       BOOLEAN NOT NULL DEFAULT FALSE,
    created_at       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at       DATETIME NULL,
    CONSTRAINT fk_inquiry_file_inquiry
        FOREIGN KEY (inquiry_id) REFERENCES inquiry(inquiry_id),
    INDEX idx_inquiry_file (inquiry_id, is_deleted)
) ENGINE=InnoDB;

-- 7. INCIDENT
-- SentinelOps가 감지/관리하는 시스템 오류 및 장애
CREATE TABLE incident (
    incident_id         BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    member_id           BIGINT UNSIGNED NULL,
    service_name        VARCHAR(100) NOT NULL,
    error_type          VARCHAR(150) NOT NULL,
    error_message       TEXT NOT NULL,
    stack_trace         LONGTEXT NULL,
    severity            ENUM('LOW', 'MEDIUM', 'HIGH', 'CRITICAL') NOT NULL,
    status              ENUM('OPEN', 'ACKNOWLEDGED', 'RESOLVED') NOT NULL DEFAULT 'OPEN',
    request_uri         VARCHAR(500),
    http_method         VARCHAR(10),
    ip_address          VARCHAR(45),
    is_deleted          BOOLEAN NOT NULL DEFAULT FALSE,
    occurred_at         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '장애 발생일시',
    acknowledged_at     DATETIME NULL COMMENT '장애 확인일시',
    resolved_at         DATETIME NULL COMMENT '장애 해결일시',
    created_at          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at          DATETIME NULL,
    CONSTRAINT fk_incident_member
        FOREIGN KEY (member_id) REFERENCES member(member_id),
    INDEX idx_incident_dashboard (is_deleted, status, severity, occurred_at),
    INDEX idx_incident_service (service_name, occurred_at)
) ENGINE=InnoDB;

-- 8. INCIDENT ANALYSIS
CREATE TABLE incident_analysis (
    analysis_id         BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    incident_id         BIGINT UNSIGNED NOT NULL,
    summary             TEXT NOT NULL,
    possible_cause      TEXT NULL,
    suggested_action    TEXT NULL,
    model_name          VARCHAR(100),
    is_deleted          BOOLEAN NOT NULL DEFAULT FALSE,
    created_at          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at          DATETIME NULL,
    CONSTRAINT fk_analysis_incident
        FOREIGN KEY (incident_id) REFERENCES incident(incident_id),
    INDEX idx_analysis_incident (incident_id, is_deleted)
) ENGINE=InnoDB;

-- 9. INCIDENT ALERT
-- Slack 등 알림 전송 기록. 감사/이력 성격이므로 일반 soft delete 대상에서 제외.
CREATE TABLE incident_alert (
    alert_id            BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    incident_id         BIGINT UNSIGNED NULL,
    alert_type          ENUM('INCIDENT', 'CRITICAL_ALERT', 'DAILY_SUMMARY') NOT NULL,
    channel_name        VARCHAR(100),
    message             TEXT NOT NULL,
    send_status         ENUM('PENDING', 'SUCCESS', 'FAILED') NOT NULL DEFAULT 'PENDING',
    error_message       VARCHAR(1000),
    sent_at             DATETIME NULL,
    created_at          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_alert_incident
        FOREIGN KEY (incident_id) REFERENCES incident(incident_id),
    INDEX idx_alert_status (alert_type, send_status, created_at)
) ENGINE=InnoDB;

-- 10. INCIDENT HISTORY
CREATE TABLE incident_history (
    history_id          BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    incident_id         BIGINT UNSIGNED NOT NULL,
    changed_by          BIGINT UNSIGNED NULL COMMENT '상태를 변경한 회원/관리자',
    previous_status     ENUM('OPEN', 'ACKNOWLEDGED', 'RESOLVED') NULL,
    new_status          ENUM('OPEN', 'ACKNOWLEDGED', 'RESOLVED') NOT NULL,
    note                VARCHAR(1000),
    changed_at          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_history_incident
        FOREIGN KEY (incident_id) REFERENCES incident(incident_id),
    CONSTRAINT fk_history_member
        FOREIGN KEY (changed_by) REFERENCES member(member_id),
    INDEX idx_incident_history (incident_id, changed_at)
) ENGINE=InnoDB;

-- 11. INCIDENT <-> INQUIRY
CREATE TABLE incident_inquiry (
    incident_inquiry_id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    incident_id         BIGINT UNSIGNED NOT NULL,
    inquiry_id          BIGINT UNSIGNED NOT NULL,
    linked_by           BIGINT UNSIGNED NULL COMMENT '문의와 장애를 연결한 회원/관리자',
    link_reason         VARCHAR(500),
    is_deleted          BOOLEAN NOT NULL DEFAULT FALSE,
    linked_at           DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at          DATETIME NULL,
    CONSTRAINT uq_incident_inquiry UNIQUE (incident_id, inquiry_id),
    CONSTRAINT fk_incident_inquiry_incident
        FOREIGN KEY (incident_id) REFERENCES incident(incident_id),
    CONSTRAINT fk_incident_inquiry_inquiry
        FOREIGN KEY (inquiry_id) REFERENCES inquiry(inquiry_id),
    CONSTRAINT fk_incident_inquiry_member
        FOREIGN KEY (linked_by) REFERENCES member(member_id),
    INDEX idx_incident_inquiry_incident (incident_id, is_deleted),
    INDEX idx_incident_inquiry_inquiry (inquiry_id, is_deleted)
) ENGINE=InnoDB;
