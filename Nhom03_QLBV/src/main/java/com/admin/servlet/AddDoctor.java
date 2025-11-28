package com.admin.servlet;

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

@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		try {
			String FullName = req.getParameter("fullName");
			String Dob = req.getParameter("dob");
			String Qualification = req.getParameter("qualification");
			String ChuyenKhoa = req.getParameter("chuyenKhoa");
			String Email = req.getParameter("email");
			String MobNo= req.getParameter("mobno");
			String Password = req.getParameter("password");
			
			Doctor d = new Doctor(FullName, Dob, Qualification, ChuyenKhoa, Email, MobNo, Password);
			DoctorDAO dao = new DoctorDAO(DBConnect.getConn());
			
			HttpSession session = req.getSession();
			
			if(dao.addDoctor(d)) {
				session.setAttribute("succMsg", "Thêm Doctor Thành Công");
				resp.sendRedirect("admin/doctor.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Thêm Doctor Không Thành Công");
				resp.sendRedirect("admin/doctor.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

}
