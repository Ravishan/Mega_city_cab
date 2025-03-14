package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.BillDAO;

@WebServlet("/DeleteBillServlet")
public class DeleteBillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String billIdStr = request.getParameter("id");

            if (billIdStr == null || billIdStr.isEmpty()) {
                response.sendRedirect("manageBills.jsp?error=Invalid+Bill+ID!");
                return;
            }

            int billId = Integer.parseInt(billIdStr);
            BillDAO billDAO = new BillDAO();

            boolean isDeleted = billDAO.deleteBill(billId);

            if (isDeleted) {
                response.sendRedirect("manageBills.jsp?message=Bill+deleted+successfully!");
            } else {
                response.sendRedirect("manageBills.jsp?error=Failed+to+delete+bill!");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("manageBills.jsp?error=Invalid+number+format!");
        }
    }
}
