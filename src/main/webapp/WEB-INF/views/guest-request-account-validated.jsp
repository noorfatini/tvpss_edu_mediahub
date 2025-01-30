<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request TVPSS Account - Validated</title>
</head>
<body>
    <h1>Account Request</h1>
    <div>
        <h2>School Information</h2>
        <p>${schoolDetails}</p>
        <button onclick="showConfirmation()">Create TVPSS Account</button>
    </div>

    <script>
        function showConfirmation() {
            const confirmAction = confirm("Are you sure you want to create an account for the selected school?");
            if (confirmAction) {
                alert("Account created successfully!");
                // Redirect to a success page
                window.location.href = "/psstv/guest/dashboard"; // Adjust accordingly
            }
        }
    </script>
</body>
</html>
