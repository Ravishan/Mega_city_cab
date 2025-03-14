package controller;

import dao.BookingDAO;
import model.Booking;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String pickup = request.getParameter("pickupLocation");
        String dropoff = request.getParameter("dropoffLocation");
        String vehicleType = request.getParameter("vehicleType");
        double price = Double.parseDouble(request.getParameter("price"));

        // ✅ Store Date as String (YYYY-MM-DD)
        String bookingDate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

        Booking booking = new Booking(0, user.getId(), pickup, dropoff, bookingDate, "Pending", vehicleType, price);
        BookingDAO bookingDAO = new BookingDAO();
        boolean bookingCreated = bookingDAO.createBooking(booking);

        if (bookingCreated) {
            response.sendRedirect("viewBookings.jsp?message=Booking successful!");
        } else {
            response.sendRedirect("booking.jsp?error=Failed to create booking.");
        }
    }
}
