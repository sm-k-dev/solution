package common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** Builds the shared branded error page model without changing the HTTP status. */
public final class ErrorPageModel {

    private ErrorPageModel() {
    }

    public static void populate(HttpServletRequest request, HttpServletResponse response) {
        Object statusValue = request.getAttribute("javax.servlet.error.status_code");
        int status = statusValue instanceof Number ? ((Number) statusValue).intValue() : 500;
        String title;
        String description;
        String label;

        switch (status) {
        case 400:
            title = "요청 내용을 확인해주세요";
            description = "입력값이 올바르지 않거나 처리할 수 없는 요청입니다. 내용을 확인한 뒤 다시 시도해주세요.";
            label = "INVALID REQUEST";
            break;
        case 401:
            title = "로그인이 필요한 화면입니다";
            description = "세션이 만료되었거나 인증되지 않은 요청입니다. 다시 로그인한 뒤 이용해주세요.";
            label = "AUTHENTICATION REQUIRED";
            break;
        case 403:
            title = "접근이 허용되지 않았습니다";
            description = "현재 계정에는 이 화면을 이용할 권한이 없습니다. 필요한 경우 관리자에게 권한을 요청해주세요.";
            label = "ACCESS DENIED";
            break;
        case 404:
            title = "요청한 페이지를 찾지 못했습니다";
            description = "주소가 변경되었거나 삭제된 페이지일 수 있습니다. 메뉴에서 원하는 기능을 다시 선택해주세요.";
            label = "PAGE NOT FOUND";
            break;
        case 405:
            title = "지원하지 않는 요청 방식입니다";
            description = "현재 주소에서는 해당 요청 방식을 사용할 수 없습니다. 이전 화면으로 돌아가 다시 진행해주세요.";
            label = "METHOD NOT ALLOWED";
            break;
        case 408:
            title = "요청 시간이 초과되었습니다";
            description = "네트워크 지연 또는 긴 처리 시간으로 요청이 종료되었습니다. "
                + "연결 상태를 확인한 뒤 다시 시도해주세요.";
            label = "REQUEST TIMEOUT";
            break;
        case 409:
            title = "요청한 변경사항을 적용하지 못했습니다";
            description = "다른 요청으로 데이터 상태가 변경됐습니다. 화면을 새로고침한 뒤 다시 확인해주세요.";
            label = "REQUEST CONFLICT";
            break;
        case 413:
            title = "첨부파일 용량이 너무 큽니다";
            description = "요청 크기 제한을 초과했습니다. 파일 크기를 줄인 뒤 다시 시도해주세요.";
            label = "PAYLOAD TOO LARGE";
            break;
        case 415:
            title = "지원하지 않는 파일 형식입니다";
            description = "현재 요청에서 사용할 수 없는 콘텐츠 형식입니다. 파일 형식이나 요청 내용을 확인해주세요.";
            label = "UNSUPPORTED MEDIA TYPE";
            break;
        case 429:
            title = "잠시 후 다시 요청해주세요";
            description = "짧은 시간에 요청이 많이 발생했습니다. 잠시 기다린 뒤 다시 이용해주세요.";
            label = "RATE LIMIT";
            break;
        case 501:
            title = "아직 제공하지 않는 기능입니다";
            description = "요청한 기능을 현재 서비스에서 처리할 수 없습니다.";
            label = "NOT IMPLEMENTED";
            break;
        case 502:
            title = "연결된 서비스의 응답을 확인하고 있습니다";
            description = "외부 또는 내부 연동 서비스에서 올바른 응답을 받지 못했습니다. 잠시 후 다시 시도해주세요.";
            label = "BAD GATEWAY";
            break;
        case 503:
            title = "서비스를 점검하고 있습니다";
            description = "더 안정적인 서비스를 위해 잠시 점검 중입니다. 잠시 후 다시 접속해주세요.";
            label = "MAINTENANCE";
            break;
        case 504:
            title = "연결된 서비스의 응답이 지연되고 있습니다";
            description = "연동 서비스의 응답 대기 시간이 초과되었습니다. 요청 상태를 확인한 뒤 다시 시도해주세요.";
            label = "GATEWAY TIMEOUT";
            break;
        case 505:
            title = "지원하지 않는 HTTP 버전입니다";
            description = "브라우저 또는 클라이언트의 연결 방식을 확인한 뒤 다시 시도해주세요.";
            label = "HTTP VERSION NOT SUPPORTED";
            break;
        case 507:
            title = "저장 공간이 부족합니다";
            description = "요청을 처리할 저장 공간이 부족합니다. 잠시 후 다시 시도해주세요.";
            label = "INSUFFICIENT STORAGE";
            break;
        case 500:
        default:
            status = 500;
            title = "시스템을 안전하게 복구하고 있습니다";
            description = "일시적인 오류가 감지되어 SentinelOps가 기록을 남겼습니다. 잠시 후 다시 시도해주세요.";
            label = "SYSTEM INCIDENT";
            break;
        }

        request.setAttribute("errorStatus", Integer.valueOf(status));
        request.setAttribute("errorTitle", title);
        request.setAttribute("errorDescription", description);
        request.setAttribute("errorLabel", label);
        request.setAttribute("errorAccent", Integer.toString(status));
        Object errorUri = request.getAttribute("javax.servlet.error.request_uri");
        request.setAttribute("errorUri", errorUri == null ? request.getRequestURI() : errorUri);
        response.setStatus(status);
    }
}
