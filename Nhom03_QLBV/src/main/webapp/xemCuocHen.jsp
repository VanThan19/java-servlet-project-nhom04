<%@page import="com.entity.Users"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.entity.CuocHen"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.CuocHenDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh Sách Cuộc Hẹn | MediHome</title>
<%@include file="GiaoDien/allCss.jsp"%>

<style>
body {
	background: linear-gradient(to right, #e8f9f3, #d6f0ff);
	font-family: "Poppins", sans-serif;
	min-height: 100vh;
	overflow-x: hidden;
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, 0.55), rgba(0, 0, 0, 0.55)),
		url("images/nen1.jpg") center/cover no-repeat;
	height: 28vh;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #ffffff;
	font-weight: 700;
	font-size: 2.8rem;
	letter-spacing: 0.5px;
	text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.4);
	border-bottom: 5px solid #00b377;
}

.card-body {
	padding: 40px;
}

.table {
	width: 100%;
	border-radius: 15px;
	overflow: hidden;
	background: #fff;
	text-align: center;
	vertical-align: middle;
	font-size: 1.05rem; /* 👉 tăng cỡ chữ */
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

.table thead {
	background-color: #00b377;
	color: white;
	font-weight: 700;
	text-transform: uppercase;
	font-size: 1rem; /* 👉 chữ to hơn */
}

.table th, .table td {
	padding: 16px 18px; /* 👉 tăng khoảng cách */
}

.table tbody tr {
	transition: all 0.25s ease-in-out;
	border-bottom: 1px solid #f1f1f1;
}

.table tbody tr:hover {
	background: #e9fbf4;
	transform: scale(1.01); /* 👉 hiệu ứng nổi nhẹ */
}

.table th {
	color: #004d40;
	font-size: 1.05rem;
}

.btn {
	border-radius: 10px;
	padding: 8px 16px;
	font-size: 0.95rem;
}

.btn-warning {
	background-color: #ffcc00;
	color: #333;
	font-weight: 600;
	border: none;
}

.fs-4.fw-bold.text-center.text-success {
	font-size: 1.8rem !important;
	margin-bottom: 20px;
}
</style>
</head>

<body>

	<c:if test="${empty userObj }">
		<c:redirect url="users_login.jsp"></c:redirect>
	</c:if>

	<%@include file="GiaoDien/navbar.jsp"%>
	<div class="container-fullid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>

	<div class="container p-3">
		<div class="row justify-content-center">
			<div class="col-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Danh Sách
							Lịch Khám</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Họ Và Tên</th>
									<th scope="col">Giới Tính</th>
									<th scope="col">Tuổi</th>
									<th scope="col">Ngày Hẹn</th>
									<th scope="col">Bệnh Tật</th>
									<th scope="col">Bác Sĩ</th>
									<th scope="col">Trạng Thái</th>
								</tr>
							</thead>
							<tbody>
								<%
								Users users = (Users) session.getAttribute("userObj");
								CuocHenDAO dao = new CuocHenDAO(DBConnect.getConn());
								DoctorDAO dao2 = new DoctorDAO(DBConnect.getConn());
								List<CuocHen> list = dao.getAllCuocHenByUserLogin(users.getId());
								for (CuocHen h : list) {
									Doctor d = dao2.getDoctorById(h.getDoctorId());
								%>
								<tr>
									<th><%=h.getFullName()%></th>
									<td><%=h.getGioiTinh()%></td>
									<td><%=h.getAge()%></td>
									<td><%=h.getNgayHen()%></td>
									<td><%=h.getBenhTat()%></td>
									<td><%=d.getFullName()%></td>
									<td>
										<%
										if ("Pending".equals(h.getTrangThai())) {
										%> <a href="#" class="btn btn-sm btn-warning">PENDING</a> <%
                                       } else {
                                         %> <%=h.getTrangThai()%> <%
                                       }
                                        %>

									</td>
								</tr>
								<%
								}
								%>



							</tbody>

						</table>

					</div>

				</div>

			</div>


		</div>

	</div>



</body>
</html>