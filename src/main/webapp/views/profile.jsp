<%@ page import="jakarta.servlet.http.Cookie" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <style>
		/* Ensure the html and body take up the full height of the viewport */
		html, body {
			height: 100%;
			margin: 0;
			padding: 0;
			font-family: Arial, sans-serif;
			background-color: #f0f0f0;
		}

		/* Center content */
		.center-content {
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			height: 100%;
		}

		/* Main container */
		.container {
			background-color: #ffffff;
			padding: 20px;
			border-radius: 10px;
			box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
			max-width: 600px;
			width: 100%;
		}

		/* Section headers */
		.section-header {
			font-size: 24px;
			font-weight: 600;
			margin-bottom: 10px;
		}

		/* User information container */
		.user-info-container {
			margin-bottom: 20px;
		}

		/* Update link style */
		.update-link {
			text-decoration: none;
			color: #2d79f3;
			font-weight: 500;
		}

		.update-link:hover {
			text-decoration: underline;
		}

		/* Health data and goals links */
		.data-links a {
			display: block;
			margin-top: 10px;
			text-decoration: none;
			color: #2d79f3;
			font-weight: 500;
		}

		.data-links a:hover {
			text-decoration: underline;
		}

		/* Horizontal rule */
		hr {
			margin: 20px 0;
			border: none;
			border-top: 1px solid #e0e0e0;
		}



		/* CSS Styles for User Information Section */
		.user-info-container {
			margin-bottom: 20px;
		}

		.info-item {
			display: flex;
			margin-bottom: 10px;
		}

		.info-label {
			flex: 0 0 150px; /* Adjust width as needed */
			font-weight: 600;
		}

		.info-value {
			flex: 1;
		}

		.update-link {
			text-decoration: none;
			color: #2d79f3;
			font-weight: 500;
			display: block;
			margin-top: 10px;
		}

		.update-link:hover {
			text-decoration: underline;
		}
		/* Center the h1 tag */
		h1 {
			text-align: center;
			font-size: 36px; /* Adjust the font size as needed */
			margin-bottom: 20px; /* Optional: Add some space below the heading */
		}



		.user-info-container {
			display: flex;
			flex-direction: column;
			gap: 20px;
			max-width: 600px;
			margin: 0 auto;
			padding: 20px;
			background-color: #ffffff;
			border-radius: 10px;
			box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		}

		.section-header {
			color: #151717;
			font-size: 24px;
			font-weight: bold;
		}

		.info-item {
			display: flex;
			justify-content: space-between;
			align-items: center;
		}

		.info-label {
			color: #444;
			font-weight: bold;
		}

		.info-value {
			color: #333;
		}

		.update-link {
			color: #2d79f3;
			text-decoration: none;
			font-weight: bold;
		}

		.update-link:hover {
			text-decoration: underline;
		}


    </style>
</head>
<body>
<div class="center-content">
    <div class="container">
        <h1>User Profile</h1>
        <%
            Cookie[] cookies = request.getCookies();
            String id=null;
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("id")) {
                        id = cookie.getValue();
                    }
                }
            }

        %>

        <div class="user-info-container">
            <h2 class="section-header">User Information</h2>
            <div class="info-item">
                <span class="info-label">User ID:</span>
                <span class="info-value"><%=id%></span>
            </div>
            <div class="info-item">
                <span class="info-label">Username:</span>
                <span class="info-value">${userDto.username}</span>
            </div>
            <div class="info-item">
                <span class="info-label">Email:</span>
                <span class="info-value">${userDto.email}</span>
            </div>
            <div class="info-item">
                <span class="info-label">Mobile Number:</span>
                <span class="info-value">${userDto.phone}</span>
            </div>
            <a class="update-link" href="${pageContext.request.contextPath}/user/update">Update User</a>
        </div>


        <hr>

        <div class="account-settings">
            <h2 class="section-header">Account Settings</h2>
            <a class="update-link" href="${pageContext.request.contextPath}/user/update-pass">Update Password</a>
        </div>

        <hr>

        <div class="health-data">
            <h2 class="section-header">Health Data Overview</h2>
            <a  class="update-link" href="${pageContext.request.contextPath}/health/all/${id}">View Detailed Health Data</a>
        </div>

        <hr>

        <div class="goal-tracking">
            <h2 class="section-header">Goal Progress Tracking</h2>
            <!-- Add progress bars, charts, or indicators here for goal achievements -->
        </div>
    </div>
</div>
</body>
</html>
