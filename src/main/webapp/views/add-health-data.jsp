<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Health Data</title>
</head>
<body>
<h1>Add Health Data</h1>
<form action="${pageContext.request.contextPath}/health/submit/${id}" method="post">
    Timestamp: <input type="datetime-local" name="timestamp" required><br>
    Heart Rate: <input type="number" name="heartRate" required><br>
    Blood Pressure: <input type="text" name="bloodPressure" required><br>
    Activity Level: <input type="text" name="activityLevel" required><br>
    <input type="submit" value="Submit">
</form>
</body>
</html>
