<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Equipment Validation - TVPSS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
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
        .status-pending {
            background-color: #ffd700;
            color: #000;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 0.9em;
        }
        .status-approved {
            background-color: #28a745;
            color: white;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 0.9em;
        }
        .status-rejected {
            background-color: #dc3545;
            color: white;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 0.9em;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
            border-radius: 10px;
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
        <div class="content-container">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3>Equipment Validation</h3>
            </div>

            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>School Code</th>
                            <th>Type</th>
                            <th>Brand</th>
                            <th>Quantity</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${pendingResources}" var="resource">
                            <tr>
                                <td>${resource.schoolCode}</td>
                                <td>${resource.type}</td>
                                <td>${resource.brand}</td>
                                <td>${resource.quantity}</td>
                                <td>
                                    <span class="status-${resource.status.toLowerCase()}">
                                        ${resource.status}
                                    </span>
                                </td>
                                <td>
                                    <c:if test="${resource.status == 'PENDING'}">
                                        <button class="btn btn-sm btn-success me-2" 
                                                onclick="showValidationModal('${resource.schoolCode}', 'APPROVED')">
                                            <i class="bi bi-check-lg"></i> Approve
                                        </button>
                                        <button class="btn btn-sm btn-danger" 
                                                onclick="showValidationModal('${resource.schoolCode}', 'REJECTED')">
                                            <i class="bi bi-x-lg"></i> Reject
                                        </button>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Validation Modal -->
    <div id="validationModal" class="modal">
        <div class="modal-content">
            <h4 class="mb-4">Validation Confirmation</h4>
            <form id="validationForm" action="<c:url value='/validate-resource'/>" method="post">
                <input type="hidden" id="modalSchoolCode" name="schoolCode">
                <input type="hidden" id="modalStatus" name="status">
                
                <div class="mb-3">
                    <label for="comments" class="form-label">Comments</label>
                    <textarea class="form-control" id="comments" name="comments" rows="3" required></textarea>
                </div>

                <div class="d-flex justify-content-end gap-2">
                    <button type="button" class="btn btn-secondary" onclick="closeModal()">Cancel</button>
                    <button type="submit" class="btn btn-primary">Confirm</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        const modal = document.getElementById("validationModal");

        function showValidationModal(schoolCode, status) {
            document.getElementById("modalSchoolCode").value = schoolCode;
            document.getElementById("modalStatus").value = status;
            modal.style.display = "block";
        }

        function closeModal() {
            modal.style.display = "none";
            document.getElementById("validationForm").reset();
        }

        window.onclick = (event) => {
            if (event.target == modal) {
                closeModal();
            }
        };
    </script>
</body>
</html>