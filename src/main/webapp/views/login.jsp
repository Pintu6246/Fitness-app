<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
    <style>
		/* Ensure the html and body take up the full height of the viewport */
		html, body {
			height: 100%;
			margin: 0;
			display: flex;
			justify-content: center;
			align-items: center;
			background-color: #f0f0f0; /* Optional: Add a background color to distinguish the form */
		}

		/* Centering container for the form */
		.centered-container {
			display: flex;
			justify-content: center;
			align-items: center;
			width: 100%;
			height: 100%;
		}

		/* Inline style moved to CSS class for better organization */
		.form {
			display: flex;
			flex-direction: column;
			gap: 10px;
			background-color: #ffffff;
			padding: 30px;
			width: 450px;
			border-radius: 20px;
			font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
		}

		.form label {
			color: #151717;
			font-weight: 600;
		}

		.form .inputForm {
			border: 1.5px solid #ecedec;
			border-radius: 10px;
			height: 50px;
			display: flex;
			align-items: center;
			padding-left: 10px;
			transition: 0.2s ease-in-out;
		}

		.form .input {
			margin-left: 10px;
			border-radius: 10px;
			border: none;
			width: 85%;
			height: 100%;
		}

		.form .input:focus {
			outline: none;
		}

		.form .inputForm:focus-within {
			border: 1.5px solid #2d79f3;
		}

		.form button {
			margin: 20px 0 10px 0;
			background-color: #151717;
			border: none;
			color: white;
			font-size: 15px;
			font-weight: 500;
			border-radius: 10px;
			height: 50px;
			width: 100%;
			cursor: pointer;
		}

		.form button:hover {
			background-color: #252727;
		}

		.form .span {
			font-size: 14px;
			margin-left: 5px;
			color: #2d79f3;
			font-weight: 500;
			cursor: pointer;
			text-align: center;
			display: block;
			margin-top: 10px;
		}

		.form .error {
			color: #df6969;
		}
    </style>
</head>
<body>
<div class="centered-container">
    <form class="form" action="${pageContext.request.contextPath}/login" method="post">
        <h1 style="text-align: center;">User Login</h1>

        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>

        <label for="identifier">Username or Email or Phone:</label>
        <div class="inputForm">
            <input class="input" type="text" id="identifier" name="identifier" required>
        </div>

        <label for="password">Password:</label>
        <div class="inputForm">
            <input class="input" type="password" id="password" name="password" required>
        </div>

        <button type="submit">Login</button>

        <span class="span">If you don't have an account, <a href="${pageContext.request.contextPath}/user/register">register here</a>.</span>
    </form>
</div>
</body>
</html>
