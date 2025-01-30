<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Guest Dashboard</title>

    <!-- Inline CSS styles -->
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

        /* Main Content Styling */
        .content-container {
            display: flex;
            flex: 1;
        }

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

        /* Link for Logout */
        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
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
            .nav {
                display: flex;
                flex-direction: row;
                gap: 10px;
            }
            .nav li {
                margin: 0;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="logo">
                <%-- <img src="${pageContext.request.contextPath}/images/tvpss-logo.png" alt="TVPSS Logo"> --%>
                <h2>TVPSS GUEST</h2>
            </div>
            <ul class="nav">
                <li><a href="/psstv/guest/list-content">View Content</a></li>
                <li><a href="/psstv/guest/view-event">View Event</a></li>
                <li><a href="/psstv/guest/guest-apply-crew">Apply Crew</a></li>
                <li><a href="/psstv/guest/request-account">Request Account</a></li>
            </ul>
            <div class="footer">
                <p>© TVPSS, All Rights Reserved</p>
            </div>
        </div>

        <!-- Main Content -->
        <div class="content-container">
            <div class="main-content">
                <h1>Welcome to the Guest Dashboard</h1>
                <p>This is the dashboard for guest users. You can view content, apply for crew, or request an account.</p>
                <a href="login">Back to Login</a>
            </div>
        </div>
    </div>
</body>
</html>
