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

			<!-- LEFT FORM -->
			<div class="col-md-5 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">

						<p class="fs-3 text-center">Add Doctor</p>

					
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form action="../addDoctor" method="post">

							<div class="mb-3">
								<label class="form-label">Họ Và Tên</label> <input type="text"
									required name="fullName" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Ngày Sinh</label> <input type="date"
									required name="dob" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Trình Độ Chuyên Môn</label> <input
									type="text" required name="qualification" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Chuyên Khoa</label> <select
									name="chuyenKhoa" required class="form-control">
									<option>--select--</option>

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
									required name="email" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Số ĐT</label> <input type="text"
									required name="mobno" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Password</label> <input
									type="password" required name="password" class="form-control">
							</div>

							<button type="submit" class="btn btn-primary">Submit</button>
						</form>

					</div>
				</div>
			</div>



		</div>
	</div>

</body>
</html>