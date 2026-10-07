(function () {
    'use strict';

    const errors = {
        400: '입력값을 확인해 주세요.',
        403: '로그인 또는 보안 토큰이 만료됐습니다. 새로고침 후 다시 시도해 주세요.',
        404: '대상을 찾을 수 없습니다.',
        409: '다른 요청으로 상태가 변경됐습니다. 새로고침 후 확인해 주세요.',
        502: '분석 서버가 응답하지 않습니다. 잠시 후 다시 시도해 주세요.'
    };

    function post(url, parameters) {
        return fetch(url, {
            method: 'POST',
            credentials: 'same-origin',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded;charset=UTF-8',
                'X-Requested-With': 'fetch'
            },
            body: parameters.toString()
        });
    }

    async function runAdminAction(button) {
        if (button.disabled || (button.dataset.confirm && !window.confirm(button.dataset.confirm))) {
            return;
        }

        const fields = button.closest('[data-admin-fields]');
        const inquiryId = fields && fields.querySelector('[name="inquiryId"]');
        const reason = fields && fields.querySelector('[name="reason"]');
        if (inquiryId && !inquiryId.reportValidity()) {
            return;
        }

        const parameters = new URLSearchParams();
        ['id', 'expectedStatus', 'newStatus', 'inquiryId'].forEach(function (name) {
            if (button.dataset[name]) {
                parameters.set(name, button.dataset[name]);
            }
        });
        if (button.dataset.csrf) {
            parameters.set('csrfToken', button.dataset.csrf);
        }
        if (inquiryId) {
            parameters.set('inquiryId', inquiryId.value);
            parameters.set('reason', reason ? reason.value : '');
        }

        button.disabled = true;
        button.setAttribute('aria-busy', 'true');
        try {
            const response = await post(button.dataset.adminAction, parameters);
            if (!response.ok) {
                throw new Error(errors[response.status] || '요청 처리 중 오류가 발생했습니다. (HTTP ' + response.status + ')');
            }
            if (button.dataset.resultParam) {
                const header = button.dataset.resultHeader || 'X-Operation-Result';
                const query = new URLSearchParams();
                query.set(button.dataset.resultParam, response.headers.get(header) || 'skipped');
                window.location.search = query.toString();
                return;
            }
            window.location.reload();
        } catch (error) {
            window.alert(error.message);
            button.disabled = false;
            button.removeAttribute('aria-busy');
        }
    }

    async function runMemberAction(button) {
        if (button.disabled || (button.dataset.confirm && !window.confirm(button.dataset.confirm))) {
            return;
        }
        const parameters = new URLSearchParams({
            memberId: button.dataset.memberId,
            csrfToken: button.dataset.csrf,
            ajax: 'true'
        });
        parameters.set(button.dataset.field, button.dataset.value);
        button.disabled = true;
        try {
            const response = await post(button.dataset.memberAction, parameters);
            const result = await response.json();
            if (!response.ok || !result.ok) {
                throw new Error(result.message || '회원 관리 요청에 실패했습니다.');
            }
            const page = button.closest('.admin-inquiry-page');
            const notice = page && page.querySelector('[data-member-action-notice]');
            if (notice) {
                notice.textContent = result.message;
                notice.hidden = false;
            }
            window.setTimeout(function () { window.location.reload(); }, 500);
        } catch (error) {
            window.alert(error.message || '회원 관리 요청에 실패했습니다.');
            button.disabled = false;
        }
    }

    document.addEventListener('click', function (event) {
        const adminButton = event.target.closest('[data-admin-action]');
        if (adminButton) {
            runAdminAction(adminButton);
            return;
        }
        const memberButton = event.target.closest('[data-member-action]');
        if (memberButton) {
            runMemberAction(memberButton);
        }
    });
}());
