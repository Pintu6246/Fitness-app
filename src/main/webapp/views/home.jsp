<%@ page import="com.fitness.myprojectBackend.entity.User" %>
<%@ page import="com.fitness.myprojectBackend.mapper.UserMapper" %>
<%@ page import="com.fitness.myprojectBackend.dto.UserDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
</head>
<body>
<h1>Welcome to Health Monitoring System</h1>
<header>
    <nav>
        <ul>

            <li><a href="${pageContext.request.contextPath}/user/profile/${id}">Profile</a></li>
            <li><a href="${pageContext.request.contextPath}/health/healthdata">Health Data</a></li>
            <li><a href="${pageContext.request.contextPath}/goal/goals">Goals</a></li>
        </ul>
    </nav>
</header>
<main>
    <!-- Add content about your website here -->
</main>
</body>
</html>
