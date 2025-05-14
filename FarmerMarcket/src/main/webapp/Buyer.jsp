<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buyer Home</title>
<%@include file="componant/allcss.jsp" %>
</head>
<body>
<%@include file="componant/navbar.jsp" %>

<section class="hero-section mt-4">
    <div class="container">
      <div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner rounded">
          <div class="carousel-item active">
            <img src="images/Buyer/farm2market.png" class="d-block w-100" alt="Hero Image">
            <div class="carousel-caption d-none d-md-block">
              <h2 class="text-light">Fresh from the farm, ready to ship</h2>
              <p class="prodsell"> Discover items from our verified farmers. They're picked at peak freshness, packed with care, and shipped direct to you.</p>
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
          <img src="images/Buyer/vegitable.jpg" alt="Vegetables" class="img-fluid pimg">
        </div>
        <div class="col-6 col-md-3">
          <img src="images/Buyer/fruit.jpg" alt="Fruits" class="img-fluid pimg">
        </div>
        <div class="col-6 col-md-3">
          <img src="images/Buyer/dairy.jpg" alt="Dairy Products" class="img-fluid pimg">
      </div>
        <div class="col-6 col-md-3">
          <img src="images/Buyer/wheat.jpeg" alt="Wheat" class="img-fluid pimg">
        </div>
      </div>
    </div>
  </section>

  <section class="sell mt-5 mb-5">
    <div class="container">
      <div class="row align-items-center g-4">
        <div class="col-md-6">
          <img src="images/Buyer/sell.jpg" alt="Sell Image" class="img-fluid rounded-4" style="object-fit: cover; height: 100%; max-height: 400px;">
        </div>
        <div class="col-md-6 text-center">
          <h1 class="psell">Looking to buy fresh and quality products?</h1>
          <p class="">Join our community and start discovering the best deals today!</p>
         <a href="ViewProduct.jsp" class="btn btn-success">View Products</a>

        </div>
      </div>
    </div>
  </section>

</body>
</html>