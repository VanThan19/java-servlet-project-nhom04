<%@page import="com.dao.ThongKeDAO"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Dashboard | MediHome</title>
<%@include file="../GiaoDien/allCss.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<%
	ThongKeDAO dao = new ThongKeDAO(DBConnect.getConn());
	int tongBN = dao.getTongBenhNhan();
	int tongBS = dao.getTongBacSi();
	int tongCH = dao.getTongCuocHen();
	Map<String, Integer> topBacSi = dao.getTopBacSi();
	Map<String, Integer> benhNhanThang = dao.getBenhNhanTheoThang();
	%>

	<div class="container mt-4">
		<h2 class="text-center text-success mb-4">📊 Dashboard Thống Kê
			MediHome</h2>

		<div class="row text-center mt-4">
			<div class="col-md-3">
				<div class="card border-info shadow-sm p-3">
					<h5 class="text-muted">Tổng Bệnh Nhân</h5>
					<h2 class="text-primary fw-bold"><%=tongBN%></h2>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card border-success shadow-sm p-3">
					<h5 class="text-muted">Tổng Bác Sĩ</h5>
					<h2 class="text-success fw-bold"><%=tongBS%></h2>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card border-danger shadow-sm p-3">
					<h5 class="text-muted">Tổng Cuộc Hẹn</h5>
					<h2 class="text-danger fw-bold"><%=tongCH%></h2>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card border-warning shadow-sm p-3">
					<h5 class="text-muted">Cuộc Hẹn Hôm Nay</h5>
					<h2 class="text-warning fw-bold"><%=dao.getCuocHenHomNay()%></h2>
				</div>
			</div>
		</div>

		<div class="row mt-5">
			<div class="col-md-6">
				<canvas id="chartBacSi"></canvas>
			</div>
			<div class="col-md-6">
				<canvas id="chartThang"></canvas>
			</div>
		</div>
	</div>

	<script>
// Bác sĩ nhiều lượt nhất
const ctx1 = document.getElementById('chartBacSi');
new Chart(ctx1, {
    type: 'bar',
    data: {
        labels: [<%for (String bs : topBacSi.keySet()) {%> "<%=bs%>", <%}%>],
        datasets: [{
            label: 'Số lượt khám',
            data: [<%for (int sl : topBacSi.values()) {%> <%=sl%>, <%}%>],
            backgroundColor: '#28a745'
        }]
    }
});

// Bệnh nhân theo tháng
const ctx2 = document.getElementById('chartThang');
new Chart(ctx2, {
    type: 'line',
    data: {
        labels: [<%for (String th : benhNhanThang.keySet()) {%> "<%=th%>", <%}%>],
        datasets: [{
            label: 'Số bệnh nhân',
            data: [<%for (int sl : benhNhanThang.values()) {%> <%=sl%>, <%}%>],
            borderColor: '#007bff',
            tension: 0.2
        }]
    }
});
</script>
</body>
</html>