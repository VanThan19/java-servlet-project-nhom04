package com.admin.servlet;

import java.io.IOException;

import com.conn.DBConnect;
import com.dao.DoctorDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deleteDoctor")
public class DeleteDoctor extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		DoctorDAO dao = new DoctorDAO(DBConnect.getConn());
		
		HttpSession session = req.getSession();
		
		if(dao.deleteDoctor(id)) {
			session.setAttribute("succMsg", "Xóa Doctor Thành Công");
			resp.sendRedirect("admin/view_doctor.jsp");
		}
		else {
			session.setAttribute("errorMsg", "Xóa Doctor Không Thành Công");
			resp.sendRedirect("admin/view_doctor.jsp");
		}
	}
	

}
