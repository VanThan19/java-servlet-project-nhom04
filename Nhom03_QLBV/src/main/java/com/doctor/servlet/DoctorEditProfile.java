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

@WebServlet("/editProfileDoctor")
public class DoctorEditProfile extends HttpServlet{

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
			
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			Doctor d = new Doctor(id, FullName, Dob, Qualification, ChuyenKhoa, Email, MobNo, "");
			DoctorDAO dao = new DoctorDAO(DBConnect.getConn());
			
			HttpSession session = req.getSession();
			
			if(dao.editDoctorProfile(d)) {
				Doctor updateDoctor = dao.getDoctorById(id);
				session.setAttribute("succMsgd", "Sửa Doctor Thành Công");
				session.setAttribute("doctObj", updateDoctor);
				resp.sendRedirect("doctor/edit_profile.jsp");
			}
			else {
				session.setAttribute("errorMsgd", "Sửa Doctor Không Thành Công");
				resp.sendRedirect("doctor/edit_profile.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
