<%@ page import="com.fitness.myprojectBackend.entity.User" %><%--<%@ page import="com.fitness.myprojectBackend.entity.User" %>--%>
<%--<%@ page import="com.fitness.myprojectBackend.mapper.UserMapper" %>--%>
<%--<%@ page import="com.fitness.myprojectBackend.dto.UserDto" %>&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: prave--%>
<%--  Date: 25-04-2024--%>
<%--  Time: 22:36--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>update profile</title>--%>
<%--</head>--%>
<%--<body>--%>

<%--<form action="${pageContext.request.contextPath}/user/profile" >--%>
<%--    Username: <input type="text" name="username" required><br>--%>
<%--    Email: <input type="email" name="email" required><br>--%>
<%--    phone: <input type="number" name="phone" required><br>--%>
<%--    <input type="submit" value="update">--%>
<%--</form>--%>

<%--</body>--%>
<%--</html>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Profile</title>
</head>
<body>


<form action="${pageContext.request.contextPath}/user/update/${id}" method="post">

    <input type="hidden" name="_method" value="PUT">

    Username: <input type="text" name="username" value="${user.username}" required><br>
    Email: <input type="email" name="email" value="${user.email}" required><br>
    Phone: <input type="text" name="phone" value="${user.phone}" required><br>
    <input type="submit" value="Update">
</form>

</body>
</html>

