package com.doctor.servlet;

import java.io.IOException;

import com.conn.DBConnect;
import com.dao.DoctorDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/doctorChangePassword")
public class DoctorPasswordChange extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		int did = Integer.parseInt(req.getParameter("did"));
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");
		
		DoctorDAO dao = new DoctorDAO(DBConnect.getConn());
		HttpSession session = req.getSession();
		
		if(dao.checkOldPassword(did, oldPassword)) {
			
			if(dao.changePassword(did, newPassword)) {
				session.setAttribute("succMsg", "Thay đổi mật khẩu thành công");
				resp.sendRedirect("doctor/edit_profile.jsp");
			}else {
				session.setAttribute("errorMsg", "Lỗi không đặt được");
				resp.sendRedirect("doctor/edit_profile.jsp");
			}
		}else {
			session.setAttribute("errorMsg", "Mật Khẩu Cũ Không Đúng");
			resp.sendRedirect("doctor/edit_profile.jsp");
		}
	}
	
	

}
