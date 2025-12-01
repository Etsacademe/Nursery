<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login & Registration</title>
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
            background-image: url("flow6.jpg"); /* Background image for the whole page */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        .container {
            display: flex;
            flex-direction: row;
            background-color: rgba(255, 255, 255, 0.9); /* White background with slight transparency */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            max-width: 900px;
            width: 100%;
            height: 450px;
        }

        .form-section {
            padding: 20px 30px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-section h2 {
            color: #228b22;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-section form {
            display: flex;
            flex-direction: column;
        }

        .form-section form input {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .form-section form button {
            background: linear-gradient(90deg, #66bb6a, #43a047);
            color: white;
            font-size: 16px;
            padding: 10px;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            transition: 0.3s;
        }

        .form-section form button:hover {
            background: #228b22;
        }

        .form-section a {
            text-align: center;
            margin-top: 10px;
            font-size: 14px;
            color: #228b22;
            text-decoration: none;
        }

        .form-section a:hover {
            text-decoration: underline;
        }

        .tabs {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .tabs button {
            flex: 1;
            padding: 10px;
            margin: 0 5px;
            border: none;
            border-radius: 20px;
            background: linear-gradient(90deg, #ffa726, #fb8c00);
            color: white;
            cursor: pointer;
            font-weight: bold;
            transition: 0.3s;
        }

        .tabs button:hover {
            background: #f57c00;
        }

        .tabs button.active {
            background: #228b22;
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

        .image-section {
            flex: 1;
            background: url("rose.jpg") no-repeat center center/cover;
            background-size: cover;
        }
    </style>
</head>
<body>
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
    <div class="container">
        <!-- Login/Register Form Section -->
        <div class="form-section">
            <h2>PLANTS NURSERY</h2>
            <div class="tabs">
                <button class="active" onclick="showLogin()">LOGIN</button>
                <button onclick="showRegister()">REGISTER</button>
            </div>

            <form id="login-form" method="POST" action="user">
                 <input type="email" placeholder="Email" name="email" required>
    				<input type="password" placeholder="Password" name="password" required><br><br>
    				<input type="hidden" name="action" value="login">
    				<button type="submit">LOGIN</button><br><br>
                <a href="#" onclick="showRegister()">NEW USER? THEN REGISTER!</a>
            </form>

            <form id="register-form" style="display: none;" method="POST" action="user">
                <input type="text" placeholder="Full Name" name="fullname" required>
    			<input type="email" placeholder="Email" name="email" required>
			    <input type="password" placeholder="Password" name="password" required>
			    <input type="password" placeholder="Confirm Password" name="confirm_password" required><br><br>
			    <input type="hidden" name="action" value="register">
			    <button type="submit">REGISTER</button><br><br>
                <a href="#" onclick="showLogin()">ALREADY HAVE AN ACCOUNT? LOGIN !</a>
            </form>
        </div>

        <!-- Image Section -->
        <div class="image-section"></div>
    </div>

    <script>
        function showLogin() {
            document.getElementById('login-form').style.display = 'block';
            document.getElementById('register-form').style.display = 'none';
            document.querySelector('.tabs button.active').classList.remove('active');
            document.querySelector('.tabs button:nth-child(1)').classList.add('active');
        }

        function showRegister() {
            document.getElementById('login-form').style.display = 'none';
            document.getElementById('register-form').style.display = 'block';
            document.querySelector('.tabs button.active').classList.remove('active');
            document.querySelector('.tabs button:nth-child(2)').classList.add('active');
        }
    </script>
</body>
</html>
