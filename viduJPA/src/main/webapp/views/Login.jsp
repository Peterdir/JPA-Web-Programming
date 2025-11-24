<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Đăng nhập hệ thống</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
}

.login-card {
	background: #fff;
	border-radius: 15px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	padding: 30px 25px;
	width: 100%;
	max-width: 400px;
	animation: fadeIn 0.7s ease-in-out;
}

@
keyframes fadeIn {
	from {opacity: 0;
	transform: translateY(-10px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.login-title {
	font-weight: 600;
	text-align: center;
	margin-bottom: 25px;
	color: #3b3b3b;
}

.btn-primary {
	background: linear-gradient(90deg, #007bff, #00b4d8);
	border: none;
}

.btn-primary:hover {
	background: linear-gradient(90deg, #0056b3, #0077b6);
}

a {
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}
</style>
</head>

<body>
	<div class="login-card">
		<h3 class="login-title">Đăng nhập hệ thống</h3>

		<!-- Hiển thị thông báo -->
		<c:if test="${not empty error}">
			<div class="alert alert-info text-center" role="alert">
				${error}</div>
		</c:if>

		<!-- Form đăng nhập -->
		<form action="${pageContext.request.contextPath}/login" method="post">
			<div class="mb-3">
				<label for="username" class="form-label">Tên đăng nhập</label> <input
					type="text" class="form-control" id="username" name="username"
					required placeholder="Nhập tên đăng nhập">
			</div>

			<div class="mb-3">
				<label for="password" class="form-label">Mật khẩu</label> <input
					type="password" class="form-control" id="password" name="password"
					required placeholder="Nhập mật khẩu">
			</div>

			<div class="form-check mb-3">
				<input type="checkbox" class="form-check-input" id="remember"
					name="remember"> <label class="form-check-label"
					for="remember">Ghi nhớ đăng nhập</label>
			</div>

			<div class="d-grid">
				<button type="submit" class="btn btn-primary">Đăng nhập</button>
			</div>

			<div class="mt-3 text-center">
				<a href="#" data-bs-toggle="modal" data-bs-target="#forgotModal">Quên
					mật khẩu?</a>
			</div>
		</form>
	</div>

	<!-- Modal Quên mật khẩu -->
	<div class="modal fade" id="forgotModal" tabindex="-1"
		aria-labelledby="forgotModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content rounded-4">
				<div class="modal-header">
					<h5 class="modal-title" id="forgotModalLabel">Quên mật khẩu</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<p>Nhập email đã đăng ký để nhận hướng dẫn đặt lại mật khẩu:</p>
					<form action="${pageContext.request.contextPath}/forgot-password"
						method="post">
						<div class="mb-3">
							<input type="email" class="form-control" name="email"
								placeholder="Nhập email của bạn" required>
						</div>
						<div class="text-end">
							<button type="submit" class="btn btn-primary">Gửi</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
