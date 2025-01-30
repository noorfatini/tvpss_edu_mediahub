<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>School List</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
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
	position: relative;
	margin-top: auto;
	margin-bottom: 35px;
}

.content-container {
	margin-left: 18%;
	padding: 20px;
}

h1 {
	font-size: 2rem;
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 10px;
	border: 1px solid #ccc;
	text-align: left;
}

th {
	background: #333;
	color: white;
}

a {
	color: #007bff;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

.search-bar {
	margin-bottom: 20px;
	display: flex;
	gap: 10px;
}

.search-bar input {
	width: 70%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}
</style>
<script>
        document.addEventListener('DOMContentLoaded', function () {
            const searchInput = document.querySelector('.search-bar input');
            const tableRows = document.querySelectorAll('table tbody tr');

            searchInput.addEventListener('input', function () {
                const query = searchInput.value.trim().toLowerCase();

                tableRows.forEach(row => {
                    const schoolCode = row.children[0].textContent.toLowerCase();
                    const schoolName = row.children[1].textContent.toLowerCase();

                    if (schoolCode.includes(query) || schoolName.includes(query)) {
                        row.style.display = ''; // Show matching rows
                    } else {
                        row.style.display = 'none'; // Hide non-matching rows
                    }
                });
            });
        });
    </script>
</head>
<body>
	<div class="dashboard-container">
		<div class="sidebar">
			<div class="logo">
				<h2>TVPSS SCHOOL</h2>
			</div>
			<ul class="nav">
				<!-- <!-- <li class="active"><a href="/manage-content">Manage Content
						Library</a></li>
				<li><a href="/view-content?schoolCode=SCHOOL_CODE">View
						Content Library</a></li>
				<li><a href="/dashboard" class="nav-footer">Back to
						Dashboard</a></li> -->
			</ul>
			<div class="footer" style="margin-bottom: 30px;">
				<!-- Adjusted margin-bottom -->
				<p>© TVPSS, All Rights Reserved</p>
			</div>
		</div>
		<div class="content-container">
			<h1>School List</h1>
			<div class="search-bar">
				<input type="text" placeholder="Search by School Name or Code">
			</div>
			<table>
				<thead>
					<tr>
						<th>School Code</th>
						<th>School Name</th>
						<th>Version (TVPSS)</th>
						<th>Level (Studio)</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="school" items="${schools}">
						<tr>
							<td>${school.schoolCode}</td>
							<td>${school.schoolName}</td>
							<td>${school.version}</td>
							<td>${school.level}</td>
							<td><a href="view-content?schoolCode=${school.schoolCode}">View
									Content</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>