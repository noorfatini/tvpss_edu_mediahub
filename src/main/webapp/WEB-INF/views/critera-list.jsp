<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>TVPSS Information List</title>
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
        .search-box {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .table th {
            background-color: #f8f9fa;
        }
        .link-cell {
            max-width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .link-cell a {
            color: #0d6efd;
            text-decoration: none;
        }
        .link-cell a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="d-flex align-items-center mb-4">
            <i class="bi bi-camera-video me-2" style="font-size: 28px;"></i>
            <h4 class="m-0">TVPSS Information</h4>
        </div>
    </div>
    
    <div class="main-content">
        <div class="content-container">
            <!-- Search/Filter Section -->
            <div class="search-box mb-4">
                <div class="row">
                    <div class="col-md-4">
                        <input type="text" id="searchSchool" class="form-control" placeholder="Search by School Code">
                    </div>
                    <div class="col-md-4">
                        <input type="text" id="searchBrand" class="form-control" placeholder="Search by Brand Name">
                    </div>
                    <div class="col-md-4">
                        <button class="btn btn-primary w-100" onclick="searchTable()">
                            <i class="bi bi-search me-2"></i>Search
                        </button>
                    </div>
                </div>
            </div>

            <!-- TVPSS Information Table -->
            <div class="table-responsive">
                <table class="table table-hover" id="criteriaTable">
                    <thead>
                        <tr>
                            <th>School Code</th>
                            <th>Brand Name</th>
                            <th>School Logo</th>
                            <th>Studio Logo</th>
                            <th>In-School Recording</th>
                            <th>YouTube Link</th>
                            <th>Outside Recording</th>
                            <th>External Collaboration</th>
                            <th>Green Screen</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${criteriaList}" var="criteria">
                            <tr>
                                <td>${criteria.schoolCode}</td>
                                <td>${criteria.brandName}</td>
                                <td class="link-cell">
                                    <c:if test="${not empty criteria.schoolLogoLink}">
                                        <a href="${criteria.schoolLogoLink}" target="_blank">View Logo</a>
                                    </c:if>
                                </td>
                                <td class="link-cell">
                                    <c:if test="${not empty criteria.studioLogoLink}">
                                        <a href="${criteria.studioLogoLink}" target="_blank">View Logo</a>
                                    </c:if>
                                </td>
                                <td class="link-cell">
                                    <c:if test="${not empty criteria.recordingInSchoolLink}">
                                        <a href="${criteria.recordingInSchoolLink}" target="_blank">View Recording</a>
                                    </c:if>
                                </td>
                                <td class="link-cell">
                                    <c:if test="${not empty criteria.youtubeLink}">
                                        <a href="${criteria.youtubeLink}" target="_blank">View Channel</a>
                                    </c:if>
                                </td>
                                <td class="link-cell">
                                    <c:if test="${not empty criteria.recordingOutsideSchoolLink}">
                                        <a href="${criteria.recordingOutsideSchoolLink}" target="_blank">View Recording</a>
                                    </c:if>
                                </td>
                                <td class="link-cell">
                                    <c:if test="${not empty criteria.collaborateWithExternalAgencies}">
                                        <a href="${criteria.collaborateWithExternalAgencies}" target="_blank">View Project</a>
                                    </c:if>
                                </td>
                                <td class="link-cell">
                                    <c:if test="${not empty criteria.greenScreenTechnologyLink}">
                                        <a href="${criteria.greenScreenTechnologyLink}" target="_blank">View Demo</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        function searchTable() {
            const searchSchool = document.getElementById('searchSchool').value.toLowerCase();
            const searchBrand = document.getElementById('searchBrand').value.toLowerCase();
            const table = document.getElementById('criteriaTable');
            const rows = table.getElementsByTagName('tr');

            for (let i = 1; i < rows.length; i++) {
                const row = rows[i];
                const schoolCode = row.cells[0].textContent.toLowerCase();
                const brandName = row.cells[1].textContent.toLowerCase();
                
                const matchesSchool = schoolCode.includes(searchSchool);
                const matchesBrand = brandName.includes(searchBrand);
                
                if (matchesSchool && matchesBrand) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            }
        }

        // Clear search on page load
        window.onload = function() {
            document.getElementById('searchSchool').value = '';
            document.getElementById('searchBrand').value = '';
        };
    </script>
</body>
</html>