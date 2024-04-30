<%--
  Created by IntelliJ IDEA.
  User: prave
  Date: 25-04-2024
  Time: 22:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>update profile</title>
</head>
<body>

<form action="http://localhost:8080/fitness/user/home" method="post">
    Username: <input type="text" name="username" required><br>
    Email: <input type="email" name="email" required><br>
    phone: <input type="number" name="phone" required><br>
    Password: <input type="password" name="password" required><br>
    <input type="submit" value="update">
</form>

</body>
</html>
