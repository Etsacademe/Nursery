<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=League+Spartan:wght@500;700&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <title>HOMEPAGE</title>
    
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

/* Side Products */
.side-products {
    position: absolute;
    right: 30px;
    top: 50%;
    transform: translateY(-50%);
    display: flex;
    flex-direction: column;
    align-items: center;
}

.product {
    background: white;
    padding: 10px;
    margin: 10px 0;
    border-radius: 12px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    position: relative;
}

.product img {
    width: 60px;
    height: 60px;
}

.add {
    position: absolute;
    bottom: -10px;
    right: -10px;
    background: green;
    color: white;
    padding: 5px;
    border-radius: 50%;
    font-size: 16px;
}

/* Quote Section */
.quote {
    background: #f9f9f9;
    padding: 30px;
    margin-top: 40px;
    text-align: center;
    font-size: 18px;
    font-style: italic;
}

.slider {
    width: 300px; /* Adjust width as needed */
    height: 300px;
    overflow: hidden;
    position: relative;
    border-radius: 10px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.3);
}

.slides {
    display: flex;
    width: 100%;
    height: 100%;
    position: absolute;
}

.slide {
    min-width: 100%;
    transition: opacity 1s ease-in-out;
    position: absolute;
    opacity: 0;
}

.slide img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.active {
    opacity: 1;
}

 /* Login Popup */
.login-popup {
    display: none; /* Initially hidden */
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.7);
    display: flex;
    justify-content: center;
    align-items: center;
}

/* Popup Content */
.popup-content {
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
    width: 400px;
    text-align: center;
    position: relative;
    animation: fadeIn 0.5s ease-in-out;
}

/* Fade In Animation */
@keyframes fadeIn {
    from {
        transform: scale(0.8);
        opacity: 0;
    }
    to {
        transform: scale(1);
        opacity: 1;
    }
}

/* Close Button */
.popup-content .close {
    position: absolute;
    top: 10px;
    right: 15px;
    font-size: 28px;
    color: black;
    cursor: pointer;
    transition: color 0.3s;
    z-index: 10;
}

.popup-content .close:hover {
    color: red;
}

/* Show the popup when 'show' class is added */
.login-popup.show {
    display: flex;
}

/* Form Inputs */
.popup-content input {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

/* Form Buttons */
.popup-content button {
    width: 100%;
    padding: 10px;
    background-color: #28a745;
    border: none;
    border-radius: 5px;
    color: white;
    font-size: 18px;
    cursor: pointer;
    transition: background-color 0.3s;
}
.popup-content h2 {
    margin-bottom: 15px;
    font-size: 24px;
    color: #333;
    text-align: center;
}
.popup-content button:hover {
    background-color: #218838;
}

/* Toggle Link */
#toggleLink {
    margin-top: 15px;
    color: #229954;
    cursor: pointer;
}

#toggleLink span {
    font-weight: bold;
}
      
      

/* Selling Section */
.section {
    padding: 60px 20px;
    background: #F5F9F9;
}

/* Container */
.selling_container {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 30px;
    max-width: 1200px;
    margin: auto;
    background: transparent; /* Ensure no background color */
}

/* Text Content */
.text-content {
    text-align: left;
    max-width: 250px;
    font-size:45px;
}

.selling_h2 {
    font-size: 28px;
    font-weight: bold;
    text-align: center;
    margin-bottom: 10px;
}

.selling_p {
    font-size: 16px;
    color: #555;
    text-align: center;
    margin-bottom: 20px;
}

/* Button */
.selling_btn {
    display: inline-block;
    padding: 12px 20px;
    font-size: 1rem;
    color: #000;
    text-decoration: none;
    border-radius: 8px;
    transition: background 0.3s ease;
    border: 1px solid #000; /* Added border for visibility */
    background: none; /* Removed background color */
}

.selling_btn:hover {
    background: none; /* Ensure no background on hover */
    opacity: 0.8; /* Optional: Add slight opacity effect */
}
/* Product Cards */
.selling_item {
    background:#c1dcdc;
    padding: 20px;
    border-radius: 12px;
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    width: 250px;
}

