<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"customer".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<html>
<head>
    <title>Customer Dashboard | MegaCityCab</title>
    <link rel="stylesheet" type="text/css" href="css/customer.css">
    <script src="js/customer.js"></script>
</head>
<body>
    <div class="container">
        <h2>Welcome, <%= user.getUsername() %>!</h2>

        <ul class="customer-menu">
            <li><a href="booking.jsp">Book a Ride</a></li>
            <li><a href="viewBookings.jsp">View My Bookings</a></li>
            <li><a href="viewBills.jsp">View My Bills</a></li>
        </ul>

        <a href="logout.jsp" class="logout-btn" onclick="return confirmLogout();">Logout</a>
    </div>
</body>
</html>
