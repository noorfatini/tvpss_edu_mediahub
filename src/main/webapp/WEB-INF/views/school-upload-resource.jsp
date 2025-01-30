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
        }
        .form-container {
            max-width: 700px;
            width: 100%;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
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
        .form-check {
            margin-bottom: 20px;
        }
        .form-check-label {
            font-size: 16px;
            font-weight: 500;
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
        #otherEquipmentInput textarea {
            resize: none;
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
            <form th:action="@{/tvpss/upload}" method="post" enctype="multipart/form-data">
                <!-- Mini Studio Equipment Section -->
                <div class="mt-4">
                    <h4>Mini Studio Equipment</h4>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="tvProgramShow" name="tvProgramShow">
                        <label class="form-check-label" for="tvProgramShow">TV Program/Show Corner/Room</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="editingCorner" name="editingCorner">
                        <label class="form-check-label" for="editingCorner">Editing Corner/Room</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="portableRecordingEquipment" name="portableRecordingEquipment">
                        <label class="form-check-label" for="portableRecordingEquipment">Peralatan Rakaman Mudah Alih</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="camera" name="camera">
                        <label class="form-check-label" for="camera">Camera</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="tripod" name="tripod">
                        <label class="form-check-label" for="tripod">Tripod</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="externalMic" name="externalMic">
                        <label class="form-check-label" for="externalMic">External Mic (Lavalier/Clip Mic) / Wireless Mic</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="mobileLighting" name="mobileLighting">
                        <label class="form-check-label" for="mobileLighting">Mobile Lighting (3 point)</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="greenScreen" name="greenScreen">
                        <label class="form-check-label" for="greenScreen">Green Screen (Permanent)</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="editingSoftware" name="editingSoftware">
                        <label class="form-check-label" for="editingSoftware">Editing Software (Premiere Pro / Final Cut Pro)</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="otherEquipment" name="otherEquipment" onchange="toggleOtherEquipmentInput()">
                        <label class="form-check-label" for="otherEquipment">Other Equipment</label>
                    </div>
                    <div id="otherEquipmentInput" style="display: none; margin-top: 10px;">
                        <textarea class="form-control" name="otherEquipmentDetails" placeholder="Please specify other equipment..." rows="3"></textarea>
                    </div>
                </div>

                <button type="submit">Submit Information</button>
            </form>
        </div>
    </div>

    <script>
        function toggleOtherEquipmentInput() {
            const otherEquipmentCheckbox = document.getElementById('otherEquipment');
            const otherEquipmentInput = document.getElementById('otherEquipmentInput');
            otherEquipmentInput.style.display = otherEquipmentCheckbox.checked ? 'block' : 'none';
        }
    </script>
</body>
</html>
