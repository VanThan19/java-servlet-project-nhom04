<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<div class="container-fluid">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/doctor/index.jsp">
			<i class="fass fa-clinic-medical"></i> Medi Home
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<a class="nav-link active" href="${pageContext.request.contextPath}/doctor/index.jsp">Trang Chủ</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="${pageContext.request.contextPath}/doctor/benhNhan.jsp">Bệnh Nhân</a>
				</li>
			</ul>

			<form class="d-flex">
				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">
						<i class="fass fa-user-circle"></i> ${doctObj.fullName}
					</button>

					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/doctor/edit_profile.jsp">
								Edit Profile
							</a>
						</li>
						<li>
							<a class="dropdown-item" href="${pageContext.request.contextPath}/doctorLogout">
								Logout
							</a>
						</li>
					</ul>
				</div>
			</form>
		</div>
	</div>
</nav>