/* Image Styling */
.selling_item_img {
    width: 100%;
    height: 250px;
    object-fit: cover;
   
   
}

/* Hover Effects */
.selling_item:hover {
    transform: translateY(-5px);
}

/* Text Styling */
.selling_item_title {
    font-size: 1.2rem;
    font-weight: bold;
    margin-top: 10px;
    color: #000;
}

.selling_item_price {
    font-size: 1.1rem;
    font-weight: bold;
    color: #000;
    margin-top: 5px;
    padding:10px;
}

/* Responsive Design */
@media (max-width: 768px) {
    .selling_container {
        flex-direction: column;
        align-items: center;
    }

    .selling_item {
        width: 90%;
    }

    .text-content {
        text-align: center;
    }
}


.about-us {
    padding: 50px 20px;
}

.about-us h2 {
    font-size: 28px;
    font-weight: bold;
}

.about-us p {
    font-size: 16px;
    color: #555;
    margin-bottom: 40px;
}

.features {
    display: flex;
    justify-content: center;
    gap: 50px;
    flex-wrap: wrap;
}

.feature {
    width: 300px;
    text-align: center;
}

.icon {
    width: 80px;
    height: 80px;
    background-color: #cde5e4;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 15px;
}

.icon img {
    width: 40px;
}

.feature h3 {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 10px;
}

.feature p {
    font-size: 14px;
    color: #333;
}

.swiper {
    width: 100%;
    height: auto;
}

.swiper-slide {
    display: flex;
    justify-content: center;
    align-items: center;
}

.swiper-wrapper {
    display: flex;
}

.swiper-pagination {
    position: relative;
    margin-top: 10px;
}

.swiper-button-next,
.swiper-button-prev {
    color: #333;
}




    </style>
</head>
<body>

    <!-- Header Section -->
    <header>
        <div class="logo">
           PLANTS NURSERY 
        </div>
        <nav>
            <ul>
                <li><a href="#" class="active">HOME</a></li>
                <li><a href="">PLANTS</a></li>
                <li><a href="">FERTILIZERS</a></li>
                <li><a href="">CONTACT US</a></li>
                <li><a href="About us.jsp">ABOUT US</a></li>
                <li><a href="">LOGIN</a></li>
            </ul>
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

    <div class="side-products">
        <div class="product">
            <img src="Images/Prd Image/Peace_Lilybg.png" alt="Peace Lily" onclick="changePlant('Images/Prd Image/Peace_Lilybg.png')">
        </div>
        <div class="product">
            <img src="Images/Prd Image/Lavander.png" alt="Lavender" onclick="changePlant('Images/Prd Image/Lavander.png')">
        </div>
        <div class="product">
            <img src="Images/Prd Image/Lily-removebg-preview.png" alt="Kapoor Tulsi" onclick="changePlant('Images/Prd Image/kapoor-tulsi.png')">
        </div>
        <span class="add">+</span>
    </div>
