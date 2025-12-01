<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>
<head>
    <title>Plant Store - Menu</title>
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
    background:  #f8f9fa;
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

/* General Styles */
.menu-section {
    text-align: center;
    padding: 50px 20px;
    background: #f8f9fa;
}

.menu-section h2 {
    font-size: 34px;
    color: #2d6a4f;
    margin-bottom: 20px;
    text-transform: uppercase;
    font-weight: bold;
}

.filter-container {
    display: flex;
    justify-content: center;
    gap: 20px;
    margin: 20px 0;
    flex-wrap: wrap;
  
    padding:20px;

}

.filter-container select, .filter-container input[type="text"] {
    padding: 10px;
    font-size: 1rem;
    border: 1px solid #ccc;
    border-radius: 5px;
    background: white;
    color: #333;
    width: 200px;
}

.filter-container button {
    padding: 10px 15px;
    font-size: 1rem;
    border: none;
    background: #007bff;
    color: white;
    border-radius: 5px;
    cursor: pointer;
}

.filter-container button:hover {
    background: #0056b3;
}

.category-section {
    text-align: center;
    width: 100%;
    margin-bottom: 40px;
    margin-top: 50px;
    		
}

.category-section h2 {
    display: inline-block;
    border-bottom: 3px solid green; /* Fixed syntax error */
    padding-bottom: 5px;
    margin-bottom: 20px;
    color: #050505;
    font-size: 24px;
}




/* Product Grid - Ensure 3 Cards per Row */
.product-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr); /* Fixed 3 columns */
    gap: 25px;
    justify-content: center;
    padding: 10px;
}

/* Product Card */
.product-card {
   	background: #c1dcdc;
    padding: 20px;
    border-radius: 12px;
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    width: 100%;
    max-width: 350px;
    height: 450px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    margin-left:50px;
}

.product-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
}

/* Product Image */
.product-card img {
 	width: 80%;
    height: 230px;
    border-radius: 10px;
}

/* Product Name */
.plant-name {
    font-size: 20px;
    font-weight: bold;
    color: #1b4332;
    margin: 15px 0 10px;
}

/* Price */
.product-card p {
    font-size: 18px;
    font-weight: bold;
    color: #444;
    margin-bottom: 10px;
}

/* Quantity Control */
.quantity-control {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 12px;
    margin: 15px 0;
}

.quantity-control button {
    background: white;
    color: black;
    border: none;
    padding: 8px 14px;
    font-size: 18px;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s;
}

.quantity-control button:hover {
    background: #40916c;
    color:white
}

.quantity-control span {
    font-size: 18px;
    font-weight: bold;
    color: #333;
}

/* Add to Cart Button */
.product-card form button {
    background: white;
    color: black;
    border: none;
    padding: 12px 15px;
    font-size: 18px;
    font-weight: bold;
    border-radius: 8px;
    cursor: pointer;
    transition: background 0.3s ease;
    width: 100%;
    margin-top: 12px;
}

.product-card form button:hover {
    background: #40916c;
    color:white
}

/* Responsive Design */
@media (max-width: 1024px) {
    .product-container {
        grid-template-columns: repeat(2, 1fr); /* 2 cards per row on medium screens */
    }
}

