<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>School Validation</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f4f6f9;
	margin: 0;
}

.table-hover tbody tr:hover {
	background-color: #f1f3f5;
}

.badge-pending {
	background-color: #ffcc00;
	color: #000;
}

.badge-approved {
	background-color: #28a745;
	color: #fff;
}

.sidebar {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	width: 15%;
	background: rgb(0, 0, 0);
	color: white;
	padding: 20px;
	display: flex;
	flex-direction: column;
}

.logo {
	display: flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 20px;
	text-align: center;
}

.logo img {
	max-width: 50px;
	margin-right: 10px;
}

.logo h2 {
	font-size: 16px;
	margin: 0;
}

.nav {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

.nav li {
	margin: 10px 0;
}

.nav li a {
	color: white;
	text-decoration: none;
	display: block;
	padding: 10px 15px;
	border-radius: 5px;
}

.nav li a:hover {
	background-color: #575d63;
}

.footer {
	text-align: center;
	font-size: 12px;
	color: #bbb;
}

.footer p {
	margin: 0;
}

.search-container {
	margin-bottom: 20px;
}

.search-input {
	width: 100%;
	padding: 10px;
	font-size: 16px;
	border: 1px solid #ddd;
	border-radius: 5px;
}
</style>
</head>
<body>
	<div class="sidebar">
		<div class="logo text-center">
			<img src="resources/images/tvpss-logo.png" alt="TVPSS Logo"
				style="width: 100px;">
			<h2 class="mt-2">TVPSS MIS</h2>
		</div>
		<ul class="nav flex-column mt-4">
			<li class="nav-item"><a class="nav-link text-white"
				href="dashboard.jsp">Dashboard</a></li>
			<li class="nav-item"><a class="nav-link text-white"
				href="/manage-account">Manage Account</a></li>
			<li class="nav-item"><a class="nav-link text-white" href="#">School
					Information Validation</a></li>
			<li class="nav-item"><a class="nav-link text-white" href="#">School
					Resource Information</a></li>
		</ul>
		<div class="footer mt-auto text-center">
			<p>© TVPSS, All Rights Reserved</p>
		</div>
	</div>

	<div class="container py-5" style="margin-left: 15%;">
		<h2 class="text-center mb-4">School Validation</h2>

		<!-- School Name -->
		<div class="text-center mb-3">
			<h4 id="schoolName">SEKOLAH KEBANGSAAN MAWAI</h4>
		</div>

		<!-- Search Bar -->
		<div class="search-container">
			<input type="text" id="schoolSearch" class="search-input"
				placeholder="Search criteria" onkeyup="searchSchool()">
		</div>
		<div class="table-responsive">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>Title</th>
						<th>Description</th>
						<th>Uploaded By</th>
						<th>Upload Date</th>
						<th>Status</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${resources}" var="resource">
						<tr>
							<td>${resource.id}</td>
							<td>${resource.title}</td>
							<td>${resource.description}</td>
							<td>${resource.uploadedBy}</td>
							<td><fmt:formatDate value="${resource.uploadDate}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td><span
								class="badge ${resource.status == 'APPROVED' ? 'bg-success' : resource.status == 'REJECTED' ? 'bg-danger' : 'bg-warning'}">
									${resource.status} </span></td>
							<td class="d-flex gap-2">
								<form action="/psstv/update-resource-status" method="POST"
									class="d-inline">
									<input type="hidden" name="id" value="${resource.id}">
									<input type="hidden" name="status" value="APPROVED">
									<button type="submit" class="btn btn-success btn-sm">Approve</button>
								</form>

								<form action="/psstv/update-resource-status" method="POST"
									class="d-inline">
									<input type="hidden" name="id" value="${resource.id}">
									<input type="hidden" name="status" value="REJECTED">
									<button type="submit" class="btn btn-danger btn-sm">Reject</button>
								</form>

								<button type="button" class="btn btn-info btn-sm"
									onclick="showResourceDetails(${resource.id})">Details
								</button>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>

		<div class="text-center mt-4">
			<button class="btn btn-primary btn-lg" id="validateBtn">Determine
				School Version</button>
		</div>
	</div>

	<!-- Criteria Modals -->
	<div class="modal fade" id="resourceModal" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Resource Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<p>
						<strong>ID:</strong> <span id="modalId"></span>
					</p>
					<p>
						<strong>Title:</strong> <span id="modalTitle"></span>
					</p>
					<p>
						<strong>Description:</strong> <span id="modalDescription"></span>
					</p>
					<p>
						<strong>Uploaded By:</strong> <span id="modalUploadedBy"></span>
					</p>
					<p>
						<strong>Upload Date:</strong> <span id="modalUploadDate"></span>
					</p>
					<p>
						<strong>Status:</strong> <span id="modalStatus"></span>
					</p>
				</div>
			</div>
		</div>
	</div>


	<!-- Add this modal HTML right before the closing body tag -->
	<div class="modal fade" id="resourceModal" tabindex="-1"
		aria-labelledby="resourceModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="resourceModalLabel">Resource
						Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<strong>ID:</strong> <span id="modalId"></span>
					</div>
					<div class="mb-3">
						<strong>Title:</strong> <span id="modalTitle"></span>
					</div>
					<div class="mb-3">
						<strong>Description:</strong> <span id="modalDescription"></span>
					</div>
					<div class="mb-3">
						<strong>Uploaded By:</strong> <span id="modalUploadedBy"></span>
					</div>
					<div class="mb-3">
						<strong>Upload Date:</strong> <span id="modalUploadDate"></span>
					</div>
					<div class="mb-3">
						<strong>Status:</strong> <span id="modalStatus" class="badge"></span>
					</div>
					<!-- Add comments section if needed -->
					<div class="mb-3">
						<strong>Comments:</strong>
						<div id="modalComments" class="mt-2">
							<!-- Comments will be populated here -->
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        // Search function
        function searchSchool() {
            const input = document.getElementById('schoolSearch');
            const filter = input.value.toLowerCase();
            const table = document.getElementById('criteriaTableBody');
            const rows = table.getElementsByTagName('tr');

            for (let i = 0; i < rows.length; i++) {
                const cell = rows[i].getElementsByTagName('td')[0];
                if (cell) {
                    const textValue = cell.textContent || cell.innerText;
                    if (textValue.toLowerCase().indexOf(filter) > -1) {
                        rows[i].style.display = "";
                    } else {
                        rows[i].style.display = "none";
                    }
                }
            }
        }

        document.getElementById('validateBtn').addEventListener('click', function() {
            let approvedCriteria = document.querySelectorAll('.btn-success.active').length;
            let totalCriteria = 9;

            let version = 'Version 1';
            if (approvedCriteria >= 7) {
                version = 'Version 2';
            }
            alert(`The school is assigned to ${version}`);
        });
    </script>

	<script>
    document.querySelectorAll('.approve-btn').forEach(button => {
        button.addEventListener('click', function () {
            if (this.classList.contains('btn-primary')) {
                // Change to Approved state
                this.classList.remove('btn-primary');
                this.classList.add('btn-success');
                this.textContent = 'Approved';
            } else {
                // Revert to Approve state
                this.classList.remove('btn-success');
                this.classList.add('btn-primary');
                this.textContent = 'Approve';
            }
        });
    });
    
    function populateModal(resourceId) {
        const resource = resources.find(res => res.id === resourceId); // Assuming `resources` is available
        if (resource) {
            document.getElementById('modalId').textContent = resource.id;
            document.getElementById('modalTitle').textContent = resource.title;
            document.getElementById('modalDescription').textContent = resource.description;
            document.getElementById('modalUploadedBy').textContent = resource.uploadedBy;
            document.getElementById('modalUploadDate').textContent = resource.uploadDate;
            document.getElementById('modalStatus').textContent = resource.status;
        }
    }
    
    function showResourceDetails(resourceId) {
        // Get the resource details from the table row
        const row = document.querySelector(`tr[data-resource-id="${resourceId}"]`);
        if (!row) return;
        
        // Get modal elements
        const modalId = document.getElementById('modalId');
        const modalTitle = document.getElementById('modalTitle');
        const modalDescription = document.getElementById('modalDescription');
        const modalUploadedBy = document.getElementById('modalUploadedBy');
        const modalUploadDate = document.getElementById('modalUploadDate');
        const modalStatus = document.getElementById('modalStatus');
        
        // Fetch the resource details from the server
        fetch(`/psstv/get-resource-details?id=${resourceId}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                // Populate modal with data
                modalId.textContent = data.id;
                modalTitle.textContent = data.title;
                modalDescription.textContent = data.description;
                modalUploadedBy.textContent = data.uploadedBy;
                modalUploadDate.textContent = new Date(data.uploadDate).toLocaleString();
                
                // Set status badge class and text
                modalStatus.className = 'badge'; // Reset classes
                switch(data.status) {
                    case 'APPROVED':
                        modalStatus.classList.add('bg-success');
                        break;
                    case 'REJECTED':
                        modalStatus.classList.add('bg-danger');
                        break;
                    default:
                        modalStatus.classList.add('bg-warning');
                }
                modalStatus.textContent = data.status;
                
                // Show the modal
                const modal = new bootstrap.Modal(document.getElementById('resourceModal'));
                modal.show();
            })
            .catch(error => {
                console.error('Error fetching resource details:', error);
                alert('Error loading resource details. Please try again.');
            });
    }
    
    function updateStatus(resourceId, status) {
        fetch(`/psstv/update-resource-status?id=${resourceId}&status=${status}`, { // Add context path
            method: 'POST'
        })
        .then(response => response.text())
        .then(data => {
            location.reload(); // Refresh to show updated status
        })
        .catch(error => console.error('Error:', error));
    }
    
</script>

</body>
</html>
