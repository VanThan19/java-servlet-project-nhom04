package com.users.servlet;

import java.io.IOException;

import com.conn.DBConnect;
import com.dao.UserDAO;
import com.entity.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/userLogin")
public class UserLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		HttpSession session = req.getSession();
		
		UserDAO dao = new UserDAO(DBConnect.getConn());
		Users user = dao.login(email, password);
		
		if(user!=null) {
			
			session.setAttribute("userObj", user);
			resp.sendRedirect("index.jsp");
		}
		else {
			session.setAttribute("errorMsg", "Đăng Nhập Không Thành Công");
			resp.sendRedirect("user_login.jsp");
		}
	}
	
	

}
