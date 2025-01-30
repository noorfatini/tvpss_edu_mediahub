<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Manage Content Library</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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

/* Sidebar */
.sidebar {
	position: fixed;
	width: 15%;
	background: #000;
	color: white;
	padding: 20px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	height: 100%;
}

.sidebar .logo {
	display: flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 20px;
}

.sidebar .logo img {
	width: 40px;
	margin-right: 10px;
}

.sidebar .logo h2 {
	font-size: 1.2rem;
}

.sidebar .nav {
	list-style: none;
	padding: 0;
}

.sidebar .nav li {
	margin: 20px 0;
}

.sidebar .nav li a {
	text-decoration: none;
	color: white;
	font-size: 1rem;
}

.sidebar .nav li.active a {
	font-weight: bold;
	color: #a8dadc;
}

.sidebar .nav li a:hover {
	color: #a8dadc;
}

.sidebar .nav-footer {
	margin-top: 20px;
	text-decoration: none;
	color: white;
	font-size: 1rem;
}

.sidebar .nav-footer:hover {
	color: #a8dadc;
}

.sidebar .footer {
	margin-top: auto;
	text-align: center;
	font-size: 0.8rem;
	color: #cccccc;
}

/* Main Content */
.content-container {
	margin-left: 18%;
	padding: 20px;
	width: 100%;
}

.content-container h1 {
	font-size: 2rem;
	margin-bottom: 20px;
}

.search-bar {
	margin-bottom: 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.search-bar input {
	width: 70%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.search-bar button {
	padding: 10px 20px;
	background: #007bff;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

table {
	width: 100%;
	border-collapse: collapse;
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

/* Modal */
.modal {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	z-index: 10;
}

.modal.active {
	display: block;
}

.modal-overlay {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 5;
}

.modal-overlay.active {
	display: block;
}
</style>
<script>
        function openModal() {
            document.querySelector('.modal').classList.add('active');
            document.querySelector('.modal-overlay').classList.add('active');
        }

        function closeModal() {
            document.querySelector('.modal').classList.remove('active');
            document.querySelector('.modal-overlay').classList.remove('active');
        }
    </script>
</head>
<body>
	<div class="dashboard-container">
		<div class="sidebar">
			<div class="logo">
				<h2>TVPSS SCHOOL</h2>
			</div>
			<ul class="nav">
				<li class="active"><a href="/manage-content">Manage Content
						Library</a></li>
				<li><a href="/view-content?schoolCode=SCHOOL_CODE">View
						Content Library</a></li>
				<li><a href="/dashboard" class="nav-footer">Back to
						Dashboard</a></li>
			</ul>
			<div class="footer" style="margin-bottom: 30px;">
				<!-- Adjusted margin-bottom -->
				<p>© TVPSS, All Rights Reserved</p>
			</div>
		</div>


		<div class="content-container">
			<h1>Manage Content Library</h1>
			<div class="search-bar">
				<input type="text" placeholder="Search...">
				<button onclick="openModal()">Create New Video</button>
			</div>
			<table>
				<thead>
					<tr>
						<th>Thumbnail</th>
						<th>Link</th>
						<th>Description</th>
						<th>Upload Date</th>
						<th>Status</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="content" items="${contents}">
						<tr>
							<td><img
								src="${pageContext.request.contextPath}${content.contentPic}"
								alt="Thumbnail" style="width: 100px;"></td>
							<td><a href="${content.contentLink}" target="_blank">View</a></td>
							<td>${content.contentDesc}</td>
							<td>${content.uploadDate}</td>
							<td>${content.status}</td>
							<td><button>Delete</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal-overlay" onclick="closeModal()"></div>
	<div class="modal">
		<h2>Create Content</h2>
		<form id="uploadForm">
			<input type="hidden" name="userID" value="${user.id}"> <label
				for="contentTitle">Title:</label> <input type="text"
				name="contentTitle" required> <label for="contentLink">Link:</label>
			<input type="text" name="contentLink" required> <label
				for="contentDesc">Description:</label>
			<textarea name="contentDesc" required></textarea>
			<label for="contentPic">Thumbnail:</label> <input type="text"
				name="contentPic" required>
			<button type="submit">Upload</button>
		</form>


		<button onclick="closeModal()">Close</button>
	</div>

	<script>
    document.addEventListener("DOMContentLoaded", function () {
        const uploadForm = document.getElementById("uploadForm");

        uploadForm.addEventListener("submit", function (e) {
            e.preventDefault();
            const formData = new FormData(uploadForm);

            fetch("/add-content", {
                method: "POST",
                body: formData,
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error("Failed to upload content.");
                    }
                    return response.json();
                })
                .then(data => {
                    closeModal();
                    // Dynamically update the content table
                })
                .catch(error => {
                    alert("Error uploading content: " + error.message);
                });


        });
    });

    function closeModal() {
        document.querySelector(".modal").classList.remove("active");
        document.querySelector(".modal-overlay").classList.remove("active");
    }
</script>

</body>
</html>