<%@page import="com.entity.Users"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.entity.CuocHen"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.CuocHenDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	height: 25vh;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #ffffff;
	font-weight: 700;
	font-size: 2.3rem;
	letter-spacing: 0.5px;
	text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.4);
	border-bottom: 5px solid #00b377;
}

.main-section {
	background: linear-gradient(to bottom right, #ffffff, #f8fdfc);
	border-radius: 20px;
	padding: 40px;
	margin-top: -60px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
	width: 90%;
	max-width: 1100px;
	margin-left: auto;
	margin-right: auto;
}

.title-text {
	color: #00a676;
	font-weight: 700;
	text-align: center;
	margin-bottom: 25px;
	font-size: 1.6rem;
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 10px;
}

.title-text i {
	color: #00b377;
}

.table {
	border-radius: 10px;
	overflow: hidden;
	background: #fff;
	text-align: center;
	vertical-align: middle;
	font-size: 0.95rem;
}

.table thead {
	background-color: #00b377;
	color: white;
	font-weight: 600;
	text-transform: uppercase;
	font-size: 0.9rem;
}

.table tbody tr {
	transition: background 0.2s ease-in-out;
}

.table tbody tr:hover {
	background: #e8fdf3;
}

.badge {
	padding: 6px 14px;
	border-radius: 12px;
	font-weight: 600;
	font-size: 0.85rem;
	text-transform: capitalize;
	letter-spacing: 0.3px;
}

.bg-pending {
	background-color: #ffe066;
	color: #664d03;
}

.bg-confirmed {
	background-color: #51cf66;
	color: #fff;
}

.bg-cancelled {
	background-color: #ff6b6b;
	color: #fff;
}

.fade-in {
	animation: fadeIn 0.8s ease-in-out;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(10px);
}

to {
	opacity: 1;
	transform: translateY(0);
}
}
</style>
</head>

<body>
	<%@include file="GiaoDien/navbar.jsp"%>
	<div class="container-fullid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Danh Sách Lịch Hẹn</p>
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
										%> <a
										href="#" class="btn btn-sm btn-warning">PENDING</a>
										<%
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