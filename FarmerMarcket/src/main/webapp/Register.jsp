<%@ page import="java.sql.*" %>
<%@ page import="com.db.DbConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Farmer2Market - Registration</title>
    <%@ include file="componant/allcss.jsp" %>
</head>
<style>
.registation {
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: aqua;
    min-height: 100vh;
}
.container {
    background-color: #ffffff;
    text-align: center;
    padding: 32px;
}
.icon {
    display: flex;
    justify-content: center;
    align-items: center;
}
input, select {
    width: 90%;
    padding: 8px;
    margin: 8px !important;
    border: none;
    outline: none;
    border-bottom: 2px solid green;
}

</style>

<body>


<section class="registation">
    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-12 col-md-6 col-lg-5">
                <h2>Registration Form</h2>
                <form action="registerservlet" method="post">
                    <div class="icon">
                        <i class="fa-solid fa-user"></i>
                        <input type="text" placeholder="Enter Your Name" required name="name">
                    </div>
                    <div class="icon">
                        <i class="fa-solid fa-envelope"></i>
                        <input type="email" placeholder="Enter Your Email" required name="email">
                    </div>
                    <div class="icon">
                        <i class="fa-solid fa-key"></i>
                        <input type="password" placeholder="Enter Your Password" required name="password">
                    </div>
                    <div class="icon">
                        <i class="fa-solid fa-phone"></i>
                        <input type="number" placeholder="Enter Your Phone" required name="number">
                    </div>
                    <div class="icon">
                        <div class="role-icon">
                            <i id="roleIcon" class="fa-solid fa-tractor"></i>
                        </div>
                        <select name="role" id="roleSelect" onchange="updateRoleIcon()">
                            <option value="farmer">Farmer</option>
                            <option value="buyer">Buyer</option>
                            <option value="admin">Admin</option>
                        </select>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-success w-50 mt-3" name="submit">Sign Up</button>
                    </div>
                    <p class="text-center mt-3">Already have an account? <a class="btn btn-primary" href="login.jsp">Login</a></p>
                </form>
            </div>
            <div class="col-md-6 col-lg-6">
                <div class="img-box d-none d-sm-block">
                    <img src="images/RKM-EF-Frame.png" alt="" class="img-fluid">
                </div>
            </div>
        </div>
    </div>
</section>

<script>
   
    function updateRoleIcon() {
        var roleSelect = document.getElementById("roleSelect");
        var roleIcon = document.getElementById("roleIcon");
        if (roleSelect.value === "farmer") {
            roleIcon.className = "fa-solid fa-tractor";
        } else if (roleSelect.value === "buyer") {
            roleIcon.className = "fa-solid fa-shopping-cart";
        } else {
            roleIcon.className = "fa-solid fa-cogs";
        }
    }
</script>

</body>
</html>
