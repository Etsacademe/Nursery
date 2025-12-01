<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment - Plants Nursery</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f0fff0; /* Light green background for fallback */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url("flow6.jpg"); /* Admin Background Image */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .payment-container {
            background-color: rgba(255, 255, 255, 0.9); /* White background with slight transparency */
            border-radius: 10px;
            padding: 30px;
            max-width: 500px;
            width: 100%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .payment-container h2 {
            text-align: center;
            color: #228b22;
            margin-bottom: 20px;
        }

        .payment-container form {
            display: flex;
            flex-direction: column;
        }

        .payment-container form input,
        .payment-container form select,
        .payment-container form button {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .payment-container form button {
            background: linear-gradient(90deg, #66bb6a, #43a047);
            color: white;
            font-size: 16px;
            padding: 10px;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            transition: 0.3s;
        }

        .payment-container form button:hover {
            background: #228b22;
        }

        .payment-container .back-button {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #228b22;
            text-decoration: none;
        }

        .payment-container .back-button:hover {
            text-decoration: underline;
        }

/* Navigation Bar Styles */
.navbar {
            width: 100%;
            padding: 15px 0;
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent background */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 10;
        }

        .navbar h2 {
            color: #229954;
            margin-left: 30px;
        }

        .navbar ul {
            list-style: none;
            display: flex;
        }

        .navbar ul li {
            margin: 0 20px;
            position: relative;
        }

        .navbar ul li a {
            text-decoration: none;
            color: #229954;
            font-weight: bolder;
            text-transform: uppercase;
            font-size: 16px;
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
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <h2>PLANTS NURSERY</h2>
        <ul>
            <li><a href="index.html">HOME</a></li>
            <li><a href="products.html">PLANTS</a></li>
            <li><a href="fertilizers.html">FERTILIZERS</a></li>
            <li><a href="contactpage.html">CONTACT US</a></li>
            <li><a href="login.html">LOGIN</a></li>

        </ul>
    </div>

    <!-- Payment Form -->
    <div class="payment-container">
        <h2>PAYMENT DETAILS</h2>
        <form action="" method="POST">
            <!-- Cardholder's Name -->
            <input type="text" name="cardholder_name" placeholder="Cardholder's Name" required>

            <!-- Credit Card Number -->
            <input type="text" name="card_number" placeholder="Card Number" pattern="\d{16}" maxlength="16" required>

            <!-- Expiry Date -->
            <div style="display: flex; justify-content: space-between;">
                <input type="month" name="expiry_date" required>
                <input type="text" name="cvv" placeholder="CVV" pattern="\d{3}" maxlength="3" required>
            </div>

            <!-- Billing Address -->
            <input type="text" name="billing_address" placeholder="Billing Address" required>

            <!-- Payment Amount -->
            <input type="number" name="amount" placeholder="Amount" min="1" required>

            <!-- Submit Button -->
            <button type="submit">MAKE PAYMENT</button>
        </form>
    </div>

    <script>
        // Add JavaScript if needed for validation or form submission handling
    </script>
</body>
</html>
