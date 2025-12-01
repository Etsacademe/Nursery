<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - Plants Nursery</title>
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

.feedback-card {

	width:100%;
    margin-left: 120px;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
    background-color: #fff;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.feedback-card:hover {
    transform: translateY(-10px);
    box-shadow: 0px 6px 20px rgba(0, 0, 0, 0.2);
}

.card-body {
    padding: 15px;
}

/* Rating Section */
.star-rating {
    color: #f39c12;
    font-size: 1.5rem;
}

.card-title {
    font-size: 1.2rem;
    font-weight: bold;
    color: #333;
    margin-bottom: 15px;
}

/* Review & Delivery Experience Section */
.card-text {
    font-size: 1rem;
    line-height: 1.6;
    color: #555;
}

.card-text strong {
    color: #333;
    font-weight: bold;
}

/* Card Grid Layout */
.row {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
}

.col-md-4 {
    width: 30%;
    margin-bottom: 30px;
}

@media (max-width: 768px) {
    .col-md-4 {
        width: 100%;
    }

    .card-title {
        font-size: 1.1rem;
    }

    .star-rating {
        font-size: 1.3rem;
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
            <li><a href="Adminpage.jsp">Dashboard</a></li>              
             <li><a href="Manageplants.jsp">Manage Plants</a></li>
            <li><a href="manageorder.jsp">Manage Orders </a></li>
            <li><a href="Report.jsp">Reports </a></li>
             <li><a href="Home.jsp">Logout</a></li>
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
    <div class="container mt-5">
    <h1 class="text-center">Feedback</h1>
    <br>

    <div class="row">
        <% 
            // Database connection details
            String jdbcURL = "jdbc:mysql://localhost:3306/Nursery";
            String jdbcUsername = "root";
            String jdbcPassword = "Gobi@1234";
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;

            try {
                // Connect to the database
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

                // Query to fetch feedback data
                String sql = "SELECT * FROM feedback";
                statement = connection.createStatement();
                resultSet = statement.executeQuery(sql);

                // Loop through the result set and display feedback in card style
                while(resultSet.next()) {
                    int rating = resultSet.getInt("rating");
                    String review = resultSet.getString("review");
                    String deliveryExperience = resultSet.getString("delivery_experience");
                    String Name = resultSet.getString("Username");
        %>

        <!-- Display each feedback as a card -->
        <div class="col-md-4">
            <div class="card feedback-card">
                <div class="card-body">
                    <!-- Rating Section -->
                    <h5 class="card-title">Rating: 
                        <%
                            // Display stars based on rating
                            for(int i = 1; i <= rating; i++) {
                        %>
                        <span class="star-rating">&#9733;</span>
                        <%
                            }
                        %>
                    </h5>

                    <!-- Review Section -->
                    <p class="card-text"><strong>Review:</strong> <%= review %></p>

                    <!-- Delivery Experience Section -->
                    <p class="card-text"><strong>Delivery Experience:</strong> <%= deliveryExperience %></p>
                <br></br>
                 <p class="card-title"><strong>By:</strong> <%= Name %></p>
                </div>
            </div>
        </div>

        <% 
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Close resources
                try {
                    if (resultSet != null) resultSet.close();
                    if (statement != null) statement.close();
                    if (connection != null) connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>
</div>

<!-- Bootstrap JS (optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>