<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>apply crew</title>

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

.main-content {
	margin-left: 250px;
	padding: 40px;
}

.header {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
}

.form-container {
	background-color: #ffffff;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin-bottom: 20px;
}

.form-container label {
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 8px;
	display: block;
}

.form-container input, .form-container textarea {
	width: 100%;
	padding: 10px;
	font-size: 16px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.form-container textarea {
	resize: vertical;
}

.form-container input[type="file"] {
	font-size: 16px;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 4px;
	width: 100%;
	box-sizing: border-box;
}

.form-buttons {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

.form-buttons .btn {
	background-color: #0046e0;
	color: white;
	padding: 12px 20px;
	font-size: 16px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-decoration: none;
	display: inline-block;
}

.form-buttons .btn:hover {
	background-color: #0032a8;
}

.popup {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: #28a745;
	color: white;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
</style>

</head>
<body>
	<!-- Sidebar -->
	<div class="sidebar">
		<div class="logo">
<%-- 			<img src="${pageContext.request.contextPath}/images/tvpss-logo.png" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/images/placeholder.png'" alt="TVPSS Logo">
 --%>			<h2>TVPSS GUEST</h2>
		</div>
		<ul class="nav">
			<li><a href="/psstv/guest/view-content">View Content</a></li>
			<li><a href="/psstv/guest/view-event">View Event</a></li>
			<li><a href="/psstv/guest/guest-apply-crew">Apply Crew</a></li>
			<li><a href="/psstv/guest/request-account">Request Account</a></li>
		</ul>
		<div class="footer">
			<p>© TVPSS, All Rights Reserved</p>
		</div>
	</div>
	<!-- Main Content -->
	<div class="main-content">
		<div class="header">CREW APPLICATION FORM</div>
		<div class="form-container">
			<form action="/psstv/guest/submitCrewApplication" method="POST">
				<label for="fullName">Full Name</label> <input type="text"
					id="fullName" name="name" placeholder="Enter your full name"
					required /> <label for="age">Age</label> <input type="number"
					id="age" name="age" placeholder="Enter your age" required /> <label
					for="phoneNum">Phone Number</label> <input type="text"
					id="phoneNum" name="phoneNum" placeholder="Enter your phone number"
					required /> <label for="schoolName">School Name</label> <input
					type="text" id="schoolName" name="schoolName"
					placeholder="Enter your school name" required /> <label
					for="reason">Why do you want to join TVPSS?</label>
				<textarea id="reason" name="reason" rows="4"
					placeholder="Explain your motivation" required></textarea>

				<button type="btn">Submit</button>
			</form>


		</div>
	</div>
	<!-- Popup Message -->
	<div id="successPopup" class="popup">
		<p>${message}</p>
	</div>

	<script>
        // Show success message if it exists in the model
        <% if (request.getAttribute("message") != null) { %>
            var successMessage = "<%= request.getAttribute("message") %>";
            var popup = document.getElementById('successPopup');
            popup.style.display = 'block';
            setTimeout(function() {
                popup.style.display = 'none';
            }, 3000); // Hide after 3 seconds
        <% } %>
    </script>
</body>
</html>