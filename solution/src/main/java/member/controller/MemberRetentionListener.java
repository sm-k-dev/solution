package member.controller;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import member.dao.WithdrawnMemberCleanupDAO;
import member.service.WithdrawnMemberCleanupService;

/** 애플리케이션 실행 중 하루에 한 번 탈퇴 회원 보유 기간 만료 데이터를 정리합니다. */
public class MemberRetentionListener implements ServletContextListener {

    private static final Logger LOGGER = Logger.getLogger(MemberRetentionListener.class.getName());
    private static final long INITIAL_DELAY_MINUTES = 1L;
    private static final long CLEANUP_INTERVAL_HOURS = 24L;

    private ScheduledExecutorService scheduler;

    @Override
    public void contextInitialized(ServletContextEvent event) {
        ServletContext context = event.getServletContext();
        String boardUploadRoot = context.getRealPath("/WEB-INF/uploads/board");
        String inquiryUploadRoot = context.getRealPath("/WEB-INF/uploads/inquiry");

        try {
            WithdrawnMemberCleanupService cleanupService = new WithdrawnMemberCleanupService(
                new WithdrawnMemberCleanupDAO());
            scheduler = Executors.newSingleThreadScheduledExecutor(new CleanupThreadFactory());
            scheduler.scheduleWithFixedDelay(
                () -> runCleanup(cleanupService, boardUploadRoot, inquiryUploadRoot),
                INITIAL_DELAY_MINUTES,
                CLEANUP_INTERVAL_HOURS * 60L,
                TimeUnit.MINUTES);
        } catch (Exception error) {
            LOGGER.log(Level.SEVERE, "탈퇴 회원 정리 작업을 시작하지 못했습니다.", error);
        }
    }

    private void runCleanup(WithdrawnMemberCleanupService cleanupService,
        String boardUploadRoot, String inquiryUploadRoot) {
        try {
            int deletedCount = cleanupService.purgeExpiredMembers(boardUploadRoot, inquiryUploadRoot);
            if (deletedCount > 0) {
                LOGGER.info("보유 기간이 끝난 탈퇴 회원 " + deletedCount + "명을 정리했습니다.");
            }
        } catch (Exception error) {
            LOGGER.log(Level.SEVERE, "탈퇴 회원 정리 작업 중 오류가 발생했습니다.", error);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        if (scheduler != null) {
            scheduler.shutdownNow();
        }
    }

    private static final class CleanupThreadFactory implements ThreadFactory {
        @Override
        public Thread newThread(Runnable task) {
            Thread thread = new Thread(task, "nexora-member-retention-cleanup");
            thread.setDaemon(true);
            return thread;
        }
    }
}
