<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Report</title>
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
	     background:#cde5e4;
	     
	}
	
	h2 {
	    color: #050505;
	    text-align: center;
	    font-size: 28px;
	}

    table {
        width: 80%;
        border-collapse: collapse;
        margin-bottom: 20px;
        margin-left: 180px;
        border-radius: 10px;
        background:#cde5e4;
       
        
    }
    tr
    {
    border-radius: 10px;
    }

th
{
		color:white;
 		padding: 12px;
        text-align: center;
        
}
  
    td {
        padding: 12px;
        text-align: center;
        color:#050505
        border-radius: 10px;
    }

    th {
        background-color: rgba(0, 0, 0, 0.5);
    }

    .form-container {
        margin-top: 20px;
        display: flex;
        flex-direction: column;
        gap: 10px;
        align-items: center;
    }

   
    .form-container select,
    .form-container input {
        width: 200px;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid rgba(255, 255, 255, 0.5);
        
       color: #050505;
        font-size: 16px;
        margin-bottom:30px;
    }
 .form-container label
 {
 color: white;
 font-size: 16px;
 padding:20px;
 
 }
    .form-container button {
        background-color: #28a745;
        color: white;
        padding: 10px;
        border: none;
        cursor: pointer;
        margin-top: 10px;
        width: 100%;
        font-size: 16px;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }

    .form-container button:hover {
        background-color: #218838;
    }

    .report-summary {
        background: rgba(255, 255, 255, 0.3); /* Frosted glass effect */
        backdrop-filter: blur(10px); /* Frosted glass effect */
        -webkit-backdrop-filter: blur(10px); /* Safari support */
        border-radius: 10px;
        padding: 15px;
        margin-top: 20px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    .report-summary p {
        color: white;
        font-size: 18px;
    }
    
    

.card {

    background:#cde5e4;
    border-radius: 20px;
    border: 1px solid rgba(255, 255, 255, 0.3);
    padding: 25px;
    width: 350px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    text-align: center;
    margin-top:50px;
    margin-left:550px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
    transform: scale(1.05);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
}

h2 {
    color: white;
    font-size: 22px;
    margin-bottom: 15px;
    text-transform: uppercase;
    font-weight: bold;
}

label {
    display: block;
    font-size: 14px;
    margin-top: 10px;
    color: #050505;
    padding:5px;
}

input {
    width: 85%;
    padding: 10px;
    margin-top: 8px;
    border: none;
    border-radius: 10px;
    outline: none;
    background: rgba(255, 255, 255, 0.3);
    color: #050505;
    font-size: 14px;
    text-align: center;
    display: block;
    margin: auto;
}

input::placeholder {
    color: rgba(255, 255, 255, 0.7);
    text-align: center;
}

button {
    margin-top: 15px;
    padding: 12px;
    width: 100%;
    border: none;
    border-radius: 12px;
    background: #ff6347;
    color: white;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: background 0.3s, transform 0.2s;
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

      
<h2 style="text-align:center;padding:10px;padding-top:20px;color:#050505">Sales Reports</h2>
   

<div class="card">
    <form action="Report.jsp" method="get">
        <label for="startDate">Start Date:</label>
        <input type="date" id="startDate" name="startDate" required>

        <label for="endDate">End Date:</label>
        <input type="date" id="endDate" name="endDate" required>

        <button type="submit">View Report</button>
    </form>
</div>


<h3 style="color:#050505;text-align:center;padding:20px;font-size:24px;font-family: 'League Spartan', sans-serif;">Sales Report:</h3>
<table>
    <tr>
        <th>Dates</th>
        <th>Total Sales (Rs)</th>
        <th>Total Orders</th>
    </tr>

    <%
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Nursery", "root", "Gobi@1234");

            String sql = "SELECT DATE(order_date) AS order_date, " +
                         "SUM(total_price) AS total_sales, COUNT(order_id) AS total_orders " +
                         "FROM orders WHERE order_date BETWEEN ? AND ? " +
                         "GROUP BY DATE(order_date) ORDER BY order_date ASC";

            ps = conn.prepareStatement(sql);
            ps.setString(1, startDate);
            ps.setString(2, endDate);
            rs = ps.executeQuery();

            boolean hasData = false;

            while (rs.next()) {
                hasData = true;
    %>
                <tr>
                    <td><%= rs.getDate("order_date") %></td>
                    <td>Rs <%= rs.getDouble("total_sales") %></td>
                    <td><%= rs.getInt("total_orders") %></td>
                </tr>
    <%
            }

            if (!hasData) {
    %>
                <tr>
                    <td colspan="3">No sales data found for the selected date range.</td>
                </tr>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    %>

</table>
</body>
</html>