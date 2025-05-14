<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
    // Redirect to login if user not logged in
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Farmer Home</title>
<%@ include file="componant/allcss.jsp" %>
</head>

<style>
.card img {
    width: 100%;
    max-height: 80vh;
    object-fit: cover;
}
.detail-box {
    top: 70%;
    right: 20%;
}
.img-fluid {
    width: 100% !important;
}
.psell {
    font-size: 3rem;
    font-weight: 700;
    color: green;
}
.prod-img {
    height: 200px;
    object-fit: cover;
}
</style>

<body>
<%@ include file="componant/navbar.jsp"%>

<section class="hero-section mt-4">
    <div class="container">
        <div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner rounded">
                <div class="carousel-item active">
                    <img src="images/Farmer/homemarcket2.jpg" class="d-block w-100" alt="Hero Image">
                    <div class="carousel-caption d-none d-md-block">
                        <h2 class="psell text-light">Shop directly from local farmers</h2>
                        <p>Order fresh, locally grown products and handcrafted goods from independent farmers and food makers.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="product mt-5">
    <div class="container">
        <div class="row g-4">
            <div class="col-6 col-md-3">
                <img src="images/Farmer/vegitable.jpg" alt="Vegetables" class="img-fluid rounded-3" style="height: 200px; object-fit: cover;">
            </div>
            <div class="col-6 col-md-3">
                <img src="images/Farmer/fruit.jpg" alt="Fruits" class="img-fluid rounded-3" style="height: 200px; object-fit: cover;">
            </div>
            <div class="col-6 col-md-3">
                <img src="images/Farmer/dairy.jpg" alt="Dairy Products" class="img-fluid rounded-3" style="height: 200px; object-fit: cover;">
            </div>
            <div class="col-6 col-md-3">
                <img src="images/Farmer/wheat.jpeg" alt="Wheat" class="img-fluid rounded-3" style="height: 200px; object-fit: cover;">
            </div>
        </div>
    </div>
</section>

<section class="sell mt-5 mb-5">
    <div class="container">
        <div class="row align-items-center g-4">
            <div class="col-md-6">
                <img src="images/Farmer/sell.jpg" alt="Sell Image" class="img-fluid rounded-4" style="object-fit: cover; height: 100%; max-height: 400px;">
            </div>
            <div class="col-md-6 text-center">
                <h1 class="psell">Ready to sell your Product?</h1>
                <p>Join our community and start selling your product online today.</p>
                <a href="Product.jsp" class="btn btn-success">Get Started</a>
            </div>
        </div>
    </div>
</section>

</body>
</html>
