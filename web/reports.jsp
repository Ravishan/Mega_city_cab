<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.ReportDAO, java.util.List" %>

<%
    ReportDAO reportDAO = new ReportDAO();
    double totalRevenue = reportDAO.getTotalRevenue();
    List<String[]> monthlyRevenue = reportDAO.getMonthlyRevenue();

    // Convert Monthly Revenue Data to JSON String Manually
    StringBuilder revenueJson = new StringBuilder("[");
    for (int i = 0; i < monthlyRevenue.size(); i++) {
        String[] data = monthlyRevenue.get(i);
        revenueJson.append("{\"month\": \"").append(data[0])
                   .append("\", \"revenue\": ").append(data[1]).append("}");
        if (i < monthlyRevenue.size() - 1) {
            revenueJson.append(",");
        }
    }
    revenueJson.append("]");
%>

<html>
<head>
    <title>Reports | MegaCityCab</title>
    <script src="https://www.gstatic.com/charts/loader.js"></script>
    <style>
        /* Dark Mode Styling */
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

        h3 {
            color: #f1c40f;
            font-size: 22px;
            font-weight: bold;
        }

        .chart-container {
            background: #222;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.1);
            margin-top: 20px;
        }

        #monthlyRevenueChart {
            width: 100%;
            height: 400px;
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
            margin-top: 20px;
            transition: all 0.3s ease-in-out;
        }

        .btn:hover {
            background: linear-gradient(135deg, #d4ac0d, #a67c00);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Financial Reports</h2>

        <!-- Total Revenue Display -->
        <h3>Total Revenue: $<%= totalRevenue %></h3>

        <!-- Monthly Revenue Chart -->
        <div class="chart-container">
            <h3>Monthly Revenue</h3>
            <div id="monthlyRevenueChart"></div>
        </div>

        <!-- Google Charts Integration -->
        <script>
            var revenueData = <%= revenueJson.toString() %>;

            google.charts.load('current', { packages: ['corechart'] });
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Month');
                data.addColumn('number', 'Revenue');

                revenueData.forEach(function(item) {
                    var obj = JSON.parse(item);
                    data.addRow([obj.month, parseFloat(obj.revenue)]);
                });

                var options = {
                    title: 'Monthly Revenue',
                    curveType: 'function',
                    legend: { position: 'bottom' },
                    backgroundColor: '#1e1e1e',
                    titleTextStyle: { color: '#f1c40f' },
                    hAxis: { textStyle: { color: '#ffffff' } },
                    vAxis: { textStyle: { color: '#ffffff' } }
                };

                var chart = new google.visualization.LineChart(document.getElementById('monthlyRevenueChart'));
                chart.draw(data, options);
            }
        </script>

        <p><a href="adminDashboard.jsp" class="btn">Back to Dashboard</a></p>
    </div>
</body>
</html>
