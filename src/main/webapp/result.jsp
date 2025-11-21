<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Kết quả</title>
</head>
<body>
    <h2>Cảm ơn bạn <%= session.getAttribute("username") %> đã tham gia! ✅</h2>
    
    <hr>
    
    <h3>Tổng số phiếu : <%= application.getAttribute("total_vote") %></h3>
    
    <a href="login.jsp">Quay lại trang chủ</a>
</body>
</html>