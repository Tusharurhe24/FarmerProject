//package com.servlect;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.db.DbConnect;
//
//@WebServlet("/LoginServlet")
//public class LoginServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//        String role = request.getParameter("role");
//
//        try (Connection con = DbConnect.getConnection()) {
//            PreparedStatement ps = con.prepareStatement(
//                "SELECT * FROM users WHERE email = ? AND password = ? AND role = ?"
//            );
//            ps.setString(1, email);
//            ps.setString(2, password);
//            ps.setString(3, role);
//
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//            	int userId = rs.getInt("user_Id");
//                HttpSession session = request.getSession();
//                String name = rs.getString("name");
//                session.setAttribute("userId", userId);
//                session.setAttribute("user", name);
//                session.setAttribute("role", role);
//
//                switch (role.toLowerCase()) {
//                
//                    case "farmer":
//                    	System.out.println("Redirecting to: Farmer.jsp");
//
//                        response.sendRedirect("Farmer.jsp");
//                        break;
//                    case "buyer":
//                        response.sendRedirect("Buyer.jsp");
//                        break;
//                    case "admin":
//                        response.sendRedirect("Welcome.jsp");
//                        break;
//                    default:
//                        response.sendRedirect("login.jsp?error=1");
//                }
//            } else {
//                response.sendRedirect("login.jsp?error=1");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.sendRedirect("login.jsp?error=server");
//        }
//    }
//}

package com.servlect;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.db.DbConnect;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try (Connection con = DbConnect.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE email = ? AND password = ? AND role = ?"
            );
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3, role);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int userId = rs.getInt("user_id"); // make sure this matches your column name
                String name = rs.getString("name");

                HttpSession session = request.getSession();
                session.setAttribute("userId", userId);
                session.setAttribute("user", name);
                session.setAttribute("role", role);

                switch (role.toLowerCase()) {
                    case "farmer":
                        // ✅ Fetch farmerId from farmers table
                        PreparedStatement farmerPs = con.prepareStatement(
                            "SELECT id FROM farmers WHERE user_id = ?"
                        );
                        farmerPs.setInt(1, userId);
                        ResultSet farmerRs = farmerPs.executeQuery();

                        if (farmerRs.next()) {
                            int farmerId = farmerRs.getInt("id");
                            session.setAttribute("farmerId", farmerId); // ✅ Important for ProductServlet
                        } else {
                            // Farmer exists in users but not in farmers table
                            response.sendRedirect("login.jsp?error=farmer_missing");
                            return;
                        }

                        System.out.println("Redirecting to: Farmer.jsp");
                        response.sendRedirect("Farmer.jsp");
                        break;

                    case "buyer":
                        response.sendRedirect("Buyer.jsp");
                        break;

                    case "admin":
                        response.sendRedirect("Welcome.jsp");
                        break;

                    default:
                        response.sendRedirect("login.jsp?error=1");
                }

            } else {
                response.sendRedirect("login.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=server");
        }
    }
}

