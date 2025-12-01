package Pro;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/user")
public class user extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 	String DB_URL = "jdbc:mysql://localhost:3306/Nursery"; 
	    String DB_USER = "root"; 
	    String DB_PASSWORD = "Gobi@1234"; 
    public user() {
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
		   String fullname = request.getParameter("fullname");
	        String email = request.getParameter("email");
	        String password=request.getParameter("password");
	        String action = request.getParameter("action");

	        // Check if we are processing a login or registration
	        if ("login".equals(action)) {
	            // Handle login logic
	            handleLogin(request, response, email, password);
	        } else if ("register".equals(action)) {
	            // Handle registration logic
	            handleRegistration(request, response, email, password,fullname);
	        }
	    }

	    private void handleLogin(HttpServletRequest request, HttpServletResponse response, String email, String password) throws ServletException, IOException {
	        Connection conn = null;
	        PreparedStatement stmt = null;
	        ResultSet rs = null;

	        try {
	           
	            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

	            
	            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
	            stmt = conn.prepareStatement(sql);
	            stmt.setString(1, email);
	            stmt.setString(2, password);

	          
	            rs = stmt.executeQuery();

	            if (rs.next()) {
	                String fullname = rs.getString("fullname"); // Use 'fullname' instead of 'name'
	                HttpSession session = request.getSession();
	                session.setAttribute("fullname", fullname); 
	                System.out.println("Retrieved fullname: " + fullname); 
	                request.getRequestDispatcher("Userhome.jsp").forward(request, response); 
	            } else if ("Admin".equals(email) && "admin@123".equals(password)) {
	            	 request.getRequestDispatcher("Adminpage.jsp").forward(request, response);
	            } else {
	                // Invalid credentials
	                request.setAttribute("loginError", "Invalid credentials. Please try again.");
	                request.getRequestDispatcher("Home.jsp").forward(request, response);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	            request.setAttribute("loginError", "Database error. Please try again later.");
	            request.getRequestDispatcher("Home.jsp").forward(request, response);
	        } finally {
	            try {
	                if (rs != null) rs.close();
	                if (stmt != null) stmt.close();
	                if (conn != null) conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }

	    private void handleRegistration(HttpServletRequest request, HttpServletResponse response, String email, String password , String fullname) throws ServletException, IOException {
	        Connection conn = null;
	        PreparedStatement stmt = null;

	        try {
	            // Establishing connection to the database
	            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

	            // SQL query to check if username already exists
	            String checkSql = "SELECT * FROM users WHERE email = ?";
	            stmt = conn.prepareStatement(checkSql);
	            stmt.setString(1, email);

	            ResultSet rs = stmt.executeQuery();

	            if (rs.next()) {
	               
	            	response.setContentType("text/html");
	                PrintWriter out = response.getWriter();
	                out.println("<script>alert('Login failed. Please check your username and password.');</script>");
	                request.getRequestDispatcher("Home.jsp").forward(request, response);
	            } else {
	                // Insert new user into the database
	                String insertSql = "INSERT INTO users (fullname, email,password) VALUES (?, ?,?)";
	                stmt = conn.prepareStatement(insertSql);
	                stmt.setString(1, fullname);
	                stmt.setString(2, email);
	                stmt.setString(3,password);

	                int result = stmt.executeUpdate();

	                if (result > 0) {
	                    // Successful login, set the username in the session
	                	 HttpSession session = request.getSession();
	             	    session.setAttribute("fullname", fullname); 
	             	    System.out.println("Retrieved name: " + fullname); 
	                    response.sendRedirect("Userhome.jsp?registrationSuccess=true");
	                } else {
	                    // Registration failed, send error message
	                	response.setContentType("text/html");
	                    PrintWriter out = response.getWriter();
	                    out.println("<script>alert('Login failed. Please check your username and password.');</script>");
	                    
	                    request.getRequestDispatcher("Home.jsp").forward(request, response);
	                }
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            request.setAttribute("registerError", "Database error. Please try again later.");
	            request.getRequestDispatcher("Home.jsp").forward(request, response);
	        } finally {
	            try {
	                if (stmt != null) stmt.close();
	                if (conn != null) conn.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	

}
