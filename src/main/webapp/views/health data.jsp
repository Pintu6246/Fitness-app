<!DOCTYPE html>
<html>
<head>
    <title>Health Data</title>
    <style>
		html, body {
			height: 100%;
			margin: 0;
			display: flex;
			justify-content: center;
			align-items: center;
			background-color: #f0f0f0;
			font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
		}
		.centered-container {
			display: flex;
			flex-direction: column;
			align-items: center;
			width: 100%;
			max-height: 100vh;
			padding: 20px;
			background-color: #ffffff;
			border-radius: 20px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}

		.link-container {
			margin-top: 0px;
			display: flex;
			flex-direction: column;
			align-items: center;
		}
		.link-container a {
			margin-top: 0px;
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
		.link-container a:hover {
			background-color: #252727;
		}

		.content {
			width: 100%;
			max-width: 1200px; /* Adjust as needed */
		}

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
		.charts-row {
			display: flex;
			justify-content: space-between;
			width: 100%;
			max-width: 1200px;
		}
		.chart-container {
			flex: 1;
			width: 400px;
			height: 200px;
			margin: 20px;
			padding: 20px;
			background-color: #e6e6e6;
			border: 1.5px solid #ff8e8e;
			border-radius: 10px;
			box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}
		h1 {
			font-size: 24px;
			color: #151717;
			text-align: center; /* Center the text horizontally */
			margin-bottom: 20px; /* Add space below the h1 tag */
		}
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<div class="centered-container">
    <div class="content">
        <h1>Health Data</h1>
        <div class="charts-row">
            <div class="chart-container">
                <canvas id="heartRateChart"></canvas>
            </div>
            <div class="chart-container">
                <canvas id="bloodPressureChart"></canvas>
            </div>
        </div>
        <div class="charts-row">
            <div class="chart-container">
                <canvas id="weightChart"></canvas>
            </div>
            <div class="chart-container">
                <canvas id="activityLevelChart"></canvas>
            </div>
        </div>
        <div class="link-container">
        <a href="${pageContext.request.contextPath}/health/all/${id}">All Health Data</a><br>
        <a href="${pageContext.request.contextPath}/health/latest/${id}">Latest Health Data</a><br>
        <a href="${pageContext.request.contextPath}/health/submit/${id}">Add Health Data</a><br>
        </div>
    </div>
</div>

<script>
    const rawHealthData = '${healthData}';
    console.log("Raw Data:", rawHealthData);

    try {
        const healthData = JSON.parse(rawHealthData);
        console.log("Parsed Data:", healthData);

        const formatDate = timestampArray => {
            if (Array.isArray(timestampArray) && timestampArray.length === 5) {
                const [year, month, day, hour, minute] = timestampArray;
                const date = new Date(year, month - 1, day, hour, minute);
                return date.toLocaleDateString('en-US', { year: 'numeric', month: 'short', day: 'numeric' });
            } else {
                console.error("Unrecognized timestamp format:", timestampArray);
                return "INVALID DATE";
            }
        };

        let dates, heartRates, bloodPressures, activityLevels, weights;

        if (Array.isArray(healthData)) {
            dates = healthData.map(item => formatDate(item.timestamp));
            heartRates = healthData.map(item => item.heartRate);
            bloodPressures = healthData.map(item => item.bloodPressure);
            activityLevels = healthData.map(item => item.activityLevel);
            weights = healthData.map(item => item.weight);
        } else {
            dates = [formatDate(healthData.timestamp)];
            heartRates = [healthData.heartRate];
            bloodPressures = [healthData.bloodPressure];
            activityLevels = [healthData.activityLevel];
            weights = [healthData.weight];
        }

        new Chart(document.getElementById('heartRateChart'), {
            type: 'line',
            data: {
                labels: dates,
                datasets: [{
                    label: 'Heart Rate',
                    data: heartRates,
                    borderColor: '#000dff',
                    borderWidth: 1,
                    fill: false
                }]
            },
            options: {
                scales: {
                    x: { title: { display: true, text: 'Date' } },
                    y: { title: { display: true, text: 'Heart Rate' } }
                }
            }
        });

        new Chart(document.getElementById('bloodPressureChart'), {
            type: 'line',
            data: {
                labels: dates,
                datasets: [{
                    label: 'Blood Pressure',
                    data: bloodPressures,
                    borderColor: 'rgb(237,5,244)',
                    borderWidth: 1,
                    fill: false
                }]
            },
            options: {
                scales: {
                    x: { title: { display: true, text: 'Date' } },
                    y: { title: { display: true, text: 'Blood Pressure' } }
                }
            }
        });

        new Chart(document.getElementById('activityLevelChart'), {
            type: 'bar',
            data: {
                labels: dates,
                datasets: [{
                    label: 'Activity Level',
                    data: activityLevels.map(level => {
                        switch (level) {
                            case 'Low': return 1;
                            case 'Moderate': return 2;
                            case 'High': return 3;
                            default: return 0;
                        }
                    }),
                    backgroundColor: 'rgba(148,225,104,0.6)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    x: { title: { display: true, text: 'Date' } },
                    y: {
                        title: { display: true, text: 'Activity Level' },
                        ticks: { callback: value => ['None', 'Low', 'Moderate', 'High'][value] }
                    }
                }
            }
        });

        new Chart(document.getElementById('weightChart'), {
            type: 'line',
            data: {
                labels: dates,
                datasets: [{
                    label: 'Weight',
                    data: weights,
                    borderColor: 'rgb(241,255,0)',
                    borderWidth: 1,
                    fill: false
                }]
            },
            options: {
                scales: {
                    x: { title: { display: true, text: 'Date' } },
                    y: { title: { display: true, text: 'Weight' } }
                }
            }
        });

    } catch (e) {
        console.log("Error parsing JSON data:", e);
    }
</script>
</body>
</html>
