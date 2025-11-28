package com.doctor.servlet;

import java.io.IOException;

import com.conn.DBConnect;
import com.dao.DoctorDAO;
import com.entity.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();

		DoctorDAO dao = new DoctorDAO(DBConnect.getConn());
		Doctor d = dao.login(email, password);

		if (d != null) {

			session.setAttribute("doctObj", d);
			resp.sendRedirect("doctor/index.jsp");
		} else {
			session.setAttribute("errorMsg", "Đăng Nhập Không Thành Công");
			resp.sendRedirect("doctor_login.jsp");
		}
	}
}
