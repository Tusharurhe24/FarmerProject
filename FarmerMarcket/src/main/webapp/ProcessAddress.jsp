<%@ page import="java.sql.*, com.db.DbConnect" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String productId = request.getParameter("productId");

    try {
        Connection con = DbConnect.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM products WHERE id = ?");
        ps.setString(1, productId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            double price = rs.getDouble("price");
            double discount = rs.getDouble("discount");
            double delivery = rs.getDouble("delivery_charge");
            double total = price - discount + delivery;
%>
    <p><strong>PRICE DETAILS</strong></p>
    <table class="table">
        <tr><td>Price</td><td>Rs. <%= price %></td></tr>
        <tr><td>Discount</td><td>Rs. <%= discount %></td></tr>
        <tr><td>Delivery Charges</td><td>Rs. <%= delivery %></td></tr>
        <tr class="total"><td><strong>Total Amount</strong></td><td><strong>Rs. <%= total %></strong></td></tr>
    </table>
    <a href="Payment.jsp" class="btn btn-outline-success">Place Order</a>
<%
        } else {
            out.print("<p>Product not found.</p>");
        }

        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        out.print("<p>Error loading product details.</p>");
        e.printStackTrace();
    }
%>
