<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Equipment - TVPSS</title>
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
        .form-container {
            max-width: 800px;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
        }
        .form-label {
            font-weight: 600;
        }
        .submit-button {
            background-color: #6C63FF;
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 25px;
            font-size: 16px;
            width: 100%;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .submit-button:hover {
            background-color: #5a4bd7;
        }
        .back-link {
            color: #6C63FF;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .back-link:hover {
            color: #5a4bd7;
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
        
        <div class="form-container">
            <h3 class="mb-4">Add New Equipment</h3>
            
            <form action="<c:url value='/save-resource'/>" method="post">
                <div class="mb-3">
                    <label for="schoolCode" class="form-label">School Code</label>
                    <input type="text" class="form-control" id="schoolCode" name="schoolCode" required>
                </div>

                <div class="mb-3">
                    <label for="type" class="form-label">Equipment Type</label>
                    <select class="form-select" id="type" name="type" required>
                        <option value="">Select Type</option>
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
                    <label for="brand" class="form-label">Brand</label>
                    <input type="text" class="form-control" id="brand" name="brand" required>
                </div>

                <div class="mb-3">
                    <label for="quantity" class="form-label">Quantity</label>
                    <input type="number" class="form-control" id="quantity" name="quantity" min="1" required>
                </div>

                <button type="submit" class="submit-button">Add Equipment</button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>