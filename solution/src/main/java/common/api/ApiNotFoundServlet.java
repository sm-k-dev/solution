package common.api;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** /api/* 아래에서 정의되지 않은 경로를 HTML 오류 페이지 대신 JSON 404로 응답합니다. */
public class ApiNotFoundServlet extends JsonApiServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected String allowedMethods() {
        return "GET, POST, PUT, PATCH, DELETE";
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        prepareJsonResponse(response);
        writeError(response, HttpServletResponse.SC_NOT_FOUND,
            "NOT_FOUND", "The requested API endpoint does not exist.");
    }
}
