<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, model.Booking, model.User, dao.BookingDAO" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    BookingDAO bookingDAO = new BookingDAO();
    List<Booking> bookings = bookingDAO.getBookingsByCustomer(user.getId());
%>

<html>
<head>
    <title>My Bookings | MegaCityCab</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #121212;
            color: white;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 70%;
            margin: 60px auto;
            padding: 30px;
            background: #1e1e1e;
            box-shadow: 0px 4px 15px rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            text-align: center;
        }

        h2 {
            color: #f1c40f;
            font-size: 26px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: #222;
            color: white;
        }

        th, td {
            padding: 12px;
            border: 1px solid #333;
            text-align: center;
            font-size: 16px;
        }

        th {
            background-color: #f1c40f;
            color: black;
            font-weight: bold;
        }

        tr:hover {
            background-color: #2c2c2c;
        }

        .no-bookings {
            color: #e74c3c;
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
        }

        .btn {
            display: inline-block;
            padding: 12px 20px;
            background: #f1c40f;
            color: black;
            text-decoration: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            margin-top: 20px;
            transition: all 0.3s ease-in-out;
        }

        .btn:hover {
            background: #d4ac0d;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>My Bookings</h2>

        <% if (bookings.isEmpty()) { %>
            <p class="no-bookings">You have no bookings yet.</p>
        <% } else { %>
            <table>
                <tr>
                    <th>Booking ID</th>
                    <th>Pickup Location</th>
                    <th>Dropoff Location</th>
                    <th>Booking Date</th>
                    <th>Status</th>
                </tr>
                <% for (Booking booking : bookings) { %>
                    <tr>
                        <td><%= booking.getBookingId() %></td>
                        <td><%= booking.getPickupLocation() %></td>
                        <td><%= booking.getDropoffLocation() %></td>
                        <td><%= booking.getBookingDate() %></td>
                        <td><%= booking.getStatus() %></td>
                    </tr>
                <% } %>
            </table>
        <% } %>

        <p><a href="booking.jsp" class="btn">Book Another Ride</a></p>
    </div>
</body>
</html>
