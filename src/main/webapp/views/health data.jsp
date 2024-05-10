<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Health Data</title>
    <!-- Include libraries for visualization (e.g., Chart.js, D3.js) -->
</head>
<body>
<h1>Health Data</h1>
<div id="chartContainer">

${healthData}
</div>
<a href="${pageContext.request.contextPath}/health/all/${id}">All Health Data</a><br>
<a href="${pageContext.request.contextPath}/health/latest/${id}">Latest Health Data</a><br>
<a href="${pageContext.request.contextPath}/health/submit/${id}">Add Health Data</a><br>
</body>
</html>
