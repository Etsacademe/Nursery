<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Plants Nursery</title>
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
    background:#47763e;  /* Classy muted green-gray */
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

.contact-container {
    width: 90%;
    max-width: 1000px;
    background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    padding: 40px;
    margin: 100px auto; /* Center the container horizontally */
    display: flex;
    flex-direction: column; /* Stack elements in a column */
    align-items: center; /* Center align content */
    text-align: center; /* Ensure text is also centered */
}

.contact-info {
    width: 100%;
    max-width: 600px; /* Restrict width for better readability */
}

.contact-info h3 {
    color: #228b22;
    margin-bottom: 15px;
}

.contact-info p {
    font-size: 18px;
    line-height: 1.6;
    margin-bottom: 15px;
    display: flex;
    align-items: left;
    justify-content: left; /* Center text and icons */
}

.contact-info p i {
    margin-right: 10px;
    font-size: 20px;
    color: #228b22;
}

.contact-info a {
    color: #228b22;
    text-decoration: none;
    font-weight: bold;
    transition: color 0.3s;
}

.contact-info a:hover {
    color: #43a047;
}

        /* Footer Styles */
        .footer {
            text-align: center;
            margin-top: 40px;
            font-size: 14px;
            color: #888;
            padding: 20px;
            background-color: #fff;
            border-top: 2px solid #ccc;
        }

        .footer a {
            color: #228b22;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }
        strong{
            color: black;
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
        <img id="hero-slider" src="Images/Prd Image/Lily-removebg-preview.png" alt="Plant">
    </div>
    </section>
    <!-- Contact Us Section -->
    <div class="contact-container">
        <!-- Contact Info (Left side) -->
        <div class="contact-info">
            <h3>CONTACT INFORMATION</h3>
            <p><i class="fas fa-map-marker-alt"></i><strong>ADDRESS:</strong> 123 Plant Avenue, Green City, GY 45678, India</p>
            <p><i class="fas fa-envelope"></i><strong>EMAIL:</strong> <a href="mailto:contact@plantsnursery.com">contact@plantsnursery.com</a></p>
            <p><i class="fas fa-phone-alt"></i><strong>PHONE:</strong> +91 987 654 3210</p>
            <p><i class="fas fa-globe"></i><strong>WEBSITE:</strong> <a href="https://www.plantsnursery.com" target="_blank">www.plantsnursery.com</a></p>
        </div>


    </div>

    <!-- Footer -->
    <div class="footer">
        <p>&copy; 2024 Plants Nursery. All rights reserved.</p>
    </div>
</body>
</html>
