package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.BillDAO;

@WebServlet("/MarkBillPaidServlet")
public class MarkBillPaidServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve Bill ID
            String billIdStr = request.getParameter("id");

            // Validate Bill ID
            if (billIdStr == null || billIdStr.isEmpty()) {
                response.sendRedirect("manageBills.jsp?error=Invalid+Bill+ID!");
                return;
            }

            int billId = Integer.parseInt(billIdStr);
            BillDAO billDAO = new BillDAO();

            // Mark bill as paid in the database
            boolean isUpdated = billDAO.markBillPaid(billId);

            // Redirect based on success or failure
            if (isUpdated) {
                response.sendRedirect("manageBills.jsp?message=Bill+marked+as+paid!");
            } else {
                response.sendRedirect("manageBills.jsp?error=Failed+to+mark+bill+as+paid!");
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
