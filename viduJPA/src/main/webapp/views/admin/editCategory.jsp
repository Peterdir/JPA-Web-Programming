<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sửa Category</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="card shadow-sm">
        <div class="card-header bg-warning text-dark">
            <h4 class="mb-0">✏️ Chỉnh sửa Category</h4>
        </div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/admin/editCategory" method="post">
                <input type="hidden" name="id" value="${category.id}">
                <div class="mb-3">
                    <label class="form-label">Tên danh mục</label>
                    <input type="text" name="name" value="${category.name}" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-warning text-white">Cập nhật</button>
                <a href="${pageContext.request.contextPath}/admin/home" class="btn btn-secondary">Hủy</a>
            </form>
        </div>
    </div>
</div>
</body>
</html>
