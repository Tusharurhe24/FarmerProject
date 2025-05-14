<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, com.db.DbConnect" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
<%@include file="componant/allcss.jsp" %>
</head>
<body class="bg-light">
<%@include file="componant/navbar.jsp" %>

<div class="container my-5">
    <div class="cards shadow">
        <div class="card-header text-center bg-success bg-opacity-25">
            <h2 class="text-success mb-0">Product List</h2>
        </div>

        <div class="card-body">
            <table class="table table-bordered table-hover align-middle text-center">
                <thead class="table-success">
                    <tr>
                        <th scope="col">Image</th>
                        <th scope="col">Price</th>
                        <th scope="col">Stock</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    String role = (String) session.getAttribute("role");
                    if (role == null) {
                        response.sendRedirect("login.jsp");
                        return;
                    }

                    Connection con = DbConnect.getConnection();
                    PreparedStatement ps = null;
                    ResultSet rs = null;

                    if ("farmer".equalsIgnoreCase(role)) {
                        int farmerId = (int) session.getAttribute("farmerId");
                        ps = con.prepareStatement("SELECT * FROM products WHERE farmer_id = ?");
                        ps.setInt(1, farmerId);
                    } else if ("buyer".equalsIgnoreCase(role)) {
                        ps = con.prepareStatement("SELECT * FROM products");
                    }

                    rs = ps.executeQuery();

                    while (rs.next()) {
                %>
                <tr>
                    <td>
                        <img src="image?id=<%= rs.getInt("id") %>" width="100" height="100"/>
                    </td>
                    <td>₹<%= rs.getBigDecimal("price") %></td>
                    <td><%= rs.getInt("quantity") %></td>
                    <td>
                        <a href="cart.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-warning">View Product</a>
                    </td>
                </tr>
                <%
                    }
                    rs.close();
                    ps.close();
                    con.close();
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
