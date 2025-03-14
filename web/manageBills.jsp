<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, model.User, model.Bill, dao.BillDAO" %>

<%
    // Ensure the user is logged in and is an admin
    User admin = (User) session.getAttribute("user");
    if (admin == null || !"admin".equals(admin.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Fetch all bills from the database
    BillDAO billDAO = new BillDAO();
    List<Bill> bills = billDAO.getAllBills();
%>

<html>
<head>
    <title>Manage Bills | MegaCityCab</title>

    <!-- 🔹 Dark Mode Styling -->
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
            width: 80%;
            margin: 50px auto;
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

        .btn {
            display: inline-block;
            padding: 10px 15px;
            background: linear-gradient(135deg, #f1c40f, #d4ac0d);
            color: black;
            text-decoration: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: bold;
            margin-top: 10px;
            transition: all 0.3s ease-in-out;
        }

        .btn:hover {
            background: linear-gradient(135deg, #d4ac0d, #a67c00);
        }

        .delete-btn {
            background: linear-gradient(135deg, #ff4747, #c40000);
            color: white;
        }

        .delete-btn:hover {
            background: linear-gradient(135deg, #c40000, #a00000);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Manage Bills</h2>

        <% if (bills.isEmpty()) { %>
            <p style="color: #e74c3c;">No bills available.</p>
        <% } else { %>
            <table>
                <tr>
                    <th>Bill ID</th>
                    <th>Booking ID</th>
                    <th>Amount</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                <% for (Bill bill : bills) { %>
                    <tr>
                        <td><%= bill.getBillId() %></td>
                        <td><%= bill.getBookingId() %></td>
                        <td>$<%= bill.getAmount() %></td>
                        <td><%= bill.getStatus() %></td>
                        <td>
                            <a href="DeleteBillServlet?id=<%= bill.getBillId() %>" class="btn delete-btn">Delete</a>
                        </td>
                    </tr>
                <% } %>
            </table>
        <% } %>

        <p><a href="adminDashboard.jsp" class="btn">Back to Dashboard</a></p>
    </div>
</body>
</html>
