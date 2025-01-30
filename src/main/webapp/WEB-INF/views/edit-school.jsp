<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit School Account</title>
<style>
/* General Styles */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	display: flex;
	background: #f5f5f5;
}

.dashboard-container {
	display: flex;
	width: 100%;
	height: 100vh;
}

/* Sidebar Styling */
.sidebar {
	position: fixed;
	width: 15%;
	background: rgb(0, 0, 0);
	color: white;
	padding: 20px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	height: 100%;
}

.logo {
	display: flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 20px;
}

.logo img {
	width: 40px;
	margin-right: 10px;
}

.logo h2 {
	font-size: 1.2rem;
}

.nav {
	list-style: none;
	padding: 0;
}

.nav li {
	margin: 20px 0;
}

.nav li a {
	text-decoration: none;
	color: white;
	font-size: 1rem;
}

.nav li a:hover {
	color: #a8dadc;
}

.footer {
	text-align: center;
	font-size: 0.8rem;
	color: #cccccc;
	margin-top: auto;
	margin-bottom: 35px;
}

/* Main Content Styling */
.content-container {
	flex: 1;
	margin-left: 18%;
	padding: 20px;
}

h1 {
	font-size: 2rem;
	margin-bottom: 20px;
}

form {
	margin-top: 20px;
}

.form-group {
	margin-bottom: 15px;
}

label {
	font-size: 1rem;
	display: block;
	margin-bottom: 5px;
}

input[type="text"], input[type="email"], input[type="password"] {
	width: 100%;
	padding: 8px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 1rem;
}

button[type="submit"] {
	background-color: #007bff;
	color: white;
	padding: 10px 15px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button[type="submit"]:hover {
	background-color: #0056b3;
}

.alert {
	margin-bottom: 20px;
	padding: 15px;
	color: white;
	background-color: #4CAF50;
}

.alert.error {
	background-color: #f44336;
}

.alert.success {
	background-color: #4CAF50;
}
</style>
</head>
<body>
	<div class="dashboard-container">
		<!-- Sidebar -->
		<div class="sidebar">
			<div class="logo">
				<%-- <img src="${pageContext.request.contextPath}/images/tvpss-logo.png"
					alt="TVPSS Logo"> --%>
				<h2>TVPSS ADMIN</h2>
			</div>
			<ul class="nav">
				<li><a href="/psstv/admin/view-content">View Content</a></li>
				<li><a href="/psstv/admin/view-event">View Event</a></li>
				<li><a href="/psstv/admin/manage-account">Manage Account</a></li>
				<li><a href="/psstv/admin/validate-school">Validate School</a></li>
			</ul>
			<div class="footer">
				<p>© TVPSS, All Rights Reserved</p>
			</div>
		</div>

		<!-- Main Content -->
		<div class="content-container">
			<h1>Edit School Account</h1>

			<!-- Display Error or Success Message -->
			<c:if test="${not empty errorMessage}">
				<div class="alert error">${errorMessage}</div>
			</c:if>

			<form action="/psstv/admin/update-school" method="post">
				<input type="hidden" name="schoolCode" value="${school.schoolCode}" />

				<div class="form-group">
					<label for="schoolCode">School Code:</label> <input type="text"
						id="schoolCode" value="${school.schoolCode}" disabled />
				</div>
				<div class="form-group">
					<label for="schoolName">School Name:</label> <input type="text"
						id="schoolName" value="${school.schoolName}" disabled />
				</div>
				<div class="form-group">
					<label for="districtPPD">District PPD:</label> <input type="text"
						id="districtPPD" value="${school.districtPPD}" disabled />
				</div>
				<div class="form-group">
					<label for="address">Address:</label> <input type="text"
						id="address" value="${school.address}" disabled />
				</div>
				<div class="form-group">
					<label for="registeredStatus">Registered Status:</label> <input
						type="text" id="registeredStatus"
						value="${school.registeredStatus}" disabled />
				</div>

				<!-- Display message for schools that don't have a user yet -->
				<c:if test="${!hasUser}">
					<div class="alert">School doesn't have an account yet.</div>
				</c:if>

				<!-- Editable Fields for User Information if user exists -->
				<c:if test="${hasUser}">
					<div class="form-group">
						<label for="username">Username:</label> <input type="text"
							id="username" value="${user.username}" disabled />
					</div>

					<!-- Only show password field if school has a user and is not REQUEST or UNREGISTERED -->
					<c:if
						test="${school.registeredStatus != 'REQUEST' && school.registeredStatus != 'UNREGISTERED'}">
						<div class="form-group">
							<label for="password">Password:</label> <input type="password"
								id="password" name="password" value="${user.password}" />
						</div>
					</c:if>

					<div class="form-group">
						<label for="email">Email:</label> <input type="email" id="email"
							name="email" value="${school.email}" />
					</div>
					<div class="form-group">
						<label for="contactNum">Contact Number:</label> <input type="text"
							id="contactNum" name="contactNum" value="${school.contactNum}" />
					</div>
				</c:if>

				<!-- Editable fields for REQUEST and UNREGISTERED schools -->
				<c:if
					test="${school.registeredStatus == 'REQUEST' || school.registeredStatus == 'UNREGISTERED'}">
					<div class="form-group">
						<label for="email">Email:</label> <input type="email" id="email"
							name="email" value="${school.email}" />
					</div>
					<div class="form-group">
						<label for="contactNum">Contact Number:</label> <input type="text"
							id="contactNum" name="contactNum" value="${school.contactNum}" />
					</div>
				</c:if>

				<button type="submit">Update</button>
			</form>
		</div>
	</div>
</body>
</html>
