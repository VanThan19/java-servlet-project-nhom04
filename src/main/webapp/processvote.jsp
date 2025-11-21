<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Integer tongsophieu = (Integer) application.getAttribute("total_vote");
	if (tongsophieu == null){
		tongsophieu = 0;
	}
		tongsophieu++;
		application.setAttribute("total_vote",tongsophieu);
		response.sendRedirect("result.jsp");
	
%>