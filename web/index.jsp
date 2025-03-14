<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MegaCityCab | Fast, Safe, and Reliable</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* Navigation Bar */
        .navbar {
            background: #34495e;
            padding: 15px 20px;
            text-align: center;
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
            z-index: 1000;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            padding: 15px 20px;
            margin: 0 10px;
            display: inline-block;
            transition: 0.3s;
        }
        .navbar a:hover {
            background: #1abc9c;
            border-radius: 5px;
        }

        /* Hero Section */
        .hero {
            background: url('images/taxi-modern.jpg') no-repeat center center/cover;
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            position: relative;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.6);
        }
        .hero::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.4);
        }
        .hero h1 {
            font-size: 50px;
            z-index: 1;
            margin-bottom: 15px;
        }
        .hero p {
            font-size: 20px;
            z-index: 1;
            margin-bottom: 20px;
        }
        .hero .btn {
            z-index: 1;
            display: inline-block;
            padding: 12px 25px;
            font-size: 18px;
            text-decoration: none;
            border-radius: 5px;
            transition: 0.3s;
            margin: 5px;
        }
        .btn-book {
            background-color: #f39c12;
            color: white;
        }
        .btn-book:hover {
            background-color: #e67e22;
        }
        .btn-login {
            background-color: #3498db;
            color: white;
        }
        .btn-login:hover {
            background-color: #2980b9;
        }
        .btn-register {
            background-color: #2ecc71;
            color: white;
        }
        .btn-register:hover {
            background-color: #27ae60;
        }

        /* Main Content */
        .container {
            text-align: center;
            padding: 60px 20px;
            flex: 1;
        }

        /* Footer */
        .footer {
            background: #34495e;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: auto;
        }
        .footer a {
            color: #1abc9c;
            text-decoration: none;
            margin: 0 10px;
        }
        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
    <div class="navbar">
        <a href="index.jsp">Home</a>
        <a href="about.jsp">About Us</a>
        <a href="services.jsp">Services</a>
        <a href="contact.jsp">Contact</a>
    </div>

    <!-- Hero Section -->
    <div class="hero">
        <h1>Your Trusted Ride, Anytime, Anywhere</h1>
        <p>Safe, Fast, and Affordable Taxi Service</p>
        <a href="booking.jsp" class="btn btn-book">Book a Ride</a>
        <a href="login.jsp" class="btn btn-login">Login</a>
        <a href="register.jsp" class="btn btn-register">Register</a>
    </div>

    <!-- Main Content -->
    <div class="container">
        <h2>Welcome to MegaCityCab</h2>
        <p>We provide top-notch taxi services at affordable prices. Book your ride now and travel hassle-free!</p>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2025 MegaCityCab | <a href="terms.jsp">Terms</a> | <a href="privacy.jsp">Privacy</a></p>
    </div>

</body>
</html>
