<%@ page import="java.sql.*, com.db.DbConnect" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    try {
        Connection con = DbConnect.getConnection();
        PreparedStatement ps = con.prepareStatement("DELETE FROM products WHERE id = ?");
        ps.setInt(1, id);
        int rows = ps.executeUpdate();
        ps.close();
        con.close();
        response.sendRedirect("cart.jsp"); 
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
