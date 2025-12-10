package com.users.servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import com.conn.DBConnect;
import com.dao.UserProfileDAO;
import com.entity.UserProfile;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/uploadAvatar")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 1,
	    maxFileSize = 1024 * 1024 * 10,      
	    maxRequestSize = 1024 * 1024 * 15    
	)
public class UploadAvatarServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

        Part filePart = req.getPart("avatar");
        int userId = Integer.parseInt(req.getParameter("userId"));

        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        
        String uploadPath = getServletContext().getRealPath("") + "user-avatars";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        String dbPath = "user-avatars/" + fileName;

        UserProfileDAO dao = new UserProfileDAO(DBConnect.getConn());
        
        dao.updateAvatar(userId, dbPath);

        UserProfile profile = dao.getProfileByUserId(userId);
        req.getSession().setAttribute("profile", profile);

        resp.sendRedirect("profile.jsp");
    }
}
