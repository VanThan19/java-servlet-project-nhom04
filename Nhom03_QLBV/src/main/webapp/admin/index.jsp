<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.entity.Doctor"%>
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
	<%@include file="navbar.jsp"%>


	<c:if test="${empty adminObj }">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>


	<div class="container p-5">
		<p class="text-center fs-3">Bảng điều khiển quản trị</p>
		<!-- Hiển thị thông báo lỗi -->
		<c:if test="${not empty errorMsg}">
			<p class="fs-3 text-center text-danger">${errorMsg}</p>
			<c:remove var="errorMsg" scope="session" />
		</c:if>

		<!-- Hiển thị thông báo thành công -->
		<c:if test="${not empty succMsg}">
			<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session" />
		</c:if>

        <% DoctorDAO dao = new DoctorDAO(DBConnect.getConn()); %>

		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Bác Sĩ <br><%= dao.countDoctor() %>
						</p>
					</div>
				</div>
			</div>
			

			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4 text-center">
							Người Dùng <br><%= dao.countUser() %>
						</p>
					</div>
				</div>
			</div>

			<!-- Card: Total Appointment -->
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Tổng số cuộc hẹn <br> <%= dao.countCuocHen() %>
						</p>
					</div>
				</div>
			</div>

		
			<div class="col-md-4 mt-2">
				<div class="card paint-card" data-bs-toggle="modal"
					data-bs-target="#exampleModal">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Bác Sĩ Chuyên Khoa <br> <%= dao.countBacSiChuyenKhoa() %>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form action="../add_ck" method="post">

						<div class="form-group">
							<label>Nhập Tên Chuyên Khoa</label> <input type="text"
								name="nameCK" class="form-control">
						</div>
						<div class="text-center mt-3">

							<button type="submit" class="btn btn-primary">Thêm</button>

						</div>

					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Đóng</button>

				</div>
			</div>
		</div>
	</div>

</body>
</html>