package com.reliablesystems.doctoroffice.util.common;

import com.reliablesystems.doctoroffice.core.utils.common.ApplicationKeys;
import org.apache.commons.io.IOUtils;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

public final class CommonUtil {
    private CommonUtil() {}

    /**
     * Method to find and read a image
     *
     * @param request Request of client
     * @param response Response generated
     * @param filePath Path of image
     */
    public static void findFileInServe(HttpServletRequest request, HttpServletResponse response, String filePath) {
        ServletContext context = request.getSession().getServletContext();
        String mimeType = context.getMimeType(filePath);
        InputStream inputStream = null;
        try {
            // Find profile picture
            inputStream = new FileInputStream(ApplicationKeys.PATH_SERVER_FILES + filePath);
        } catch (FileNotFoundException e) {
            try {
                // If patient have not profile picture, load avatar
                inputStream = new FileInputStream(ApplicationKeys.PATH_AVATAR_SERVER_IMAGE);
            } catch (FileNotFoundException e1) {
                e1.printStackTrace();
            }
        }
        byte[] fileContent = new byte[0];
        try {
            fileContent = IOUtils.toByteArray(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (mimeType == null) {
            // Binary when not exist
            mimeType = "application/octet-stream";
        }
        // Cont type
        response.setContentType(mimeType);
        response.setContentLength(fileContent.length);
        // Write in client
        try {
            response.getOutputStream().write(fileContent);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
