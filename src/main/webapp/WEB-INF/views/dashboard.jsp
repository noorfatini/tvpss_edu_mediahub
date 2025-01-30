<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard | TVPSS</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
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
	width: 15%;
	background: rgb(0, 0, 0);
	color: white;
	padding: 20px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
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
	margin-top: auto;
	font-size: 0.8rem;
	color: #cccccc;
}

/* Content Container */
.content-container {
	display: flex;
	flex: 1;
}

/* Main Content */
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

/* Statistics Cards */
.stats {
	display: flex;
	gap: 20px;
	margin-bottom: 30px;
}

.stat-card {
	flex: 1;
	height: 115px;
	background: #d9d9d9;
	border-radius: 10px;
	text-align: center;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	padding: 10px;
}

.stat-card h2 {
	margin-bottom: 10px;
	font-size: 1.2rem;
}

.stat-card p {
	font-size: 1.5rem;
	font-weight: bold;
	color: #333;
}

/* Search Section */
.search-section {
	margin-bottom: 20px;
	text-align: center;
}

#searchInput {
	width: 80%;
	max-width: 500px;
	padding: 12px 15px;
	font-size: 16px;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	outline: none;
	transition: all 0.3s ease;
}

#searchInput:focus {
	border-color: #007bff;
	box-shadow: 0 4px 10px rgba(0, 123, 255, 0.2);
	background-color: #f8f9fa;
}

/* Filter Section */
.filter-section {
	margin-bottom: 20px;
	display: flex;
	gap: 15px;
	align-items: center;
	justify-content: center;
}

.filter-section label {
	font-size: 1rem;
	margin-right: 5px;
}

.filter-section select {
	padding: 8px 12px;
	font-size: 1rem;
	border: 1px solid #ddd;
	border-radius: 5px;
	outline: none;
	transition: all 0.3s ease;
}

.filter-section select:focus {
	border-color: #007bff;
	box-shadow: 0 4px 10px rgba(0, 123, 255, 0.2);
}

/* Table Section */
.table-section {
	margin-bottom: 30px;
}

table {
	width: 100%;
	border-collapse: collapse;
	text-align: left;
	background: #fff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
	overflow: hidden;
}

table th, table td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: left;
}

table th {
	background: #d9d9d9;
	color: black;
	font-weight: bold;
	cursor: pointer;
}

table td a {
	color: #007bff;
	text-decoration: none;
}

table td a:hover {
	text-decoration: underline;
}

/* Pagination Buttons */
.pagination {
	margin-top: 10px;
	display: flex;
	justify-content: space-between;
}

.pagination button {
	background: #007bff;
	color: white;
	border: none;
	padding: 8px 15px;
	border-radius: 5px;
	cursor: pointer;
}

.pagination button:hover {
	background: #0056b3;
}

/* Upcoming Events Section */
.events-section {
	flex: 1;
	padding: 20px;
	background: #d9d9d9;
	border-radius: 10px;
	border: 2px solid #000000;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	margin-left: 20px;
	margin: 40px;
}

.events-section h2 {
	text-align: center;
	font-size: 1.5rem;
}

.events {
	display: flex;
	flex-direction: column;
	gap: 20px;
	margin-top: 20px;
}