</section>


 <section class="section">
        <div class="container selling_container">
            <div class="text-content">
                <h2 class="selling_h2">Best Selling <br> Plants</h2>
                <p class="selling_p">
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                </p>
                <a href="#" class="selling_btn">See more &rarr;</a>
            </div>
            <div class="selling_item">
                <img src="Images/Prd Image/zz_plantbg.png" alt="Natural Plant" class="selling_item_img" />
                <p class="selling_item_title">Flowers</p>
                <p class="selling_item_price">Rs 259</p>
                <a href="#" class="selling_btn" style="background:white">Buy Now &rarr;</a>
            </div>
            <div class="selling_item">
                <img src="Images/Prd Image/Peace_Lilybg.png" alt="Artificial Plant" class="selling_item_img" />
                <p class="selling_item_title">Cactus</p>
                <p class="selling_item_price">Rs 175</p>
                <a href="#" class="selling_btn" style="background:white">Buy Now &rarr;</a>
            </div>
            <div class="selling_item">
                <img src="Images/Prd Image/Lily-removebg-preview.png" alt="Artificial Plant" class="selling_item_img" />
                <p class="selling_item_title">Indoor Plants</p>
                <p class="selling_item_price">Rs 699</p>
                <a href="#" class="selling_btn" style="background:white">Buy Now &rarr;</a>
            </div>
        </div>
    </section>
    <section class="about-us">
        <h2 style="text-align:center;padding:25px">Why u Choose us</h2>
        <p style="text-align:center">Order now and appreciate the beauty of nature</p>
        <div class="features">
            <div class="feature">
                <div class="icon">
                    <img src="Images/Prd Image/plant.png" alt="Large Assortment">
                </div>
                <h3>Large Assortment</h3>
                <p>We offer many different types of products with fewer variations in each category.</p>
            </div>
            <div class="feature">
                <div class="icon">
                    <img src="Images/Prd Image/delivery.png" alt="Fast & Free Shipping">
                </div>
                <h3>Fast & Free Shipping</h3>
                <p>4-day or less delivery time, free shipping, and an expedited delivery option.</p>
            </div>
            <div class="feature">
                <div class="icon">
                    <img src="Images/Prd Image/support.png" alt="24/7 Support">
                </div>
                <h3>24/7 Support</h3>
                <p>Answers to any business-related inquiry 24/7 and in real-time.</p>
            </div>
        </div>
    </section>
    
    
    
    
    <section class="section" style="background:#c1dcdc">
  <div class="container">
    <div class="section_header">
     <h2 class="section_h2" style="text-align: center; padding:10px;margin-bottom:20px;">
    Words from Our Clients
</h2>
    </div>
    <div class="reviews">
      <div class="swiper mySwiper">
        <div class="swiper-wrapper">
          <!-- Review 1 -->
          <div class="swiper-slide">
            <div class="review">
              <p class="review_text">
                The service was fantastic! The plants arrived in perfect condition, and the customer support was great.
              </p>
              <div class="review_footer">
                <div class="review_user">
                  <h3 class="review_user_name" style="padding:10px">Mr.Arun</h3>
                  <p class="review_user_designation">Plant Lover</p>
                </div>
                <h3 class="review_rating">
                  ⭐⭐⭐⭐⭐ <span>5.0</span>
                </h3>
              </div>
            </div>
          </div>

          <!-- Review 2 -->
          <div class="swiper-slide">
            <div class="review">
              <p class="review_text">
                Absolutely love my new plants! They were well-packaged and very healthy. Will definitely order again!
              </p>
              <div class="review_footer">
                <div class="review_user">
                  <h3 class="review_user_name" style="padding:10px">Ms. Harini</h3>
                  <p class="review_user_designation">Gardener</p>
                </div>
                <h3 class="review_rating">
                  ⭐⭐⭐⭐☆ <span>4.5</span>
                </h3>
              </div>
            </div>
          </div>

          <!-- Review 3 -->
          <div class="swiper-slide">
            <div class="review">
              <p class="review_text">
                Nursery has the best variety of plants. Their team is very helpful, and the delivery was fast.
              </p>
              <div class="review_footer">
                <div class="review_user">
                  <h3 class="review_user_name" style="padding:10px">Mr.Varshini</h3>
                  <p class="review_user_designation">Home Decor Enthusiast</p>
                </div>
                <h3 class="review_rating">
                  ⭐⭐⭐⭐⭐ <span>5.0</span>
                </h3>
              </div>
            </div>
          </div>
        </div>

        <!-- Swiper Navigation and Pagination -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
      </div>
    </div>
  </div>
</section>
    
 
 
<!-- Login Popup -->
<div id="loginPopup" class="login-popup">
    <div class="popup-content">
        <span class="close" onclick="closeLoginForm()">&times;</span>
        <h2 id="popupTitle">Login</h2>

        <!-- Login Form -->
        <form id="loginForm" action="user" method="POST">
            <input type="text" id="username" name="email" placeholder="Username" required>
           <input type="password" id="password" name="password" placeholder="Password" required
pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6}$"
title="Password must be exactly 6 characters long and contain at least one uppercase letter, one lowercase letter, one special character, and one number.">

            <a href="#" onclick="showForgotPasswordForm()" style="padding: 10px; text-decoration: none; color: inherit; display: block; text-align: right;">Forgot Password?</a>
            <button type="submit" name="action" value="login">Login</button>
        </form>

        <!-- Register Form -->
        <form id="registerForm" style="display:none;" action="user" method="POST">
            <input type="text" id="fullname" name="fullname" placeholder="Fullname" required>
            <input type="email" id="email" name="email" placeholder="Email ID" required>
            <input type="password" id="password" name="password" placeholder="Password" required
pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6}$"
title="Password must be exactly 6 characters long and contain at least one uppercase letter, one lowercase letter, one special character, and one number.">

            <button type="submit" name="action" value="register">Regis ter</button>
        </form>

        <!-- Forgot Password Form -->
        <form id="forgotPasswordForm" style="display:none;" action="forgetpass" method="post">
            <p>Enter your email to reset password</p>
            <input type="email" id="forgotEmail" name="email" placeholder="Enter your email" required>
            <input type="password" id="newPassword" name="newPassword" placeholder="New Password" required>
            <button type="submit" name="action" value="resetPassword">Reset Password</button>
        </form>

        <!-- Toggle Link -->
        <p id="toggleLink" onclick="toggleForm()">Don't have an account?<span> Register here.</span></p>
    </div>
</div>

 
 
    
    
</body>
<script>
//Object mapping plant images to their respective background colors
const plantBackgrounds = {
    "Images/Prd Image/zz_plantbg.png": "#c3a251", // Light Blue
    "Images/Prd Image/Peace_Lilybg.png": "#617a51", // Light Yellow
    "Images/Prd Image/Lavander.png": "#ba94c5", // Soft Purple
    "Images/Prd Image/Lily-removebg-preview.png": "#47763e" // Light Green
};

// List of plant images for the slider
const images = Object.keys(plantBackgrounds); // Extracts image paths from the object

let currentIndex = 0; // Tracks the current image index

// Function to change the plant image and background color
function changePlant(imageSrc) {
    const heroImage = document.getElementById("hero-slider");
    const heroSection = document.getElementById("hero-section");

    // Change the hero image
    heroImage.src = imageSrc;

    // Change the background color
    heroSection.style.background = plantBackgrounds[imageSrc] || "#FFFFFF";
    // Increase size only for "kapoor-tulsi.png"
    if (imageSrc.includes("kapoor-tulsi.png")) {
        heroImage.style.width = "500px"; // Increase size
    } else {
        heroImage.style.width = "400px"; // Default size for other images
    }

}

// Function to cycle through images every 3 seconds
function changeImage() {
    currentIndex = (currentIndex + 1) % images.length; // Loop through images
    changePlant(images[currentIndex]); // Update image and background color
}

// Start the automatic image and background transition
setInterval(changeImage, 3000);



document.addEventListener("DOMContentLoaded", function () {
    var swiper = new Swiper(".mySwiper", {
        loop: true, // Enables infinite looping
        autoplay: {
            delay: 3000, // Changes feedback every 3 seconds
            disableOnInteraction: false, // Keeps autoplay running after user interaction
        },
        slidesPerView: 1,  // Ensures only 1 feedback is visible at a time
        spaceBetween: 20,  // Adds spacing between slides
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
    });
});

//Function to toggle between login and register form
function toggleForm() {
    let loginForm = document.getElementById("loginForm");
    let registerForm = document.getElementById("registerForm");
    let forgotPasswordForm = document.getElementById("forgotPasswordForm");
    let toggleText = document.getElementById("toggleLink");

    // Hide forgot password form if visible
    forgotPasswordForm.style.display = "none";

    if (loginForm.style.display === "none") {
        loginForm.style.display = "block";
        registerForm.style.display = "none";
        toggleText.innerHTML = "Don't have an account?<span> Register here.</span>";
    } else {
        loginForm.style.display = "none";
        registerForm.style.display = "block";
        toggleText.innerHTML = "Already have an account?<span> Login here.</span>";
    }
}

// Function to show Forgot Password form
function showForgotPasswordForm() {
    document.getElementById("loginForm").style.display = "none";
    document.getElementById("registerForm").style.display = "none";
    document.getElementById("forgotPasswordForm").style.display = "block";
}

// Function to close the login modal
function closeLoginForm() {
    document.getElementById("loginPopup").style.display = "none";
}



</script>
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
</html>