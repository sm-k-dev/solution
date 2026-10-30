package admin.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import inquiry.dao.InquiryDAO;
import inquiry.service.InquiryService;
import admin.dao.AdminMemberDAO;
import board.dao.BoardDAO;
import sentinel.dao.IncidentManagementDAO;

public class AdminDashboardController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private InquiryService inquiryService;
    private AdminMemberDAO memberDAO;
    private BoardDAO boardDAO;
    private IncidentManagementDAO incidentDAO;

    @Override
    public void init() throws ServletException {
        try {
            inquiryService = new InquiryService(new InquiryDAO());
            memberDAO = new AdminMemberDAO();
            boardDAO = new BoardDAO();
            incidentDAO = new IncidentManagementDAO();
        } catch (NamingException error) {
            throw new ServletException("관리자 대시보드 DB 자원을 찾지 못했습니다.", error);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Map<String, Integer> inquiryCounts = inquiryService.countDashboardStatuses();
            int received = value(inquiryCounts, "RECEIVED");
            request.setAttribute("recentInquiries", inquiryService.findRecentInquirySummaries(4));
            request.setAttribute("newInquiryCount", Integer.valueOf(received));
            request.setAttribute("pendingInquiryCount", Integer.valueOf(received + value(inquiryCounts, "IN_PROGRESS")));
            request.setAttribute("memberCount", Integer.valueOf(memberDAO.countAll()));
            request.setAttribute("boardCount", Integer.valueOf(boardDAO.countAll()));
            Map<String, Integer> incidentCounts = incidentDAO.findDashboardCounts();
            int low = value(incidentCounts, "low"), medium = value(incidentCounts, "medium"), high = value(incidentCounts, "high"), critical = value(incidentCounts, "critical");
            int total = value(incidentCounts, "total");
            request.setAttribute("openIncidentCount", Integer.valueOf(value(incidentCounts, "open")));
            request.setAttribute("criticalIncidentCount", Integer.valueOf(critical));
            request.setAttribute("incidentCount", Integer.valueOf(total));
            request.setAttribute("recentIncidents", incidentDAO.findRecentIncidentSummaries(5));
            request.setAttribute("lowIncidentCount", Integer.valueOf(low));
            request.setAttribute("mediumIncidentCount", Integer.valueOf(medium));
            request.setAttribute("highIncidentCount", Integer.valueOf(high));
            request.setAttribute("lowIncidentPercent", percent(low, total));
            request.setAttribute("mediumIncidentPercent", percent(medium, total));
            request.setAttribute("highIncidentPercent", percent(high, total));
            request.setAttribute("criticalIncidentPercent", percent(critical, total));
            request.setAttribute("dailyIncidentStats", dailyStats(incidentDAO.countByDay(7)));
            request.getRequestDispatcher("/admin/admin.jsp").forward(request, response);
        } catch (Exception error) {
            throw new ServletException("관리자 대시보드 문의 요약 조회 중 오류", error);
        }
    }

    private int value(Map<String, Integer> values, String key) {
        Integer value = values.get(key);
        return value == null ? 0 : value.intValue();
    }

    private String percent(int count, int total) {
        return total == 0?"0.0":String.format(Locale.ROOT, "%.1f", count*100.0/total);
    }

    private List<Map<String, Object>> dailyStats(Map<String, Integer> counts) {
        List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
        Calendar day = Calendar.getInstance();
        day.add(Calendar.DATE, -6);
        SimpleDateFormat key = new SimpleDateFormat("yyyy-MM-dd", Locale.ROOT);
        SimpleDateFormat label = new SimpleDateFormat("MM-dd", Locale.ROOT);
        int max = 1;
        for (int i = 0;i < 7;i++) {
            String date = key.format(day.getTime());
            int count = counts.containsKey(date) ? counts.get(date).intValue() : 0;
            max = Math.max(max, count);
            Map<String, Object> item = new HashMap<String, Object>();
            item.put("date", date);
            item.put("label", label.format(day.getTime()));
            item.put("count", Integer.valueOf(count));
            result.add(item);
            day.add(Calendar.DATE, 1);
        }
        for (Map<String, Object> item : result) {
            int count = ((Integer) item.get("count")).intValue();
            item.put("height", Integer.valueOf(count == 0 ? 2 : Math.max(8, count*100/max)));
        }
        return result;
    }
}
