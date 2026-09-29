package sentinel.controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import sentinel.service.IncidentRecorder;

public class IncidentFilter implements Filter {
    private final IncidentRecorder recorder = new IncidentRecorder();

    @Override public void init(FilterConfig config) { }
    @Override public void destroy() { }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        if (!(request instanceof HttpServletRequest) || !(response instanceof HttpServletResponse)) {
            chain.doFilter(request, response);
            return;
        }
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        request.setCharacterEncoding("UTF-8");
        StatusResponse wrapped = new StatusResponse((HttpServletResponse) response);
        try {
            chain.doFilter(request, wrapped);
        } catch (IOException | ServletException | RuntimeException error) {
            recorder.record(httpRequest, error, 500);
            throw error;
        }
        if (wrapped.getStatus() >= 500) {
            recorder.record(httpRequest, null, wrapped.getStatus());
        }
    }

    private static class StatusResponse extends HttpServletResponseWrapper {
        private int status;
        StatusResponse(HttpServletResponse response) {
            super(response);
            status = response.getStatus();
        }
        @Override public void setStatus(int code) { status = code; super.setStatus(code); }
        @Override public void sendError(int code) throws IOException { status = code; super.sendError(code); }
        @Override public void sendError(int code, String message) throws IOException {
            status = code; super.sendError(code, message);
        }
        @Override public void sendRedirect(String location) throws IOException {
            status = HttpServletResponse.SC_FOUND;
            super.sendRedirect(location);
        }
        @Override public int getStatus() { return status; }
    }
}
