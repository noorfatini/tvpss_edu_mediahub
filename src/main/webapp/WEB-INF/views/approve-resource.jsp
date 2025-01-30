<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>TVPSS Equipment Management</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"
	rel="stylesheet">
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f7f8fb;
	min-height: 100vh;
}

.sidebar {
	width: 250px;
	background-color: rgb(0, 0, 0);
	padding: 30px;
	height: 100vh;
	position: fixed;
	color: white;
	box-shadow: 4px 0 10px rgba(0, 0, 0, 0.1);
}

.main-content {
	margin-left: 250px;
	padding: 40px;
}

.content-container {
	background: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
}

.badge {
	padding: 8px 12px;
	border-radius: 4px;
	font-weight: 500;
}

.status-approved {
	color: #198754;
}

.status-rejected {
	color: #dc3545;
}
</style>
</head>
<body>
	<div class="sidebar">
		<div class="d-flex align-items-center mb-4">
			<i class="bi bi-camera-video me-2" style="font-size: 28px;"></i>
			<h4 class="m-0">TVPSS Equipment</h4>
		</div>
	</div>

	<div class="main-content">

		<div class="search-filter-container mb-3">
			<label for="searchFilterInput" class="form-label">Search and
				Filter</label> <input type="text" class="form-control"
				id="searchFilterInput"
				placeholder="Search by school code, type, brand, or status..."
				onkeyup="searchAndFilterTable()">
		</div>

		<div class="content-container">
			<div class="d-flex justify-content-between align-items-center mb-4">
				<h3>Equipments Approval</h3>
			</div>

			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>School Code</th>
							<th>Type</th>
							<th>Brand</th>
							<th>Quantity</th>
							<th>Update Status</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${resources}" var="resource">
							<tr>
								<td>${resource.schoolCode}</td>
								<td>${resource.type}</td>
								<td>${resource.brand}</td>
								<td>${resource.quantity}</td>
								<!-- Replace the existing form structure in approve-resource.jsp with this -->
								<td><c:choose>
										<c:when
											test="${resource.status == 'Approved' || resource.status == 'Rejected'}">
											<span
												class="badge ${resource.status == 'Approved' ? 'bg-success' : 'bg-danger'}">
												${resource.status} </span>
										</c:when>
										<c:otherwise>
											<div class="btn-group" role="group">
												<form
													action="${pageContext.request.contextPath}/update-resource-status/${resource.schoolCode}"
													method="post"
													style="display: inline-block; margin-right: 5px;">
													<input type="hidden" name="status" value="Approved">
													<button type="submit" class="btn btn-sm btn-success">
														<i class="bi bi-check-circle"></i> Approve
													</button>
												</form>
												<form
													action="${pageContext.request.contextPath}/update-resource-status/${resource.schoolCode}"
													method="post" style="display: inline-block;">
													<input type="hidden" name="status" value="Rejected">
													<button type="submit" class="btn btn-sm btn-danger">
														<i class="bi bi-x-circle"></i> Reject
													</button>
												</form>
											</div>
										</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<!-- Add this right before the closing content-container div -->
		<div class="mt-4">
			<button type="button" class="btn btn-primary mb-3"
				onclick="showValidateForm()">
				<i class="bi bi-check-square"></i> Validate Level
			</button>

			<div id="validateLevelForm" style="display: none;">
				<div class="card">
					<div class="card-header">
						<h5 class="mb-0">Update TVPSS Level</h5>
					</div>
					<div class="card-body">
						<form
							action="${pageContext.request.contextPath}/update-tvpss-level"
							method="post">
							<div class="mb-3">
								<label for="schoolCode" class="form-label">School Code</label> <input
									type="text" class="form-control" id="schoolCode"
									name="schoolCode" required>
							</div>
							<div class="mb-3">
								<label for="level" class="form-label">TVPSS Level</label> <input
									type="text" class="form-control" id="level" name="level"
									required>
							</div>
							<button type="submit" class="btn btn-success">
								<i class="bi bi-check-circle"></i> Save Changes
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

	<script>
$(document).ready(function() {
    // Configure toastr options
    toastr.options = {
        "closeButton": true,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "timeOut": "3000"
    };

    // Handle form submissions
    $('form[action*="/update-resource-status/"]').on('submit', function(e) {
        e.preventDefault();
        
        const form = $(this);
        const schoolCode = form.attr('action').split('/').pop();
        const status = form.find('input[name="status"]').val();
        const row = form.closest('tr');
        
        $.ajax({
            url: form.attr('action'),
            method: 'POST',
            data: { status: status },
            success: function(response) {
                // Update the status badge
                const statusCell = row.find('td:nth-child(5)');
                const badgeClass = status === 'Approved' ? 'bg-success' : 'bg-danger';
                statusCell.html(`<span class="status-badge badge ${badgeClass}">${status}</span>`);
                
                // Update the action buttons cell
                const actionCell = row.find('td:last-child');
                actionCell.html(`<span class="badge ${badgeClass}">${status}</span>`);
                
                // Show success message
                toastr.success(`Resource ${status.toLowerCase()} successfully`);
            },
            error: function(xhr) {
                // Show error message
                toastr.error(xhr.responseText || 'Error updating status');
            }
        });
    });
});

	function searchAndFilterTable() {
        const searchInput = document.getElementById("searchFilterInput").value.toLowerCase();
        const rows = document.querySelectorAll("table tbody tr");

        rows.forEach(row => {
            const schoolCode = row.cells[0].textContent.toLowerCase();
            const type = row.cells[1].textContent.toLowerCase();
            const brand = row.cells[2].textContent.toLowerCase();
            const status = row.cells[4].textContent.toLowerCase();

            const matchesSearch = schoolCode.includes(searchInput) || 
                                   type.includes(searchInput) || 
                                   brand.includes(searchInput) || 
                                   status.includes(searchInput);

            row.style.display = matchesSearch ? "" : "none";
        });
    }
	
	 $(document).ready(function() {
	        // Configure toastr options
	        toastr.options = {
	            "closeButton": true,
	            "progressBar": true,
	            "positionClass": "toast-top-right",
	            "timeOut": "3000"
	        };

	        // Handle form submissions
	        $('form[action*="/update-resource-status/"]').on('submit', function(e) {
	            e.preventDefault();

	            const form = $(this);
	            const schoolCode = form.attr('action').split('/').pop();
	            const status = form.find('input[name="status"]').val();

	            $.ajax({
	                url: form.attr('action'),
	                method: 'POST',
	                data: { status: status },
	                success: function(response) {
	                    // Reload the page after successful status update
	                    location.reload();
	                },
	                error: function(xhr) {
	                    // Show error message
	                    toastr.error(xhr.responseText || 'Error updating status');
	                }
	            });
	        });
	    });
	 
	// Add this to your existing scripts section
	 $(document).ready(function() {
    // Check for success message in model
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.has('success')) {
        toastr.success('TVPSS Level updated successfully!');
    }
});
	
	 function showValidateForm() {
		    const form = document.getElementById('validateLevelForm');
		    if (form.style.display === 'none') {
		        form.style.display = 'block';
		    } else {
		        form.style.display = 'none';
		    }
		}

		$(document).ready(function() {
		    // Check for success message in model
		    const urlParams = new URLSearchParams(window.location.search);
		    if (urlParams.has('success')) {
		        toastr.success('TVPSS Level updated successfully!');
		    }
		});
	 
 </script>
</body>
</html>
