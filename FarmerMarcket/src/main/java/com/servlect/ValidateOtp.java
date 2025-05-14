package com.servlect;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ValidateOtp")
public class ValidateOtp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int enteredOtp = Integer.parseInt(request.getParameter("otp"));
		HttpSession session = request.getSession();
		int sessionOtp = (int) session.getAttribute("otp");

		RequestDispatcher dispatcher;

		if (enteredOtp == sessionOtp) {
			// Email is already stored in session by ForgotPassword servlet
			String email = (String) session.getAttribute("email");
			System.out.println("OTP validated for email: " + email);

			request.setAttribute("status", "success");
			dispatcher = request.getRequestDispatcher("newPassword.jsp");
			dispatcher.forward(request, response);
		} else {
			request.setAttribute("message", "Wrong OTP. Please try again.");
			dispatcher = request.getRequestDispatcher("EnterOtp.jsp");
			dispatcher.forward(request, response);
		}
	}
}
