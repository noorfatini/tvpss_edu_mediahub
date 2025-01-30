<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>
</head>
<body>
    <h2>Login</h2>

    <!-- Login Form -->
    <form action="/psstv/login/authenticate" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required /><br />

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required /><br />

    <label for="role">Role:</label>
    <select id="role" name="role" required>
        <option value="ADMIN">Admin</option>
        <option value="SCHOOL">School</option>
    </select><br />

    <button type="submit">Login</button>
</form>

    <!-- Continue as Guest -->
    <br />
    <form action="guestDashboard" method="get">
        <button type="submit">Continue as Guest</button>
    </form>
</body>
</html>
