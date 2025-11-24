<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đặt lại mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5" style="max-width: 450px;">
    <div class="card p-4 shadow-sm">
        <h4 class="text-center">Đặt lại mật khẩu</h4>

        <form action="${pageContext.request.contextPath}/reset-password" method="post">
            
            <!-- giữ lại email -->
            <input type="hidden" name="email" value="${email}">

            <div class="mb-3">
                <label class="form-label">Mật khẩu mới</label>
                <input type="password" name="newPassword" class="form-control" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Nhập lại mật khẩu</label>
                <input type="password" name="confirmPassword" class="form-control" required>
            </div>

            <div class="d-grid">
                <button class="btn btn-primary">Xác nhận</button>
            </div>
        </form>

        <c:if test="${not empty message}">
            <div class="alert alert-danger mt-3">${message}</div>
        </c:if>
    </div>
</div>

</body>
</html>
