package com.users.servlet;

import java.io.IOException;
import java.util.List;

import com.conn.DBConnect;
import com.dao.HoSoBenhAnDAO;
import com.entity.HoSoBenhAn;
import com.entity.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/userHoSoBenhAn")
public class UserHoSoBenhAnServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("userObj");

        if (user == null) {
            resp.sendRedirect("users_login.jsp");
            return;
        }

        HoSoBenhAnDAO dao = new HoSoBenhAnDAO(DBConnect.getConn());
        List<HoSoBenhAn> list = dao.getRecordsByUserId(user.getId());

        req.setAttribute("recordList", list);
        req.getRequestDispatcher("user_hoSoBenhAn.jsp").forward(req, resp);
	}
	
	

}
