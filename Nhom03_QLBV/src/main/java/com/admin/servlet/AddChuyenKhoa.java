package com.admin.servlet;

import java.io.IOException;

import com.conn.DBConnect;
import com.dao.ChuyenKhoaDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/add_ck")
public class AddChuyenKhoa extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		String TenChuyenKhoa = req.getParameter("nameCK");
		ChuyenKhoaDAO dao = new ChuyenKhoaDAO(DBConnect.getConn());
		boolean f = dao.ThemChuyenKhoa(TenChuyenKhoa);
		HttpSession session = req.getSession();

		if (f) {

			session.setAttribute("succMsg", "Thêm Thành Công");
			resp.sendRedirect("admin/index.jsp");
		} else {
			session.setAttribute("errorMsg", "Thêm Không Thành Công");
			resp.sendRedirect("admin/index.jsp");
		}
	}

}
