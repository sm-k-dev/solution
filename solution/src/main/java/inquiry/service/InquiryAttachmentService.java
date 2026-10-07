package inquiry.service;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;
import inquiry.dto.InquiryFileDTO;

public class InquiryAttachmentService {
    private static final int MAX_FILE_COUNT = 5;
    private static final long MAX_FILE_SIZE = 10L * 1024L * 1024L;
    private static final String UPLOAD_WEB_PATH = "/WEB-INF/uploads/inquiry";
    private static final Set<String> ALLOWED_EXTENSIONS = new HashSet<String>(Arrays.asList(
        "pdf", "png", "jpg", "jpeg", "gif", "txt", "csv", "doc", "docx", "xls", "xlsx",
        "ppt", "pptx", "zip"));

    public List<InquiryFileDTO> store(HttpServletRequest request)
    throws IOException, ServletException {
        java.util.Collection<Part> parts = request.getParts();
        List<Part> selected = new ArrayList<Part>();
        for (Part part : parts) {
            if ("attachments".equals(part.getName()) && hasFileName(submittedFileName(part))) {
                selected.add(part);
            }
        }
        if (selected.size() > MAX_FILE_COUNT) {
            throw new IllegalArgumentException("첨부파일은 최대 5개까지 등록할 수 있습니다.");
        }

        String realPath = request.getServletContext().getRealPath(UPLOAD_WEB_PATH);
        if (realPath == null) {
            throw new IOException("문의 첨부파일 저장 경로를 확인할 수 없습니다.");
        }
        Path directory = Path.of(realPath).toAbsolutePath().normalize();
        Files.createDirectories(directory);
        List<InquiryFileDTO> stored = new ArrayList<InquiryFileDTO>();
        try {
            for (Part part : selected) {
                if (part.getSize() > MAX_FILE_SIZE) {
                    throw new IllegalArgumentException("파일 하나의 크기는 10MB 이하여야 합니다.");
                }
                String originalName = normalizeOriginalName(submittedFileName(part));
                String extension = extensionOf(originalName);
                if (!ALLOWED_EXTENSIONS.contains(extension)) {
                    throw new IllegalArgumentException("지원하지 않는 첨부파일 형식입니다.");
                }

                String savedName = UUID.randomUUID().toString() + "."  + extension;
                Path destination = directory.resolve(savedName).normalize();
                if (!destination.startsWith(directory)) {
                    throw new IllegalArgumentException("첨부파일 이름을 확인해 주세요.");
                }
                try (InputStream input = part.getInputStream()) {
                    Files.copy(input, destination);
                }

                InquiryFileDTO file = new InquiryFileDTO();
                file.setOriginalName(originalName);
                file.setSavedName(savedName);
                file.setFilePath(UPLOAD_WEB_PATH + "/"  + savedName);
                file.setFileSize(part.getSize());
                file.setFileType(part.getContentType());
                stored.add(file);
            }
            return stored;
        } catch (IOException | RuntimeException error) {
            deleteFiles(request.getServletContext(), stored);
            throw error;
        }
    }

    public void deleteFiles(ServletContext context, List<InquiryFileDTO> files) {
        if (files == null || files.isEmpty()) {
            return;
        }
        String realPath = context.getRealPath(UPLOAD_WEB_PATH);
        if (realPath == null) {
            return;
        }
        Path directory = Path.of(realPath).toAbsolutePath().normalize();
        for (InquiryFileDTO file : files) {
            Path path = directory.resolve(file.getSavedName()).normalize();
            if (path.startsWith(directory)) {
                try {
                    Files.deleteIfExists(path);
                } catch (IOException ignored) {
                    context.log("문의 첨부파일 정리 실패", ignored);
                }
            }
        }
    }

    public static boolean hasFileName(String fileName) {
        return fileName != null && !fileName.trim().isEmpty();
    }

    private String submittedFileName(Part part) {
        String header = part.getHeader("content-disposition");
        if (header == null) {
            return null;
        }
        for (String token : header.split(";")) {
            String value = token.trim();
            if (value.startsWith("filename=")) {
                String name = value.substring("filename=".length()).trim();
                if (name.startsWith("\"") && name.endsWith("\"") && name.length() > 1) {
                    return name.substring(1, name.length() - 1);
                }
                return name;
            }
        }
        return null;
    }

    public static String normalizeOriginalName(String submittedName) {
        if (!hasFileName(submittedName)) {
            throw new IllegalArgumentException("첨부파일 이름을 확인해 주세요.");
        }
        String normalized = submittedName.replace('\\', '/');
        normalized = normalized.substring(normalized.lastIndexOf('/') + 1);
        normalized = normalized.replaceAll("[\\p{Cntrl}]", "_").trim();
        if (normalized.isEmpty()) {
            throw new IllegalArgumentException("첨부파일 이름을 확인해 주세요.");
        }
        if (normalized.length() > 255) {
            normalized = normalized.substring(normalized.length() - 255);
        }
        return normalized;
    }

    public static String extensionOf(String fileName) {
        int dot = fileName.lastIndexOf('.');
        if (dot < 1 || dot == fileName.length() - 1) {
            return "";
        }
        return fileName.substring(dot + 1).toLowerCase(Locale.ROOT);
    }

    public static boolean isAllowedExtension(String fileName) {
        return ALLOWED_EXTENSIONS.contains(extensionOf(normalizeOriginalName(fileName)));
    }
}
