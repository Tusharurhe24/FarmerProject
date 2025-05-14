//package com.servlect;
//
//import java.io.*;
//import java.math.BigDecimal;
//import java.sql.*;
//import javax.servlet.*;
//import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.*;
//
//import com.db.DbConnect;
//
//@WebServlet("/ProductServlet")
//@MultipartConfig
//public class ProductServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        // Retrieve form data
//        String name = request.getParameter("Name");
//        String category = request.getParameter("Category");
//        BigDecimal price = new BigDecimal(request.getParameter("price"));
//        int quantity = Integer.parseInt(request.getParameter("quantity"));
//        String desc = request.getParameter("description");
//        Part imagePart = request.getPart("imageInput");
//        InputStream imageInputStream = imagePart.getInputStream();
//        int farmerId = (int) request.getSession().getAttribute("farmerId");
//
//        Connection con = null;
//        PreparedStatement ps = null;
//
//        try {
//            con = DbConnect.getConnection();
//
//            // Insert into products table
// 
//
//            String sql = "INSERT INTO products (name, category, price, quantity, description, image, farmer_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
//            ps = con.prepareStatement(sql);
//
//            ps.setString(1, name);
//            ps.setString(2, category);
//            ps.setBigDecimal(3, price);
//            ps.setInt(4, quantity);
//            ps.setString(5, desc);
//            ps.setBlob(6, imageInputStream);
//            ps.setInt(7, farmerId);
//            
//           
//
//            int i = ps.executeUpdate();
//            if (i > 0) {
//                response.sendRedirect("ViewProduct.jsp"); 
//            } else {
//                response.getWriter().println("Failed to insert data.");
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace(response.getWriter());
//        } finally {
//            try { if (ps != null) ps.close(); } catch (SQLException e) { e.printStackTrace(); }
//            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
//        }
//    }
//}

package com.servlect;

import java.io.*;
import java.math.BigDecimal;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.db.DbConnect;

@WebServlet("/ProductServlet")
@MultipartConfig
public class ProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("farmerId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int farmerId = (Integer) session.getAttribute("farmerId");  

       
        String name = request.getParameter("Name");
        String category = request.getParameter("Category");
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String desc = request.getParameter("description");

        Part imagePart = request.getPart("imageInput");
        InputStream imageInputStream = imagePart.getInputStream();

        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DbConnect.getConnection();

            String sql = "INSERT INTO products (name, category, price, quantity, description, image, farmer_id) VALUES (?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, category);
            ps.setBigDecimal(3, price);
            ps.setInt(4, quantity);
            ps.setString(5, desc);
            ps.setBlob(6, imageInputStream);
            ps.setInt(7, farmerId);  // ✅ link product to the logged-in farmer

            int i = ps.executeUpdate();
            if (i > 0) {
                response.sendRedirect("ViewProduct.jsp");  // or wherever you list products
            } else {
                response.getWriter().println("Failed to insert product.");
            }

        } catch (Exception e) {
            e.printStackTrace(response.getWriter());  // Debugging info
        } finally {
            try { if (ps != null) ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
}

