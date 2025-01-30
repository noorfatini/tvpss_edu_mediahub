<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Request TVPSS Account</title>
<style>
/* General Styles */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
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

.header {
	font-size: 2rem;
	font-weight: bold;
	margin-bottom: 20px;
}

.description {
	font-size: 1rem;
	color: #555;
	margin-bottom: 20px;
	text-align: left;
}

.form-container {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
	width: calc(100% - 555px);
}

input {
	width: 50%;
	padding: 10px 20px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.btn {
	background-color: #007bff;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.btn:hover {
	background-color: #0056b3;
}

.error-message {
	color: red;
	margin-top: 10px;
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
				<h2>TVPSS GUEST</h2>
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
		<div class="content-container">
			<div class="main-content">
				<div class="header">Request TVPSS Account</div>
				<div class="description">Please enter your school email and
					password to request an account.</div>

				<div class="form-container">
					<form action="/psstv/guest/request-account" method="post">
						<input type="email" name="email" placeholder="Enter your email"
							required> <input type="password" name="password"
							placeholder="Enter your password" required><br>
						<button type="submit" class="btn">Submit</button>
					</form>
				</div>

				<!-- If school details are available, display them -->
				<c:if test="${not empty schoolDetails}">
					<div class="form-container">
						<h3>School Information</h3>
						<p>School Name: ${schoolDetails.schoolName}</p>
						<p>District PPD: ${schoolDetails.districtPPD}</p>
						<p>Address: ${schoolDetails.address}</p>
						<p>Status: ${schoolDetails.registeredStatus}</p>
						<button onclick="showConfirmation()">Create TVPSS Account</button>
						<input type="hidden" id="schoolCode"
							value="${schoolDetails.schoolCode}">
					</div>
				</c:if>

				<!-- If validation fails, display error message -->
				<c:if test="${not empty errorMessage}">
					<div class="error-message">${errorMessage}</div>
				</c:if>
			</div>
		</div>
	</div>

	<script>
	function showConfirmation() {
	    const confirmAction = confirm("Are you sure you want to create an account for the selected school?");
	    if (confirmAction) {
	        const schoolCode = document.getElementById("schoolCode").value;  // Get the schoolCode value from hidden input
	        console.log("School Code Sent: ", schoolCode);  // Debugging log

	        if (!schoolCode) {
	            alert("Error: Missing school code.");
	            return;
	        }

	        // Sending the schoolCode to the backend using fetch
	        fetch("/psstv/guest/create-account", {
	            method: "POST",
	            headers: {
	                "Content-Type": "application/x-www-form-urlencoded"
	            },
	            body: "schoolCode=" + encodeURIComponent(schoolCode)  // Send the schoolCode correctly
	        })
	        .then(response => response.text())
	        .then(message => {
	            alert(message); // Show the response message
	            if (message.includes("Request has been sent")) {
	                window.location.reload(); // Reload page to reflect changes
	            }
	        })
	        .catch(error => {
	            console.error("Error:", error);
	            alert("Something went wrong. Please try again.");
	        });
	    }
	}

    </script>
</body>

</html>