@media (max-width: 768px) {
    .product-container {
        grid-template-columns: repeat(1, 1fr); /* 1 card per row on small screens */
    }

    .menu-section h2 {
        font-size: 24px;
    }

    .category-section h2 {
        font-size: 22px;
    }

    .product-card img {
        height: 180px;
    }
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
    background:#046A38;  /* Classy muted green-gray */
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
   
<div class="filter-container">
    <input type="text" id="searchInput" placeholder="Search for products" oninput="filterProducts()">
    <select id="categoryFilter" onchange="filterProducts()">
        <option value="">All Categories</option>
        <option value="Flowers">Flowers</option>
        <option value="Fruits">Fruits</option>
        <option value="Cactus">Cactus</option>
        <option value="Medicinal">Medicinal</option>
        <option value="Indoor Plants">Indoor Plants</option>
    </select>
    <select id="priceFilter" onchange="filterProducts()">
        <option value="">All Prices</option>
        <option value="low">Below Rs 100</option>
        <option value="high">Above Rs 100</option>
    </select>
</div>

<div class="menu-section">
    <h2 style="margin-top:5px;font-size:35px; display: inline-block;
    border-bottom: 3px solid green; /* Fixed syntax error */
    padding-bottom: 5px;
    margin-bottom: 20px;
    color: #050505;
    font-size: 24px;">Available Plants</h2>
    <div class="menu">

        <%
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            int index = 0; // Initialize unique index

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
                    <div class="quantity-control">
                        <button type="button" onclick="decrementQuantity('<%= index %>', <%= price %>)">-</button>
                        <span id="<%= index %>Quantity">1</span>
                        <button type="button" onclick="incrementQuantity('<%= index %>', <%= price %>)">+</button>
                    </div>
                    
                   <form action="addtocart.jsp" method="post" onsubmit="updateHiddenInputs('<%= index %>')">
    <input type="hidden" name="plantName" value="<%= plant.get("name") %>">
    <input type="hidden" name="price" value="<%= price %>">
    <input type="hidden" name="image" value="<%= plant.get("image") %>">
    <input type="hidden" id="<%= index %>HiddenQuantity" name="quantity" value="1">
    <input type="hidden" id="<%= index %>HiddenTotalPrice" name="totalPrice" value="<%= price %>">
    <button type="submit">Add to Cart</button>
</form>

<script>
function updateHiddenInputs(index) {
    let quantityElement = document.getElementById(index + "Quantity");
    let quantityInput = document.getElementById(index + "HiddenQuantity");
    let totalPriceInput = document.getElementById(index + "HiddenTotalPrice");

    if (quantityElement && quantityInput && totalPriceInput) {
        let currentQuantity = parseInt(quantityElement.innerText) || 1;
        quantityInput.value = currentQuantity;
        totalPriceInput.value = (currentQuantity * parseFloat(quantityInput.dataset.price)).toFixed(2);
    }
}
</script>
    				
        
                </div>
                <%
                    index++; // Increment unique ID for each product
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
</div>
    <script>
    function addToCart(plantName, price, imageUrl) {
        let quantity = parseInt(document.getElementById("quantity-" + plantName).innerText);

        // Retrieve existing cart from localStorage or initialize an empty array
        let cart = JSON.parse(localStorage.getItem("cart")) || [];

        // Check if the item already exists in the cart
        let existingItem = cart.find(item => item.name === plantName);

        if (existingItem) {
            existingItem.quantity += quantity;
        } else {
            cart.push({ name: plantName, price: price, image: imageUrl, quantity: quantity });
        }

        // Save updated cart to localStorage
        localStorage.setItem("cart", JSON.stringify(cart));

        alert(plantName + " added to cart!");
    }

    function incrementQuantity(index, price) {
        let quantityElement = document.getElementById(index + "Quantity");
        let quantityInput = document.getElementById(index + "HiddenQuantity");
        let totalPriceInput = document.getElementById(index + "HiddenTotalPrice");

        if (quantityElement && quantityInput && totalPriceInput) {
            let currentQuantity = parseInt(quantityElement.innerText) || 1;
            let newQuantity = currentQuantity + 1;

            quantityElement.innerText = newQuantity;
            quantityInput.value = newQuantity;
            totalPriceInput.value = (newQuantity * parseFloat(price)).toFixed(2);
        }
    }

    function decrementQuantity(index, price) {
        let quantityElement = document.getElementById(index + "Quantity");
        let quantityInput = document.getElementById(index + "HiddenQuantity");
        let totalPriceInput = document.getElementById(index + "HiddenTotalPrice");

        if (quantityElement && quantityInput && totalPriceInput) {
            let currentQuantity = parseInt(quantityElement.innerText) || 1;
            if (currentQuantity > 1) {
                let newQuantity = currentQuantity - 1;

                quantityElement.innerText = newQuantity;
                quantityInput.value = newQuantity;
                totalPriceInput.value = (newQuantity * parseFloat(price)).toFixed(2);
            }
        }
    }

        function buyNow(name, price, id, image) { 
            let quantity = document.getElementById(id + "Quantity").innerText;

            // Store product details in session storage
            sessionStorage.setItem("orderProduct", JSON.stringify({
                name: name,
                price: price,
                quantity: quantity,
                image: image
            }));

            // Redirect to order.jsp
            window.location.href = "order.jsp";
        }
        
        function filterProducts() {
            var searchQuery = document.getElementById("searchInput").value.toLowerCase();
            var categoryFilter = document.getElementById("categoryFilter").value;
            var priceFilter = document.getElementById("priceFilter").value;

            // Get all product cards
            var products = document.querySelectorAll(".product-card");

            products.forEach(function(product) {
                var productName = product.querySelector("h3").textContent.toLowerCase();
                var productCategory = product.getAttribute("data-category");
                var productPrice = parseInt(product.getAttribute("data-price"));

                // Check if product matches search query
                var matchesSearch = productName.includes(searchQuery);

                // Check if product matches selected category
                var matchesCategory = categoryFilter === "" || productCategory === categoryFilter;

                // Check if product matches selected price range
                var matchesPrice = (priceFilter === "low" && productPrice < 100) || (priceFilter === "high" && productPrice >= 100) || priceFilter === "";

                // Show or hide product based on the filter criteria
                if (matchesSearch && matchesCategory && matchesPrice) {
                    product.style.display = "block"; // Show the product
                } else {
                    product.style.display = "none"; // Hide the product
                }
            });
        }


        
    </script>
</body>
</html>
