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

	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Trả Lời Bệnh Nhân</p>
						
						<%int id = Integer.parseInt(request.getParameter("id"));
						CuocHenDAO dao = new CuocHenDAO(DBConnect.getConn());
						CuocHen h = dao.getCuocHenById(id);
						%>

						<form class="row" action="../updateTrangThai" method="post">
							<div class="col-md-6">
								<label>Tên Bệnh Nhân</label> <input type="text" readonly
									value="<%= h.getFullName() %>" class="form-control">
							</div>
							<div class="col-md-6">
								<label>Tuổi</label> <input type="text" value="<%= h.getAge() %>" readonly
									class="form-control">
							</div>
							<div class="col-md-6">
								<label>Số ĐT</label> <input type="text" value="<%= h.getSdt() %>" readonly
									class="form-control">
							</div>
							<div class="col-md-6">
								<label>Bệnh Tật</label> <input type="text" value="<%= h.getBenhTat() %>" readonly
									class="form-control">
							</div>
							<div class="col-md-12">
								<br> <label>Comment</label>
								<textarea required name="comm" class="form-control" row="3"
									cols=""></textarea>
							</div>
							<input type="hidden" name="id" value="<%= h.getId() %>"> 
							<input type="hidden" name="did" value="<%= h.getDoctorId() %>">
							<button class=" mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>