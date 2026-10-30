package inquiry.service;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import inquiry.dao.InquiryDAO;
import inquiry.dto.InquiryDTO;

public class InquiryService {
    private static final Set<String> CATEGORIES = new HashSet<String>(Arrays.asList(
        "GENERAL", "TECHNICAL", "ACCOUNT", "PAYMENT", "SECURITY", "OTHER"));
    private final InquiryDAO inquiryDAO;

    public InquiryService(InquiryDAO inquiryDAO) {
        this.inquiryDAO = inquiryDAO;
    }

    public long createInquiry(InquiryDTO inquiry) throws SQLException {
        inquiry.setContactName(required(inquiry.getContactName(), "이름", 100));
        inquiry.setContactEmail(required(inquiry.getContactEmail(), "이메일", 150));
        inquiry.setCompanyName(optional(inquiry.getCompanyName(), 150));
        inquiry.setTitle(required(inquiry.getTitle(), "제목", 200));
        inquiry.setContent(required(inquiry.getContent(), "문의 내용", 10000));
        String category = required(inquiry.getCategory(), "문의 유형", 20);
        if (!CATEGORIES.contains(category)) {
            throw new IllegalArgumentException("문의 유형을 확인해 주세요.");
        }
        inquiry.setCategory(category);
        if (!inquiry.getContactEmail().matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")) {
            throw new IllegalArgumentException("이메일 주소를 확인해 주세요.");
        }
        return inquiryDAO.insertInquiry(inquiry);
    }

    public List<InquiryDTO> findAllInquiries() throws SQLException {
        return inquiryDAO.findAllInquiries();
    }

    public List<InquiryDTO> findRecentInquiries(int limit) throws SQLException {
        return inquiryDAO.findRecentInquiries(limit);
    }

    public int countByStatus(String status) throws SQLException {
        return inquiryDAO.countByStatus(status);
    }

    public List<InquiryDTO> findRecentInquirySummaries(int limit) throws SQLException {
        return inquiryDAO.findRecentInquirySummaries(limit);
    }

    public Map<String, Integer> countDashboardStatuses() throws SQLException {
        return inquiryDAO.countDashboardStatuses();
    }

    public List<InquiryDTO> findInquiriesByMember(long memberId) throws SQLException {
        return inquiryDAO.findInquiriesByMember(memberId);
    }

    public int countByMemberId(long memberId) throws SQLException {

        if (memberId < 1) {
            return 0;
        }

        return inquiryDAO.countByMemberId(memberId);
    }
    // === countByMemberId Method

    public int countCompletedByMemberId(long memberId) throws SQLException {

        if (memberId < 1) {
            return 0;
        }

        return inquiryDAO.countCompletedByMemberId(memberId);
    }
    // === countCompletedByMemberId Method

    public int countInProgressByMemberId(long memberId) throws SQLException {

        if (memberId < 1) {

            return 0;
        }

        return inquiryDAO.countInProgressByMemberId(memberId);
    }
    // === countInProgressByMemberId Method

    public InquiryDTO findInquiryById(long inquiryId) throws SQLException {
        return inquiryDAO.findInquiryById(inquiryId);
    }

    public boolean answerInquiry(long inquiryId, long adminId, String answer, String status) throws SQLException {
        String normalizedAnswer = required(answer, "답변", 10000);
        if (!"IN_PROGRESS".equals(status) && !"COMPLETED".equals(status)) {
            throw new IllegalArgumentException("문의 상태를 확인해 주세요.");
        }
        return inquiryDAO.updateAnswer(inquiryId, adminId, normalizedAnswer, status);
    }

    private String required(String value, String label, int maxLength) {
        if (value == null || value.trim().isEmpty()) {
            throw new IllegalArgumentException(label + "을(를) 입력해 주세요.");
        }
        String normalized = value.trim();
        if (normalized.length() > maxLength) {
            throw new IllegalArgumentException(label + "은(는) "  + maxLength + "자 이내로 입력해 주세요.");
        }
        return normalized;
    }

    private String optional(String value, int maxLength) {
        if (value == null || value.trim().isEmpty()) {
            return null;
        }
        String normalized = value.trim();
        if (normalized.length() > maxLength) {
            throw new IllegalArgumentException("회사명은 "  + maxLength + "자 이내로 입력해 주세요.");
        }
        return normalized;
    }
}
