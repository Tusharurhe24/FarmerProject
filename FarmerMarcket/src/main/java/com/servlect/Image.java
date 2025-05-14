package com.servlect; // ← Replace with your actual package

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import com.db.DbConnect;

@WebServlet("/image")
public class Image extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing product ID");
            return;
        }

        try {
            int productId = Integer.parseInt(idParam);

            try (Connection con = DbConnect.getConnection()) {
                String query = "SELECT image FROM products WHERE id = ?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, productId);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    Blob imageBlob = rs.getBlob("image");
                    if (imageBlob != null) {
                        response.setContentType("image/jpeg"); 
                        response.setHeader("Cache-Control", "no-cache");

                        try (InputStream is = imageBlob.getBinaryStream();
                             OutputStream os = response.getOutputStream()) {

                            byte[] buffer = new byte[4096];
                            int bytesRead;
                            while ((bytesRead = is.read(buffer)) != -1) {
                                os.write(buffer, 0, bytesRead);
                            }
                            os.flush();
                        }
                    } else {
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "No image found");
                    }
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
                }

                rs.close();
                ps.close();
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }
}
