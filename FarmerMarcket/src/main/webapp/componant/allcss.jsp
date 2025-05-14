 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">     
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- Navbar Css -->
<style>
body {
  background-color: #f0fff0;
}
.navbar {
    background-color: #f1f8f4;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
  }

  .navbar-brand img {
    height: 50px;
    object-fit: contain;
  }

  .btn-outline-success {
    border-radius: 20px;
    border-color: #28a745;
    color: #28a745;
  }

  .btn-outline-success:hover {
    background-color: #28a745;
    color: white;
  }

  .btn-success,
  .btn-light {
    border-radius: 20px;
    padding: 6px 16px;
  }

  .btn-success {
    background-color: #28a745;
    border: none;
  }

  .btn-light {
    background-color: #ffffff;
    border: 1px solid #ced4da;
  }

  .btn-light:hover {
    background-color: #e9ecef;
  }

  .navbar-toggler {
    border: none;
  }

  .navbar-toggler-icon {
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%2328a745' viewBox='0 0 30 30'%3e%3cpath stroke='rgba%280,0,0,0.5%29' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
  }
  
  <!-- Hero Section Css -->
  
  .hero-section .carousel-item img {
    height: 70vh;
    object-fit: cover;
  }
  
  <!-- Product Section Css -->
  label {
    font-size: 1rem;
    padding-bottom: 8px;
}

input,
select,
textarea {
    font-size: 1.5rem;
    padding: 4px;
    width: 100%;
    outline: none;
}

input:hover,
select:hover,
textarea:hover {

}

.pe-auto {
    cursor: pointer;
    color: green;
}
  
  
  <!-- Sell Section Css -->
  
   .psell {
    font-size: 2.5rem;
    font-weight: 700;
  }
  
  <!-- View Product Section Css -->
  
   table th td{
    border: 2px solid green; 
    width: 100%;
  }
  tab{
    background-color: #28a745;
  }
  .container table td img{
    object-fit: cover;
    border-radius: 50%;
    width: 4rem;
    height: 4rem;
  }
  table td button{
    font-size: 8px;
  }
  
  <!-- Cart Page Css -->
  .img-cart{
  width:100%;
  height:100%;
  object-fit:cover;
  }
  .btn-edit{
  background-color:	#0dcaf0;
  }
  .btn-edit:hover{
  background-color:#069cbae0;
  }
  
  <!-- Buyer section Css Start -->
  
  <!-- Buyer Hero Section Css -->
  
  .heroimg img{
   border-radius: 10px;
   margin-top: 15px;
  }

  .herodetail{
    top: 65%;
    left: 22vw;
    font-size: 20px;
    right: 19vw;
    text-align: center;
  }
   .psell{
    font-size: 2.5rem;
    font-weight: 700;
  }
  .psell{
    color: #198754;
  }
  .prodsell{
    color: #B1F0F7;
  }

.pimg{
  height: 200px;
  width: 100%;
  object-fit: cover;
  border-radius: 10px;
}

  <!-- Admin Section Css -->

  a{
    text-decoration: none;
  }
  li{
    list-style: none;
  }
  .sidebar-link {
    color: #1f4b2e;
    font-weight: 500;
    display: flex;
    align-items: center;
    gap: 0.5rem;
    margin-bottom: 1rem;
  }
  .sidebar-link:hover {
    color: #3c7c47;
  }

  .offcanvas {
    background-color: #f3f8ef; /* light green background */
    max-width: 70%;
  }
  .nav-text a{
    color: #03861f;
    font-size: 20px!important;
    font-weight: 500;
  }
  .card{

    border: 1px solid #164124; /* dark green border */
    border-radius: 10px;
    padding: 20px;
    margin-bottom: 20px;
  }
  .category-section {
    display: none;
  }

  .category-section:target {
    display: block;
  }
  body:not(:has(:target)) #vegetables {
    display: block;
  }
  .product-img{
    width: 100%;
    height: 200px;
    object-fit: cover;
    border-radius: 10px;
  }
  
  .address-container {
    margin-top: 50px;
    padding: 20px;
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}


.address-box {
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    background-color: #f9f9f9;
    margin-bottom: 20px;
}

.address-box h5 {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 15px;
}

.address-box input[type="text"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}


.addressdetail-box {
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    background-color: #f9f9f9;
}

.addressdetail-box p {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 15px;
}

.addressdetail-box table {
    width: 100%;
    margin-bottom: 20px;
    border-collapse: collapse;
}

.addressdetail-box table td {
    padding: 8px;
    border-bottom: 1px solid #ddd;
}

.addressdetail-box table .total td {
    font-weight: bold;
    color: #28a745;
}

.addressdetail-box a {
    display: inline-block;
    text-align: center;
    padding: 10px 20px;
    color: #fff;
    background-color: #28a745;
    border: none;
    border-radius: 4px;
    text-decoration: none;
    font-weight: bold;
}

.addressdetail-box a:hover {
    background-color: #218838;
}

</style> 
<script src="script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>