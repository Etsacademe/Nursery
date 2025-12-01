<%@ page import="java.sql.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation</title>
        <script>
        document.addEventListener("DOMContentLoaded", function() {
            let orderData = JSON.parse(sessionStorage.getItem("orderProduct"));

            if (orderData) {
                let totalPrice = orderData.price * orderData.quantity; // Calculate total price

                document.getElementById("productImage").src = orderData.image;
                document.getElementById("productName").innerText = orderData.name;
                document.getElementById("productPrice").innerText = "Rs " + orderData.price;
                document.getElementById("productQuantity").innerText = orderData.quantity;
                document.getElementById("totalPrice").innerText = "Rs " + totalPrice;
                document.getElementById("Status").value = Status;

                // Hidden input fields to send data to the server
                document.getElementById("nameInput").value = orderData.name;
                document.getElementById("priceInput").value = orderData.price;
                document.getElementById("quantityInput").value = orderData.quantity;
                document.getElementById("imageInput").value = orderData.image;
                document.getElementById("totalPriceInput").value = totalPrice;
                document.getElementById("Status").value = Status;
                
            }
        });
    </script>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&family=Lora&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=League+Spartan:wght@500;700&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'League Spartan', sans-serif;
        }
        body {
            width: 100%;
            height: 100vh;
            background-image: linear-gradient(rgba(0,0,0,0.75),rgba(0,0,0,0.75)), url("Images/Prd Image/flow6.jpg");
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        .banner {
            width: 100%;
            height: 100vh;
            background-image: linear-gradient(rgba(0,0,0,0.75),rgba(0,0,0,0.75)), url("Images/Prd Image/flow6.jpg");
            background-size: cover;
            background-position: center;
        }
        .navbar {
            width: 100%;
            margin: auto;
            padding: 25px 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: rgba(255, 255, 255, 0.2); /* Transparent white background */
            backdrop-filter: blur(10px); /* Frosted glass effect */
            -webkit-backdrop-filter: blur(10px); /* Safari support */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
        }
        .navbar ul li {
            list-style: none;
            display: inline-block;
            margin: 0 25px;
            position: relative;
        }
        .navbar ul li a {
            text-decoration: none;
            color: #fff;
            text-transform: uppercase;
        }
        .navbar ul li::after {
            content: '';
            height: 3px;
            width: 0;
            background: #229954;
            position: absolute;
            left: 0;
            bottom: -10px;
            transition: 0.5s;
        }
        .navbar ul li:hover::after {
            width: 100%;
        }
.container {
    display: flex;
    flex-direction: column;
    gap: 30px;
    justify-content: center;
    align-items: center;
    width: 100%;
}

.navbar h2 {
    color: white;
    margin-left: 50px;
    padding-right:250px;
}

h1 {
    color: white;
    text-align: center;
    padding-bottom: 50px;
    padding-top: 30px;
}

.menu-section {
    margin-bottom: 40px;
}

.menu-section h2 {
    font-size: 1.8rem;
    margin-bottom: 20px;
    text-align: center;
    color: white;
}

.menu {
    display: flex;
    gap: 20px;
    flex-wrap: wrap;
    justify-content: center;
}

.product-card {
    background: rgba(255, 255, 255, 0.2); /* Transparent background */
    border-radius: 15px;
    padding: 20px;
    width: 250px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    backdrop-filter: blur(10px); /* Frosted glass effect */
    -webkit-backdrop-filter: blur(10px); /* Safari support */
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
    margin: 15px;
}

.product-card:hover {
    transform: scale(1.05);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
}

.product-card img {
    width: 100%;
    height: auto;
    border-radius: 10px;
}

.product-card h3 {
    font-size: 1.3rem;
    margin: 15px 0;
    color: white;
}

.product-card p {
    font-size: 1.1rem;
    margin-bottom: 15px;
    color: white;
}

        .order-container {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            padding: 30px;
            text-align: center;
            width: 350px;
            color: #fff;
            margin-left:500px;
            margin-top:50px;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        img {
            width: 150px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
        }

        p {
            font-size: 18px;
            margin-left:90px;
            justify-content: space-between; 
    		padding: 12px;
    		padding-right:50px;
    		text-align:justify;
    		
        }

        form {
            margin-top: 20px;
        }
        input
        {
        padding:10px;
        margin-left:120px;
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


    </style>
</head>
<body>
    <div class="banner">
        <div class="navbar">
            <h2>PLANTS NURSERY</h2>
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
            <li><a href="Contactus.jsp">Contact US</a></li>
             <li><a href="About us.jsp">About Us</a></li>
             <li><a href="Home.jsp">Logout</a></li>
            </ul>
            <div class="cart-icon" onclick="window.location.href='userorder.jsp'">
                <a href="cart.jsp"><i class="fa fa-shopping-cart" style="font-size:48px;color:white; margin-right:50px"></i>
            
            </a></div>
        </div>
          <div class="order-container">
        <h2>Confirm Your Order</h2>
        <img id="productImage" src="" alt="Product Image">
        <p><strong>Product:</strong> <span id="productName"></span></p>
        <p><strong>Price:</strong> <span id="productPrice"></span></p>
        <p><strong>Quantity:</strong> <span id="productQuantity"></span></p>
        <p><strong>Total Price:</strong> <span id="totalPrice"></span></p>
       
        
        <form action="StoreOrderServlet" method="post">
            <input type="hidden" id="nameInput" name="name">
            <input type="hidden" id="priceInput" name="price">
            <input type="hidden" id="quantityInput" name="quantity">
            <input type="hidden" id="imageInput" name="image">
            <input type="hidden" id="totalPriceInput" name="totalPrice">
            
            <p><strong>Username:</strong></p>
            <input type="text" id="Username" name="Username" 
                   value="<%= session.getAttribute("fullname") != null ? session.getAttribute("fullname") : "" %>" 
                   style="border: none; background-color: transparent; color: white;" readonly>

            <p><strong>Book Status:</strong></p>
      		<input type="text" id="Status" name="Status" value="Pending" readonly style="border: none; background-color: transparent; color: black;">
            <button type="submit">Confirm Order</button>
        </form>
    </div>
</body>
</html>
