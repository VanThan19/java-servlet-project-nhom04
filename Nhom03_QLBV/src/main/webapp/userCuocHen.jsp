<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.DoctorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đặt Cuộc Hẹn | MediHome</title>
<%@include file="GiaoDien/allCss.jsp"%>

<style>
body {
    background: linear-gradient(to right, #f0f9ff, #e6f3ff);
    font-family: "Poppins", sans-serif;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

.booking-container {
    max-width: 750px;
    background: #fff;
    margin: 80px auto;
    padding: 40px 50px;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.08);
    transition: 0.3s ease;
}
.booking-container:hover {
    box-shadow: 0 12px 40px rgba(0,0,0,0.12);
}

.booking-container h2 {
    color: #009970;
    font-weight: 700;
    text-align: center;
    margin-bottom: 30px;
}

label {
    font-weight: 500;
    color: #333;
    margin-bottom: 5px;
}

.form-control, select, textarea {
    border: 1px solid #d4e2eb;
    border-radius: 10px;
    padding: 10px 15px;
    font-size: 15px;
    transition: 0.3s ease;
}
.form-control:focus, select:focus, textarea:focus {
    border-color: #009970;
    box-shadow: 0 0 0 2px rgba(0,153,112,0.15);
}

.btn-success {
    background: linear-gradient(90deg, #009970, #00b389);
    border: none;
    font-weight: 600;
    border-radius: 30px;
    padding: 12px 50px;
    letter-spacing: 0.5px;
    transition: 0.3s ease;
}
.btn-success:hover {
    background: linear-gradient(90deg, #00b389, #009970);
    transform: translateY(-2px);
}

@media (max-width: 768px) {
    .booking-container {
        margin: 40px 15px;
        padding: 30px 25px;
    }
}
</style>
</head>

<body>
    <%@include file="GiaoDien/navbar.jsp"%>

    <div class="booking-container">
        <h2>🩺 Đặt Cuộc Hẹn Khám Bệnh</h2>

        <%
            String doctorName = request.getParameter("doctor");
        %>

        <!-- Thông báo -->
        <c:if test="${not empty errorMsg}">
            <div class="alert alert-danger text-center">${errorMsg}</div>
            <c:remove var="errorMsg" scope="session"/>
        </c:if>

        <c:if test="${not empty succMsg}">
            <div class="alert alert-success text-center">${succMsg}</div>
            <c:remove var="succMsg" scope="session"/>
        </c:if>

        <!-- Form -->
        <form class="row g-3" action="addCuocHen" method="post">
            <input type="hidden" name="userId" value="${userObj.id}">

            <div class="col-md-6">
                <label>Họ và Tên</label>
                <input type="text" name="fullname" class="form-control" required placeholder="Nhập họ và tên...">
            </div>

            <div class="col-md-6">
                <label>Giới tính</label>
                <select name="gioiTinh" class="form-control" required>
                    <option value="nam">Nam</option>
                    <option value="nu">Nữ</option>
                </select>
            </div>

            <div class="col-md-6">
                <label>Tuổi</label>
                <input type="number" name="age" class="form-control" required placeholder="VD: 25">
            </div>

            <div class="col-md-6">
                <label>Ngày hẹn</label>
                <input type="date" name="ngayHen" class="form-control" required>
            </div>

            <div class="col-md-6">
                <label>Email</label>
                <input type="email" name="email" class="form-control" required placeholder="example@gmail.com">
            </div>

            <div class="col-md-6">
                <label>Số điện thoại</label>
                <input type="number" name="sdt" class="form-control" required maxlength="10" placeholder="0912345678">
            </div>

            <div class="col-md-6">
                <label>Bệnh tật</label>
                <input type="text" name="benhTat" class="form-control" required placeholder="VD: Viêm họng, đau đầu...">
            </div>

            <div class="col-md-6">
                <label>Bác sĩ</label>
                <select name="doctorId" class="form-control" required>
                    <option value="">--Chọn bác sĩ--</option>
                    <%
                        DoctorDAO dao = new DoctorDAO(DBConnect.getConn());
                        List<Doctor> list = dao.getAllDoctor();
                        for (Doctor d : list) {
                            String selected = "";
                            if (doctorName != null && doctorName.equalsIgnoreCase(d.getFullName())) {
                                selected = "selected";
                            }
                    %>
                    <option value="<%=d.getId()%>" <%=selected%>>
                        <%=d.getFullName()%> (<%=d.getChuyenKhoa()%>)
                    </option>
                    <% } %>
                </select>
            </div>

            <div class="col-md-12">
                <label>Địa chỉ</label>
                <textarea name="diaChi" class="form-control" rows="3" required placeholder="Nhập địa chỉ của bạn..."></textarea>
            </div>

            <div class="text-center mt-4">
                <c:if test="${empty userObj}">
                    <a href="users_login.jsp" class="btn btn-success">Đăng nhập để đặt lịch</a>
                </c:if>

                <c:if test="${not empty userObj}">
                    <button type="submit" class="btn btn-success">Gửi yêu cầu</button>
                </c:if>
            </div>
        </form>
    </div>

    <%@include file="GiaoDien/footer.jsp"%>
</body>
</html>
