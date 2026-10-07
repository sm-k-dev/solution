package member.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import member.dao.WithdrawnMemberCleanupDAO;
import member.dao.WithdrawnMemberCleanupDAO.CleanupResult;

/** 탈퇴 회원의 DB 데이터와 실제 업로드 파일을 보유 기간 종료 후 정리합니다. */
public class WithdrawnMemberCleanupService {

    private static final Logger LOGGER = Logger.getLogger(WithdrawnMemberCleanupService.class.getName());
    private final WithdrawnMemberCleanupDAO cleanupDAO;

    public WithdrawnMemberCleanupService(WithdrawnMemberCleanupDAO cleanupDAO) {
        if (cleanupDAO == null) {
            throw new IllegalArgumentException("cleanupDAO is required");
        }
        this.cleanupDAO = cleanupDAO;
    }

    public int purgeExpiredMembers(String boardUploadRoot, String inquiryUploadRoot) throws Exception {
        Timestamp cutoff = Timestamp.valueOf(
            MemberRetentionPolicy.cleanupCutoff(LocalDateTime.now()));
        int totalDeleted = 0;

        while (true) {
            CleanupResult result = cleanupDAO.purgeBatch(cutoff);
            if (result.getDeletedMemberCount() == 0) {
                return totalDeleted;
            }

            totalDeleted += result.getDeletedMemberCount();
            deleteStoredFiles(boardUploadRoot, result.getBoardFileNames(), "게시판");
            deleteStoredFiles(inquiryUploadRoot, result.getInquiryFileNames(), "문의");
        }
    }

    private void deleteStoredFiles(String uploadRoot, List<String> savedNames, String type) {
        if (savedNames.isEmpty()) {
            return;
        }
        if (uploadRoot == null || uploadRoot.trim().isEmpty()) {
            LOGGER.warning(type + " 첨부파일 저장 경로를 확인할 수 없어 실제 파일 정리를 건너뜁니다.");
            return;
        }

        try {
            File baseDirectory = new File(uploadRoot).getCanonicalFile();
            String allowedPrefix = baseDirectory.getPath() + File.separator;

            for (String savedName : savedNames) {
                try {
                    File target = new File(baseDirectory, savedName).getCanonicalFile();
                    if (!target.getPath().startsWith(allowedPrefix)) {
                        LOGGER.warning("허용된 업로드 경로 밖의 파일 삭제 요청을 차단했습니다: " + savedName);
                        continue;
                    }
                    Files.deleteIfExists(target.toPath());
                } catch (IOException error) {
                    LOGGER.log(Level.WARNING, type + " 첨부파일을 삭제하지 못했습니다: " + savedName, error);
                }
            }
        } catch (IOException error) {
            LOGGER.log(Level.WARNING, type + " 첨부파일 저장 경로를 확인하지 못했습니다.", error);
        }
    }
}
