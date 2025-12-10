<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="GiaoDien/allCss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%@include file="GiaoDien/navbar.jsp"%>

	<div class="container p-4">
		<h3>Hồ Sơ Cá Nhân</h3>

		<c:if test="${not empty succMsg}">
			<div class="alert alert-success">${succMsg}</div>
		</c:if>

		<c:if test="${not empty errorMsg}">
			<div class="alert alert-danger">${errorMsg}</div>
		</c:if>

		<hr>

		<!-- Avatar -->
		<div class="text-center mb-3">
			<img src="${profile.avatar}" width="150" height="150"
				style="border-radius: 50%; border: 3px solid #28a745;">
		</div>

		<form action="${pageContext.request.contextPath}/uploadAvatar"
			method="post" enctype="multipart/form-data">
			<input type="hidden" name="userId" value="${userObj.id}"> <input
				type="file" name="avatar" class="form-control">
			<button class="btn btn-success mt-2">Cập nhật ảnh</button>
		</form>

		<div class="text-center mb-3 mt-3">
			<c:choose>
				<c:when test="${not empty profile.avatar}">
					<img src="${pageContext.request.contextPath}/${profile.avatar}"
						width="150" height="150"
						style="border-radius: 50%; border: 3px solid #28a745;">
				</c:when>
				<c:otherwise>
					<img src="images/default-avatar.png" width="150" height="150"
						style="border-radius: 50%; border: 3px solid #28a745;">
				</c:otherwise>
			</c:choose>
		</div>

		<hr>

		<!-- Form cập nhật thông tin -->
		<form action="updateProfile" method="post">
			<input type="hidden" name="userId" value="${userObj.id}"> <label>Giới
				tính</label> <input type="text" name="gender" class="form-control"
				value="${profile.gender}"> <label>Số điện thoại</label> <input
				type="text" name="phone" class="form-control"
				value="${profile.phone}"> <label>Địa chỉ</label> <input
				type="text" name="address" class="form-control"
				value="${profile.address}"> <label>Bảo hiểm y tế</label> <input
				type="text" name="insurance" class="form-control"
				value="${profile.insuranceNumber}"> <label>Ngày sinh</label>
			<input type="date" name="dob" class="form-control"
				value="${profile.dob}">

			<button class="btn btn-success mt-3">Lưu thay đổi</button>
		</form>
	</div>

</body>
</html>