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

@WebServlet("/SubmitFeedbackServlet")
public class SubmitFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitFeedbackServlet() {
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
		String rating = request.getParameter("rating");
		String review = request.getParameter("review");
		String deliveryExperience = request.getParameter("delivery-experience");
		String uname=request.getParameter("username");


	    // Check if rating is null or empty
	    if (rating == null || rating.trim().isEmpty()) {
	        response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script type=\"text/javascript\">");
	        out.println("alert('Please select a rating before submitting feedback.');");
	        out.println("location='Feedback.jsp';");
	        out.println("</script>");
	        return; // Stop further execution if rating is missing
	    }

	    Connection conn = null;
	    PreparedStatement stmt = null;

	    try {
	        // Database connection setup
	        String dbURL = "jdbc:mysql://localhost:3306/Nursery";  // Database URL
	        String dbUser = "root";  // Database username
	        String dbPassword = "Gobi@1234";  // Database password

	        // Load JDBC driver
	        Class.forName("com.mysql.cj.jdbc.Driver");

	        // Connect to database
	        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

	        // SQL query to insert feedback into the database
	        String sql = "INSERT INTO feedback (rating, review, delivery_experience,Username) VALUES (?,?, ?, ?)";
	        stmt = conn.prepareStatement(sql);

	        // Set values in the prepared statement
	        stmt.setInt(1, Integer.parseInt(rating)); // Parse the rating only after validating it
	        stmt.setString(2, review);
	        stmt.setString(3, deliveryExperience);
	        stmt.setString(4, uname);

	        // Execute the insert query
	        int rowsInserted = stmt.executeUpdate();

	        // Check if data was inserted
	        if (rowsInserted > 0) {
	            response.setContentType("text/html;charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script type=\"text/javascript\">");
	            out.println("alert('Thank you for your feedback!');");
	            out.println("location='Feedback.jsp';");
	            out.println("</script>");
	        } else {
	            response.setContentType("text/html;charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script type=\"text/javascript\">");
	            out.println("alert('Error submitting feedback. Please try again.');");
	            out.println("location='Feedback.jsp';");
	            out.println("</script>");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.getWriter().println("Error: " + e.getMessage());
	    } finally {
	        try {
	            if (stmt != null) stmt.close();
	            
	        } catch (SQLException se) {
	            se.printStackTrace();
	        }
	    }

}
}
