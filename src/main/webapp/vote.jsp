<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Phiếu bầu</title>
</head>
<body>
	<h1> Xin chào , <%= session.getAttribute("username") %>!</h1>
	<h3>Vui lòng chọn các ứng cử viên:</h3>
	<form action = "processvote.jsp" method = "post">
		<input type="radio" name="candidate" value="A" checked> Bảy tạ<br>
        <input type="radio" name="candidate" value="B"> Si lùn<br>
        <br>
        <button type="submit">Gửi phiếu bầu</button>
	</form>
</body>
</html>