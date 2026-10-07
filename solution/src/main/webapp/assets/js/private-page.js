(function () {
    "use strict";

    // A back/forward-cache snapshot can outlive the session that produced it.
    // Reload restored private pages so the server rechecks authentication.
    window.addEventListener("pageshow", function (event) {
        if (event.persisted) {
            window.location.reload();
        }
    });
})();
