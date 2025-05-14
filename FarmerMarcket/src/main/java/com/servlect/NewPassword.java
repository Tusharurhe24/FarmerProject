package com.servlect;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		

		System.out.println("New Password: " + newPassword);


			try {
				Class.forName("com.mysql.jdbc.Driver");

				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/farmermarcket", "root", "tushar@0088");

				PreparedStatement pst = con.prepareStatement("UPDATE users SET password = ? WHERE email = ?");
				pst.setString(1, newPassword);
				String email = (String) session.getAttribute("email");
				System.out.println("Email in session: " + email);
				pst.setString(2, email);

				int rowCount = pst.executeUpdate();
				System.out.println("Password reset row count: " + rowCount);

				if (rowCount > 0) {
					System.out.println("Redirecting to login.jsp");
					response.sendRedirect("login.jsp?status=resetSuccess");
				} else {
					System.out.println("Redirecting to login.jsp with resetFailed");
					response.sendRedirect("login.jsp?status=resetFailed");
				}

				pst.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

