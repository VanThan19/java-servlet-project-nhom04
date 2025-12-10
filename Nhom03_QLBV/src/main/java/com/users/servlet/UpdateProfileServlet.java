package com.users.servlet;

import java.io.IOException;
import java.sql.Connection;

import com.conn.DBConnect;
import com.dao.UserProfileDAO;
import com.entity.UserProfile;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		int userId = Integer.parseInt(req.getParameter("userId"));
        String gender = req.getParameter("gender");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String insurance = req.getParameter("insurance");
        String dob = req.getParameter("dob");

        Connection conn = DBConnect.getConn();
        UserProfileDAO dao = new UserProfileDAO(conn);

        UserProfile profile = new UserProfile();
        profile.setUserId(userId);
        profile.setGender(gender);
        profile.setPhone(phone);
        profile.setAddress(address);
        profile.setInsuranceNumber(insurance);

        try {
            profile.setDob(java.sql.Date.valueOf(dob));
        } catch (Exception e) {
            profile.setDob(null);
        }

        boolean updated = dao.updateProfile(profile);

        HttpSession session = req.getSession();
        if (updated) {
            session.setAttribute("succMsg", "Cập nhật thành công");
        } else {
            session.setAttribute("errorMsg", "Cập nhật thất bại");
        }

        resp.sendRedirect("profile.jsp");
	}
	

}
