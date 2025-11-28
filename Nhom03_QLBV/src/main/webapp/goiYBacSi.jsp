<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gợi ý bác sĩ phù hợp | MediHome</title>
<%@include file="GiaoDien/allCss.jsp"%>
<style>
.paint-card {
  box-shadow: 0 0 10px rgba(0,0,0,0.3);
  border-radius: 10px;
}
.table-hover tbody tr:hover {
  background-color: #f1f1f1;
}
</style>
</head>

<body>
  <%@include file="GiaoDien/navbar.jsp"%>

  <div class="container mt-5 mb-5">
    <div class="card paint-card p-4">
      <h2 class="text-center text-success">🔍 Gợi ý bác sĩ phù hợp</h2>
      <p class="text-center text-muted">Nhập triệu chứng của bạn để hệ thống tìm chuyên khoa và bác sĩ phù hợp nhất.</p>

      <form action="<%=request.getContextPath()%>/suggestDoctor" method="post" class="mt-4">
        <div class="mb-3">
          <label for="trieuChung" class="form-label fw-bold">Triệu chứng:</label>
          <input type="text" name="trieuChung" id="trieuChung" class="form-control"
                 placeholder="Ví dụ: đau đầu, ho nhiều, khó thở, đau mắt..." required>
        </div>
        <div class="text-center">
          <button type="submit" class="btn btn-success px-4">Tìm bác sĩ</button>
        </div>
      </form>

      <c:if test="${not empty errorMsg}">
        <div class="alert alert-danger mt-4 text-center">${errorMsg}</div>
      </c:if>

      <c:if test="${not empty listDoc}">
        <hr class="mt-5">
        <h4 class="text-primary mt-4">Kết quả gợi ý cho triệu chứng: 
          <span class="text-success">"${trieuChung}"</span>
        </h4>

        <table class="table table-striped table-hover mt-3">
          <thead class="table-success">
            <tr>
              <th scope="col">#</th>
              <th scope="col">Tên bác sĩ</th>
              <th scope="col">Chuyên khoa</th>
              <th scope="col">Email</th>
              <th scope="col">Số điện thoại</th>
              <th scope="col">Hành động</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="d" items="${listDoc}" varStatus="loop">
              <tr>
                <td>${loop.index + 1}</td>
                <td>${d.fullName}</td>
                <td>${d.chuyenKhoa}</td>
                <td>${d.email}</td>
                <td>${d.mobNo}</td>
                <td>
                  <a href="userCuocHen.jsp?doctor=${d.fullName}" 
                     class="btn btn-outline-success btn-sm">
                     <i class="fas fa-calendar-check"></i> Đặt lịch
                  </a>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </c:if>
    </div>
  </div>

</body>
</html>