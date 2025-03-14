<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login | MegaCityCab</title>
</head>
<body style="font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; display: flex; justify-content: center; align-items: center; height: 100vh;">
    <div style="width: 300px; background: white; padding: 20px; border-radius: 10px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); text-align: center;">
        <h2 style="color: #333;">Login</h2>
        <form id="loginForm" action="LoginServlet" method="post">
            <label style="display: block; margin: 10px 0 5px; font-weight: bold;">Username:</label>
            <input type="text" name="username" id="username" required style="width: 100%; padding: 8px; margin-bottom: 10px; border: 1px solid #ccc; border-radius: 5px;">

            <label style="display: block; margin: 10px 0 5px; font-weight: bold;">Password:</label>
            <input type="password" name="password" id="password" required style="width: 100%; padding: 8px; margin-bottom: 10px; border: 1px solid #ccc; border-radius: 5px;">

            <button type="submit" style="width: 100%; padding: 10px; background-color: #007bff; color: white; border: none; border-radius: 5px; font-size: 16px; cursor: pointer;">Login</button>
        </form>
        
        <p style="margin-top: 10px;">New User? <a href="register.jsp" style="color: #007bff; text-decoration: none; font-weight: bold;">Register Here</a></p>
    </div>
</body>
</html>
