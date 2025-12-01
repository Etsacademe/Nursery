package Pro;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/addPlantServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)

public class addPlantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = "plant_images";  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addPlantServlet() {
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
	       response.setContentType("text/html;charset=UTF-8");

	        String plantName = request.getParameter("plantName");
	        double plantPrice = Double.parseDouble(request.getParameter("plantPrice"));
	        String plantCategory = request.getParameter("plantCategory");
	        String fertilizerType = request.getParameter("fertilizerType");
	        String requirements = request.getParameter("requirements");
	        String careInstructions = request.getParameter("careInstructions");

	        // File upload logic
	        Part filePart = request.getPart("plantImage");
	        String fileName = extractFileName(filePart);
	        String savePath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
	        File fileSaveDir = new File(savePath);
	        if (!fileSaveDir.exists()) {
	            fileSaveDir.mkdir();
	        }
	        filePart.write(savePath + File.separator + fileName);

	        // Database connection
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        String url = "jdbc:mysql://localhost:3306/Nursery";
	        String user = "root";
	        String password = "Gobi@1234";

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            conn = DriverManager.getConnection(url, user, password);
	            String sql = "INSERT INTO plants(name, price, category, fertilizer, requirements, care_instructions, image) VALUES (?, ?, ?, ?, ?, ?, ?)";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, plantName);
	            pstmt.setDouble(2, plantPrice);
	            pstmt.setString(3, plantCategory);
	            pstmt.setString(4, fertilizerType);
	            pstmt.setString(5, requirements);
	            pstmt.setString(6, careInstructions);
	            pstmt.setString(7, UPLOAD_DIR + "/" + fileName);

	            int rows = pstmt.executeUpdate();
	            if (rows > 0) {
	                response.getWriter().println("<script>alert('Plant added successfully!'); window.location='Manageplants.jsp';</script>");
	            } else {
	                response.getWriter().println("<script>alert('Failed to add plant.'); window.location='Manageplants.jsp';</script>");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("<script>alert('Database error!'); window.location='addPlant.jsp';</script>");
	        } finally {
	            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
	            if (conn != null) try { conn.close(); } catch (SQLException e) {}
	        }
	    }

	    // Extracts file name
	    private String extractFileName(Part part) {
	        String contentDisp = part.getHeader("content-disposition");
	        for (String content : contentDisp.split(";")) {
	            if (content.trim().startsWith("filename")) {
	                return content.substring(content.indexOf("=") + 2, content.length() - 1);
	            }
	        }
	        return "default.jpg";
	    }
	}



