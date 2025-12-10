<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hồ Sơ Bệnh Án</title>
<%@include file="../GiaoDien/allCss.jsp"%>
</head>
<body>

<%@include file="../GiaoDien/navbar.jsp"%>

<div class="container mt-4">
    <h3 class="text-center mb-3">Hồ Sơ Bệnh Án</h3>

    <c:if test="${empty recordList}">
        <p class="text-center text-muted">Chưa có hồ sơ bệnh án nào.</p>
    </c:if>

    <c:if test="${not empty recordList}">
        <table class="table table-bordered text-center">
            <thead class="table-success">
                <tr>
                    <th>Ngày Tạo</th>
                    <th>Bác Sĩ</th>
                    <th>Ngày Khám</th>
                    <th>Triệu Chứng</th>
                    <th>Chẩn Đoán</th>
                    <th>Toa Thuốc</th>
                    <th>Tái Khám</th>
                    <th>Kết Quả Xét Nghiệm</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="r" items="${recordList}">
                    <tr>
                        <td><fmt:formatDate value="${r.createdAt}" pattern="dd/MM/yyyy HH:mm"/></td>
                        <td>${r.doctorName}</td>
                        <td>${r.appointmentDate}</td>
                        <td>${r.symptoms}</td>
                        <td>${r.diagnosis}</td>
                        <td>${r.medicine}</td>
                        <td><fmt:formatDate value="${r.nextAppointment}" pattern="dd/MM/yyyy"/></td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty r.pdfResult}">
                                    <a href="${pageContext.request.contextPath}/${r.pdfResult}" target="_blank"
                                       class="btn btn-sm btn-outline-primary">Xem PDF</a>
                                </c:when>
                                <c:otherwise>
                                    <span class="text-muted">Chưa có</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

</body>
</html>