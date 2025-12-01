<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.*" %>

<%
    // Ensure user is logged in
    String username = (String) session.getAttribute("fullname");
    if (username == null) {
        response.sendRedirect("Home.jsp");
        return;
    }

    // Retrieve cart from session
    List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<>();
        session.setAttribute("cart", cart);
    }

    // Retrieve selected plant details
    String plantName = request.getParameter("plantName");
    String price = request.getParameter("price");
    String image = request.getParameter("image");
    String quantity = request.getParameter("quantity");

    if (plantName != null && price != null && image != null && quantity != null &&
        !plantName.isEmpty() && !price.isEmpty() && !image.isEmpty() && !quantity.isEmpty()) {

   /*     try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Nursery", "root", "Gobi@1234")) {
                String sql = "INSERT INTO cart (username, plant_name, price, quantity, total_price, image, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setString(1, username);
                    ps.setString(2, plantName);
                    ps.setDouble(3, Double.parseDouble(price));
                    ps.setInt(4, Integer.parseInt(quantity));
                    ps.setDouble(5, Integer.parseInt(quantity) * Double.parseDouble(price));
                    ps.setString(6, image);
                    ps.setString(7, "Pending");
                    ps.executeUpdate();
                    response.sendRedirect("addtocart.jsp");
                }
            } */

            // **Update Session Cart**
            Map<String, String> item = new HashMap<>();
            item.put("name", plantName);
            item.put("price", price);
            item.put("quantity", quantity);
            item.put("image", image);
            cart.add(item);
            session.setAttribute("cart", cart); // Update session with new cart
            
            response.sendRedirect("addtocart.jsp"); // Refresh to show added item

          
    }

    // Remove item from cart
    String removePlant = request.getParameter("removePlant");
    if (removePlant != null && !removePlant.isEmpty()) {
        Iterator<Map<String, String>> iterator = cart.iterator();
        while (iterator.hasNext()) {
            Map<String, String> item = iterator.next();
            if (item.get("name").equals(removePlant)) {
                iterator.remove();
                break;
            }
        }
    }

   
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link href="https://fonts.googleapis.com/css2?family=League+Spartan:wght@500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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





/* Container Styling */
.cart-container {
    width: 90%;
    max-width: 800px;
    background: #f8f9fa;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    margin: 40px auto;
    text-align: center;
}

/* Cart Item Styling */
.cart-item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    background: #ffffff;
    padding: 15px;
    border-radius: 10px;
    margin-bottom: 15px;
    transition: transform 0.3s;
    box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.1);
}

.cart-item:hover {
    transform: scale(1.03);
}

.cart-item img {
    width: 70px;
    height: 70px;
    border-radius: 5px;
    border: 1px solid #ddd;
    object-fit: cover;
}

.cart-item p {
    flex-grow: 1;
    text-align: left;
    margin: 0 10px;
    font-size: 16px;
    font-weight: 500;
}

/* Buttons */
.remove-btn, .buy-now {
    padding: 10px 15px;
    border-radius: 8px;
    font-size: 14px;
    cursor: pointer;
    transition: 0.3s;
    border: none;
}

.remove-btn {
    background: #dc3545;
    color: white;
}

.remove-btn:hover {
    background: #a71d2a;
}

.buy-now {
    background: #28a745;
    color: white;
    font-size: 16px;
}

.buy-now:hover {
    background: #218838;
}

/* Payment Section */
label {
    font-weight: 600;
    display: block;
    margin: 10px 0 5px;
    text-align:left;
}

input[type="text"], input[type="email"], input[type="month"] {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 14px;
}

.payment-container {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 10px;
}

/* Payment options in a single row */
.payment-options {
    display: flex;
    align-items: center;
    flex-wrap: nowrap; /* Ensures all options remain in one row */
    gap: 20px;
    white-space: nowrap; /* Prevents text from wrapping */
    overflow-x: auto; /* Enables horizontal scrolling if needed */
    padding: 10px 0;
}

/* Payment option labels */
.payment-options label {
    display: flex;
    align-items: center;
    cursor: pointer;
    padding: 8px 12px;
    background: #f8f9fa;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 500;
    white-space: nowrap;
    transition: background 0.3s ease-in-out;
}

/* Hide default radio buttons */
.payment-options input[type="radio"] {
    display: none;
}

/* Circle indicator before labels */
.payment-options label::before {
    content: "○";
    font-size: 18px;
    margin-right: 8px;
    color: #333;
    transition: color 0.3s ease-in-out;
}

/* Highlight selected option */
.payment-options input[type="radio"]:checked + label {
    background: #007bff;
    color: white;
    border: 1px solid #007bff;
}

.payment-options input[type="radio"]:checked + label::before {
    content: "●";
    color: white;
}

/* Card & UPI Details Box */
#cardDetails, #upiDetails {
    display: none;
    background: #e9ecef;
    padding: 15px;
    border-radius: 8px;
    margin-top: 10px;
    width: 100%;
}

/* Form fields inside payment details */
#cardDetails input, #upiDetails input {
    width: 100%;
    padding: 8px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

/* UPI Providers in a row */
.upi-providers {
    display: flex;
    align-items: center;
    flex-wrap: nowrap;
    gap: 15px;
    white-space: nowrap;
    overflow-x: auto;
}


.cont-container {
    display: flex;
    justify-content: center; /* Centers content horizontally */
    align-items: center; /* Centers content vertically if needed */
    margin-top: 20px;
}

.cont {
    color: white;
    text-decoration: none;
    font-size: 16px;
    display: inline-block; /* Ensures it behaves as a button */
    padding: 10px 20px;
    background: #50C878;
    border-radius: 5px;
    transition: background 0.3s;
    text-align: center;
    margin-top: 20px;
}

