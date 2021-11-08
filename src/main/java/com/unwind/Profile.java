package com.unwind;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Profile extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email=(String) session.getAttribute("username");
		String name = request.getParameter("name");
		String phno = request.getParameter("phno");
		LoginDB db = new LoginDB();
		if(db.editProfile(email,name,phno)) {
				response.sendRedirect("employee/employeeProfile.jsp");
		}
		else {
			response.sendRedirect("login.jsp");
		}
	}

}
