<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<% 
    // Database Connection
    String url = "jdbc:mysql://localhost:3306/Nursery"; // Your DB name
    String user = "root"; // Your DB username
    String password = "Gobi@1234"; // Your DB password

    // Retrieve values from the form
    String productName = request.getParameter("product_name");
    String price = request.getParameter("price");
    String image = request.getParameter("image");
    String quantity = request.getParameter("quantity");
    System.out.println(quantity);
    String totalPrice = request.getParameter("totalPrice");
    String username = (String) session.getAttribute("fullname"); // Get logged-in user

    if (username == null) {
        response.sendRedirect("Home.jsp"); // Redirect to login if not logged in
        return;
    }

    Connection conn = null;
    PreparedStatement ps = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        // Insert into orders table
        String query = "INSERT INTO orders (username, product_name, price,image,quantity,total_price,status) VALUES (?,?, ?, ?, ?,?,?)";
        ps = conn.prepareStatement(query);
        ps.setString(1, username);
        ps.setString(2, productName);
        ps.setString(3, price);
        ps.setString(4, image);
        ps.setString(5, quantity);
        ps.setString(6, totalPrice);
        ps.setString(7, "Pending");

        int result = ps.executeUpdate();
        if (result > 0) {
            out.println("<script>alert('Order placed successfully!'); window.location.href='cart.jsp';</script>");
        } else {
            out.println("<script>alert('Order failed! Try again.'); history.back();</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Database Error!'); history.back();</script>");
    } finally {
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>
