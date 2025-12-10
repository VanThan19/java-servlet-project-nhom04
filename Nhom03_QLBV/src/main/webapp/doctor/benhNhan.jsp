<%@page import="com.conn.DBConnect"%>
<%@page import="com.entity.CuocHen"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.CuocHenDAO"%>
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
	<c:if test="${empty doctObj }">
		<c:redirect url="../doctor_login.jsp"></c:redirect>
	</c:if>

	<%@include file="navbar.jsp"%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Chi Tiết Bệnh Nhân</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-4 text-center text-danger">${errorMsg}<
								<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class="fs-4 text-center text-danger">${succMsg}<
								<c:remove var="succMsg" scope="session" />
						</c:if>

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
									<th scope="col">Trạng Thái</th>
									<th scope="col">Hoạt Động</th>
								</tr>
							</thead>
							<tbody>
								<%
								Doctor d = (Doctor) session.getAttribute("doctObj");
								CuocHenDAO dao = new CuocHenDAO(DBConnect.getConn());
								List<CuocHen> list = dao.getAllCuocHenByDoctorLogin(d.getId());
								for (CuocHen h : list) {
								%>
								<tr>
									<th><%=h.getFullName()%></th>
									<td><%=h.getGioiTinh()%></td>
									<td><%=h.getAge()%></td>
									<td><%=h.getNgayHen()%></td>
									<td><%=h.getEmail()%></td>
									<td><%=h.getSdt()%></td>
									<td><%=h.getBenhTat()%></td>
									<td><%=h.getTrangThai()%></td>
									<td>
										<%
										if ("Đã xác nhận".equalsIgnoreCase(h.getTrangThai()) || "Hoàn thành".equalsIgnoreCase(h.getTrangThai())) {
										%> <a
										href="${pageContext.request.contextPath}/doctor/add_benh_an.jsp?cuocHenId=<%=h.getId()%>&userId=<%=h.getUserId()%>"
										class="btn btn-sm btn-outline-success">Nhập hồ sơ</a> <%
                                         } else if ("Pending".equalsIgnoreCase(h.getTrangThai())) {
                                        %>

										<a href="../updateTrangThai?id=<%=h.getId()%>"
										class="btn btn-sm btn-warning">Xác nhận</a> <%
                                        } else {
                                          %>

										<button class="btn btn-sm btn-secondary" disabled>Không
											khả dụng</button> <%
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