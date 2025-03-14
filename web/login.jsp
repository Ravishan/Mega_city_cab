<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login | MegaCityCab</title>
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <script src="js/login.js"></script>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form id="loginForm" action="LoginServlet" method="post">
            <label>Username:</label>
            <input type="text" name="username" id="username" required class="input-field"><br>

            <label>Password:</label>
            <input type="password" name="password" id="password" required class="input-field"><br>

            <button type="submit">Login</button>
        </form>

        <!-- Register Link for New Users -->
        <p>New User? <a href="register.jsp" class="register-link">Register Here</a></p>
    </div>
</body>
</html>
