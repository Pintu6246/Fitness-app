<%--
  Created by IntelliJ IDEA.
  User: prave
  Date: 06-05-2024
  Time: 18:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>change password</title>
    <style>
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


    </style>
    <script type="text/javascript">
        function validatePassword() {
            const newPassword = document.getElementById("newPassword").value;
            const confirmPassword = document.getElementById("confirmPassword").value;
            if (newPassword !== confirmPassword) {
                alert("New password and confirm password must match!");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<div>
    <!-- Account Settings -->
    <h2>Account Settings</h2>
    <form class="form" action="${pageContext.request.contextPath}/user/update-pass/${id}" method="post" onsubmit="return validatePassword()">

        <input type="hidden" name="_method" value="PUT">

        <label for="newPassword">New Password:</label>
        <div class="inputForm">
            <input class="input" type="password" id="newPassword" name="newPassword" value="${userDto.password}" required>
        </div>

        <label for="confirmPassword">Confirm Password:</label>
        <div class="inputForm">
            <input class="input" type="password" id="confirmPassword" name="confirmPassword" value="${userDto.password}" required>
        </div>

        <button type="submit">Change Password</button>
    </form>
</div>
</body>
</html>
