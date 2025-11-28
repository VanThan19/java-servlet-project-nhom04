<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MediHome | Trang Chủ</title>
<%@include file="GiaoDien/allCss.jsp"%>

<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<style>
body {
	font-family: "Poppins", sans-serif;
	background-color: #f7fcff;
	color: #333;
}

.carousel-item img {
	height: 550px;
	object-fit: cover;
	filter: brightness(0.9);
}

.carousel-caption {
	background: rgba(0, 0, 0, 0.5);
	padding: 20px 40px;
	border-radius: 10px;
	backdrop-filter: blur(4px);
}

.section-title {
	text-align: center;
	font-weight: 700;
	color: #009970;
	margin: 60px 0 30px;
	position: relative;
}

.section-title::after {
	content: "";
	width: 100px;
	height: 3px;
	background-color: #009970;
	display: block;
	margin: 10px auto 0;
	border-radius: 5px;
}

.feature-card {
	transition: all 0.3s ease;
	border: none;
	border-radius: 15px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
	background: #fff;
}

.feature-card:hover {
	transform: translateY(-6px);
	box-shadow: 0 8px 18px rgba(0, 0, 0, 0.12);
}

.feature-card p:first-child {
	color: #009970;
	font-weight: 600;
}

.team-card {
	border: none;
	border-radius: 15px;
	overflow: hidden;
	transition: all 0.3s ease;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.team-card:hover {
	transform: translateY(-8px);
}

.team-card img {
	border-bottom: 4px solid #009970;
	width: 100%;
	height: 320px;
	object-fit: cover;
}

.team-card p {
	margin: 0;
}

.team-card .name {
	color: #009970;
	font-weight: 700;
	margin-top: 10px;
}
</style>
</head>

<body>
	<%@include file="GiaoDien/navbar.jsp"%>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="images/AnhNen1.webp" class="d-block w-100" alt="Slide 1">
				<div class="carousel-caption" data-aos="zoom-in">
					<h2 class="text-white fw-bold">Kết nối cộng đồng, lan tỏa sức
						khỏe</h2>
					<p data-aos="fade-up" data-aos-delay="200">"Cam kết mang đến
						sức khỏe và niềm tin cho mọi nhà."</p>
				</div>
			</div>

			<div class="carousel-item">
				<img src="images/AnhNen2.webp" class="d-block w-100" alt="Slide 2">
				<div class="carousel-caption" data-aos="fade-left">
					<h2 class="text-white fw-bold">Chăm sóc y tế toàn diện</h2>
					<p data-aos="fade-up" data-aos-delay="200">Dành cho mọi người,
						mọi lứa tuổi, mọi nơi</p>
				</div>
			</div>

			<div class="carousel-item">
				<img src="images/AnhNen3.webp" class="d-block w-100" alt="Slide 3">
				<div class="carousel-caption" data-aos="fade-right">
					<h2 class="text-white fw-bold">Đội ngũ bác sĩ tận tâm</h2>
					<p data-aos="fade-up" data-aos-delay="200">Luôn đồng hành cùng
						sức khỏe của bạn</p>
				</div>
			</div>
		</div>

		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

	<section class="intro-section py-5"
		style="background: linear-gradient(135deg, #e8f9f3, #d6f0ff);">
		<div class="container">
			<div class="row align-items-center">
				<!-- Ảnh minh họa bệnh viện -->
				<div class="col-lg-6 mb-4 mb-lg-0" data-aos="fade-right">
					<img src="images/hospital-view.webp" alt="Bệnh viện MediHome"
						class="img-fluid rounded shadow-lg"
						style="border: 6px solid #fff;">
				</div>

				<div class="col-lg-6" data-aos="fade-left">
					<h2 class="fw-bold mb-3" style="color: #009970;">Giới Thiệu
						MediHome</h2>
					<p style="font-size: 1.05rem; line-height: 1.7;">
						<strong>MediHome</strong> là hệ thống quản lý bệnh viện thông minh
						giúp kết nối bác sĩ và bệnh nhân mọi lúc, mọi nơi. Chúng tôi cam
						kết mang đến dịch vụ y tế chất lượng cao, ứng dụng công nghệ hiện
						đại để tối ưu trải nghiệm khám chữa bệnh, tiết kiệm thời gian và
						chi phí cho người dân.
					</p>
					<ul style="list-style: none; padding: 0;">
						<li><i class="fas fa-check-circle text-success"></i> Dịch vụ
							khám chữa bệnh đa khoa – chuyên nghiệp.</li>
						<li><i class="fas fa-check-circle text-success"></i> Đặt
							lịch, tra cứu kết quả, quản lý hồ sơ tiện lợi.</li>
						<li><i class="fas fa-check-circle text-success"></i> Đội ngũ
							bác sĩ đầu ngành – tận tâm với bệnh nhân.</li>
					</ul>

				</div>
			</div>
		</div>
	</section>

	<section class="container">
		<h2 class="section-title" data-aos="fade-up">Các tính năng chính
			của Bệnh viện</h2>
		<div class="row g-4" data-aos="fade-up" data-aos-delay="200">
			<div class="col-md-6 col-lg-3">
				<div class="card feature-card text-center p-4">
					<p>An Toàn 100%</p>
					<p>Đảm bảo tuyệt đối an toàn cho bệnh nhân và bảo mật thông tin
						cá nhân.</p>
				</div>
			</div>
			<div class="col-md-6 col-lg-3">
				<div class="card feature-card text-center p-4">
					<p>Môi Trường Sạch Sẽ</p>
					<p>Không gian hiện đại, đạt chuẩn vệ sinh y tế, thoáng mát và
						thân thiện.</p>
				</div>
			</div>
			<div class="col-md-6 col-lg-3">
				<div class="card feature-card text-center p-4">
					<p>Bác Sĩ Thân Thiện</p>
					<p>Đội ngũ y bác sĩ tận tâm, chuyên nghiệp, luôn vì sức khỏe
						người bệnh.</p>
				</div>
			</div>
			<div class="col-md-6 col-lg-3">
				<div class="card feature-card text-center p-4">
					<p>Nghiên Cứu Y Học</p>
					<p>Ứng dụng các tiến bộ y học mới nhất để nâng cao chất lượng
						điều trị.</p>
				</div>
			</div>
		</div>
	</section>

	<section class="container mt-5 mb-5">
		<h2 class="section-title" data-aos="fade-up">Đội Ngũ Bác Sĩ Của
			Chúng Tôi</h2>
		<div class="row g-4" data-aos="fade-up" data-aos-delay="200">
			<div class="col-md-3">
				<div class="card team-card text-center" data-aos="flip-left">
					<img src="images/BacSiNam2.jpg" alt="Doctor 1">
					<div class="p-3">
						<p class="name">Nguyễn Văn T</p>
						<p class="text-muted">Giám đốc Bệnh viện</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card team-card text-center" data-aos="flip-right">
					<img src="images/BacSiNam3.png" alt="Doctor 2">
					<div class="p-3">
						<p class="name">Nguyễn Văn M</p>
						<p class="text-muted">Trưởng Khoa Nội</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card team-card text-center" data-aos="flip-left">
					<img src="images/BacSiNu1.jpg" alt="Doctor 3">
					<div class="p-3">
						<p class="name">Nguyễn Thị A</p>
						<p class="text-muted">Trưởng Khoa Nhi</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card team-card text-center" data-aos="flip-right">
					<img src="images/BacSiNu2.jpg" alt="Doctor 4">
					<div class="p-3">
						<p class="name">Nguyễn Thị B</p>
						<p class="text-muted">Chuyên khoa Da liễu</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@include file="GiaoDien/footer.jsp"%>

	<script>
		AOS.init({
			duration : 1000,
			once : true,
			offset : 100
		});
	</script>
</body>
</html>