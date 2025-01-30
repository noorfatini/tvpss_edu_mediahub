<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<meta charset="UTF-8">
<title>Validate TVPSS Crew Applications</title>
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
	background: #000;
	color: white;
	padding: 20px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	height: 100%;
	z-index: 100;
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
	margin-left: 280px;
	padding: 20px;
	flex: 1;
	background: #f5f5f5;
	overflow: auto;
}

h2 {
	font-size: 2rem;
	margin-bottom: 20px;
	font-weight: bold;
}

/* Filter Container */
.filter-container {
	display: flex;
	gap: 10px;
	margin-bottom: 20px;
}

.filter-btn {
	padding: 10px 20px;
	font-size: 14px;
	border: 1px solid #ddd;
	border-radius: 5px;
	cursor: pointer;
	background-color: #f4f4f4;
	color: #333;
}

.filter-btn:hover {
	background-color: #e6e6e6;
}

.filter-btn.active {
	background-color: #333;
	color: white;
}

/* Table Styling */
table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

table th, table td {
	padding: 12px;
	text-align: left;
	border: 1px solid #ddd;
}

table th {
	background-color: #f2f2f2;
	cursor: pointer;
}

.status-dot {
	height: 10px;
	width: 10px;
	border-radius: 50%;
	display: inline-block;
}

.green {
	background-color: green;
}

.red {
	background-color: red;
}

.gray {
	background-color: gray;
}

/* No Results Styling */
#noResults {
	display: none;
	color: #999;
	text-align: center;
	margin-top: 10px;
}

/* Stats Box */
.stats {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
}

.stat-box {
	flex: 1;
	padding: 20px;
	background: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	text-align: center;
	margin: 0 10px;
}

.stat-box h3 {
	font-size: 1.2rem;
	margin-bottom: 10px;
}

.stat-box p {
	font-size: 1.5rem;
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
		padding: 10px;
	}
	.content-container {
		flex-direction: column;
		margin-left: 0;
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
	.fas.fa-trash {
		font-size: 20px;
		color: red;
	}
}
</style>
<script>
    // JavaScript for filtering table rows
    function filterStatus(status) {
        const rows = document.querySelectorAll(".status-row");
        rows.forEach(row => {
            const rowStatus = row.dataset.status;  // Retrieve the data-status attribute from the row
            if (status === "all" || rowStatus === status) {
                row.style.display = "";  // Show the row
            } else {
                row.style.display = "none";  // Hide the row
            }
        });

        // Highlight the active filter button
        const buttons = document.querySelectorAll(".filter-btn");
        buttons.forEach(btn => btn.classList.remove("active"));
        document.getElementById("btn-" + status).classList.add("active");
    }

    // Real-time searching function
    function searchTable() {
        const input = document.getElementById("searchInput").value.toLowerCase();
        const rows = document.querySelectorAll(".status-row");
        let visibleRows = 0;

        rows.forEach(row => {
            const rowText = row.textContent.toLowerCase();
            if (rowText.includes(input)) {
                row.style.display = "";  // Show row
                visibleRows++;
            } else {
                row.style.display = "none";  // Hide row
            }
        });

        // Show or hide "No Results" message
        const noResultsMessage = document.getElementById("noResults");
        noResultsMessage.style.display = visibleRows === 0 ? "block" : "none";
    }
</script>
</head>
<body>

	<div class="dashboard-container">
		<!-- Sidebar -->
		<div class="sidebar">
			<div class="logo">
				<h2>TVPSS SCHOOL</h2>
			</div>
			<ul class="nav">
				<li><a href="#">View Content</a></li>
				<li><a href="#">View Event</a></li>
				<li><a href="#">Upload Information</a></li>
				<li><a href="#">Upload Resources</a></li>
				<li><a href="#">Validate Crew</a></li>
				<li><a href="#">Manage Content</a></li>
			</ul>
			<div class="footer">
				<p>© TVPSS, All Rights Reserved</p>
			</div>
		</div>

		<!-- Main Content -->
		<div class="content-container">
			<h2>Validate TVPSS Crew Applications</h2>

			<!-- Filter Buttons -->
			<div class="filter-container">
				<button class="filter-btn active" id="btn-all"
					onclick="filterStatus('all')">All</button>
				<button class="filter-btn" id="btn-approved"
					onclick="filterStatus('approved')">Approved</button>
				<button class="filter-btn" id="btn-rejected"
					onclick="filterStatus('rejected')">Rejected</button>
				<button class="filter-btn" id="btn-pending"
					onclick="filterStatus('pending')">Pending</button>
			</div>

			<div class="table-container">
				<input type="text" id="searchInput"
					placeholder="Search by name or status..."
					style="width: 98%; padding: 10px; margin-bottom: 10px;"
					onkeyup="searchTable()">

				<table data-sort-direction="asc">
					<thead>
						<tr>
							<th>No</th>
							<th>Name</th>
							<th>Application Status</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="application" items="${applications}">
							<tr class="status-row" data-status="${application.applyStat}">
								<td>${application.applyId}</td>
								<td><a href="#">${application.name}</a></td>
								<td><c:choose>
										<c:when test="${application.applyStat == 'APPROVED'}">
											<span class="status-dot green"></span> Approved
                    </c:when>
										<c:when test="${application.applyStat == 'REJECTED'}">
											<span class="status-dot red"></span> Rejected
                    </c:when>
										<c:when test="${application.applyStat == 'PENDING'}">
											<span class="status-dot gray"></span> Pending
                    </c:when>
									</c:choose></td>
								<td>
									<!-- Update Status Form -->
									<form action="updateStatus" method="POST"
										style="display: inline-block;">
										<input type="hidden" name="applyId"
											value="${application.applyId}"> <select
											name="applyStat" required>
											<option value="PENDING"
												${application.applyStat == 'PENDING' ? 'selected' : ''}>Pending</option>
											<option value="APPROVED"
												${application.applyStat == 'APPROVED' ? 'selected' : ''}>Approved</option>
											<option value="REJECTED"
												${application.applyStat == 'REJECTED' ? 'selected' : ''}>Rejected</option>
										</select>
										<button type="submit">Update</button>
									</form> <!-- Delete Application Form -->
									<form action="deleteApplication" method="POST"
										style="display: inline-block; margin-left: 10px;">
										<input type="hidden" name="applyId"
											value="${application.applyId}">
										<button type="submit"
											style="background: none; border: none; cursor: pointer;">
											<i class="fas fa-trash-alt" style="color: red;"></i>
											<!-- Trash icon -->
										</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
				<p id="noResults"
					style="display: none; color: #999; text-align: center; margin-top: 10px;">No
					results found</p>
			</div>

			<!-- school-validate-crew.jsp -->
			<div class="stats">
				<div class="stat-box">
					<h3>Total Applicants</h3>
					<p id="total-applicants">${totalApplicants}</p>
				</div>
				<div class="stat-box">
					<h3>Total Pending Applicants</h3>
					<p id="total-pending">${totalPending}</p>
				</div>
				<div class="stat-box">
					<h3>Total Approved Applicants</h3>
					<p id="total														-approved">${totalApproved}</p>
				</div>
				<div class="stat-box">
					<h3>Total Rejected Applicants</h3>
					<p id="total-rejected">${totalRejected}</p>
				</div>
			</div>


		</div>
	</div>
</body>
</html>