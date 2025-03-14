<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Booking" %>

<%
    Booking booking = (Booking) request.getAttribute("booking");
    if (booking == null) {
        response.sendRedirect("viewBookings.jsp?error=Booking not found");
        return;
    }
%>

<html>
<head>
    <title>Edit Booking | MegaCityCab</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: white;
            padding: 20px;
            width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 8px;
            text-align: center;
        }
        h2 {
            margin-bottom: 15px;
            color: #333;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
            text-align: left;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            color: white;
        }
        .btn-update {
            background-color: #28a745;
        }
        .btn-update:hover {
            background-color: #218838;
        }
        .btn-back {
            background-color: #007bff;
            margin-top: 10px;
        }
        .btn-back:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Booking</h2>

        <% if (request.getParameter("error") != null) { %>
            <p class="error-message"><%= request.getParameter("error") %></p>
        <% } %>

        <form action="EditBookingServlet" method="post">
            <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">

            <label>Pickup Location:</label>
            <input type="text" name="pickupLocation" value="<%= booking.getPickupLocation() %>" required>

            <label>Dropoff Location:</label>
            <input type="text" name="dropoffLocation" value="<%= booking.getDropoffLocation() %>" required>

            <label>Booking Date:</label>
            <input type="date" name="bookingDate" value="<%= booking.getBookingDate() %>" required>

            <label>Status:</label>
            <select name="status">
                <option value="Pending" <%= booking.getStatus().equals("Pending") ? "selected" : "" %>>Pending</option>
                <option value="Completed" <%= booking.getStatus().equals("Completed") ? "selected" : "" %>>Completed</option>
                <option value="Cancelled" <%= booking.getStatus().equals("Cancelled") ? "selected" : "" %>>Cancelled</option>
            </select>

            <label>Vehicle Type:</label>
            <select name="vehicleType">
                <option value="Economy" <%= booking.getVehicleType().equals("Economy") ? "selected" : "" %>>Economy</option>
                <option value="Standard" <%= booking.getVehicleType().equals("Standard") ? "selected" : "" %>>Standard</option>
                <option value="Luxury" <%= booking.getVehicleType().equals("Luxury") ? "selected" : "" %>>Luxury</option>
            </select>

            <label>Price ($):</label>
            <input type="number" name="price" step="0.01" value="<%= booking.getPrice() %>" required>

            <button type="submit" class="btn btn-update">Update Booking</button>
        </form>

        <a href="viewBookings.jsp"><button class="btn btn-back">Back to Bookings</button></a>
    </div>
</body>
</html>
