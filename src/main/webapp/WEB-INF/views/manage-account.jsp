<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Account</title>
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

table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #333;
	color: white;
}

.registered {
	color: green;
	font-weight: bold;
}

.unregistered {
	color: red;
	font-weight: bold;
}

.request {
	color: orange;
	font-weight: bold;
}

.search-bar {
	margin-bottom: 20px;
	width: 100%- 50px;
	margin-right: 20px;
}

input[type="text"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

@media ( max-width : 768px) {
	.sidebar {
		width: 100%;
		flex-direction: row;
		justify-content: space-between;
	}
	.content-container {
		margin-left: 0;
		margin-top: 20px;
	}
}

.btn {
	padding: 5px 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 0.9rem;
	text-decoration: none;
	color: white;
}

.btn-edit {
	background-color: #007bff;
}

.btn-edit:hover {
	background-color: #0056b3;
}

.btn-delete {
	background-color: #dc3545;
}

.btn-delete:hover {
	background-color: #a71d2a;
}
</style>
</head>
<body>
	<div class="dashboard-container">
		<!-- Sidebar -->
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
			<h1>Manage Accounts</h1>

			<!-- Success Message -->
			<c:if test="${not empty deleteSuccess}">
				<div class="alert success">${deleteSuccess}</div>
			</c:if>

			<div class="search-bar">
				<input type="text" placeholder="Search..." onkeyup="filterTable()"
					id="searchInput">
			</div>
			<table id="schoolTable">
				<thead>
					<tr>
						<th>Code</th>
						<th>School Name</th>
						<th>PPD</th>
						<th>Username</th>
						<th>Contact</th>
						<th>Registered</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="school" items="${schools}">
						<tr>
							<td>${school.schoolCode}</td>
							<td>${school.schoolName}</td>
							<td>${school.districtPPD}</td>
							<td><c:choose>
									<c:when test="${school.registeredStatus == 'REGISTERED'}">
										${school.userID.username}
									</c:when>
									<c:otherwise>
										-
									</c:otherwise>
								</c:choose></td>
							<td>${school.contactNum}</td>
							<td><span
								class="${school.registeredStatus == 'REGISTERED' ? 'registered' : (school.registeredStatus == 'REQUEST' ? 'request' : 'unregistered')}">
									<c:choose>
										<c:when test="${school.registeredStatus == 'REQUEST'}">
											<!-- If the status is REQUEST, make it a clickable link to create an account -->
											<a
												href="/psstv/admin/create-account?schoolCode=${school.schoolCode}"
												class="request-link">${school.registeredStatus}</a>
										</c:when>
										<c:otherwise>
											<!-- For other statuses, just display the text -->
											${school.registeredStatus}
										</c:otherwise>
									</c:choose>
							</span></td>
							<td>
								<!-- Buttons for Edit and Delete --> <a
								href="/psstv/admin/edit-school?schoolCode=${school.schoolCode}"
								class="btn btn-edit">Edit</a>
								<button onclick="confirmDelete('${school.schoolCode}')"
									class="btn btn-delete">Delete</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<script>
		function filterTable() {
			const input = document.getElementById("searchInput");
			const filter = input.value.toLowerCase();
			const rows = document.querySelectorAll("#schoolTable tbody tr");

			rows.forEach(row => {
				const text = row.innerText.toLowerCase();
				row.style.display = text.includes(filter) ? "" : "none";
			});
		}

		function confirmDelete(schoolCode) {
		    console.log(`Deleting school with code: ${schoolCode}`);
		    
		    const confirmation = confirm(`Are you sure you want to delete the account for school with code ${schoolCode}?`);
		    if (confirmation) {
		        // Redirect to the delete URL
		        window.location.href = `/psstv/admin/delete-school?schoolCode=${schoolCode}`;
		    }
		}

	</script>
</body>

</html>
