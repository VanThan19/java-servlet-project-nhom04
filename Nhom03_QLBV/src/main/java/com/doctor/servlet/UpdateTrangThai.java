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
public class UpdateTrangThai extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		try {
			int id = Integer.parseInt(req.getParameter("id")); // ID cuộc hẹn

			CuocHenDAO dao = new CuocHenDAO(DBConnect.getConn());
			boolean success = dao.updateStatus(id, "Đã xác nhận");

			HttpSession session = req.getSession();
			if (success) {
				session.setAttribute("succMsg", "Đã xác nhận cuộc hẹn thành công!");
			} else {
				session.setAttribute("errorMsg", "Không thể xác nhận cuộc hẹn!");
			}

			resp.sendRedirect("doctor/benhNhan.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
