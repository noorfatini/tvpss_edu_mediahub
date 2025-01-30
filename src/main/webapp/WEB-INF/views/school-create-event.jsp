<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create TVPSS Event</title>
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
        position: fixed;
        width: 15%;
        background: rgb(0, 0, 0);
        color: white;
        padding: 20px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        height: 100%;
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

    /* Main Content Styling */
    .content-container {
        display: flex;
        flex: 1;
        margin-left: 18%;
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

    form {
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    form input, form select, form textarea {
        padding: 12px;
        font-size: 1rem;
        border-radius: 5px;
        border: 1px solid #ccc;
    }

    form button {
        background-color: #0046e0;
        color: white;
        padding: 12px 20px;
        font-size: 1.1rem;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    form button:hover {
        background-color: #0032a8;
    }
</style>
</head>
<body>
    <div class="dashboard-container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="logo">
                <h2>TVPSS SCHOOL</h2>
            </div>
            <ul class="nav">
                <li><a href="/psstv/school/view-content">View Content</a></li>
                <li><a href="/psstv/school/view-event">View Event</a></li>
                <li><a href="/psstv/school/school-upload-information">Upload Information</a></li>
                <li><a href="/psstv/school/school-upload-resources">Upload Resources</a></li>
                <li><a href="/psstv/school/school-validate-crew">Validate Crew</a></li>
                <li><a href="/psstv/school/manage-content">Manage Content</a></li>
                <li><a href="javascript:void(0);" onclick="toggleManageEventDropdown()">Manage Event</a>
                    <div id="manageEventDropdown" style="display:none;">
                        <a href="/psstv/school/create-event">Create Event</a><br>
                        <a href="/psstv/school/view-events">View Events</a><br>
                        <a href="/psstv/school/update-event">Update Event</a><br>
                        <a href="/psstv/school/delete-event">Delete Event</a>
                    </div>
                </li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="content-container">
            <div class="main-content">
                <h1>Create New Event</h1>

                <form action="/psstv/school/create-event" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="userId" value="${userId != null ? userId : ''}">
                    
                    <label for="eventName">Event Name:</label>
                    <input type="text" id="eventName" name="eventName" required>
                    <label for="eventDesc">Event Description:</label>
                    <textarea id="eventDesc" name="eventDesc" rows="5" maxlength="500" required></textarea>

                    <label for="eventDate">Event Date:</label>
                    <input type="date" id="eventDate" name="eventDate" required>

                    <label for="eventTime">Event Time:</label>
                    <input type="time" id="eventTime" name="eventTime" required>

                    <label for="eventLoc">Event Location:</label>
                    <input type="text" id="eventLoc" name="eventLoc" required>

                    <label for="schoolCode">School Name:</label>
    				<input type="text" id="schoolCode" name="schoolCode" required>
                    
                    <label for="eventPoster">Event Poster:</label>
                    <input type="file" id="eventPoster" name="eventPoster" accept="image/*" required>

                    <label for="eventStatus">Event Status:</label>
                    <select id="eventStatus" name="eventStatus" required>
                        <option value="COMING_SOON">COMING SOON</option>
                        <option value="FINISHED">FINISHED</option>
                    </select>

                    <button type="submit">Create Event</button>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Toggle Manage Event Dropdown
        function toggleManageEventDropdown() {
            var dropdown = document.getElementById("manageEventDropdown");
            dropdown.style.display = dropdown.style.display === "none" || dropdown.style.display === "" ? "block" : "none";
        }
    </script>
</body>
</html>
