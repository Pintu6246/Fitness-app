<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Health Data</title>
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
			flex-wrap: wrap;
			gap: 10px;
			background-color: #ffffff;
			padding: 30px;
			width: 700px;
			border-radius: 20px;
			font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
		}

		.form label {
			color: #151717;
			font-weight: 600;
			width: 100%;
		}

		.inputForm {
			border: 1.5px solid #ecedec;
			border-radius: 10px;
			height: 50px;
			display: flex;
			align-items: center;
			padding-left: 10px;
			transition: 0.2s ease-in-out;
			width: calc(100% - 10px); /* Adjust width to be a third of the container */
		}

		.input {
			margin-left: 10px;
			border-radius: 10px;
			border: none;
			width: 100%;
			height: 100%;
		}

		.input:focus {
			outline: none;
		}

		.inputForm:focus-within {
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

		/* Ensure labels and inputs stay aligned within the container */
		.form-group {
			display: flex;
			flex-direction: column;
			width: calc(33.33% - 10px); /* Adjust width to be a third of the container */
		}
    </style>
</head>
<body>
<div class="centered-container">
    <form class="form" action="${pageContext.request.contextPath}/health/submit/${id}" method="post">
        <div class="form-group">
            <label for="age">Age:</label>
            <div class="inputForm">
                <input class="input" type="number" id="age" name="age" min="15" max="90" required>
            </div>
        </div>

        <div class="form-group">
            <label for="height">Height (cm):</label>
            <div class="inputForm">
                <input class="input" type="number" id="height" name="height" min="100" max="200" required>
            </div>
        </div>

        <div class="form-group">
            <label for="weight">Weight (kg):</label>
            <div class="inputForm">
                <input class="input" type="number" id="weight" name="weight" min="30" max="130" required>
            </div>
        </div>

        <div class="form-group">
            <label for="gender">Gender:</label>
            <div class="inputForm">
                <select class="input" id="gender" name="gender" required>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label for="timestamp">Timestamp:</label>
            <div class="inputForm">
                <input class="input" type="datetime-local" id="timestamp" name="timestamp" required>
            </div>
        </div>

        <div class="form-group">
            <label for="heartRate">Heart Rate (bpm):</label>
            <div class="inputForm">
                <input class="input" type="number" id="heartRate" name="heartRate" min="50" max="110" required>
            </div>
        </div>

        <div class="form-group">
            <label for="bloodPressure">Blood Pressure (mm Hg):</label>
            <div class="inputForm">
                <input class="input" type="number" id="bloodPressure" name="bloodPressure" min="60" max="150" required>
            </div>
        </div>

        <div class="form-group">
            <label for="alcoholOrSmoke">Alcohol or Smoke:</label>
            <div class="inputForm">
                <select class="input" id="alcoholOrSmoke" name="alcoholOrSmoke" required>
                    <option value="Yes">Yes</option>
                    <option value="No">No</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label for="stress">Stress:</label>
            <div class="inputForm">
                <select class="input" id="stress" name="stress" required>
                    <option value="yes">Yes</option>
                    <option value="no">No</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label for="diet">Diet:</label>
            <div class="inputForm">
                <select class="input" id="diet" name="diet" required>
                    <option value="Balanced">Balanced</option>
                    <option value="High_protein">High Protein</option>
                    <option value="Low_carb">Low Carb</option>
                    <option value="Vegetarian">Vegetarian</option>
                    <option value="Vegan">Vegan</option>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label for="activityLevel">Activity Level:</label>
            <div class="inputForm">
                <select class="input" id="activityLevel" name="activityLevel" required>
                    <option value="High">High</option>
                    <option value="Moderate">Moderate</option>
                    <option value="Low">Low</option>
                </select>
            </div>
        </div>

        <button type="submit">Submit</button>
    </form>
</div>
</body>
</html>
