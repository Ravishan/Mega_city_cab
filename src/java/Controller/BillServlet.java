package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.BillDAO;
import model.Bill;

@WebServlet("/BillServlet")
public class BillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve input values
            String bookingIdStr = request.getParameter("bookingId");
            String amountStr = request.getParameter("amount");

            // Validate input
            if (bookingIdStr == null || amountStr == null || bookingIdStr.isEmpty() || amountStr.isEmpty()) {
                response.sendRedirect("manageBills.jsp?error=Invalid+input!");
                return;
            }

            int bookingId = Integer.parseInt(bookingIdStr);
            double amount = Double.parseDouble(amountStr);
            String status = "Pending"; // Default status

            // Create Bill object
            Bill bill = new Bill(0, bookingId, amount, status);
            BillDAO billDAO = new BillDAO();

            // Insert bill into database
            boolean isInserted = billDAO.addBill(bill);

            // Redirect based on success or failure
            if (isInserted) {
                response.sendRedirect("manageBills.jsp?message=Bill+added+successfully!");
            } else {
                response.sendRedirect("manageBills.jsp?error=Failed+to+add+bill!");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("manageBills.jsp?error=Invalid+number+format!");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manageBills.jsp?error=Unexpected+error!");
        }
    }
}
