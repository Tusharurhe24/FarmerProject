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
        <h2 class="text-success mb-4 text-center">Product List</h2>
        <div class="row">
            <%
                String role = (String) session.getAttribute("role");
                if (role != null) role = role.toLowerCase();

                try {
                    Connection con = DbConnect.getConnection();
                    PreparedStatement ps;
                    
                    if ("farmer".equals(role)) {
                        Integer farmerId = (Integer) session.getAttribute("farmerId");
                        ps = con.prepareStatement("SELECT * FROM products WHERE farmer_id = ?");
                        ps.setInt(1, farmerId);
                    } else {
                        // buyer or admin
                        ps = con.prepareStatement("SELECT * FROM products");
                    }

                    ResultSet rs = ps.executeQuery();

                    while (rs.next()) {
            %>
            <div class="col-md-4 mb-4">
                <div class="card h-100 shadow">
                    <img src="image?id=<%= rs.getInt("id") %>" class="card-img-top" height="200">
                    <div class="card-body">
                        <h5 class="card-title"><%= rs.getString("name") %></h5>
                        <p class="card-text"><%= rs.getString("description") %></p>
                        <p class="text-success fw-bold">₹<%= rs.getBigDecimal("price") %></p>
                        <div class="d-flex gap-2">
                            <% if ("farmer".equals(role)) { %>
                                <a href="updateproduct.jsp?id=<%= rs.getInt("id") %>" class="btn btn-primary btn-sm w-50">Edit</a>
                                <form action="deleteproduct.jsp" method="post" class="w-50">
                                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                    <button type="submit" class="btn btn-danger btn-sm w-100">Delete</button>
                                </form>
                            <% } else if ("buyer".equals(role)) { %>
                                <form action="Payment.jsp" method="post" class="w-100">
                                    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                    <button type="submit" class="btn btn-success btn-sm w-100">Buy Now</button>
                                </form>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
            <%
                    }
                    rs.close();
                    ps.close();
                    con.close();
                } catch (Exception e) {
            %>
                <div class="alert alert-danger text-center">Something went wrong while loading products.</div>
            <%
                    e.printStackTrace();
                }
            %>
        </div>
    </div>
</body>
</html>
