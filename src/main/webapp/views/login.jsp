<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
</head>
<body>
<h1>User Login</h1>

<c:if test="${not empty error}">
    <p style="color:#df6969;">${error}</p>
</c:if>
<form action="${pageContext.request.contextPath}/login" method="post">
    Username or Email or Phone: <input type="text" name="identifier" required><br>
    Password: <input type="password" name="password" required><br>
    <input type="submit" value="Login">
</form>
<p>If you don't have an account, <a href="${pageContext.request.contextPath}/user/register">register here</a>.</p>
</body>
</html>
