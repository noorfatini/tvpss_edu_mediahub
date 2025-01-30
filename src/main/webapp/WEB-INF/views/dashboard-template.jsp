<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | TVPSS</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/styles/dashboard.css">
</head>
<body>
    <div class="dashboard-container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="logo">
                <img src="images/tvpss-logo.png" alt="TVPSS Logo">
                <h2>TVPSS MIS</h2>
            </div>
            <ul class="nav flex-column">
                <!-- Sidebar items will be dynamically included -->
                <jsp:include page="${sidebar}" />
            </ul>
            <div class="footer">
                <p>© TVPSS, All Rights Reserved</p>
            </div>
        </div>

        <!-- Main Content -->
        <div class="content-container">
            <div class="main-content">
                <!-- Content will be dynamically included -->
                <jsp:include page="${content}" />
            </div>
        </div>
    </div>
</body>
</html>
