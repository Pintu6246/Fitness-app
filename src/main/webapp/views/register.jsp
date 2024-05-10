<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <script>
        function validateForm() {

            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("cnfpassword").value;
            var phone=document.getElementById("phone").value;

            if(phone.length!==10 || isNaN(phone)){
                alert("Phone number should have exactly 10 digits and contain only numbers.")
                return false;
            }

            if (password !== confirmPassword) {
                alert("Passwords do not match. Please enter the same password in both fields.");
                return false;
            }

        }
    </script>
</head>
<body>
<h1>User Registration</h1>
<form action="${pageContext.request.contextPath}/user/register" method="post" id="registrationForm" onsubmit="return validateForm()">
    Username: <input type="text" name="username" id="username" required><br>
    Email: <input type="email" name="email" id="email" required><br>
    Phone: <input type="text" name="phone" id="phone" required><br>
    Password: <input type="password" name="password" id="password" required><br>
    Confirm Password: <input type="password" name="cnfpassword" id="cnfpassword" required><br>

    <input type="submit" value="Register">
</form>
<p>If you already have an account, <a href="${pageContext.request.contextPath}/login">login here</a>.</p>
</body>
</html>