.event-card {
	display: flex;
	align-items: center;
	padding: 10px;
	background: #f8f9fa;
	border-radius: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.event-card img {
	width: 80px;
	margin-right: 10px;
	border-radius: 5px;
}

.event-card p {
	margin: 0;
	font-size: 1rem;
}

.event-card button {
	margin-left: auto;
	padding: 8px 12px;
	background: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.event-card button:hover {
	background: #0056b3;
}

.see-all {
	text-align: center;
	color: #1d3557;
	font-weight: bold;
	margin-top: 10px;
	text-decoration: none;
}

.see-all:hover {
	color: #457b9d;
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
	.stats {
		flex-direction: column;
	}
	.events-section {
		margin: 20px 0;
	}
	.filter-section {
		flex-direction: column;
		gap: 10px;
	}
}
</style>
</head>
<body>
	<div class="dashboard-container">
		<!-- Sidebar -->
		<div class="sidebar">
			<div class="logo">
				<img src="images/tvpss-logo.png" alt="TVPSS Logo">
				<h2>TVPSS MIS</h2>
			</div>
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link active"
					href="/psstv/dashboard">Dashboard</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/psstv/resource-list">Upload Resource</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/psstv/approve-resource">Approve Resource</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/psstv/upload-tvpss">Upload TVPSS</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/psstv/criteria-list">Criteria List</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/psstv/validate-tvpss">Validate TVPSS</a></li>
			</ul>
			<div class="footer">
				<p>© TVPSS, All Rights Reserved</p>
			</div>
		</div>

		<!-- Main Content -->
		<div class="content-container">
			<div class="main-content">
				<h1>ADMIN DASHBOARD</h1>
				<div class="stats">
					<div class="stat-card">
						<h2>Total School Registered</h2>
						<p>364</p>
					</div>
					<div class="stat-card">
						<h2>Total Content Published</h2>
						<p>3220</p>
					</div>
					<div class="stat-card">
						<h2>Total Active Crew</h2>
						<p>4210</p>
					</div>
				</div>

				<!-- Search Section -->
				<div class="search-section">
					<input type="text" id="searchInput"
						placeholder="Search by Code or School Name"
						onkeyup="searchTable()" />
				</div>

				<!-- Filter Section -->
				<div class="filter-section">
					<label for="filterVersion">Filter by TVPSS Version:</label> <select
						id="filterVersion" onchange="filterTable()">
						<option value="">All</option>
						<option value="1">Version 1</option>
						<option value="2">Version 2</option>
						<option value="3">Version 3</option>
						<option value="4">Version 4</option>
					</select> <label for="filterStudio">Filter by Studio Level:</label> <select
						id="filterStudio" onchange="filterTable()">
						<option value="">All</option>
						<option value="1">Level 1</option>
						<option value="2">Level 2</option>
						<option value="3">Level 3</option>
					</select>
				</div>

				<!-- Table Section -->
				<div class="table-section">
					<table>
						<thead>
							<tr>
								<th>Code</th>
								<th>School Name</th>
								<th>TVPSS Version</th>
								<th>Studio Level</th>
								<th>Link</th>
							</tr>
						</thead>
						<tbody id="schoolTable">
							<tr>
								<td>JBA3033</td>
								<td>SEKOLAH KEBANGSAAN MAWAI</td>
								<td>2</td>
								<td>2</td>
								<td><a href="#">🔗</a></td>
							</tr>
							<tr>
								<td>JBA3034</td>
								<td>SEKOLAH KEBANGSAAN SERI AMAN</td>
								<td>1</td>
								<td>3</td>
								<td><a href="#">🔗</a></td>
							</tr>
							<tr>
								<td>JBA3035</td>
								<td>SEKOLAH KEBANGSAAN NAM HENG</td>
								<td>3</td>
								<td>1</td>
								<td><a href="#">🔗</a></td>
							</tr>
							<tr>
								<td>JBA3036</td>
								<td>SEKOLAH KEBANGSAAN SELIDI KECIL</td>
								<td>3</td>
								<td>1</td>
								<td><a href="#">🔗</a></td>
							</tr>
							<tr>
								<td>JBA3037</td>
								<td>SEKOLAH KEBANGSAAN SEMANGAR</td>
								<td>2</td>
								<td>1</td>
								<td><a href="#">🔗</a></td>
							</tr>
							<tr>
								<td>JBA3038</td>
								<td>SEKOLAH KEBANGSAAN LEPAU</td>
								<td>4</td>
								<td>3</td>
								<td><a href="#">🔗</a></td>
							</tr>
						</tbody>
					</table>
					<div class="pagination">
						<button>&laquo; Previous</button>
						<button>Next &raquo;</button>
					</div>
				</div>
			</div>

			<!-- Upcoming Events -->
			<div class="events-section">
				<h2>Upcoming Events</h2>
				<div class="events">
					<div class="event-card">
						<img src="images/event1.png" alt="Event 1">
						<p>
							TVPSS SK Putrajaya Presint 5-1 <br> Kejohanan Ragbi MSSP
							2024
						</p>
					</div>
					<a href="/all-events" class="see-all">See All</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Search and Filter Scripts -->
	<script>
        function searchTable() {
            const input = document.getElementById("searchInput").value.toLowerCase();
            const rows = document.querySelectorAll("#schoolTable tr");

            rows.forEach(row => {
                const code = row.cells[0].textContent.toLowerCase();
                const name = row.cells[1].textContent.toLowerCase();

                if (code.includes(input) || name.includes(input)) {
                    row.style.display = ""; // Show row
                } else {
                    row.style.display = "none"; // Hide row
                }
            });
        }

        function filterTable() {
            const versionFilter = document.getElementById("filterVersion").value;
            const studioFilter = document.getElementById("filterStudio").value;
            const rows = document.querySelectorAll("#schoolTable tr");

            rows.forEach(row => {
                const version = row.cells[2].textContent.trim(); // TVPSS Version
                const studio = row.cells[3].textContent.trim(); // Studio Level

                const matchesVersion = versionFilter === "" || version === versionFilter;
                const matchesStudio = studioFilter === "" || studio === studioFilter;

                if (matchesVersion && matchesStudio) {
                    row.style.display = ""; // Show row
                } else {
                    row.style.display = "none"; // Hide row
                }
            });
        }
    </script>
</body>
</html>
