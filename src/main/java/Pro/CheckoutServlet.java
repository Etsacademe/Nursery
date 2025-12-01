package Pro;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;


@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CheckoutServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        // Get user details from session
        String username = (String) session.getAttribute("fullname");
        List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");

        // Get form parameters
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String usname=request.getParameter("username");
        String paymentMethod = request.getParameter("paymentMethod");
        String cardNumber = request.getParameter("cardNumber");
        String upiId = request.getParameter("upiId");

        // Validate required fields
        if (username == null || cart == null || cart.isEmpty() || address == null || email == null || paymentMethod == null) {
            response.sendRedirect("cart.jsp");
            return;
        }

        // Build cart summary
        StringBuilder summary = new StringBuilder();
        double totalPrice = 0.0;

        for (Map<String, String> item : cart) {
        	summary.append("Product: ").append(item.get("name")).append("\n")
            .append("Quantity: ").append(item.get("quantity")).append("\n")
            .append("Price: ").append(item.get("price")).append("\n")
            .append("Image: ").append(item.get("image")).append("\n");
        

            // Calculate total price
            double price = Double.parseDouble(item.get("price"));
            int quantity = Integer.parseInt(item.get("quantity"));
            totalPrice += (price * quantity);
        }

        // Remove last " | " from summary
        if (summary.length() > 3) {
            summary.setLength(summary.length() - 3);
        }

        // Mask Card Number or Store UPI ID
        String maskedPaymentInfo = (cardNumber != null && !cardNumber.trim().isEmpty())
                ? "XXXX-XXXX-XXXX-" + cardNumber.substring(cardNumber.length() - 4)
                : (upiId != null && !upiId.trim().isEmpty())
                    ? upiId
                    : "N/A";

        // Insert order into database
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Nursery", "root", "Gobi@1234");
             PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO orders (summary, total_price, status, address, email,Username, payment_method, card_or_upi) VALUES (?, ?, ?, ?,?, ?, ?, ?)")) {

            // Load MySQL driver (optional if already configured in project)
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn.setAutoCommit(false); // Start transaction

            // Set values in prepared statement
            stmt.setString(1, summary.toString()); // Order summary
            stmt.setDouble(2, totalPrice); // Total price
            stmt.setString(3, "Pending"); // Order status
            stmt.setString(4, address); // Address
            stmt.setString(5, email); // Email
            stmt.setString(6, usname);
            stmt.setString(7, paymentMethod); // Payment method
            stmt.setString(8, maskedPaymentInfo); // Masked card or UPI ID

            stmt.executeUpdate(); // Execute SQL query
            conn.commit(); // Commit transaction

            // Clear cart after successful checkout
            session.removeAttribute("cart");

            response.sendRedirect("cart.jsp"); // Redirect to confirmation page

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirect to error page
        }
    }
}
