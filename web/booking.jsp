<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<html>
<head>
    <title>Book a Ride | MegaCityCab</title>
    <script src="js/booking.js" defer></script>
    
    <!-- Inline CSS for Professional Look -->
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
            width: 40%;
            margin: 60px auto;
            padding: 30px;
            background: white;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            text-align: center;
            transition: transform 0.3s ease-in-out;
        }

        .container:hover {
            transform: scale(1.02);
        }

        /* Heading */
        h2 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        /* Form Styling */
        form {
            text-align: left;
            width: 100%;
            padding: 10px;
        }

        /* Label */
        label {
            display: block;
            font-size: 16px;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }

        /* Input Fields */
        .input-field {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 2px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s ease-in-out;
        }

        .input-field:focus {
            border-color: #007bff;
            outline: none;
        }

        /* Button Styling */
        button {
            background: linear-gradient(135deg, #007bff, #0056b3);
            color: white;
            padding: 14px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            font-weight: bold;
            margin-top: 20px;
            transition: all 0.3s ease-in-out;
        }

        button:hover {
            background: linear-gradient(135deg, #0056b3, #004095);
        }

        /* View Bookings Link */
        .back-link {
            display: inline-block;
            margin-top: 15px;
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
            font-size: 14px;
        }

        .back-link:hover {
            text-decoration: underline;
        }

        /* Error Message */
        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
        }

        /* Success Message */
        .success-message {
            color: green;
            font-size: 14px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Book a Ride</h2>

        <% if (request.getParameter("error") != null) { %>
            <p class="error-message"><%= request.getParameter("error") %></p>
        <% } %>

        <form id="bookingForm" action="BookingServlet" method="post">
            <label>Pickup Location:</label>
            <input type="text" name="pickupLocation" id="pickupLocation" required class="input-field">

            <label>Dropoff Location:</label>
            <input type="text" name="dropoffLocation" id="dropoffLocation" required class="input-field">

            <button type="submit">Book Now</button>
        </form>

        <p><a href="viewBookings.jsp" class="back-link">View My Bookings</a></p>
    </div>
</body>
</html>
