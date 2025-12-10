<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm Hồ Sơ Bệnh Án</title>
<%@include file="../GiaoDien/allCss.jsp"%>
</head>
<body>
	<%
	// Chặn truy cập nếu chưa đăng nhập bác sĩ
	if (session.getAttribute("doctObj") == null) {
		response.sendRedirect("doctor_login.jsp");
		return;
	}
	%>

	<%@include file="navbar.jsp"%>

	<div class="container mt-4">
		<h3 class="text-center">Thêm Hồ Sơ Bệnh Án</h3>

		<c:if test="${not empty succMsg}">
			<div class="alert alert-success">${succMsg}</div>
		</c:if>
		<c:if test="${not empty errorMsg}">
			<div class="alert alert-danger">${errorMsg}</div>
		</c:if>

		<form action="${pageContext.request.contextPath}/addHoSoBenhAn"
			method="post" enctype="multipart/form-data">

			<input type="hidden" name="cuocHenId" value="${param.cuocHenId}">
			<input type="hidden" name="userId" value="${param.userId}"> <input
				type="hidden" name="doctorId" value="${doctObj.id}"> <label>Triệu
				chứng</label>
			<textarea name="symptoms" class="form-control" rows="3" required></textarea>

			<label class="mt-2">Chẩn đoán</label>
			<textarea name="diagnosis" class="form-control" rows="3" required></textarea>

			<label class="mt-2">Toa thuốc</label>
			<textarea name="medicine" class="form-control" rows="3" required></textarea>

			<label class="mt-2">Ngày tái khám</label> <input type="date"
				name="nextAppointment" class="form-control" required> <label
				class="mt-2">Kết quả xét nghiệm (PDF)</label> <input type="file"
				name="pdfResult" class="form-control" accept="application/pdf">

			<button class="btn btn-success mt-3">Lưu hồ sơ</button>
		</form>
	</div>

</body>
</html>
