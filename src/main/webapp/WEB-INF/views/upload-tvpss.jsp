<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Upload TVPSS Information</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f8fb;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .sidebar {
            width: 250px;
            background-color: rgb(0, 0, 0);
            padding: 30px;
            height: 100vh;
            color: white;
            box-shadow: 4px 0 10px rgba(0, 0, 0, 0.1);
        }
        .sidebar-title {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
        }
        .sidebar-title i {
            margin-right: 15px;
            font-size: 28px;
            color: #fff;
        }
        .main-content {
            flex-grow: 1;
            padding: 40px;
            max-height: 100vh;
            overflow-y: auto;
        }
        .form-container {
            max-width: 700px;
            width: 100%;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            margin: 0 auto;
        }
        .form-container:hover {
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
        }
        .form-container h3 {
            font-size: 24px;
            color: #6C63FF;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-container label {
            font-weight: 600;
        }
        .form-container button {
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
        .form-container button:hover {
            background-color: #5a4bd7;
        }
        .form-check-input.form-switch {
            margin-right: 10px;
        }
        .link-input {
            display: none;
            margin-top: 15px;
        }
        .form-check-label {
            font-size: 16px;
            font-weight: 500;
        }
        .form-check {
            margin-bottom: 20px;
        }
        .sidebar-title h4 {
            font-size: 20px;
            margin: 0;
            color: white;
        }
        .form-check-input {
            width: 20px;
            height: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .alert {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="sidebar-title">
            <i class="bi bi-camera-video"></i>
            <h4>TVPSS School Information</h4>
        </div>
    </div>
    
    <div class="main-content">
        <div class="form-container">
            <h3>Enter School TVPSS Information</h3>
            
            <!-- Success Message -->
            <div th:if="${successMessage}" class="alert alert-success" role="alert">
                <span th:text="${successMessage}"></span>
            </div>
            
            <!-- Error Message -->
            <div th:if="${errorMessage}" class="alert alert-danger" role="alert">
                <span th:text="${errorMessage}"></span>
            </div>

            <form action="/psstv/criteria/add" method="post">
                <!-- School Code -->
                <div class="form-group mb-3">
                    <label for="schoolCode">School Code</label>
                    <input type="text" class="form-control" id="schoolCode" name="schoolCode" required>
                </div>
            
                <!-- Brand Name -->
                <div class="form-group">
                    <label for="brandName">Brand Name</label>
                    <textarea class="form-control" id="brandName" name="brandName" rows="3" required></textarea>
                </div>
                
                <!-- Logo Links -->
                <div class="form-group">
                    <label for="schoolLogoLink">School Logo Link</label>
                    <input type="url" class="form-control" id="schoolLogoLink" name="schoolLogoLink" required>
                </div>

                <div class="form-group">
                    <label for="studioLogoLink">Corner/Mini Studio/TV Studio Link</label>
                    <input type="url" class="form-control" id="studioLogoLink" name="studioLogoLink" required>
                </div>
                
                <!-- Checkbox and Link Input Fields --> 
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" id="recordingInSchool" onclick="toggleLinkInput('recordingInSchool')">
                    <label class="form-check-label" for="recordingInSchool">In-School Recording</label>
                    <input type="url" class="form-control link-input" id="recordingInSchoolLink" name="recordingInSchoolLink" placeholder="Enter video link">
                </div>
                
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" id="youtube" onclick="toggleLinkInput('youtube')">
                    <label class="form-check-label" for="youtube">YouTube</label>
                    <input type="url" class="form-control link-input" id="youtubeLink" name="youtubeLink" placeholder="Enter YouTube link">
                </div>
                
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" id="recordingOutsideSchool" onclick="toggleLinkInput('recordingOutsideSchool')">
                    <label class="form-check-label" for="recordingOutsideSchool">Recording inside and outside the school</label>
                    <input type="url" class="form-control link-input" id="recordingOutsideSchoolLink" name="recordingOutsideSchoolLink" placeholder="Enter video link">
                </div>
                
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" id="collaborateWithExternalAgencies" onclick="toggleLinkInput('collaborateWithExternalAgencies')">
                    <label class="form-check-label" for="collaborateWithExternalAgencies">Collaborate with external agencies</label>
                    <input type="url" class="form-control link-input" id="collaborateWithExternalAgenciesLink" name="collaborateWithExternalAgencies" placeholder="Enter video link">
                </div>
                
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" id="greenScreenTechnology" onclick="toggleLinkInput('greenScreenTechnology')">
                    <label class="form-check-label" for="greenScreenTechnology">Using 'Green Screen' Technology</label>
                    <input type="url" class="form-control link-input" id="greenScreenTechnologyLink" name="greenScreenTechnologyLink" placeholder="Enter video link">
                </div>
                
                <!-- Submit Button -->
                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>

    <!-- JavaScript to toggle link input visibility -->
    <script>
        function toggleLinkInput(id) {
            var linkInput = document.getElementById(id + 'Link');
            var checkbox = document.getElementById(id);
            
            if (checkbox.checked) {
                linkInput.style.display = 'block';
                linkInput.required = true;
            } else {
                linkInput.style.display = 'none';
                linkInput.required = false;
                linkInput.value = ''; // Clear the value when unchecked
            }
        }

        // Initialize link inputs as hidden
        document.addEventListener('DOMContentLoaded', function() {
            var linkInputs = document.querySelectorAll('.link-input');
            linkInputs.forEach(function(input) {
                input.style.display = 'none';
            });

            // Check for success or error messages and auto-hide them after 5 seconds
            var alerts = document.querySelectorAll('.alert');
            alerts.forEach(function(alert) {
                setTimeout(function() {
                    alert.style.display = 'none';
                }, 5000);
            });
        });
    </script>

    <!-- Optional Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>