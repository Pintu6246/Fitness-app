<%@ page import="com.fitness.myprojectBackend.entity.User" %>
<%@ page import="com.fitness.myprojectBackend.mapper.UserMapper" %>
<%@ page import="com.fitness.myprojectBackend.dto.UserDto" %><%--
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
<% UserDto loggedInUser = (UserDto)session.getAttribute("loggedInUser");
    UserMapper mapper = new UserMapper();
    User user=mapper.toEntity(loggedInUser); %>

<form action="${pageContext.request.contextPath}/user/profile" >
    Username: <input type="text" name="username" required><br>
    Email: <input type="email" name="email" required><br>
    phone: <input type="number" name="phone" required><br>
    <input type="submit" value="update">
</form>

</body>
</html>
