<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String loggedUser = (String) session.getAttribute("user");
    String userRole = (String) session.getAttribute("userRole");
%>

<nav class="navbar navbar-expand-lg sticky-top">
    <div class="container">
        <a class="navbar-brand" href="#"><img src="images/logo1.png" alt="Farm2Market Logo"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end gap-3" id="navbarSupportedContent">
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>

            <% if ("farmer".equalsIgnoreCase(userRole)) { %>
                <a href="Product.jsp" class="btn btn-success">Sell Your Product</a>
            <% } %>

            <% if (loggedUser != null) { %>
                <span class="navbar-text me-2">
                  <i class="bi bi-person-circle"></i> <%= (loggedUser != null) ? loggedUser : "Guest" %>
                </span>
                <a href="logout.jsp" class="btn btn-danger">Logout</a>
            <% } else { %>
                <a href="login.jsp" class="btn btn-danger">Login</a>
            <% } %>
        </div>
    </div>
</nav>
