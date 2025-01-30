<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>${schoolName}Content</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
/* General Styles */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background: #f5f5f5;
	display: flex;
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

.content-container {
	margin-left: 18%;
	padding: 20px;
	flex: 1;
	display: flex;
	flex-direction: column;
	align-items: center;
}

h1 {
	font-size: 2rem;
	margin-bottom: 10px;
	text-align: center;
}

h2 {
	font-size: 1.5rem;
	margin-bottom: 20px;
	color: #666;
	text-align: center;
}

.video-list-section {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
	gap: 20px;
	width: 100%;
	max-width: 1200px;
	margin-top: 20px;
}

.video-thumbnail {
	background: white;
	border-radius: 8px;
	padding: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	text-align: center;
	transition: transform 0.2s;
}

.video-thumbnail img {
	width: 100%;
	border-radius: 8px;
	cursor: pointer;
}

.video-thumbnail a {
	text-decoration: none;
	color: #000;
}

.video-thumbnail p {
	font-size: 1rem;
	margin: 10px 0;
	font-weight: bold;
}

.video-thumbnail:hover {
	transform: scale(1.05);
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
		margin-left: 0;
		padding: 10px;
	}
	.video-list-section {
		grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
	}
}
</style>
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
			<h1>${schoolName}Content</h1>
			<h2>Total Videos: ${totalVideos}</h2>
			<div class="video-list-section">
				<c:forEach var="content" items="${contents}">
					<div class="video-thumbnail">
						<a href="${content.contentLink}" target="_blank"> <img
							src="${content.contentPic}" alt="${content.contentTitle}">
						</a>
						<p>${content.contentTitle}</p>
					</div>
				</c:forEach>


			</div>
		</div>
	</div>
</body>
</html>