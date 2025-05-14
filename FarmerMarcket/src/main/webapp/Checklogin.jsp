<%@ page language="java" import="javax.servlet.http.*,javax.servlet.*" %>
<%
 
    String user = (String) session.getAttribute("user"); 

    if (user == null) {
        // Not logged in → redirect to login page
        session.setAttribute("redirectAfterLogin", "Address.jsp?pid=" + request.getParameter("pid"));
        response.sendRedirect("login.jsp");
    } else {
        // Logged in → go to address form
        response.sendRedirect("Address.jsp?pid=" + request.getParameter("pid"));
    }
%>
