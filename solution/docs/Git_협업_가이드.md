# NEXORA Git Team Guide

## Branch

| 팀원 | Branch |
|---|---|
| 김순민 | `ksm` |
| 이현우 | `hw` |
| 유승민 | `sm` |
| 강인선 | `is` |
| 박서현 | `sh` |

`main`은 통합/제출 브랜치입니다. 개인 작업은 본인 브랜치에서 진행하고 PR로 `main`에 반영합니다.

## 기본 작업

```bash
git fetch origin
git checkout 본인브랜치
git pull origin 본인브랜치

# 작업 후
git status
git add .
git status
git commit -m "type: 작업 내용"
git push origin 본인브랜치
```

main의 최신 내용을 가져올 때:

```bash
git fetch origin
git checkout 본인브랜치
git merge origin/main
```

팀 프로젝트에서는 특별한 이유 없이 `git push --force`, `git reset --hard`, `git rebase`를 사용하지 않습니다.

## Commit Type

| Type | 용도 | 예 |
|---|---|---|
| `feat` | 새 기능 | `feat: 회원가입 기능 구현` |
| `fix` | 오류 수정 | `fix: 로그인 세션 오류 수정` |
| `refactor` | 기능 변화 없는 코드 개선 | `refactor: BoardDAO 조회 로직 개선` |
| `style` | CSS/UI/레이아웃 | `style: 게시판 모바일 UI 수정` |
| `docs` | 문서 | `docs: 요구사항 정의서 수정` |
| `db` | SQL/ERD/DB 구조 | `db: incident 테이블 생성` |
| `chore` | 환경/설정/기타 | `chore: context.xml Git 추적 제외` |
| `test` | 테스트 | `test: 회원가입 테스트 추가` |

Type은 파일 종류가 아니라 **작업 목적**으로 선택합니다.

## PR

PR에는 최소한 작업 내용과 확인 사항을 작성합니다.

```text
## 작업 내용
- 회원가입 기능 구현
- 이메일 중복 검사 추가

## 확인 사항
- 정상 가입 확인
- 중복 이메일 입력 확인
```

## DB 변경

공용 DB를 변경했다면 `database/01_schema.sql`, ERD, `데이터베이스_가이드.md`도 함께 갱신합니다.

## 보안

실제 `context.xml`, DB 비밀번호, AWS 자격 증명, API Key/Token, Slack Webhook URL은 commit하지 않습니다.  
`git add .` 후 `git status`로 commit 대상을 반드시 확인합니다.
