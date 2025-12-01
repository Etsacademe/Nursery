	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	    <%@ page import="java.sql.*" %>
	<%@ page import="java.util.*" %>
	<!DOCTYPE html>
	<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Admin Login - Plants Nursery</title>
	       <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&family=Lora&display=swap" rel="stylesheet">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	    <link href="https://fonts.googleapis.com/css2?family=League+Spartan:wght@500;700&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
	    <style>
         * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'League Spartan', sans-serif;
}

body {
    background: #f3f6f4;
    color: #333;
}

/* Header */
header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 50px;
    background: #f3f3f3;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.logo {
    font-size: 24px;
    font-weight: bold;
   	color	:#046A38; 
    display: flex;
    align-items: center;
}

.logo img {
    width: 24px;
    margin-right: 10px;
}

nav {
    display: flex;
    justify-content: flex-end; /* Moves navigation to the right */
    align-items: right;
    padding: 10px 20px;
}

nav ul {
    list-style: none;
    display: flex;
    margin: 0;
    padding: 10px;
   
}

nav ul li {
    margin: 0 15px;
    	 
}

nav ul li a {
    text-decoration: none;
    color: black;
    font-size: 16px;
    transition: 0.3s;
    text-align: right; 
   	font-weight:bolder;
    display: inline-block; /* Ensure it's properly aligned */
}

