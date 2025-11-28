package com.users.servlet;

import java.io.IOException;

import com.conn.DBConnect;
import com.dao.CuocHenDAO;
import com.entity.CuocHen;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/addCuocHen")
public class CuocHenServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		int userId = Integer.parseInt(req.getParameter("userId"));
		String fullName = req.getParameter("fullname");
		String gioiTinh = req.getParameter("gioiTinh");
		String age = req.getParameter("age");
		String ngayHen = req.getParameter("ngayHen");
		String email = req.getParameter("email");
		String sdt = req.getParameter("sdt");
		String benhTat = req.getParameter("benhTat");
		int doctorId = Integer.parseInt(req.getParameter("doctorId"));
		String diaChi = req.getParameter("diaChi");
		
		CuocHen h = new CuocHen(userId, fullName, gioiTinh, age, ngayHen, email, sdt, benhTat, doctorId, diaChi, "Pending");
		CuocHenDAO dao = new CuocHenDAO(DBConnect.getConn());
		HttpSession session = req.getSession();
		
		if(dao.addCuocHen(h)) {
			session.setAttribute("succMsg", "Thêm Cuộc Hẹn Thành Công");
			resp.sendRedirect("userCuocHen.jsp");
		}
		else {
			session.setAttribute("errorMsg","Thêm Cuộc Hẹn Thất Bại");
			resp.sendRedirect("userCuocHen.jsp");
		}
		
		
	}
	
	

}
