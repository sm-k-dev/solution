(function () {
    'use strict';

    document.addEventListener('click', function (event) {
        const button = event.target.closest('[data-board-reply]');
        if (!button) {
            return;
        }

        const parentCommentId = document.getElementById('parentCommentId');
        const replyNotice = document.getElementById('replyNotice');
        const commentContent = document.getElementById('commentContent');
        if (!parentCommentId || !replyNotice || !commentContent) {
            return;
        }

        parentCommentId.value = button.dataset.commentId;
        replyNotice.hidden = false;
        replyNotice.textContent = '@' + button.dataset.author + ' 님에게 답글 작성 중';
        commentContent.focus();
    });
}());
