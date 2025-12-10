package com.users.servlet;

import java.io.IOException;

import com.conn.DBConnect;
import com.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/userChangePassword")
public class ChangePassword extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		int uid = Integer.parseInt(req.getParameter("uid"));
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");
		
		UserDAO dao = new UserDAO(DBConnect.getConn());
		HttpSession session = req.getSession();
		
		if(dao.checkOldPassword(uid, oldPassword)) {
			
			if(dao.changePassword(uid, newPassword)) {
				session.setAttribute("succMsg", "Thay đổi mật khẩu thành công");
				resp.sendRedirect("changepassword.jsp");
			}else {
				session.setAttribute("errorMsg", "Lỗi không đặt được");
				resp.sendRedirect("changepassword.jsp");
			}
		}else {
			session.setAttribute("errorMsg", "Mật Khẩu Cũ Không Đúng");
			resp.sendRedirect("changepassword.jsp");
		}
	}
	

}
