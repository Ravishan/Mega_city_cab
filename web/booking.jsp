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
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #121212;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #1e1e1e;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(255, 255, 255, 0.1);
            text-align: center;
            width: 350px;
        }
        h2 {
            margin-bottom: 20px;
            color: #ffffff;
        }
        label {
            display: block;
            text-align: left;
            margin: 10px 0 5px;
            font-weight: bold;
            color: #ddd;
        }
        input, select {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: none;
            background: #333;
            color: white;
            outline: none;
            transition: 0.3s;
        }
        input:focus, select:focus {
            background: #444;
            border: 1px solid #555;
        }
        button {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            background: #007bff;
            color: white;
            transition: 0.3s;
        }
        button:hover {
            background: #0056b3;
        }
        .view-bookings {
            display: block;
            margin-top: 15px;
            text-decoration: none;
            color: #00aaff;
            font-weight: bold;
        }
        .view-bookings:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Book a Ride</h2>

        <form action="BookingServlet" method="post">
            <label>Pickup Location:</label>
            <input type="text" name="pickupLocation" required>

            <label>Dropoff Location:</label>
            <input type="text" name="dropoffLocation" required>

            <label>Select Vehicle Type:</label>
            <select name="vehicleType" id="vehicleType" onchange="calculatePrice()">
                <option value="Economy">Economy - $10</option>
                <option value="Standard">Standard - $15</option>
                <option value="Luxury">Luxury - $25</option>
            </select>

            <label>Estimated Price:</label>
            <input type="text" id="price" name="price" readonly>

            <button type="submit">Book Now</button>
        </form>

        <a href="viewBookings.jsp" class="view-bookings">View My Bookings</a>
    </div>

    <script>
        function calculatePrice() {
            var vehicleType = document.getElementById("vehicleType").value;
            var price = 0;
            if (vehicleType === "Economy") price = 10;
            if (vehicleType === "Standard") price = 15;
            if (vehicleType === "Luxury") price = 25;
            document.getElementById("price").value = price;
        }
    </script>

</body>
</html>
