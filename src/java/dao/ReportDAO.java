package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.DBConnection;

public class ReportDAO {

    // Get total revenue
    public double getTotalRevenue() {
        double total = 0.0;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT SUM(amount) AS total FROM bills WHERE status = 'Paid'";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next() && rs.getObject("total") != null) {
                total = rs.getDouble("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    // Get monthly revenue as a list of String arrays
    public List<String[]> getMonthlyRevenue() {
        List<String[]> monthlyRevenue = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT MONTH(booking_date) AS month, SUM(amount) AS revenue FROM bills WHERE status = 'Paid' GROUP BY month ORDER BY month";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String[] data = new String[2];
                data[0] = String.valueOf(rs.getInt("month"));  // Convert month to string
                data[1] = String.valueOf(rs.getDouble("revenue"));  // Convert revenue to string
                monthlyRevenue.add(data);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return monthlyRevenue;
    }
}