.cont:hover {
    background: #45B768; /* Slightly darker green for hover */
}


/* Responsive */
@media (max-width: 480px) {
    .cart-item {
        flex-direction: column;
        align-items: flex-start;
        gap: 10px;
    }

    .cart-actions {
        width: 100%;
        justify-content: space-between;
    }

    .buy-now {
        width: 100%;
        text-align: center;
    }
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
                    String us = (String) session.getAttribute("fullname");
                    if (us != null) {
                    %>
                        <li><a>Welcome, <strong><%= us %></strong></a></li>
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
        <img id="hero-slider" src="Images/Prd Image/Peace_Lilybg.png" alt="Plant">
    </div>
    </section>
        <br></br>

<h2 style="padding: 20px; text-align:center;" >Your Cart</h2>

    <div class="cart-container">
        <% if (cart.isEmpty()) { %>
            <p>Your cart is empty.</p>
        <% } else { 
            double grandTotal = 0;
        %>
            <ul>
                <% for (Map<String, String> item : cart) { 
                    int qty = Integer.parseInt(item.get("quantity"));
                    double prices = Double.parseDouble(item.get("price"));
                    double totalPrice = qty * prices;
                    grandTotal += totalPrice;
                %>
                    <li class="cart-item">
                        <img src="<%= item.get("image") %>" alt="<%= item.get("name") %>">
                        <p><strong><%= item.get("name") %></strong></p>
                        <p><strong><%= item.get("quantity") %></strong></p>
                        <p>Rs <%= String.format("%.2f", totalPrice) %></p>
                        <form action="addtocart.jsp" method="post">
                            <input type="hidden" name="removePlant" value="<%= item.get("name") %>">
                            <button type="submit" class="remove-btn">Remove</button>
                        </form>
                    </li>
                <% } %>
            </ul>

            <h3  style="padding:20px;text-align:right;color:green;font-weight:bold;font-size:24px">Total: Rs <%= String.format("%.2f", grandTotal) %></h3>
            <form action="CheckoutServlet" method="post">
            <label for="address">Address:</label>
    		<input type="text" id="address" name="address" required>

    			<label for="email">Email:</label>
    			<input type="email" id="email" name="email" required>
    			<label for="email">Username:</label>
    			<input type="text" id="usname" name="username" value="<%= us %>" required>

   <div class="payment-container">
    <label>Payment Method:</label>

    <div class="payment-options">
        <input type="radio" id="creditCard" name="paymentMethod" value="Credit Card" onclick="togglePaymentFields()">
        <label for="creditCard">Credit Card</label>

        <input type="radio" id="debitCard" name="paymentMethod" value="Debit Card" onclick="togglePaymentFields()">
        <label for="debitCard">Debit Card</label>

        <input type="radio" id="upi" name="paymentMethod" value="UPI" onclick="togglePaymentFields()">
        <label for="upi">UPI</label>

        <input type="radio" id="COD" name="paymentMethod" value="Cash on Delivery" onclick="togglePaymentFields()">
        <label for="COD">Cash on Delivery</label>
    </div>

    <!-- Card Details -->
    <div id="cardDetails">
        <label for="cardNumber">Card Number:</label>
        <input type="text" id="cardNumber" name="cardNumber" pattern="\d{16}" placeholder="Enter 16-digit card number">

        <label for="cvv">CVV:</label>
        <input type="text" id="cvv" name="cvv" pattern="\d{3}" placeholder="Enter 3-digit CVV">

        <label for="expDate">Expiration Date:</label>
        <input type="month" id="expDate" name="expDate">
    </div>

    <!-- UPI Payment Section -->
    <div id="upiDetails">
        <label>Select UPI Provider:</label>

        <div class="upi-providers">
            <input type="radio" id="gpay" name="upiProvider" value="Google Pay" onclick="toggleUpiId()">
            <label for="gpay">Google Pay</label>

            <input type="radio" id="phonepe" name="upiProvider" value="PhonePe" onclick="toggleUpiId()">
            <label for="phonepe">PhonePe</label>

            <input type="radio" id="amazonpay" name="upiProvider" value="Amazon Pay" onclick="toggleUpiId()">
            <label for="amazonpay">Amazon Pay</label>

            <input type="radio" id="paytm" name="upiProvider" value="Paytm" onclick="toggleUpiId()">
            <label for="paytm">Paytm</label>
        </div>

        <!-- UPI ID Field -->
        <div id="upiIdSection" style="display: none;">
        <br></br>
       <img src="Images/Qr.jpeg" alt="Qrcode" width="50%" height="50%">
            <label for="upiId">UPI ID:</label>
            <input type="text" id="upiId" name="upiId" placeholder="Enter your UPI ID">
        </div>
    </div>
</div>

                <button type="submit" class="buy-now">Buy Now</button>
                <div class="cont-container">
    <a href="Plantgallery.jsp" class="cont">Continue Shopping</a>
</div>
            </form>
        <% } %>
</div>




</body>
<script>
function togglePaymentFields() {
    let paymentMethod = document.querySelector('input[name="paymentMethod"]:checked')?.value;

    // Show/hide card details
    document.getElementById("cardDetails").style.display = (paymentMethod === "Credit Card" || paymentMethod === "Debit Card") ? "block" : "none";

    // Show/hide UPI details
    document.getElementById("upiDetails").style.display = (paymentMethod === "UPI") ? "block" : "none";

    // Hide UPI ID field when switching payment method
    document.getElementById("upiIdSection").style.display = "none";
}

function toggleUpiId() {
    let selectedUpi = document.querySelector('input[name="upiProvider"]:checked');

    // Show UPI ID field only if a UPI provider is selected
    document.getElementById("upiIdSection").style.display = selectedUpi ? "block" : "none";
}
</script>