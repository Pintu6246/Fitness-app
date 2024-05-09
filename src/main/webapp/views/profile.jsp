<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="com.fitness.myprojectBackend.repositry.UserRepo" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ page import="com.fitness.myprojectBackend.entity.User" %>
<%@ page import="org.springframework.ui.Model" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <!-- Include CSS and JavaScript libraries here (e.g., Bootstrap, Chart.js) -->
</head>
<body>
<h1>User Profile</h1>

<div>
    <!-- User Information Display and Update -->
    <h2>User Information</h2>


    <%-- Retrieve user details from cookies --%>
    <%


        Cookie[] cookies = request.getCookies();
        String username = null, email = null, phone=null,id=null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    username = cookie.getValue();
                } else if (cookie.getName().equals("email")) {
                    email = cookie.getValue();
                } else if (cookie.getName().equals("phone")) {
                    phone = cookie.getValue();
                } else if (cookie.getName().equals("id")) {
                    id = cookie.getValue();
                }

            }

        }

    %>

    UserId: <%=id%><br>
    Username: <%= username %><br>
    Email: <%= email %><br>
    Mobile Number: <%=phone%><br>

    <%-- Create update user link with user ID --%>
    <!-- Add link to update user details -->
    <a href="${pageContext.request.contextPath}/user/update">Update User</a>
</div>

<hr>

<div>
    <!-- Account Settings -->
    <h2>Account Settings</h2>
    <a href="${pageContext.request.contextPath}/user/updatepass">Update pass</a>

</div>

<hr>

<div>
    <!-- Health Data Overview -->
    <h2>Health Data Overview</h2>
    <!-- Add charts or visualizations for health data -->
    <a href="${pageContext.request.contextPath}/health/healthdata">View Detailed Health Data</a>
</div>

<hr>

<div>
    <!-- Goal Progress Tracking -->
    <h2>Goal Progress Tracking</h2>
    <!-- Show progress bars, charts, or indicators for goal achievements -->
</div>
</body>
</html>
