package controller;

import dao.BookingDAO;
import model.Booking;
import model.User;
import util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/EditBookingServlet")
public class EditBookingServlet extends HttpServlet {

    private BookingDAO bookingDAO;

    @Override
    public void init() {
        bookingDAO = new BookingDAO();
    }

    // ✅ Handle GET request (Load booking details)
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int bookingId = Integer.parseInt(request.getParameter("id"));
            Booking booking = bookingDAO.getBookingById(bookingId);

            if (booking != null) {
                request.setAttribute("booking", booking);
                request.getRequestDispatcher("editBooking.jsp").forward(request, response);
            } else {
                response.sendRedirect("viewBookings.jsp?error=Booking not found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("viewBookings.jsp?error=Invalid booking ID");
        }
    }

    // ✅ Handle POST request (Update booking)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            String pickupLocation = request.getParameter("pickupLocation");
            String dropoffLocation = request.getParameter("dropoffLocation");
            String bookingDate = request.getParameter("bookingDate"); // Ensure date is a string
            String status = request.getParameter("status");
            String vehicleType = request.getParameter("vehicleType");
            double price = Double.parseDouble(request.getParameter("price"));

            Booking booking = new Booking(bookingId, 0, pickupLocation, dropoffLocation, bookingDate, status, vehicleType, price);
            boolean updated = bookingDAO.updateBooking(booking);

            if (updated) {
                response.sendRedirect("viewBookings.jsp?message=Booking updated successfully!");
            } else {
                response.sendRedirect("editBooking.jsp?error=Failed to update booking");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("editBooking.jsp?error=Invalid input data");
        }
    }
}
