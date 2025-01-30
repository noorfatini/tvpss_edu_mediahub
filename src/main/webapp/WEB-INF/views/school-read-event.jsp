<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Events</title>
</head>
<body>
    <h2>Manage Events</h2>
    <table>
        <thead>
            <tr>
                <th>Event Name</th>
                <th>Event Date</th>
                <th>Event Status</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="event" items="${events}">
                <tr>
                    <td>${event.eventName}</td>
                    <td>${event.eventDate}</td>
                    <td>${event.eventStatus}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
