<%@ page import="java.sql.*, java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    // Get the logged-in user's full name
    String fullname = (String) session.getAttribute("fullname");
    if (fullname == null) {
        response.sendRedirect("Home.jsp"); // Redirect to login if not logged in
        return;
    }
    
    // Database connection details
    String url = "jdbc:mysql://localhost:3306/nursery"; // Change this
    String user = "root"; // Change this
    String password = "Gobi@1234"; // Change this

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Order Details</title>
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
    background: #f8f9fa;
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

h1 {
    color: white;
    text-align: center;
    padding-bottom: 50px;
    padding-top: 30px;
}


.hero {
    display: flex;
    align-items: center;
    justify-content: space-around;
    padding: 60px;
    height: 580px;
    margin: 2px auto;
    width: 100%;
    position: relative;
    background:#ba94c5;  /* Classy muted green-gray */
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
    border-radius: 0px 0px 5px 5px;
    overflow: hidden;
    
}


/* Styling for hero content */
.hero-content {
    position: relative;
    z-index: 2;
    text-align: center;
     font-family: 'League Spartan', sans-serif;
    color: #2d2d2d;
    max-width: 700px;
}

.hero-content h1 {
    font-size: 48px;
    font-weight: bold;
    color: #285943;
}

.hero-content p {
    font-size: 18px;
    line-height: 1.6;
    color: #555;
}

/* Optional: Add a stylish call-to-action button */
.hero-content .btn {
    display: inline-block;
    padding: 12px 24px;
    background: white;
    color: white;
    text-decoration: none;
    font-size: 18px;
    font-weight: bold;
    border-radius: 8px;
    transition: 0.3s ease-in-out;
}

.hero-content .btn:hover {
    background: #1d412f;
}


.hero-text {
    max-width: 500px;
    text-align: left;
}

.badge {
    background: White;
    color:color;
    padding: 5px 10px;
    border-radius: 12px;
    font-size: 14px;
    font-weight:bold;
   
}

h1 {
    font-size: 42px;
    margin: 10px 0;
    color:#ffffff;
}

.highlight {
color: #FFFFF0 /* Gold */
    text-transform: uppercase;
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
    font-weight: bold;
}

.hero-text p {
    font-size: 18px;
    color:white;
}

.buttons {
    margin-top: 20px;
}

.btn {
    display: inline-block;
    padding: 10px 20px;
    border-radius: 25px;
    text-decoration: none;
    margin-right: 10px;
    font-size: 16px;
    border: 2px solid white;
    color: #FFD700 ;
    transition: 0.3s;
}

.green {
    background: White;
    color: #046A38;
    font-weight:bold;
}

.btn:hover {
    background: darkgreen;
    color: white;
}

.rating {
    margin-top: 20px;
}

.trust {
    font-weight: bold;
    color: White;
}

.score {
    font-size: 18px;
    color: #FFD700;
    font-weight:bold;
}

/* Hero Image */
.hero-image img {
    width: 350px;
}
.order-container {
    width: 50%; /* Adjust width as per requirement */
    margin: 20px auto; /* Center the container */
    padding: 20px;
    border: 2px solid #ccc;
    border-radius: 10px;
    background-color: #ffffff;
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
}

.order-details p {
    display: flex;
    justify-content: space-between;
    font-size: 16px;
    margin: 10px 0;
    padding: 5px 0;
   
}

.order-details strong {
    width: 40%; /* Label width */
    text-align: left; /* Correct alignment */
    font-weight: bold;
    color: #444;
}


.order-details span {
    width: 55%; /* Value width */
    text-align: left;
    font-weight: normal;
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
            <% 
                    // Check if the user is logged in by checking the session for "username"
                    String username = (String) session.getAttribute("fullname");
                    if (username != null) {
                    %>
                        <li><a>Welcome, <strong><%= username %></strong></a></li>
                    <% 
                    } else {
                    %>
                        <li><a href="Home.jsp"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                    <% 
                    }
                    %>          
             <li><a href="Plantgallery.jsp">Browse Plants</a></li>
             <li><a href="Fertilizers.jsp">Plant Details</a></li>
             <li><a href="addtocart.jsp">Add to cart</a></li>
             <li><a href="Contactus.jsp">Contact Us</a></li>
              <li><a href="About us.jsp">About Us</a></li>
             <li><a href="Home.jsp">Logout</a></li>
            </ul>
             <div class="cart-icon" onclick="window.location.href='userorder.jsp'">
                <a href="cart.jsp"><i class="fa fa-shopping-cart" style="font-size:28px;color:#050505; margin-right:50px"></i>
            
            </a></div>
        </nav>
    </header>
     <section class="hero" id="hero-section">
    <div class="hero-text">
        <span class="badge">Oxygen Plant</span><br></br>
        <h1><span class="highlight">Plants</span> make life better</h1>
        <p>Plants reduce stress and improve your mood, so they are ideal for use at home and in the workplace.</p>
        <div class="buttons">
            <a href="#" class="btn green">Book Now</a>
            <a href="#" class="btn">Care Tips 🌱</a>
        </div>
        <div class="rating">
            <span class="trust">⭐ Trustpilot</span>
            <span class="score">4.9 ★</span>
        </div>
    </div>

    <div class="hero-image">
        <img id="hero-slider" src="Images/Prd Image/Lavander.png" alt="Plant">
    </div>
    </section>
        <br></br>
    <h2 align="center" style=" color:#050505; padding:50px">Your Orders</h2>

    <%
        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to database
            conn = DriverManager.getConnection(url, user, password);
            boolean hasOrders = false;
            
            // Query to get orders for the logged-in user
          String sql = "SELECT summary, total_price, status,order_date,address,email,payment_method,card_or_upi FROM orders WHERE username=?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, fullname);
rs = pstmt.executeQuery();

while (rs.next()) {
    hasOrders = true;
    String summary = rs.getString("summary");
    double totalPrice = rs.getDouble("total_price");
    String orderStatus = rs.getString("status");
    String Date = rs.getString("order_date");
    String Address = rs.getString("address");
    String EmailID = rs.getString("email");
    String payment_Method = rs.getString("payment_method");
    String card_or_upi = rs.getString("card_or_upi");
%>
    <div class="order-container">
    <div class="order-details">
        <p><strong>Products:</strong> <span><%= summary %></span></p>
        <p><strong>Total Price:</strong> <span>Rs <%= totalPrice %> /-</span></p>
        <p><strong>Order Date:</strong> <span><%= Date %></span></p>
        <p><strong>Address:</strong> <span><%= Address %></span></p>
        <p><strong>Email ID:</strong> <span><%= EmailID %></span></p>
        <p><strong>Payment Method:</strong> <span><%= payment_Method %></span></p>
        <p><strong>Card OR UPI ID Details:</strong> <span><%= card_or_upi %></span></p>
        <p><strong>Order Status:</strong> <span><%= orderStatus %></span></p>
    </div>
</div>

}

    <%
            }

            if (!hasOrders) {
    %>
                <p class="no-orders" style="color:black;text-align:center;font-size:24px">😔 No orders found. Please purchase something from our nursery. 🛒🌱</p>

  
    <%
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (conn != null) try { conn.close(); } catch (SQLException e) {}
        }
    %>
</div>
</body>
</html>


