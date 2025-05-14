<%@ page import="java.sql.*, com.db.DbConnect" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection con = DbConnect.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM products WHERE id = ?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();

    if(rs.next()) {
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Product</title>
    <%@include file="componant/allcss.jsp" %>
</head>
<body class="bg-light">
<%@include file="componant/navbar.jsp" %>

<div class="container my-5">
    <h2 class="text-center text-primary mb-4">Edit Product</h2>
    <form action="updateproductpross.jsp" method="post">
        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
        
        <div class="mb-3">
            <label class="form-label">Product Name</label>
            <input type="text" name="name" class="form-control" value="<%= rs.getString("name") %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea name="description" class="form-control" required><%= rs.getString("description") %></textarea>
        </div>
        
         <div class="mb-3">
            <label class="form-label">Stock</label>
            <input type="text" name="quantity" class="form-control" value="<%= rs.getString("quantity") %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Price</label>
            <input type="number" step="0.01" name="price" class="form-control" value="<%= rs.getBigDecimal("price") %>" required>
        </div>

        <button type="submit" class="btn btn-success">Update Product</button>
    </form>
</div>

</body>
</html>
<%
    }
    rs.close();
    ps.close();
    con.close();
%>
