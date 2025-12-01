<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Properties, jakarta.mail.*, jakarta.mail.internet.*" %>
<%@ page import="jakarta.activation.DataHandler" %>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage Order</title>
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


	/* Main Content */
	.container {
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    width: 90%;
	    max-width: 1200px;
	    margin-top: 100px; /* To prevent overlap with the navbar */
	    text-align: center;
	}
	
	h2 {
	    color: #050505;
	    text-align: center;
	    font-size: 28px;
	}
   table {
    width: 80%;
    margin: 20px auto;
    border-collapse: collapse;
    background:#046A38;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0 6px 10px rgba(0, 0, 0, 0.3);
}

th, td {
    padding: 15px;
    text-align: center;
    color: white;
    font-size: 16px;
}

th {
    background-color: rgba(0, 0, 0, 0.7);
    font-weight: bold;
    text-transform: uppercase;
    letter-spacing: 1px;
}

td {
    background-color: rgba(255, 255, 255, 0.2);
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

tr:last-child td {
    border-bottom: none;
}

tr:hover td {
    background-color: rgba(255, 255, 255, 0.3);
    transition: background-color 0.3s ease;
}

   .form-container {
        margin-top: 20px;
        display: flex;
        flex-direction: column;
        gap: 20px;
        align-items: center;
        background:#046A38;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        color:white;
    }
    .form-container input, .form-container button ,.form-container select  {
        width: 200px;
        padding: 10px;
        border-radius: 5px;
        border: none;
        font-size: 16px;
        
    }
    .form-container button {
        background-color: #28a745;
        color: white;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    .form-container button:hover {
        background-color: #218838;
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
             </ul>
        </nav>
    </header>
      


<%
    Connection conn = null;
    PreparedStatement psUpdate = null, psOrderDetails = null, psOrders = null;
    ResultSet rsOrder = null, rsOrders = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Nursery", "root", "Gobi@1234");

        // Handling POST request for updating status
        String id = request.getParameter("id");
        String status = request.getParameter("status");

        if (id != null && status != null) {
            // Update the status in the database
            String updateQuery = "UPDATE orders SET status = ? WHERE order_id = ?";
            psUpdate = conn.prepareStatement(updateQuery);
            psUpdate.setString(1, status);
            psUpdate.setInt(2, Integer.parseInt(id));

            int rowsUpdated = psUpdate.executeUpdate();
            if (rowsUpdated > 0) {
                // Fetch order details to send in email
                String fetchOrderQuery = "SELECT summary, total_price, order_date, address, email, payment_method, card_or_upi,Username FROM orders WHERE order_id = ?";
                psOrderDetails = conn.prepareStatement(fetchOrderQuery);
                psOrderDetails.setInt(1, Integer.parseInt(id));
                rsOrder = psOrderDetails.executeQuery();

                if (rsOrder.next()) {
                    String email = rsOrder.getString("email");
                    String summary = rsOrder.getString("summary");
                    double total_price = rsOrder.getDouble("total_price");
                    String order_date = rsOrder.getString("order_date");
                    String address = rsOrder.getString("address");
                    String payment_method = rsOrder.getString("payment_method");
                    String card_or_upi = rsOrder.getString("card_or_upi");
                    String Usname=rsOrder.getString("Username");

                    // Sending email
                 String subject = "Order Status Update - Nursery Store";
String messageBody = "<html>"
    + "<head>"
    + "<style>"
    + "body { font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0; }"
    + ".container { max-width: 600px; margin: 40px auto; background: white; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); overflow: hidden; }"
    + ".header { background: linear-gradient(135deg, #4CAF50, #2E7D32); padding: 20px; text-align: center; color: white; }"
    + ".header h2 { margin: 0; font-size: 24px; font-weight: bold; }"
    + ".content { padding: 20px; text-align: left; }"
    + ".content p { font-size: 16px; color: #555; margin: 10px 0; }"
    + ".details { background: #f8f9fa; padding: 15px; border-radius: 8px; border-left: 4px solid #4CAF50; margin-top: 10px; }"
    + ".details p { font-size: 14px; color: #333; margin: 5px 0; }"
    + ".status { font-weight: bold; color: #007bff; }"
    + ".cta-button { text-align: center; margin-top: 20px; }"
    + ".cta-button a { background: #28a745; color: white; padding: 12px 20px; text-decoration: none; border-radius: 6px; font-size: 14px; display: inline-block; transition: 0.3s; }"
    + ".cta-button a:hover { background: #218838; }"
    + ".footer { text-align: center; font-size: 12px; color: #777; padding: 15px; background: #f1f1f1; border-top: 1px solid #ddd; }"
    + "</style>"
    + "</head>"
    + "<body>"
    + "<div class='container'>"
    + "<div class='header'><h2>Order Status Updated</h2></div>"
    + "<div class='content'>"
    + "<p>Dear <strong>" + Usname + "</strong>,</p>"
    + "<p>Your order status has been updated. Here are the details:</p>"
    + "<div class='details'>"
    + "<p><strong>Order Summary:</strong> " + summary + "</p>"
    + "<p><strong>Total Price:</strong> Rs " + total_price + "</p>"
    + "<p><strong>Order Date:</strong> " + order_date + "</p>"
    + "<p><strong>Address:</strong> " + address + "</p>"
    + "<p><strong>Payment Method:</strong> " + payment_method + "</p>"
    + "<p><strong>Card/UPI:</strong> " + card_or_upi + "</p>"
    + "<p><strong>Status:</strong> <span class='status'>" + status + "</span></p>"
    + "</div>"
    + "<p>If you have any questions, feel free to contact our support team.</p>"
    + "</div>"
    + "<div class='footer'>"
    + "<p>Thank you for shopping with us!<br><strong>Nursery Store</strong></p>"
    + "</div>"
    + "</div>"
    + "</body>"
    + "</html>";


				sendEmail(email, subject, messageBody, true);

                }
%>
                <script>alert("Status updated successfully and email sent!");</script>
<%
            } else {
%>
                <script>alert("Update failed! Invalid ID.");</script>
<%
            }
        }

        // Fetch orders
        String queryOrders = "SELECT * FROM orders";
        psOrders = conn.prepareStatement(queryOrders);
        rsOrders = psOrders.executeQuery();

    } catch (Exception e) {
        e.printStackTrace();
    } 
%>

<h2 style="padding:20px;text-align:center;color: #050505;">Order Details</h2>
<table border="1">
    <tr>
        <th>Order ID</th>
        <th>Product Ordered</th>
        <th>Total Price</th>
        <th>Order Date</th>
        <th>Address</th>
        <th>Email ID</th>
        <th>Payment Method</th>
        <th>Card_or_Upi</th>
        <th>Status</th>
    </tr>
    <% while (rsOrders.next()) { %>
    <tr>
        <td><%= rsOrders.getInt("order_id") %></td>
        <td><%= rsOrders.getString("summary") %></td>
        <td>Rs <%= rsOrders.getDouble("total_price") %></td>
        <td><%= rsOrders.getString("order_date") %></td>
        <td><%= rsOrders.getString("address") %></td>
        <td><%= rsOrders.getString("email") %></td>
        <td><%= rsOrders.getString("payment_method") %></td>
        <td><%= rsOrders.getString("card_or_upi") %></td>
        <td><%= rsOrders.getString("status") %></td>
    </tr>
    <% } %>
</table>

<h2 style="padding:20px;text-align:center; color: #050505;">Update Status</h2>
<div class="form-container">
    <form action="manageorder.jsp" method="post">
        <label for="id">Order/Cart ID:</label>
        <input type="text" id="id" name="id" required>
        <label for="status">New Status:</label>
        <input type="text" id="status" name="status" required>

        <button type="submit">Update Status</button>
    </form>
</div>

<%!
// Function to send email
public void sendEmail(String recipient, String subject, String messageBody, boolean isHtml)  {
    final String senderEmail = "academyerode@gmail.com"; // Your email
    final String senderPassword = "fbxj vxzt mmrh rbkk"; // Your email password

    Properties properties = new Properties();
    properties.put("mail.smtp.auth", "true");
    properties.put("mail.smtp.starttls.enable", "true");
    properties.put("mail.smtp.host", "smtp.gmail.com");
    properties.put("mail.smtp.port", "587");

    Session session = Session.getInstance(properties, new Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(senderEmail, senderPassword);
        }
    });

    try {
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(senderEmail));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
        message.setSubject(subject);
        if (isHtml) {
            message.setContent(messageBody, "text/html"); // Set HTML format
        } else {
            message.setText(messageBody);
        }

        Transport.send(message);
    } catch (MessagingException e) {
        e.printStackTrace();
    }
}
%>

</body>
</html>
