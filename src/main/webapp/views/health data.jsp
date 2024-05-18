<!DOCTYPE html>
<html>
<head>
    <title>Health Data</title>
    <style>
		/* Ensure the html and body take up the full height of the viewport */
		html, body {
			height: 100%;
			margin: 0;
			display: flex;
			justify-content: center;
			align-items: center;
			background-color: #f0f0f0; /* Optional: Add a background color to distinguish the form */
			font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
		}

		/* Centering container for the content */
		.centered-container {
			display: flex;
			flex-direction: column;
			align-items: center;
			width: 100%;
			padding: 20px;
			background-color: #ffffff;
			border-radius: 20px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}

		/* Styles for links */
		a {
			margin-top: 10px;
			padding: 10px 20px;
			border-radius: 10px;
			background-color: #151717;
			color: white;
			text-decoration: none;
			font-size: 15px;
			font-weight: 500;
			display: inline-block;
			text-align: center;
			transition: background-color 0.2s ease-in-out;
		}

		a:hover {
			background-color: #252727;
		}

		/* Styles for the chart container */
		#chartContainer {
			margin: 20px 0;
			padding: 20px;
			background-color: #fff;
			border: 1.5px solid #ecedec;
			border-radius: 10px;
			width: 100%;
			max-width: 600px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
			display: flex;
			justify-content: center;
			align-items: center;
		}

		/* General heading styles */
		h1 {
			font-size: 24px;
			color: #151717;
		}
    </style>
</head>
<body>
<div class="centered-container">
    <h1>Health Data</h1>
    <div id="chartContainer">
        ${healthData}
    </div>
    <a href="${pageContext.request.contextPath}/health/all/${id}">All Health Data</a><br>
    <a href="${pageContext.request.contextPath}/health/latest/${id}">Latest Health Data</a><br>
    <a href="${pageContext.request.contextPath}/health/submit/${id}">Add Health Data</a><br>
</div>
</body>
</html>
