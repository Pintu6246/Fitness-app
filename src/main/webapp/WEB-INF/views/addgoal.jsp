<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Goal</title>
</head>
<body>
<h1>Add Goal</h1>
<form action="addgoal" method="post">
    Goal Name: <input type="text" name="goalName" required><br>
    Target Heart Rate: <input type="number" name="targetHeartRate" required><br>
    Target Steps: <input type="number" name="targetSteps" required><br>
    <input type="submit" value="Set Goal">
</form>
</body>
</html>
