<%@ page import="java.sql.*, com.db.DbConnect" %>
<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String description = request.getParameter("description");
    int quantity = Integer.parseInt(request.getParameter("quantity")); 
    double price = Double.parseDouble(request.getParameter("price"));

    try {
        Connection con = DbConnect.getConnection();
        PreparedStatement ps = con.prepareStatement(
            "UPDATE products SET name=?, description=?, quantity=?, price=? WHERE id=?"
        );
        ps.setString(1, name);
        ps.setString(2, description);
        ps.setInt(3, quantity);   
        ps.setDouble(4, price);
        ps.setInt(5, id);

        int updated = ps.executeUpdate();

        ps.close();
        con.close();

        response.sendRedirect("cart.jsp"); 
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
