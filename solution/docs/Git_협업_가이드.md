# NEXORA Git 협업 가이드

## 1. 브랜치 구성

| 담당자 | 개인 Branch | 담당 영역(계획) |
|---|---|---|
| 김순민 | `ksm` | 팀 통합, SentinelOps·Security 탐지·기록 파이프라인 |
| 유승민 | `sm` | SentinelOps·Security 관제·분석·알림·대응 |
| 강인선 | `is` | Member |
| 이현우 | `hw` | Community Board |
| 박서현 | `sh` | Inquiry |
| 팀 공용 | `team` | 기능 통합 및 공동 테스트 |
| 최종 제출 | `main` | 최종 검증 후 반영하는 보호 브랜치 |

개인 브랜치에서 작업하고 Pull Request(PR)로 `team`에 반영합니다. `team` 통합 테스트와 검토가 끝나기 전에는 `main`에 반영하지 않습니다. 팀 역할과 실제 기여 증거 기준은 `팀원_역할_분담(3).md`를 참고합니다.

## 2. 기본 작업 흐름

개인 브랜치에서 최신 변경을 받고 작업합니다. 아래 예시는 김순민의 `ksm` 기준이며, 다른 팀원은 자신의 브랜치 이름으로 바꿉니다.

```bash
# 원격 브랜치 정보 갱신
git fetch origin

# 본인 브랜치로 이동하고 원격 변경 반영
git switch ksm
git pull --ff-only origin ksm

# 작업 후 변경 사항 확인
git status -sb
git diff

# 필요한 파일만 stage하고 stage 결과 재확인
git add 경로/파일명
git diff --cached

# 커밋과 push
git commit -m "feat: 보안 위협 이벤트 기록 추가"
git push origin ksm
```

팀 통합 브랜치의 최신 내용을 개인 브랜치로 가져오려면 다음처럼 합니다. 먼저 현재 작업을 commit하거나 안전하게 보관하고, 올바른 개인 브랜치에 있는지 확인합니다.

```bash
git fetch origin
git switch ksm
git merge origin/team
```

`git fetch`는 원격 정보만 갱신하고 현재 작업 파일을 바꾸지 않습니다. `git pull`은 현재 브랜치에 원격 변경을 반영합니다. 명령을 실행하기 전에 `git status -sb`로 브랜치와 미커밋 작업을 확인합니다.

팀 프로젝트에서는 특별한 사유와 팀 합의 없이 `git push --force`, `git reset --hard`, `git rebase`를 사용하지 않습니다.

## 3. 커밋 메시지 규칙

형식은 `type: 한글로 작업 요약`입니다. Type은 파일 종류가 아니라 작업 목적에 맞춰 선택합니다.

| Type | 용도 | 예시 |
|---|---|---|
| `feat` | 새 기능 | `feat: 문의 답변 기능 구현` |
| `fix` | 오류 수정 | `fix: 회원 세션 만료 처리 수정` |
| `refactor` | 기능 변화 없는 구조 개선 | `refactor: 공통 API 인증 로직 분리` |
| `style` | CSS·화면·레이아웃 변경 | `style: 관리자 관제 화면 정렬 수정` |
| `docs` | 문서 수정 | `docs: 팀원 역할 분담과 Git 규칙 갱신` |
| `db` | SQL·ERD·DB 구조 변경 | `db: Security 이벤트 인덱스 추가` |
| `test` | 테스트 추가·수정 | `test: Security 이벤트 조회 검증 추가` |
| `chore` | 환경·설정·기타 작업 | `chore: 개발 환경 설정 정리` |

여러 작업이 서로 독립적이면 가능한 한 커밋을 나눕니다. 메시지는 실제 변경과 일치하게 작성합니다.

## 4. Pull Request 규칙

PR의 base는 `team`, compare는 본인 작업 브랜치로 설정합니다. PR에는 작업 내용, 영향 범위, 실행한 테스트와 남은 확인 사항을 기록합니다. 공통 파일이나 DB를 수정했다면 해당 사실과 함께 확인 방법을 씁니다.

```text
## 작업 내용
- Security 이벤트 목록·상세 조회 구현
- 공통 API 인증 사용

## 확인 사항
- 전체 Java 컴파일
- API 목록·상세 및 인증 실패 응답 확인

## 영향 범위 / 남은 확인
- web.xml URL 매핑 추가
- Tomcat·DB 연결 통합 테스트 필요
```

충돌 해결 후에는 파일 내용과 `git status`를 확인하고, 테스트를 다시 실행한 뒤 PR을 갱신합니다.

## 5. DB 변경

공용 DB 구조나 샘플 데이터를 바꾸면 `database/01_schema.sql`, `database/02_sample_data.sql`, ERD와 `docs/데이터베이스_가이드.md`를 함께 검토합니다. 기존 데이터에 미치는 영향과 새 DB에서의 실행 순서도 PR에 적습니다.

## 6. 보안 및 stage 점검

실제 `context.xml`, DB 비밀번호, AWS 자격 증명, API Key/Token, Slack Webhook URL은 commit하지 않습니다. `.class`, `build/`, Tomcat 임시 파일도 포함하지 않습니다.

`git add .`를 무심코 사용하지 말고, 커밋 전에 아래 명령으로 stage 대상을 확인합니다.

```bash
git status -sb
git diff --cached --name-status
git diff --cached
```
