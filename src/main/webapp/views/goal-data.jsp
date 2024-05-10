<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Goal Data</title>
    <!-- Include libraries for visualization (e.g., Chart.js, D3.js) -->
</head>
<body>
<h1>Goal Data</h1>
<div id="chartContainer">
    ${goals}
</div>
<a href="${pageContext.request.contextPath}/goal/set/${id}">Add Goal</a>
</body>
</html>
