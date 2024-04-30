<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
</head>
<body>
<h1>User Registration</h1>
<form action="${pageContext.request.contextPath}/user/register" method="post" modelAttribute="userDto">
    Username: <input type="text" name="username" required><br>
    Email: <input type="email" name="email" required><br>
    Phone: <input type="text" name="phone" required><br>
    Password: <input type="password" name="password" required><br>
    <input type="submit" value="Register">
</form>
<p>If you already have an account, <a href="${pageContext.request.contextPath}/login">login here</a>.</p>

</body>
</html>
