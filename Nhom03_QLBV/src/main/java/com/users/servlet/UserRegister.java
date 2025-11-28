package com.users.servlet;

import java.io.IOException;

import org.apache.catalina.connector.Response;

import com.conn.DBConnect;
import com.dao.UserDAO;
import com.entity.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		try {
			String FullName = req.getParameter("fullname");
			String Email = req.getParameter("email");
			String Password = req.getParameter("password");
			
			Users u = new Users(FullName, Email, Password);
			UserDAO dao = new UserDAO(DBConnect.getConn());
			
			HttpSession session = req.getSession();
			boolean f = dao.UsersRegister(u);
			
			if(f) {
				session.setAttribute("succMsg", "Thêm Dữ Liệu Thành Công");
				resp.sendRedirect("DangKyUser.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Thêm Dữ Liệu Không Thành Công");
				resp.sendRedirect("DangKyUser.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

}
