package com.unwind;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Login extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		System.out.println(uname+pwd);
		HttpSession session = request.getSession();
		LoginDB db = new LoginDB();
		if(db.check(uname, pwd)) {
			session.setAttribute("username", uname);
			session.removeAttribute("error");
			session.removeAttribute("errorSignin");
			if(db.checkAdmin(uname, pwd))
				response.sendRedirect("admin/company.jsp");
			else
			response.sendRedirect("employee/company.jsp");
		}
		else {
			session.setAttribute("errorSignin", "Invalid Credentials");
			response.sendRedirect("login.jsp");
		}
	}

}
