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

    <!-- Inline CSS for Styling -->
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #74ebd5, #acb6e5);
            text-align: center;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 70%;
            margin: 60px auto;
            padding: 30px;
            background: white;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            text-align: center;
        }

        h2 {
            color: #333;
            font-size: 26px;
            margin-bottom: 20px;
            font-weight: bold;
        }

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

        tr:hover {
            background-color: #f1f1f1;
        }

        .btn {
            display: inline-block;
            padding: 10px 15px;
            background: linear-gradient(135deg, #007bff, #0056b3);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: bold;
            margin-top: 10px;
            transition: all 0.3s ease-in-out;
        }

        .btn:hover {
            background: linear-gradient(135deg, #0056b3, #004095);
        }

        .delete-btn {
            background: linear-gradient(135deg, #ff4747, #c40000);
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
            <p>No bills available.</p>
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

