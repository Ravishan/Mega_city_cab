package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Bill;
import util.DBConnection;

public class BillDAO {

    // Retrieve all bills
    public List<Bill> getAllBills() {
        List<Bill> bills = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM bills";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                bills.add(new Bill(
                    rs.getInt("bill_id"),
                    rs.getInt("booking_id"),
                    rs.getDouble("amount"),
                    rs.getString("status")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bills;
    }

    // Add a new bill
    public boolean addBill(Bill bill) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO bills (booking_id, amount, status) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, bill.getBookingId());
            ps.setDouble(2, bill.getAmount());
            ps.setString(3, bill.getStatus());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Mark bill as paid
    public boolean markBillPaid(int billId) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE bills SET status = 'Paid' WHERE bill_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, billId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete a bill
    public boolean deleteBill(int billId) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM bills WHERE bill_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, billId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