nav ul li a:hover {
    color: white;
    padding:15px;
    background:#046A38;
    border-radius:15px;
    border-bottom: 2px solid green;
}
.active
{
	color: white;
    padding:15px;
    background:#046A38;
    border-radius:15px;
    border-bottom: 2px solid green;
}


	/* Main Content */
	.container {
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    width: 90%;
	    max-width: 1200px;
	    margin-top: 100px; /* To prevent overlap with the navbar */
	    text-align: center;
	}
	
	h2 {
	    color: #050505;
	    text-align: center;
	    font-size: 28px;
	}
	    
	    .formcontainer {
	    width: 60%;
	    margin: auto;
	    background:#046A38;
	   
	    padding: 20px;
	    border-radius: 10px;
	    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2); /* Subtle shadow for depth */
	    margin-top: 120px;
	}
	
	label {
	    font-weight: bold;
	    display: block;
	    margin-top: 10px;
	    color:White; /* White label text for better contrast */
	    
	}
	
	input, textarea {
	    width: 95%;
	    padding: 8px;
	    margin-top: 5px;
	    border-radius: 5px;
	    border: 1px solid rgba(255, 255, 255, 0.5); /* Transparent border */
	    background: rgba(255, 255, 255, 0.1); /* Transparent background */
	    color: white; /* White text inside input fields */
	    font-size: 16px;
	}
	select
	{
		width: 97%;
	    padding: 8px;
	    margin-top: 5px;
	    border-radius: 5px;
	    border: 1px solid rgba(255, 255, 255, 0.5); /* Transparent border */
	    background: rgba(0, 0, 0, 0.5); /* Transparent background */
	    color: white; /* White text inside input fields */
	    font-size: 16px;
	}
	button {
	    background-color: #28a745;
	    color: white;
	    padding: 10px;
	    border: none;
	    cursor: pointer;
	    margin-top: 15px;
	    width: 100%;
	    font-size: 16px;
	    border-radius: 5px;
	    transition: background-color 0.3s ease;
	}
	
	button:hover {
	    background-color: #218838; /* Darker green on hover */
	}
	
	
	h2 {
	    text-align: center;
	    margin-bottom: 30px;
	    color: #333;
	}
	
	
	
	.plant-card {
	    display: inline-block;
	    width: 350px;
	    margin: 15px;
	    background: #c1dcdc; /* Matching selling_item background */
   	
	    padding: 20px;
	    border-radius: 10px;
	    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
	    text-align: center;
	    transition: transform 0.3s ease;
	}
	
	.plant-card img {
	    width: 100%;
	    height: 150px;
	    object-fit: cover;
	    border-radius: 10px;
	}
	
	.plant-card h3 {
	    margin-top: 10px;
	    font-size: 18px;
	    color: #333;
	}
	
	.plant-card p {
	    font-size: 14px;
	    color: #555;
	}
	
	.plant-card:hover {
	    transform: translateY(-10px); /* Slight hover effect */
	}
	
	
	
	</style>
	</head>
	<body>
   <header>
        <div class="logo">
           PLANTS NURSERY 
        </div>
        <nav>
            <ul>            
             <li><a href="Adminpage.jsp">Dashboard</a></li>              
             <li><a href="Manageplants.jsp">Manage Plants</a></li>
            <li><a href="manageorder.jsp">Manage Orders </a></li>
            <li><a href="Report.jsp">Reports </a></li>
             <li><a href="Home.jsp">Logout</a></li>
             </ul>
        </nav>
    </header>
     
	    <div class="formcontainer">
	        <h2 style="color:white">🌱 Add New Plant</h2>
	        <form action="addPlantServlet" method="post" enctype="multipart/form-data">
	            <label>Plant Image:</label>
	            <input type="file" name="plantImage" required>
	
	            <label>Plant Name:</label>
	            <input type="text" name="plantName" required>
	
	            <label>Price (Rs):</label>
	            <input type="number" step="0.01" name="plantPrice" required>
	
	            <label>Category:</label>
	            <select name="plantCategory" required>
	                <option value="Flowers">Flowers</option>
	                <option value="Fruits">Fruits</option>
	                <option value="Cactus">Cactus</option>
	                <option value="Medicinal">Medicinal</option>
	                <option value="Indoor Plants">Indoor Plants</option>
	            </select>
	
	            <label>Soil Type:</label>
	            <textarea type="text" name="fertilizerType"  rows="3" required></textarea>
	
	            <label>Fertilizer:</label>
	            <textarea name="requirements" rows="3" required></textarea>
	
	            <label>Care Instructions:</label>
	            <textarea name="careInstructions" rows="4" required></textarea>
	
	            <button type="submit">Add Plant 🌿</button>
	        </form>
	    </div>
	
	<br>
	<br>
	<br>
	<br>
	<br>
	 <h2 style="text-align:center; color:#050505;">View Added Plants</h2>
	
	    <% 
	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;
	
	        try {
	            // Load MySQL driver and establish connection
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Nursery", "root", "Gobi@1234");
	            
	            // Query to get all plants
	            String sql = "SELECT * FROM plants";
	            pstmt = conn.prepareStatement(sql);
	            rs = pstmt.executeQuery();
	
	            // Display plants
	            while (rs.next()) {
	    %>
	
	    <div class="plant-card">
	    <img src="<%= rs.getString("image") %>" alt="<%= rs.getString("name") %>">
	    <h3><%= rs.getString("name") %></h3>
	    <p><strong>Price:</strong> Rs <%= rs.getDouble("price") %> /-</p>
	    <p><strong>Category:</strong> <%= rs.getString("category") %></p>
	    <p><strong>Soil Type:</strong> <%= rs.getString("fertilizer") %></p>
	    <p><strong>Fertilizer:</strong> <%= rs.getString("requirements") %></p>
	    <p><strong>Care Instructions:</strong> <%= rs.getString("care_instructions") %></p>
	
	   <form action="deletePlantServlet" method="post" style="display:inline;">
    <input type="hidden" name="plantId" value="<%= rs.getInt("id") %>">
    <button type="submit" onclick="return confirm('Are you sure you want to delete this plant?');" 
    style="background-color: #dc3545; color: white; padding: 5px; border: none; cursor: pointer;">
        Delete
    </button>
</form>

	</div>

	
	    <% 
	            }
	        } catch (Exception e) {
	            out.println("<p>Error: " + e.getMessage() + "</p>");
	        } finally {
	            // Close connections
	            try { if (rs != null) rs.close(); } catch (SQLException e) {}
	            try { if (pstmt != null) pstmt.close(); } catch (SQLException e) {}
	            try { if (conn != null) conn.close(); } catch (SQLException e) {}
	        }
	    %>
	
	</body>
	</html>
