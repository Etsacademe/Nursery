package Pro;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/StoreOrderServlet")

public class StoreOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StoreOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String image = request.getParameter("image");
        String totalPrice = request.getParameter("totalPrice");
        String username = request.getParameter("Username");
        String status = request.getParameter("Status");

        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/Nursery";
        String dbUser = "root";
        String dbPassword = "Gobi@1234";

        String sql = "INSERT INTO orders (name, price, quantity, image, total_price, Username, Status) VALUES (?, ?, ?, ?, ?, ?, ?)";

        // Set response type
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter();
             Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
             PreparedStatement statement = conn.prepareStatement(sql)) {

            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Set values in PreparedStatement
            statement.setString(1, name);
            statement.setString(2, price);
            statement.setString(3, quantity);
            statement.setString(4, image);
            statement.setString(5, totalPrice);
            statement.setString(6, username);
            statement.setString(7, status);

            // Execute update
            int rowsInserted = statement.executeUpdate();

            if (rowsInserted > 0) {
                out.println("<script type='text/javascript'>");
                out.println("alert('Booked Successfully!');");
                out.println("window.location.href='cart.jsp';");
                out.println("</script>");
            } else {
                out.println("<script type='text/javascript'>");
                out.println("alert('Please enter valid data.');");
                out.println("window.location.href='order.jsp';");
                out.println("</script>");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();  // Log the error
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database driver not found.");
        } catch (SQLException e) {
            e.printStackTrace();  // Log the error
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error inserting data into the database.");
        }
    }
}
