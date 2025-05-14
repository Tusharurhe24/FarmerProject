<%@ page import="java.sql.*" %>
<%@ page import="com.db.DbConnect"%>
<%@ page session="true" %>
<%
    // Move logic before HTML rendering to prevent redirect issues
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DbConnect.getConnection();
            ps = con.prepareStatement("SELECT * FROM users WHERE email = ? AND password = ? AND role = ?");
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3, role);

            rs = ps.executeQuery();
            if (rs.next()) {
                session.setAttribute("user", email);
                session.setAttribute("role", role);

                if ("Farmer".equalsIgnoreCase(role)) {
                    response.sendRedirect("Farmer.jsp");
                    return;
                } else if ("Buyer".equalsIgnoreCase(role)) {
                    response.sendRedirect("Buyer.jsp");
                    return;
                } else if ("Admin".equalsIgnoreCase(role)) {
                    response.sendRedirect("Welcome.jsp");
                    return;
                }
            } else {
                // Failed login
                response.sendRedirect("login.jsp?error=1");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=server");
            return;
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {}
            if (ps != null) try { ps.close(); } catch (SQLException e) {}
            if (con != null) try { con.close(); } catch (SQLException e) {}
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <%@include file="componant/allcss.jsp" %>
    <style>
       /* body {
            background: #f8f9fa;
        }
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        } */
        
        
        body {
    background: linear-gradient(to right, rgba(125, 130, 122, 0.582), rgba(125, 130, 122, 0.582)), 
    url('images/login/login background.jpg') no-repeat center center/cover;
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
}


.row {
    height: 100vh;
}

.login-box {
    background-color: #ffffff;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

/* Input and Select Styling */
input, select {
    width: 100%;
    margin: 10px 0;
    padding: 12px;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 16px;
}

/* Button Styling */
button {
    padding: 10px;
    font-size: 16px;
    font-weight: bold;
    border: none;
    border-radius: 5px;
    background-color: #28a745;
    color: #fff;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #218838;
}

/* Responsive Design */
@media (max-width: 768px) {
    .login-box {
        padding: 15px;
    }

    input, select {
        font-size: 14px;
    }

    button {
        font-size: 14px;
    }
}
        
    </style>
</head>
<body>
   <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-12 col-md-6 col-lg-5">
                <div class="login-box shadow p-4 rounded">
                    <h2 class="text-center mb-4 text-success">Login</h2>
            <%-- Display error if login failed --%>
            <%
                String error = request.getParameter("error");
                if ("1".equals(error)) {
            %>
                <div class="alert alert-danger text-center">Invalid email, password, or role.</div>
            <% } else if ("server".equals(error)) { %>
                <div class="alert alert-danger text-center">Server error. Please try again later.</div>
            <% } %>

            <form action="LoginServlet" method="POST">
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" name="email" placeholder="Enter Your Email" class="form-control" required>
                        </div>
                        <div class="mb-3">
                             <label for="password" class="form-label">Password</label>
                            <input type="password" name="password" placeholder="Enter Your Password" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label for="role" class="form-label">Login As</label>
                            <select name="role" id="role" class="form-select" required>
                               
                                <option value="farmer">Farmer</option>
                                <option value="buyer">Buyer</option>
                                <option value="admin">Admin</option>
                            </select>
                        </div>
                       <div class="mb-3">
                    <a href="forgetPassword.jsp">Forgot Password?</a>
                </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-success w-100">Login</button>
                        </div>
                    </form>
        </div>
    </div>
    </div>
    </div>
  
</body>
</html>
