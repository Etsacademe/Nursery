<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
    
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plant Store</title>
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
    background:#617a51;  /* Classy muted green-gray */
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


.menu-section {
    margin-bottom: 40px;
}

.menu-section h2 {
    font-size: 1.8rem;
    margin-bottom: 20px;
    text-align: center;
    color: #050505;
    margin-top: 25px;
}

.menu {
    display: flex;
    gap: 20px;
    flex-wrap: wrap;
    justify-content: center;
}
.product-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* 3 columns */
    grid-template-rows: repeat(3, auto); /* 3 rows */
    gap: 30px;
    justify-content: center; /* Center the grid */
    padding: 20px;
    margin-left:50px;
}

.product-card {
    background: #c1dcdc;
    padding: 20px;
    border-radius: 12px;
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    width: 100%;
    max-width: 320px;
    height: 400px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.product-card:hover {
    transform: scale(1.05);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
}

.product-card img {
    width: 100%;
    height: 230px;
    border-radius: 10px;
    object-fit: cover; /* Ensures images fit well */
}

.product-card h3 {
    font-size: 1.3rem;
    margin: 15px 0;
    color: #050505;
}

.product-card p {
    font-size: 1.1rem;
    margin-bottom: 15px;
    color: #050505;
}

button {
    padding: 10px 15px;
    font-size: 1rem;
    border: none;
    background: #ff6347;
    color: white;
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
    background: #e5533e;
}

/* Responsive Design */
@media (max-width: 1024px) {
    .product-container {
        grid-template-columns: repeat(2, 1fr); /* 2 columns on tablets */
    }
}

@media (max-width: 768px) {
    .product-container {
        grid-template-columns: repeat(1, 1fr); /* 1 column on mobile */
    }
}

.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    width: 90%;
    max-width: 500px;
    background: #c1dcdc;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
    transition: 0.3s ease-in-out;
}

.modal-content {
    padding: 20px;
    border-radius: 12px;
    width: 100%;
    text-align: center;
}

.modal h2 {
    font-size: 24px;
    color: #2c3e50;
    margin-bottom: 10px;
}

.modal p {
    font-size: 16px;
    color: #555;
    margin: 10px 0;
    padding: 10px;
    background: #f7f7f7;
    border-radius: 8px;
}

.close-btn {
    position: absolute;
    top: 15px;
    right: 20px;
    font-size: 24px;
    cursor: pointer;
    color: #e74c3c;
    transition: 0.2s;
}

.close-btn:hover {
    color: #c0392b;
}

/* Backdrop Effect */
.modal::before {
    content: "";
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: #c1dcdc;
    z-index: -1;
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
        <img id="hero-slider" src="Images/Prd Image/zz_plantbg.png" alt="Plant">
    </div>
    </section>



<div class="menu-section">
    <%
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String url = "jdbc:mysql://localhost:3306/Nursery";
            String user = "root";
            String password = "Gobi@1234";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);

            String query = "SELECT * FROM plants";
            stmt = conn.prepareStatement(query);
            rs = stmt.executeQuery();

            // Grouping products by category
            Map<String, List<Map<String, String>>> categoryMap = new HashMap<>();

            while (rs.next()) {
                String category = rs.getString("category");
                Map<String, String> plantData = new HashMap<>();
                plantData.put("name", rs.getString("name"));
                plantData.put("price", String.valueOf(rs.getDouble("price")));
                plantData.put("image", rs.getString("image"));
                plantData.put("soilType", rs.getString("fertilizer") != null ? rs.getString("fertilizer") : "N/A");
                plantData.put("fertilizer", rs.getString("requirements") != null ? rs.getString("requirements") : "N/A");
                plantData.put("careInstructions", rs.getString("care_instructions") != null ? rs.getString("care_instructions") : "N/A");

                categoryMap.computeIfAbsent(category, k -> new ArrayList<>()).add(plantData);
            }

            // Display each category in a separate section
            for (Map.Entry<String, List<Map<String, String>>> entry : categoryMap.entrySet()) {
    %>
    <div class="category-section" id="<%= entry.getKey() %>">
        <h2><%= entry.getKey().substring(0, 1).toUpperCase() + entry.getKey().substring(1) %></h2>
        <div class="product-container">
            <% for (Map<String, String> plant : entry.getValue()) { 
                double price = Double.parseDouble(plant.get("price"));
            %>
            <div class="product-card" data-category="<%= entry.getKey() %>" data-price="<%= price %>">
                <img src="<%= plant.get("image") %>" alt="<%= plant.get("name") %>">
                <h3 class="plant-name"><%= plant.get("name") %></h3>
                <p style="color:#050505">Price: Rs <%= price %></p>
<button type="button" 
   onclick="viewDetails('<%= plant.get("name").replace("'", "\\'") %>', 
                     `<%= plant.get("soilType").replace("'", "\\'") %>`, 
                     `<%= plant.get("fertilizer").replace("'", "\\'") %>`, 
                     `<%= plant.get("careInstructions").replace("'", "\\'") %>`)">
    View Details
</button>


            </div>
            <%
                } // End product loop
            %>
        </div>
    </div>
    <%
            } // End category loop
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</div>


<!-- Modal for Viewing Plant Details -->
<div id="plantModal" class="modal">
    <div class="modal-content">
        <span class="close-btn" onclick="closeModal()">&times;</span>
        <h2 id="modalPlantName"></h2>
        <p><strong>Soil Type:</strong> <span id="modalSoilType"></span></p>
        <p><strong>Fertilizer:</strong> <span id="modalFertilizer"></span></p>
        <p><strong>Care Instructions:</strong> <span id="modalCareInstructions"></span></p>
    </div>
</div>




</body>
<script>
    function viewDetails(name, soilType, fertilizer, careInstructions) {
        document.getElementById("modalPlantName").innerText = name;
        document.getElementById("modalSoilType").innerText = soilType;
        document.getElementById("modalFertilizer").innerText = fertilizer;
        document.getElementById("modalCareInstructions").innerText = careInstructions;
        
        // Show modal
        document.getElementById("plantModal").style.display = "block";
    }

    function closeModal() {
        document.getElementById("plantModal").style.display = "none";
    }

    // Close modal when clicking outside the modal content
    window.onclick = function(event) {
        var modal = document.getElementById("plantModal");
        if (event.target === modal) {
            modal.style.display = "none";
        }
    };
</script>

</html>
    