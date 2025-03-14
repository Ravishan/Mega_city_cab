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

    <!-- 🔹 Inline CSS Styling -->
    <style>
        /* General Page Styling */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #74ebd5, #acb6e5);
            text-align: center;
            margin: 0;
            padding: 0;
        }

        /* Booking Container */
        .container {
            width: 70%;
            margin: 60px auto;
            padding: 30px;
            background: white;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            text-align: center;
        }

        /* Heading */
        h2 {
            color: #333;
            font-size: 26px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
            font-size: 16px;
        }

        th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        /* Row Hover Effect */
        tr:hover {
            background-color: #f1f1f1;
        }

        /* Booking Message */
        .no-bookings {
            color: #d9534f;
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
        }

        /* Button Styling */
        .btn {
            display: inline-block;
            padding: 12px 20px;
            background: linear-gradient(135deg, #007bff, #0056b3);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            margin-top: 20px;
            transition: all 0.3s ease-in-out;
        }

        .btn:hover {
            background: linear-gradient(135deg, #0056b3, #004095);
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
