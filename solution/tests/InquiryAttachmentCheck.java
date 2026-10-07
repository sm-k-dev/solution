import inquiry.service.InquiryAttachmentService;

public class InquiryAttachmentCheck {
    public static void main(String[] args) {
        String normalized = InquiryAttachmentService.normalizeOriginalName(
            "C:\\private\\folder\\report.pdf");
        if (!"report.pdf".equals(normalized)) {
            throw new AssertionError("Upload paths must not be retained as filenames");
        }
        if (!InquiryAttachmentService.isAllowedExtension("report.PDF")) {
            throw new AssertionError("Allowed extension check should ignore case");
        }
        if (InquiryAttachmentService.isAllowedExtension("../../script.jsp")) {
            throw new AssertionError("Executable file extensions must be rejected");
        }
        String sanitized = InquiryAttachmentService.normalizeOriginalName("../\nreport.pdf");
        if (sanitized.contains("\n") || sanitized.contains("/")) {
            throw new AssertionError("Control characters and path segments must be removed");
        }
        System.out.println("Inquiry attachment checks passed");
    }
}
