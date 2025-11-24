<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Trang quản trị</title>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f5f7fb;
	font-family: "Segoe UI", sans-serif;
	min-height: 100vh;
	padding: 30px 20px;
}

.dashboard-title {
	font-weight: 600;
	text-align: center;
	margin-bottom: 30px;
}

.menu-card {
	padding: 25px;
	border-radius: 14px;
	text-align: center;
	transition: 0.25s ease;
	border: 1px solid #e3e6ea;
	background: #ffffff;
	cursor: pointer;
}

.menu-card:hover {
	background: #0d6efd;
	color: white !important;
	transform: translateY(-5px);
	box-shadow: 0 8px 18px rgba(0, 0, 0, 0.15);
}

.menu-icon {
	font-size: 40px;
	margin-bottom: 10px;
}

a.menu-link {
	text-decoration: none;
	color: inherit;
}
</style>

</head>
<body>

	<div class="mb-3">
		<a href="${pageContext.request.contextPath}/home"
			class="btn btn-secondary"> ⬅ Quay lại trang Home </a>
	</div>

	<h2 class="dashboard-title">Trang quản trị hệ thống</h2>

	<div class="container mt-4">
		<div class="row justify-content-center g-4">

			<!-- Card 1 -->
			<div class="col-md-4 col-sm-6">
				<a href="${pageContext.request.contextPath}/admin/category/list"
					class="menu-link">
					<div class="menu-card">
						<div class="menu-icon">📂</div>
						<h5>Quản lý danh mục</h5>
						<p class="text-muted mt-2">Thêm, sửa, xóa danh mục sản phẩm</p>
					</div>
				</a>
			</div>

			<!-- Card 2 (để dành chức năng sau này) -->
			<div class="col-md-4 col-sm-6">
				<a href="#" class="menu-link">
					<div class="menu-card">
						<div class="menu-icon">🛒</div>
						<h5>Quản lý sản phẩm</h5>
						<p class="text-muted mt-2">Tính năng sẽ cập nhật sau</p>
					</div>
				</a>
			</div>

		</div>
	</div>

</body>
</html>
