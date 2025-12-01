<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Maha Nursery</title>
    <style>
        /* Global Styles */
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
.container {
    max-width: 900px;
    background: #c1dcdc;
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
    text-align: center;
    animation: fadeIn 0.8s ease-in-out;
    
    /* Centering below navbar */
    margin: 50px auto; /* Adjust the spacing as needed */
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

        /* Headings */
        h1 {
            font-size: 32px;
            color: #2E8B57;
            margin-bottom: 10px;
        }
        h2 {
            font-size: 24px;
            color: #218c74;
            margin-top: 20px;
        }

        /* Paragraph */
        p {
            font-size: 16px;
            line-height: 1.8;
            color: #444;
            margin-bottom: 15px;
        }

        /* Mission List */
        .mission-list {
            list-style: none;
            margin-top: 15px;
            padding: 0;
        }
        .mission-list li {
            background: #f4f4f4;
            padding: 12px;
            margin: 8px 0;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: start;
            gap: 10px;
            transition: all 0.3s ease-in-out;
        }
        .mission-list li:hover {
            background: #2E8B57;
            color: white;
            transform: scale(1.03);
        }
        
        /* Icons */
        .icon {
            font-size: 18px;
            color: #2E8B57;
        }
        .mission-list li:hover .icon {
            color: white;
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 30px;
            }
            h1 {
                font-size: 28px;
            }
            h2 {
                font-size: 22px;
            }
            p {
                font-size: 15px;
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
    <div class="container">
        <h1>About Us</h1>
        <p>Welcome to <strong>Maha Nursery</strong>, your one-stop destination for high-quality plants, gardening tools, and eco-friendly solutions. We are passionate about greenery and committed to helping you create beautiful, thriving gardens. Whether you're a seasoned gardener or just starting, we provide expert advice, premium plants, and everything you need to nurture nature in your home or workspace.</p>

        <h2>Our Vision</h2>
        <p>To be a leading nursery store that inspires a greener world by promoting sustainable gardening and making nature accessible to every home.</p>

        <h2>Our Mission</h2>
        <ul class="mission-list">
            <li><span class="icon">🌿</span> To provide healthy, high-quality plants and eco-friendly gardening products.</li>
            <li><span class="icon">📚</span> To educate and inspire individuals about the importance of plants and sustainable living.</li>
            <li><span class="icon">🏡</span> To create a welcoming space where plant lovers can find everything they need for their gardening journey.</li>
            <li><span class="icon">🌍</span> To promote environmental responsibility through organic practices and community engagement.</li>
        </ul>
    </div>

</body>
</html>
