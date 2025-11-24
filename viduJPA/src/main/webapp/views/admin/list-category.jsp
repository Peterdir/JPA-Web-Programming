<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Danh sách danh mục</title>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f5f7fb;
	font-family: "Segoe UI", sans-serif;
	padding: 40px;
}

.table-container {
	max-width: 1100px;
	margin: auto;
	background: #ffffff;
	padding: 25px;
	border-radius: 12px;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
}

h2 {
	font-weight: 600;
	text-align: center;
	margin-bottom: 25px;
}

.thumb {
	width: 120px;
	height: 90px;
	object-fit: cover;
	border-radius: 6px;
	border: 1px solid #e6e6e6;
}

.btn-edit {
	background: #0d6efd;
	color: white;
}

.btn-edit:hover {
	background: #0b5ed7;
}

.btn-delete {
	background: #dc3545;
	color: white;
}

.btn-delete:hover {
	background: #bb2d3b;
}
</style>
</head>

<body>

	<div class="table-container">
		<div class="mb-3">
			<a href="${pageContext.request.contextPath}/admin/dashboard"
				class="btn btn-secondary"> ⬅ Quay lại Dashboard </a>
		</div>

		<h2>📂 Danh sách danh mục</h2>

		<div class="text-end mb-3">
			<a href="${pageContext.request.contextPath}/admin/category/add"
				class="btn btn-success"> ➕ Thêm danh mục </a>
		</div>

		<table
			class="table table-bordered table-hover align-middle text-center">
			<thead class="table-primary">
				<tr>
					<th width="60">STT</th>
					<th width="160">Hình ảnh</th>
					<th>Tên danh mục</th>
					<th width="170">Thao tác</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${cateList}" var="cate" varStatus="i">

					<c:url value="/image?fname=${cate.images}" var="imgUrl" />

					<tr>
						<td>${i.index + 1}</td>

						<td><img src="${imgUrl}" class="thumb"
							onerror="this.src='/images/no-image.png'"></td>

						<td class="fw-semibold">${cate.name}</td>

						<td><a
							href="<c:url value='/admin/category/edit?id=${cate.id}'/>"
							class="btn btn-sm btn-edit"> Sửa </a> <a
							href="<c:url value='/admin/category/delete?id=${cate.id}'/>"
							class="btn btn-sm btn-delete"
							onclick="return confirm('Bạn có chắc muốn xóa danh mục này?');">
								Xóa </a></td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
