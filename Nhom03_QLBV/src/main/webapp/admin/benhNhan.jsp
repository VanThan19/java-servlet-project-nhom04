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
	<div class="col-md-12">
		<div class="card paint-card">
			<div class="card-body">
				<p class="fs-3 text-center">Chi Tiết Bệnh Nhân</p>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Họ Và Tên</th>
							<th scope="col">Giới Tính</th>
							<th scope="col">Tuổi</th>
							<th scope="col">Ngày Hẹn</th>
							<th scope="col">Email</th>
							<th scope="col">Số ĐT</th>
							<th scope="col">Bệnh Tật</th>
							<th scope="col">Tên Bác Sĩ</th>
							<th scope="col">Địa Chỉ</th>
							<th scope="col">Trạng Thái</th>
						</tr>
					</thead>
					<tbody>
						<%
						CuocHenDAO dao = new CuocHenDAO(DBConnect.getConn());
						DoctorDAO dao2 = new DoctorDAO(DBConnect.getConn());
						List<CuocHen> list = dao.getAllCuocHen();
						for (CuocHen h : list) {
							Doctor d = dao2.getDoctorById(h.getDoctorId());
						%>
						<tr>
							<th><%=h.getFullName()%></th>
							<td><%=h.getGioiTinh()%></td>
							<td><%=h.getAge()%></td>
							<td><%=h.getNgayHen()%></td>
							<td><%=h.getEmail()%></td>
							<td><%=h.getSdt()%></td>
							<td><%=h.getBenhTat()%></td>
							<td><%= d.getFullName() %></td>
							<td><%= h.getDiaChi() %></td>
							<td><%=h.getTrangThai()%></td>

						</tr>
						<%
						}
						%>
						
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>