<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.entity.BacSiChuyenKhoa"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.ChuyenKhoaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../GiaoDien/allCss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<c:if test="${empty doctObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>
	<%@include file="navbar.jsp"%>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>

					<c:if test="${not empty succMsg}">
						<p class="text-center text-success fs-3">${succMsg}</p>
						<c:remove var="succMsg" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsg}">
						<p class="text-center text-danger fs-5">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />
					</c:if>

					<div class="card-body">
						<form action="../doctorChangePassword" method="post">

							<div class="mb-3">
								<label>Enter New Password</label> <input type="text"
									name="newPassword" class="form-control" required>
							</div>

							<div class="mb-3">
								<label>Enter Old Password</label> <input type="text"
									name="oldPassword" class="form-control" required>
							</div>
							<input type="hidden" value="${doctObj.id }" name="did">

							<button class="btn btn-success col-md-12">Change
								Password</button>

						</form>
					</div>

				</div>
			</div>
			<div class="col-md-6 offset-md-2">
				<div class="card paint-card">
					<p class="text-center fs-3"= "">Edit Profile</p>

					<c:if test="${not empty succMsgd}">
						<p class="text-center text-success fs-3">${succMsgd}</p>
						<c:remove var="succMsgd" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsgd}">
						<p class="text-center text-danger fs-5">${errorMsgd}</p>
						<c:remove var="errorMsgd" scope="session" />
					</c:if>

					<div class="card-body">

						<form action="../editProfileDoctor" method="post">

							<div class="mb-3">
								<label class="form-label">Họ Và Tên</label> <input type="text"
									required name="fullName" class="form-control"
									value="${doctObj.fullName }">
							</div>

							<div class="mb-3">
								<label class="form-label">Ngày Sinh</label> <input type="date"
									required name="dob" class="form-control"
									value="${doctObj.dob }">
							</div>

							<div class="mb-3">
								<label class="form-label">Trình Độ Chuyên Môn</label> <input
									type="text" required name="qualification" class="form-control"
									value="${doctObj.qualification }">
							</div>

							<div class="mb-3">
								<label class="form-label">Chuyên Khoa</label> <select
									name="chuyenKhoa" required class="form-control">
									<option>${doctObj.chuyenKhoa }</option>

									<%
									ChuyenKhoaDAO dao = new ChuyenKhoaDAO(DBConnect.getConn());
									List<BacSiChuyenKhoa> list = dao.getAllSpec();
									for (BacSiChuyenKhoa bs : list) {
									%>
									<option><%=bs.getTenChuyenKhoa()%></option>
									<%
									}
									%>

								</select>
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text"
									readonly required name="email" class="form-control"
									value="${doctObj.email }">
							</div>

							<div class="mb-3">
								<label class="form-label">Số ĐT</label> <input type="text"
									required name="mobno" class="form-control"
									value="${doctObj.mobNo }">
							</div>
							<input type="hidden" name="id" value="${doctObj.id}">
							<button type="submit" class="btn btn-primary">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>