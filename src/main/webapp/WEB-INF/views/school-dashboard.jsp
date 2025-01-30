<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>School Dashboard</title>

<!-- Inline CSS styles -->
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
	position: fixed; /* Keeps the sidebar fixed in place */
	width: 15%;
	background: rgb(0, 0, 0);
	color: white;
	padding: 20px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	height: 100%;
	/* Ensures the sidebar takes up the full height of the viewport */
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
	position: relative; /* Ensures it stays within the layout */
	margin-top: auto;
	margin-bottom: 35px;
}
/* Main Content Styling */
.content-container {
	display: flex;
	flex: 1;
	margin-left: 18%;
	/* Pushes the content to the right to make space for the sidebar */
}

.main-content {
	flex: 3;
	padding: 20px;
	background: #f5f5f5;
	border-radius: 10px;
}

h1 {
	font-size: 2rem;
	margin-bottom: 20px;
}

/* Link for Logout */
a {
	color: #007bff;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

/* Responsive Design */
@media ( max-width : 768px) {
	.dashboard-container {
		flex-direction: column;
	}
	.sidebar {
		width: 100%;
		flex-direction: row;
		justify-content: space-between;
	}
	.content-container {
		flex-direction: column;
	}
	.main-content {
		margin-top: 20px;
	}
	.nav {
		display: flex;
		flex-direction: row;
		gap: 10px;
	}
	.nav li {
		margin: 0;
	}
}
</style>
</head>
<body>
	<div class="dashboard-container">
		<!-- Sidebar -->
		<div class="sidebar">
			<div class="logo">
<%-- 				<img src="${pageContext.request.contextPath}/images/tvpss-logo.png"
					alt="TVPSS Logo">
 --%>				<h2>TVPSS SCHOOL</h2>
			</div>
			<ul class="nav">
				<li><a href="/psstv/school/list-content">View Content</a></li>
				<li><a href="/psstv/school/view-event">View Event</a></li>
				<li><a href="/psstv/upload-tvpss">Upload Information</a></li>
				<li><a href="/psstv/upload-tvpss">Upload Resources</a></li>
				<li><a href="/psstv/school/school-validate-crew">Validate
						Crew</a></li>
				<li><a href="/psstv/school/school-manage-content">Manage Content</a></li>
				<li><a href="javascript:void(0);"
					onclick="toggleManageEventDropdown()">Manage Event</a> <!-- Dropdown menu for Manage Event -->
					<div id="manageEventDropdown">
						<a href="/psstv/school/create-event">Create Event</a><br> <a
							href="school-read-event.jsp">View Events</a><br> <a
							href="school-update-event.jsp">Update Event</a><br> <a
							href="school-delete-event.jsp">Delete Event</a>
					</div></li>
			</ul>
			<div class="footer">
				<p>© TVPSS, All Rights Reserved</p>
			</div>
		</div>

		<!-- Main Content -->
		<div class="content-container">
			<div class="main-content">
				<h1>Welcome to the School Dashboard</h1>
				<p>This is the dashboard for school users. Manage your content,
					events, and resources here.</p>
				<a href="logout">Logout</a>
			</div>
		</div>
	</div>

	<script>
        // JavaScript to toggle the visibility of the "Manage Event" dropdown
        function toggleManageEventDropdown() {
            var dropdown = document.getElementById("manageEventDropdown");
            if (dropdown.style.display === "none" || dropdown.style.display === "") {
                dropdown.style.display = "block";
            } else {
                dropdown.style.display = "none";
            }
        }
    </script>
</body>
</html>
