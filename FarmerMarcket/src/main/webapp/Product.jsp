<%@ page import="java.sql.*, com.db.DbConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="componant/allcss.jsp" %>

<%@ include file="componant/navbar.jsp" %>
<section class="product-section">
    <div class="container prod-container">
        <div class="heading-container">
            <h2 class="text-center">Add Product</h2>
        </div>

        <div class="row justify-content-center align-items-center">
            <div class="col-12 col-md-12 col-lg-6">
                <form action="ProductServlet" method="POST" enctype="multipart/form-data">
                    <label for="Name">Product Name</label>
                    <input type="text" id="Name" name="Name" placeholder="Product Name" required>

                    <label for="Category">Category</label>
                    <select id="Category" name="Category">
                        <option value="fruits">Fruits</option>
                        <option value="vegetables">Vegetables</option>
                        <option value="crops">Crops</option>
                    </select>

                    <label for="price">Price</label>
                    <input type="text" id="price" name="price" placeholder="Rs.00" required>

                    <label for="quantity">Quantity</label>
                    <input type="text" id="quantity" name="quantity" placeholder="0 Kg" required>

                    <label for="description">Description</label>
                    <textarea id="description" name="description" rows="6" placeholder="Description"></textarea>

                    <label for="imageInput" class="pe-auto">Upload Image</label>
                    <input type="file" id="imageInput" name="imageInput" accept="image/*">

                   <div class="btns d-flex justify-content-between m-2">
                    <button type="submit" name="submit" class="btn btn-success">Submit</button>
                    <a class="btn btn-Primary rounded-pill" href="ViewProduct.jsp">View Product</a>
                    </div>
                </form>
            </div>

            <div class="col-12 col-md-12 col-lg-6">
                <img src="./images/product.jpg" class="img-fluid d-none d-lg-inline" alt="Product Image">
            </div>
        </div>
    </div>
</section>
