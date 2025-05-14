<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Admin Dashboard</title>
    <%@include file="componant/allcss.jsp" %>
    <style>

    </style>    
</head>

<body>

    <nav class="navbar navbar-light bg-white border-bottom d-md-none">
        <div class="container-fluid">
            <button class="btn btn-outline-success" type="button" data-bs-toggle="offcanvas"
                data-bs-target="#sidebarMenu">
                <div><i class="fa-solid fa-bars p-1"></i>Menu</div>
            </button>
            <span class="navbar-brand mb-0 h1">Buyer Dashboard</span>
        </div>
    </nav>

    <div class="offcanvas offcanvas-start d-md-none" tabindex="-1" id="sidebarMenu">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title">Menu</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
        </div>
        <div class="offcanvas-body">
            <div class="nav-text d-flex flex-column gap-2">
                <div><i class="fa-solid fa-house p-2"></i><a href="#">Home</a></div>
                <div><i class="fa-solid fa-truck-moving p-2"></i><a href="#">Order</a></div>
                <div><i class="fa-solid fa-message p-2"></i><a href="#">Messages</a></div>
                <div><i class="fa-solid fa-wallet p-2"></i><a href="#">Payments</a></div>
                <div><i class="fa-solid fa-question p-2"></i><a href="#">Help</a></div>
                <div><i class="fa-solid fa-arrow-right-from-bracket p-2"></i><a href="logout.jsp" class="text-danger">Log out</a>
                </div>
            </div>
        </div>
    </div>

    <div class="d-none d-md-block col-md-3 col-xl-2 px-4 py-4 bg-white border-end position-fixed h-100">
        <h4 class="mb-4">Buyer Dashboard</h4>
        <div class="nav-text d-flex flex-column gap-2">
            <div><i class="fa-solid fa-house p-2"></i><a href="#">Home</a></div>
            <div><i class="fa-solid fa-truck-moving p-2"></i><a href="#order.html">Order</a></div>
            <div><i class="fa-solid fa-message p-2"></i><a href="#">Messages</a></div>
            <div><i class="fa-solid fa-wallet p-2"></i><a href="#">Payments</a></div>
            <div><i class="fa-solid fa-question p-2"></i><a href="#">Help</a></div>
            <div><i class="fa-solid fa-arrow-right-from-bracket p-2"></i><a href="logout.jsp" class="text-danger">Log out</a>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-9 offset-md-3 col-xl-10 offset-xl-2 py-4">
                <h2 class="text-success">Welcome back</h2>

                <div class="row mt-4 ">
                    <div class="heading">
                        <p class="fs-5 fw-bold">Your Activity</p>
                    </div>
                    <div class="col-md-4">
                        <div class="card text-center border-0 shadow-sm mb-4">
                            <div class="card-body">
                                <h5 class="card-title">Total Orders</h5>
                                <p class="card-text">10</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card text-center border-0 shadow-sm mb-4">
                            <div class="card-body">
                                <h5 class="card-title">Pending Orders</h5>
                                <p class="card-text">2</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card text-center border-0 shadow-sm mb-4">
                            <div class="card-body">
                                <h5 class="card-title">Order Complete</h5>
                                <p class="card-text">4</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Category Buttons -->
                <div class="container" id="order">
                    <p class="fs-5 fw-bold">Varieties</p>
                    <nav>
                      <ul class="nav gap-2">
                        <li class="nav-item"><a href="#vegetables" class="btn btn-outline-success">Vegetables</a></li>
                        <li class="nav-item"><a href="#fruits" class="btn btn-outline-success">Fruits</a></li>
                        <li class="nav-item"><a href="#dairy" class="btn btn-outline-success">Dairy Products</a></li>
                        <li class="nav-item"><a href="#crops" class="btn btn-outline-success">Crops</a></li>
                      </ul>
                    </nav>
                  </div>
                
                  <!-- Sections -->
                  <div class="container mt-4">
                    <div id="vegetables" class="category-section">
                      <h4>Vegetables</h4>
                      <div class="row">
                        <div class="col-md-4 col-lg-3">
                           <a href="ViewProduct.jsp"><img src="images/Admin/66e396b812e1a2185f9d97cf_6195cd0d036f0d118f936751_veget20815382.jpeg" class="img-fluid product-img" /></a> 
                        </div>
                         <div class="col-md-4 col-lg-3">
                            <a href="ViewProduct.jsp"><img src="images/Admin/vegitable.jpg" class="img-fluid product-img" /></a>   
                        </div>
                         <div class="col-md-4 col-lg-3">
                            <a href="ViewProduct.jsp"><img src="images/Admin/vegitable1.jpg" class="img-fluid product-img" /></a>
                        </div>
                         <div class="col-md-4 col-lg-3"> 
                           <a href="ViewProduct.jsp"><img src="images/Admin/vegitable2.jpg" class="img-fluid product-img" /></a>    
                        </div>
                        
                      </div>
                    </div>
                
                    <div id="fruits" class="category-section">
                      <h4>Fruits</h4>
                      <div class="row">
                        <div class="col-md-4 col-lg-3"> 
                           <a href="ViewProduct.jsp"><img src="images/Admin/Alphonso-Mango-plant.webp" class="img-fluid product-img" /></a>    
                        </div>
                        <div class="col-md-4 col-lg-3"> 
                           <a href="ViewProduct.jsp"><img src="images/Admin/Basket-Fruit.jpg" class="img-fluid product-img" /></a>    
                        </div>
                        <div class="col-md-4 col-lg-3"> 
                           <a href="ViewProduct.jsp"><img src="images/Admin/strawbarry.jpg" class="img-fluid product-img" /></a>    
                        </div>
                        <div class="col-md-4 col-lg-3"> 
                           <a href="ViewProduct.jsp"><img src="images/Admin/images.jpeg" class="img-fluid product-img" /></a>    
                        </div>
                      </div>
                    </div>
                
                    <div id="dairy" class="category-section">
                      <h4>Dairy Products</h4>
                      <div class="row">
                         <div class="col-md-4 col-lg-3"> 
                           <a href="ViewProduct.jsp"><img src="images/Admin/milk1.webp" class="img-fluid product-img" /></a>    
                        </div>
                        <div class="col-md-4 col-lg-3"> 
                           <a href="ViewProduct.jsp"><img src="images/Admin/eggs.jpg" class="img-fluid product-img" /></a>    
                        </div>
                        <div class="col-md-4 col-lg-3"> 
                           <a href="ViewProduct.jsp"><img src="images/Admin/shudh-desi-ghee-500x500.webp" class="img-fluid product-img" /></a>    
                        </div>
                        <div class="col-md-4 col-lg-3"> 
                           <a href="ViewProduct.jsp"><img src="images/Admin/dairy.jpg" class="img-fluid product-img" /></a>    
                        </div>
                      </div>
                    </div>
                
                    <div id="crops" class="category-section">
                      <h4>Crops</h4>
                      <div class="row">
                         <div class="col-md-4 col-lg-3"> 
                           <a href="ViewProduct.jsp"><img src="images/Admin/soya.jpg" class="img-fluid product-img" /></a>    
                        </div>
                         <div class="col-md-4 col-lg-3"> 
                           <a href="ViewProduct.jsp"><img src="images/Admin/sugarcane.jpg" class="img-fluid product-img" /></a>    
                        </div>
                         <div class="col-md-4 col-lg-3"> 
                           <a href="ViewProduct.jsp"><img src="images/Admin/onion-farming.webp" class="img-fluid product-img" /></a>    
                        </div>
                         <div class="col-md-4 col-lg-3"> 
                           <a href="ViewProduct.jsp"><img src="images/Admin/crop.jpg" class="img-fluid product-img" /></a>    
                        </div>
                      </div>
                    </div>
                  </div>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>