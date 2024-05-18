<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Health Monitoring System</title>
    <style>
		/* Ensure the html and body take up the full height of the viewport */
		html, body {
			height: 100%;
			margin: 0;
			display: flex;
			justify-content: center;
			align-items: center;
			background-color: #f0f0f0; /* Optional: Add a background color to distinguish the content */
		}

		/* Centering container for the content */
		.centered-container {
			display: flex;
			justify-content: center;
			align-items: center;
			width: 100%;
			height: 100%;
		}

		/* Inline style moved to CSS class for better organization */
		.content {
			display: flex;
			flex-direction: column;
			gap: 20px;
			background-color: #ffffff;
			padding: 30px;
			width: 450px;
			border-radius: 20px;
			font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
			text-align: center;
		}

		.content h1 {
			color: #151717;
			font-weight: 600;
			margin-bottom: 20px;
		}

		.content a {
			text-decoration: none;
			color: #2d79f3;
			font-weight: 500;
			border: 1.5px solid #2d79f3;
			border-radius: 10px;
			padding: 10px 20px;
			transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
		}

		.content a:hover {
			background-color: #2d79f3;
			color: white;
		}
    </style>
</head>
<body>
<div class="centered-container">
    <div class="content">
        <h1>Welcome to Health Monitoring System</h1>
        <a href="${pageContext.request.contextPath}/user/profile/${id}">Profile</a>
        <a href="${pageContext.request.contextPath}/health/all/${id}">Health Data</a>
        <a href="${pageContext.request.contextPath}/goal/goals/${id}">Goals</a>
    </div>
</div>
</body>
</html>
