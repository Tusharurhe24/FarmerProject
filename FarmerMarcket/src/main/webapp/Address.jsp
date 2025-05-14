<%@ page language="java" %>
<%
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Enter Address</title>
    <%@include file="componant/allcss.jsp" %>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        function fetchProductDetails(productId) {
            $.ajax({
                url: 'getProductDetails.jsp',
                method: 'POST',
                data: { productId: productId },
                success: function(response) {
                    $("#priceDetails").html(response);
                }
            });
        }

        $(document).ready(function() {
            const urlParams = new URLSearchParams(window.location.search);
            const productId = urlParams.get('productId');
            if (productId) {
                fetchProductDetails(productId);
                $("#productId").val(productId); // Set hidden field value
            }
        });
    </script>
</head>
<body>
<%@include file="componant/navbar.jsp" %>

<div class="container address-container mt-4">
    <div class="row">
        <!-- Address Form -->
        <div class="col-md-6">
            <div class="address-box p-3 shadow rounded">
                <h5>CONTACT DETAILS</h5>
                <form action="ProcessAddress.jsp" method="post">
                    <input type="hidden" name="productId" id="productId" value="">
                    <div><input type="text" name="username" placeholder="Name" class="form-control mb-2" required></div>
                    <div><input type="text" name="mobile" placeholder="Mobile No" class="form-control mb-2" required></div>
                    <p class="mt-3 mb-1">ADDRESS</p>
                    <div><input type="text" name="pincode" placeholder="Pin code" class="form-control mb-2" required></div>
                    <div><input type="text" name="address" placeholder="Address" class="form-control mb-2" required></div>
                    <div><input type="text" name="locality" placeholder="Locality/Town" class="form-control mb-2" required></div>
                    <button type="submit" class="btn btn-success mt-3">Submit</button>
                </form>
            </div>
        </div>

        <!-- Price Details -->
        <div class="col-md-6">
            <div class="addressdetail-box p-3 shadow rounded" id="priceDetails">
                <p>Loading product details...</p>
            </div>
        </div>
    </div>
</div>

</body>
</html>
