<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account</title>
<style>
/* General Styles (same as in manage-account.jsp) */
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

/* Sidebar Styling (same as in manage-account.jsp) */
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

input[type="text"], input[type="email"], input[type="password"], select
	{
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	margin-bottom: 15px;
}

label {
	font-weight: bold;
}

button {
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 1rem;
	background-color: #007bff;
	color: white;
}

button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<div class="dashboard-container">
		<!-- Sidebar (Same as manage-account.jsp) -->
		<div class="sidebar">
			<div class="logo">
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
			<h1>Create Account for School: ${school.schoolName}</h1>
			<form action="/psstv/admin/create-account" method="post">
				<input type="hidden" name="schoolCode" value="${school.schoolCode}" />
				<div>
					<label for="schoolCode">School Code:</label> <input type="text"
						id="schoolCode" value="${school.schoolCode}" disabled />
				</div>
				<div>
					<label for="schoolName">School Name:</label> <input type="text"
						id="schoolName" value="${school.schoolName}" disabled />
				</div>
				<div>
					<label for="email">Email:</label> <input type="text" id="email"
						value="${school.email}" disabled />
				</div>
				<div>
					<label for="contactNum">Contact Number:</label> <input type="text"
						id="contactNum" value="${school.contactNum}" disabled />
				</div>
				<div>
					<label for="username">Username:</label> <input type="text"
						id="username" name="username" required />
				</div>
				<div>
					<label for="password">Password:</label> <input type="password"
						id="password" name="password" required />
				</div>
				<div>
					<label for="role">Role:</label> <select name="role" id="role"
						required>
						<option value="school">School</option>
						<option value="admin">Admin</option>
					</select>
				</div>
				<button type="submit">Create Account</button>
			</form>

		</div>
	</div>
</body>
</html>
