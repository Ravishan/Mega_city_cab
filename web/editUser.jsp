<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.User, dao.UserDAO" %>

<%
    UserDAO userDAO = new UserDAO();
    int userId = Integer.parseInt(request.getParameter("id"));
    User user = userDAO.getUserById(userId);
%>

<html>
<head>
    <title>Edit User | MegaCityCab</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #121212;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #1e1e1e;
            padding: 30px;
            width: 400px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(255, 255, 255, 0.1);
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
            color: #f1c40f;
        }
        label {
            display: block;
            text-align: left;
            margin: 10px 0 5px;
            font-weight: bold;
        }
        input, select {
            width: 100%;
            padding: 12px;
            border-radius: 5px;
            border: 1px solid #444;
            background: #222;
            color: white;
            transition: 0.3s;
            outline: none;
        }
        input:focus, select:focus {
            border-color: #f1c40f;
            box-shadow: 0 0 5px rgba(241, 196, 15, 0.5);
        }
        button {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            background: linear-gradient(135deg, #f1c40f, #d4ac0d);
            color: black;
            transition: 0.3s;
        }
        button:hover {
            background: linear-gradient(135deg, #d4ac0d, #a67c00);
        }
        .back-link {
            display: block;
            margin-top: 15px;
            text-decoration: none;
            color: #f1c40f;
            font-weight: bold;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit User</h2>

        <form action="EditUserServlet" method="post">
            <input type="hidden" name="id" value="<%= user.getId() %>">

            <label>Username:</label>
            <input type="text" name="username" value="<%= user.getUsername() %>" required>

            <label>Role:</label>
            <select name="role">
                <option value="admin" <%= user.getRole().equals("admin") ? "selected" : "" %>>Admin</option>
                <option value="customer" <%= user.getRole().equals("customer") ? "selected" : "" %>>Customer</option>
            </select>

            <button type="submit">Update User</button>
        </form>

        <a href="manageUsers.jsp" class="back-link">Back to Users</a>
    </div>
</body>
</html>
