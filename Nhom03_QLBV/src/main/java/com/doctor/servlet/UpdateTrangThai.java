package com.doctor.servlet;

import java.io.IOException;

import com.conn.DBConnect;
import com.dao.CuocHenDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/updateTrangThai")
public class UpdateTrangThai extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			int did = Integer.parseInt(req.getParameter("did"));
			String comment = req.getParameter("comm");
			
			CuocHenDAO dao = new CuocHenDAO(DBConnect.getConn());
			
			HttpSession session = req.getSession();
			if(dao.updateCommentStatus(id, did, comment)) {
				session.setAttribute("succMsg", "Comment Cập Nhật Thành Công");
				resp.sendRedirect("doctor/benhNhan.jsp");
			}else {
				session.setAttribute("errorMsg", "Comment Cập Nhật Không Thành Công");
				resp.sendRedirect("doctor/benhNhan.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

}
