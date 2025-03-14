<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, model.Booking, dao.BookingDAO" %>

<%
    BookingDAO bookingDAO = new BookingDAO();
    List<Booking> bookings = bookingDAO.getAllBookings();
%>

<html>
<head>
    <title>Manage Bookings | MegaCityCab</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 90%;
            max-width: 1100px;
            background: #fff;
            padding: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th {
            background: #007BFF;
            color: white;
            padding: 10px;
            text-align: left;
        }
        td {
            padding: 8px;
            background: #fff;
        }
        tr:nth-child(even) {
            background: #f2f2f2;
        }
        a {
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 4px;
        }
        .edit-btn {
            background: #28a745;
            color: white;
        }
        .delete-btn {
            background: #dc3545;
            color: white;
        }
        .edit-btn:hover {
            background: #218838;
        }
        .delete-btn:hover {
            background: #c82333;
        }
        .back-btn {
            display: block;
            margin-top: 15px;
            text-align: center;
            padding: 10px;
            background: #007BFF;
            color: white;
            border-radius: 5px;
            width: fit-content;
            margin-left: auto;
            margin-right: auto;
        }
        .back-btn:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Manage Bookings</h2>

        <% if (bookings.isEmpty()) { %>
            <p style="text-align: center; color: red;">No bookings available.</p>
        <% } else { %>
            <table>
                <tr>
                    <th>Booking ID</th>
                    <th>Customer ID</th>
                    <th>Pickup Location</th>
                    <th>Dropoff Location</th>
                    <th>Booking Date</th>
                    <th>Status</th>
                    <th>Vehicle Type</th>
                    <th>Price</th>
                    <th>Actions</th>
                </tr>
                <% for (Booking booking : bookings) { %>
                    <tr>
                        <td><%= booking.getBookingId() %></td>
                        <td><%= booking.getCustomerId() %></td>
                        <td><%= booking.getPickupLocation() %></td>
                        <td><%= booking.getDropoffLocation() %></td>
                        <td><%= booking.getBookingDate() %></td>
                        <td><%= booking.getStatus() %></td>
                        <td><%= booking.getVehicleType() %></td>
                        <td>$<%= booking.getPrice() %></td>
                        <td>
                            <a href="EditBookingServlet?id=<%= booking.getBookingId() %>" class="edit-btn">Edit</a>
                            |
                            <a href="DeleteBookingServlet?id=<%= booking.getBookingId() %>" class="delete-btn" onclick="return confirm('Are you sure?');">Delete</a>
                        </td>
                    </tr>
                <% } %>
            </table>
        <% } %>

        <a href="adminDashboard.jsp" class="back-btn">Back to Dashboard</a>
    </div>
</body>
</html>
