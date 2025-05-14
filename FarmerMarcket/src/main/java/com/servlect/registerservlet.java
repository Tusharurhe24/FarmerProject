package com.servlect;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.db.DbConnect;

@WebServlet("/registerservlet")
public class registerservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("number");
        String role = request.getParameter("role");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DbConnect.getConnection();
            if (con == null) {
                response.getWriter().println("Database connection is null. Please check your settings.");
                return;
            }

            String userInsertQuery = "INSERT INTO users (name, email, password, phone, role) VALUES (?, ?, ?, ?, ?)";
            ps = con.prepareStatement(userInsertQuery, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, phone);
            ps.setString(5, role);
            int rows = ps.executeUpdate();

            if (rows > 0) {
                rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int userId = rs.getInt(1);

                    if ("Farmer".equalsIgnoreCase(role)) {
                        String farmerInsertQuery = "INSERT INTO farmers (user_id) VALUES (?)";
                        try (PreparedStatement farmerPs = con.prepareStatement(farmerInsertQuery)) {
                            farmerPs.setInt(1, userId);
                            farmerPs.executeUpdate();
                        }
                    }

                    response.sendRedirect("login.jsp");
                } else {
                    response.getWriter().println("User registered, but could not get user ID.");
                }
            } else {
                response.getWriter().println("Failed to insert user.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (con != null) con.close(); } catch (Exception e) {}
        }
    }
}
