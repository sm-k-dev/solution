package common.web;

import javax.servlet.http.HttpServletResponse;

/** Adds conservative response headers for pages containing session-specific data. */
public final class CacheControlSupport {

    private CacheControlSupport() {
    }

    public static void preventCaching(HttpServletResponse response) {
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, private");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0L);
    }
}
