<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Goal Data</title>
    <!-- Include Chart.js library -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
    <h1>Goal Data</h1>
    <div id="chartContainer">
        <canvas id="goalsChart">
            ${goalsJson}
        </canvas>
    </div>
    <a href="${pageContext.request.contextPath}/goal/set/${id}">Add Goal</a>
</div>

<script>
    // Parse the JSON data from the JSP variable
    const rawData = '${goalsJson}';
    console.log("Raw data:", rawData);

    try {
        const goalsData = JSON.parse(rawData);
        console.log("Parsed data:", goalsData);

        // Extract labels and data points for the chart


        const labels = goalsData.map(goal => goal.goalName);
        const data = goalsData.map(goal => goal.targetSteps);

        console.log("Labels:",labels);
        console.log("Data:",data);

        // Get the context of the canvas element we want to select
        const ctx = document.getElementById('goalsChart').getContext('2d');

        // Create a new Chart
        const goalsChart = new Chart(ctx, {
            type: 'bar', // Specify the type of chart: bar
            data: {
                labels: labels,
                datasets: [{
                    label: 'Target Steps',
                    data: data,
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    } catch (e) {
        console.error("Error parsing JSON data:", e);
    }
</script>
</body>
</html>
