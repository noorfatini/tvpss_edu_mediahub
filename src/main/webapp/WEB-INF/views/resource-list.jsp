<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>TVPSS Equipment Management</title>
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
            padding-top: 60px;
        }
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
            border-radius: 10px;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
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
        <!-- Equipment List -->
        <div class="content-container">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h3>Equipment List</h3>
                <a href="<c:url value='/upload-resource2'/>" class="btn btn-primary">
                    <i class="bi bi-plus-lg me-2"></i>Add Equipment
                </a>
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
                        <c:forEach items="${resources}" var="resource">
                            <tr>
                                <td>${resource.schoolCode}</td>
                                <td>${resource.type}</td>
                                <td>${resource.brand}</td>
                                <td>${resource.quantity}</td>
                                <td>${resource.status}</td>
                                <td>
                                    <button class="btn btn-sm btn-outline-primary me-2 edit-button" data-school-code="${resource.schoolCode}" data-type="${resource.type}" data-brand="${resource.brand}" data-quantity="${resource.quantity}" data-status="${resource.status}">
                                        <i class="bi bi-pencil"></i>
                                    </button>
                                    <a href="<c:url value='/delete-resource/${resource.schoolCode}'/>" class="btn btn-sm btn-outline-danger">
                                        <i class="bi bi-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Edit Modal -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h3 class="mb-4">Edit Equipment</h3>
            <form action="<c:url value='/update-resource'/>" method="post">
                <div class="mb-3">
                    <label for="modalSchoolCode" class="form-label">School Code</label>
                    <input type="text" class="form-control" id="modalSchoolCode" name="schoolCode" readonly>
                </div>
                <div class="mb-3">
                    <label for="modalType" class="form-label">Equipment Type</label>
                    <select class="form-select" id="modalType" name="type" required>
                        <option value="mini studio">Mini Studio</option>
                        <option value="camera">Camera</option>
                        <option value="tripod">Tripod</option>
                        <option value="external mic">External Mic</option>
                        <option value="mobile lighting">Mobile Lighting</option>
                        <option value="green screen">Green Screen</option>
                        <option value="editing software">Editing Software</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="modalBrand" class="form-label">Brand</label>
                    <input type="text" class="form-control" id="modalBrand" name="brand" required>
                </div>
                <div class="mb-3">
                    <label for="modalQuantity" class="form-label">Quantity</label>
                    <input type="number" class="form-control" id="modalQuantity" name="quantity" min="1" required>
                </div>
                <button type="submit" class="submit-button">Update Equipment</button>
            </form>
        </div>
    </div>

    <script>
        const modal = document.getElementById("editModal");
        const span = document.getElementsByClassName("close")[0];
        const editButtons = document.querySelectorAll(".edit-button");

        editButtons.forEach(button => {
            button.addEventListener("click", () => {
                document.getElementById("modalSchoolCode").value = button.getAttribute("data-school-code");
                document.getElementById("modalType").value = button.getAttribute("data-type");
                document.getElementById("modalBrand").value = button.getAttribute("data-brand");
                document.getElementById("modalQuantity").value = button.getAttribute("data-quantity");
                modal.style.display = "block";
            });
        });

        span.onclick = () => {
            modal.style.display = "none";
        };

        window.onclick = event => {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        };
    </script>
</body>
</html>