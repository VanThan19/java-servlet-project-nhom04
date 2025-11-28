<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<footer class="footer mt-auto">
  <div class="container text-center py-4">
    <p class="mb-1 fw-semibold">
      © 2025 <span class="text-brand">MediHome</span> — Hệ thống quản lý bệnh viện thông minh
    </p>
    <p class="small mb-3 text-secondary">
      Nhóm 03 - Java Servlet | <i class="fa-solid fa-envelope"></i> support@medihome.vn
    </p>

    <div class="social-icons">
      <a href="#" class="text-brand mx-2"><i class="fab fa-facebook-f"></i></a>
      <a href="#" class="text-brand mx-2"><i class="fab fa-twitter"></i></a>
      <a href="#" class="text-brand mx-2"><i class="fab fa-github"></i></a>
    </div>
  </div>
</footer>

<style>
body {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

.footer {
    margin-top: auto;
    background: #f8f9fa; /* nền sáng hơn */
    color: #333;
    border-top: 4px solid #009970;
    box-shadow: 0 -3px 15px rgba(0,0,0,0.08);
}

.footer p {
    margin: 0;
    color: #444;
}

.footer .text-brand {
    color: #009970;
    font-weight: 600;
}

.footer .social-icons a {
    color: #009970;
    font-size: 18px;
    transition: 0.3s;
}

.footer .social-icons a:hover {
    color: #005f48;
    transform: scale(1.15);
}
</style>