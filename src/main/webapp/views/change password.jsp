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
    <form action="${pageContext.request.contextPath}/user/update-pass/${id}" method="post" onsubmit="return validatePassword()">

        <input type="hidden" name="_method" value="PUT">

        New Password: <input type="password" id="newPassword" name="newPassword" value="${userDto.password}" required><br>
        Confirm Password: <input type="password" id="confirmPassword" name="confirmPassword" value="${userDto.password}"
                                 required><br>
        <input type="submit" value="Change Password">
    </form>
</div>
</body>
</html>
