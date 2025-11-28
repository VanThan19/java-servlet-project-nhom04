<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDAO"%>
<%@page import="com.entity.BacSiChuyenKhoa"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.ChuyenKhoaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<div class="container-fluid p-3">
		<div class="row">

			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">

						<p class="fs-3 text-center">Chi Tiết Bác Sĩ</p>
						
						
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<!-- SUCCESS MESSAGE -->
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						

						<table class="table">
							<thead>
								<tr>
									<th scope="col">Họ Và Tên</th>
									<th scope="col">Ngày Sinh</th>
									<th scope="col">Trình Độ Chuyên Môn</th>
									<th scope="col">Chuyên Gia</th>
									<th scope="col">Email</th>
									<th scope="col">Số ĐT</th>
									<th scope="col">Hoạt Động</th>
								</tr>
							</thead>
							<tbody>
								<%
								DoctorDAO dao2 = new DoctorDAO(DBConnect.getConn());
								List<Doctor> list2 = dao2.getAllDoctor();
								for (Doctor d : list2) {
								%>
								<tr>
									<td><%=d.getFullName()%></td>
									<td><%=d.getDob()%></td>
									<td><%=d.getQualification()%></td>
									<td><%=d.getChuyenKhoa()%></td>
									<td><%=d.getEmail()%></td>
									<td><%=d.getMobNo()%></td>
									<td><a href="edit_doctor.jsp?id=<%=d.getId() %>" class="btn btn-sm btn-primary">Edit</a> <a
										href="../deleteDoctor?id=<%=d.getId() %>" class="btn btn-sm btn-danger">Delete</a></td>
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