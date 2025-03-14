package dao;

import model.Booking;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {

    // ✅ Fetch all bookings (For Admin Panel)
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM bookings";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Booking booking = new Booking(
                    rs.getInt("booking_id"),
                    rs.getInt("customer_id"),
                    rs.getString("pickup_location"),
                    rs.getString("dropoff_location"),
                    rs.getString("booking_date"), // ✅ Ensure booking_date is correctly handled
                    rs.getString("status"),
                    rs.getString("vehicle_type"),
                    rs.getDouble("price")
                );
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    // ✅ Create a new booking (For Customers)
    public boolean createBooking(Booking booking) {
        boolean isCreated = false;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO bookings (customer_id, pickup_location, dropoff_location, booking_date, status, vehicle_type, price) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, booking.getCustomerId());
            ps.setString(2, booking.getPickupLocation());
            ps.setString(3, booking.getDropoffLocation());
            ps.setString(4, booking.getBookingDate()); // ✅ Store Date as String
            ps.setString(5, booking.getStatus());
            ps.setString(6, booking.getVehicleType());
            ps.setDouble(7, booking.getPrice());

            int rowsInserted = ps.executeUpdate();
            isCreated = rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isCreated;
    }

    // ✅ Delete Booking
    public boolean deleteBooking(int bookingId) {
        boolean isDeleted = false;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM bookings WHERE booking_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, bookingId);

            int rowsDeleted = ps.executeUpdate();
            isDeleted = rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isDeleted;
    }

    // ✅ Update Booking
    public boolean updateBooking(Booking booking) {
        boolean isUpdated = false;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE bookings SET pickup_location=?, dropoff_location=?, booking_date=?, status=?, vehicle_type=?, price=? WHERE booking_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, booking.getPickupLocation());
            ps.setString(2, booking.getDropoffLocation());
            ps.setString(3, booking.getBookingDate()); // ✅ Ensure Date is String
            ps.setString(4, booking.getStatus());
            ps.setString(5, booking.getVehicleType());
            ps.setDouble(6, booking.getPrice());
            ps.setInt(7, booking.getBookingId());

            int rowsUpdated = ps.executeUpdate();
            isUpdated = rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isUpdated;
    }
    
    public Booking getBookingById(int bookingId) {
    Booking booking = null;
    try (Connection conn = DBConnection.getConnection()) {
        String sql = "SELECT * FROM bookings WHERE booking_id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, bookingId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            booking = new Booking(
                rs.getInt("booking_id"),
                rs.getInt("customer_id"),
                rs.getString("pickup_location"),
                rs.getString("dropoff_location"),
                rs.getString("booking_date"),
                rs.getString("status"),
                rs.getString("vehicle_type"),
                rs.getDouble("price")
            );
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return booking;
}
    
        public List<Booking> getBookingsByCustomer(int customerId) {
        List<Booking> bookings = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM bookings WHERE customer_id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                bookings.add(new Booking(
                    rs.getInt("booking_id"),
                    rs.getInt("customer_id"),
                    rs.getString("pickup_location"),
                    rs.getString("dropoff_location"),
                    rs.getString("booking_date"), // Ensure stored as String
                    rs.getString("status"),
                    rs.getString("vehicle_type"),
                    rs.getDouble("price")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

}
