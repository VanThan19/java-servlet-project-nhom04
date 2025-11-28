package com.users.servlet;

import java.io.IOException;
import java.util.List;

import com.conn.DBConnect;
import com.dao.BenhDAO;
import com.dao.DoctorDAO;
import com.entity.Doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/suggestDoctor")
public class GoiYBacSiServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		req.setCharacterEncoding("UTF-8");

		String trieuChung = req.getParameter("trieuChung");
		BenhDAO benhDAO = new BenhDAO(DBConnect.getConn());
		DoctorDAO doctorDAO = new DoctorDAO(DBConnect.getConn());

		int chuyenKhoaId = benhDAO.getChuyenKhoaIdByTrieuChung(trieuChung);

		if (chuyenKhoaId == -1) {
			req.setAttribute("errorMsg", "Không tìm thấy chuyên khoa phù hợp với triệu chứng '" + trieuChung + "'");
			req.getRequestDispatcher("goiYBacSi.jsp").forward(req, resp);
			return;
		}

		List<Doctor> listDoc = doctorDAO.getDoctorsByChuyenKhoaId(chuyenKhoaId);

		req.setAttribute("listDoc", listDoc);
		req.setAttribute("chuyenKhoaId", chuyenKhoaId);
		req.setAttribute("trieuChung", trieuChung);

		req.getRequestDispatcher("goiYBacSi.jsp").forward(req, resp);
	}

}
