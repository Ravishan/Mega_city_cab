<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login | MegaCityCab</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #1a1a2e;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #16213e;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            text-align: center;
            color: white;
            width: 350px;
        }
        h2 {
            margin-bottom: 20px;
        }
        label {
            display: block;
            text-align: left;
            margin: 10px 0 5px;
            font-weight: bold;
        }
        input {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: none;
            outline: none;
            background: #0f3460;
            color: white;
        }
        input:focus {
            background: #1f4068;
        }
        button {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            background: #e94560;
            color: white;
            transition: 0.3s;
        }
        button:hover {
            background: #c82333;
        }
        .register-link {
            color: #03a9f4;
            text-decoration: none;
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }
        .register-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            <label>Username:</label>
            <input type="text" name="username" required>

            <label>Password:</label>
            <input type="password" name="password" required>

            <button type="submit">Login</button>
        </form>
        <p>New User? <a href="register.jsp" class="register-link">Register Here</a></p>
    </div>
</body>
</html>
