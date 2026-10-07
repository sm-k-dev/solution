package common.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

/** Serves private uploaded files as downloads after validating their storage path. */
public final class FileDownloadSupport {

    private FileDownloadSupport() {
    }

    public static boolean writeAttachment(ServletContext context, HttpServletResponse response,
        String directoryPath, String savedName, String originalName) throws IOException {
        String realPath = context.getRealPath(directoryPath);
        if (realPath == null || savedName == null || savedName.contains("/")
        || savedName.contains("\\")) {
            return false;
        }

        File directory = new File(realPath).getCanonicalFile();
        File file = new File(directory, savedName).getCanonicalFile();
        if (!file.getPath().startsWith(directory.getPath() + File.separator) || !file.isFile()) {
            return false;
        }

        String encodedName = URLEncoder.encode(originalName, "UTF-8").replace("+", "%20");
        response.setContentType("application/octet-stream");
        response.setHeader("X-Content-Type-Options", "nosniff");
        response.setHeader("Content-Disposition", "attachment; filename*=UTF-8''" + encodedName);
        response.setContentLength((int) Math.min(Integer.MAX_VALUE, file.length()));
        try (InputStream input = new FileInputStream(file);
        OutputStream output = response.getOutputStream()) {
            byte[] buffer = new byte[8192];
            int length;
            while ((length = input.read(buffer)) != -1) {
                output.write(buffer, 0, length);
            }
        }
        return true;
    }
}
