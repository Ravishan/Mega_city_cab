package controller;

import dao.BookingDAO;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/DeleteBookingServlet")
public class DeleteBookingServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            int bookingId = Integer.parseInt(request.getParameter("id"));
            BookingDAO bookingDAO = new BookingDAO();

            // Ensure the method name matches exactly
            boolean deleted = bookingDAO.deleteBooking(bookingId);

            if (deleted) {
                response.sendRedirect("viewBookings.jsp?message=Booking deleted successfully!");
            } else {
                response.sendRedirect("viewBookings.jsp?error=Failed to delete booking.");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("viewBookings.jsp?error=Invalid booking ID.");
        }
    }
}
