<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name_hm = request.getParameter("hm_name");
	session.setAttribute("username",name_hm);
	response.sendRedirect("vote.jsp");
%>