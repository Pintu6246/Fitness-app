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
</head>
<body>
<div>
    <!-- Account Settings -->
    <h2>Account Settings</h2>
    <form action="updatePassword" method="post">
        New Password: <input type="password" name="newPassword" required><br>
        Confirm Password: <input type="password" name="confirmPassword" required><br>
        <input type="submit" value="Change Password">
    </form>
</div>
</body>
</html>
