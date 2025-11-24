<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý Category - Manager</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- Header -->
nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold d-flex align-items-center" href="#">
            <i class="bi bi-speedometer2 me-2"></i> Manager Panel
        </a>

        <div class="d-flex align-items-center">
            <span class="navbar-text text-white me-3">
                👋 Xin chào, <strong><c:out value="${sessionScope.user.userName}" default="Manager" /></strong>
            </span>
            <a href="${pageContext.request.contextPath}/logout" 
               class="btn btn-light btn-sm px-3 fw-semibold shadow-sm logout-btn">
               <i class="bi bi-box-arrow-right me-1"></i> Đăng xuất
            </a>
        </div>
    </div>
</nav>

<!-- Content -->
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3 class="fw-bold text-primary">📂 Danh mục của bạn</h3>
        <a href="${pageContext.request.contextPath}/manager/addCategory" class="btn btn-success btn-sm shadow-sm">+ Thêm Category</a>
    </div>

    <c:choose>
        <c:when test="${empty categories}">
            <div class="alert alert-info text-center mb-0">
                Bạn chưa có <strong>Category</strong> nào.
            </div>
        </c:when>

        <c:otherwise>
            <div class="table-responsive bg-white rounded shadow-sm p-2">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-primary text-center">
                        <tr>
                            <th width="10%">ID</th>
                            <th width="50%">Tên danh mục</th>
                            <th width="20%">Người tạo</th>
                            <th width="20%">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cat" items="${categories}">
                            <tr>
                                <td class="text-center fw-semibold">${cat.id}</td>
                                <td>${cat.name}</td>
                                <td class="text-center">${cat.user.userName}</td>
                                <td class="text-center">
                                    <a href="editCategory?id=${cat.id}" class="btn btn-warning btn-sm me-1">✏️ Sửa</a>
                                    <a href="deleteCategory?id=${cat.id}" class="btn btn-danger btn-sm"
                                       onclick="return confirm('Bạn có chắc muốn xóa Category này không?');">🗑️ Xóa</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<footer class="text-center text-muted mt-4 mb-3 small">
    © 2025 Manager Panel - Category Management
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
