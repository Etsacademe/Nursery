package Pro;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/deletePlantServlet")
public class deletePlantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deletePlantServlet() {
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

		String idParam = request.getParameter("plantId");

        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("Manageplants.jsp?message=Invalid ID");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Nursery", "root", "Gobi@1234");

            String sql = "DELETE FROM plants WHERE id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            int rowsDeleted = pstmt.executeUpdate();

            conn.close();

            if (rowsDeleted > 0) {
                response.sendRedirect("Manageplants.jsp?message=Plant deleted successfully");
            } else {
                response.sendRedirect("Manageplants.jsp?message=Plant not found");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("Manageplants.jsp?message=Invalid ID format");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Manageplants.jsp?message=Database Error");
        }
    }
		
	


}
