package com.unwind;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Register extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		String confpwd = request.getParameter("confpwd");
		String admin = request.getParameter("admin_flag"); 
		int admin_flag = 0;
		if(admin != null)admin_flag=1;
		LoginDB db = new LoginDB();
		HttpSession session = request.getSession();
		if(!pwd.equals(confpwd)) {
			session.setAttribute("error", "Password and confirm password must be the same");
			response.sendRedirect("login.jsp");
		}
		else if(db.checkUnique(uname)) {
			session.setAttribute("username", uname);
			if(db.register(uname,pwd,admin_flag)) {
				session.removeAttribute("error");
				if(admin_flag==1)
						response.sendRedirect("admin/company.jsp");
				else
				response.sendRedirect("employee/company.jsp");
			}
			else {
				session.setAttribute("error", "Can't register user");
				response.sendRedirect("login.jsp");
			}	
			
		}
		else {
			session.setAttribute("error", "User already exists!");
			response.sendRedirect("login.jsp");
		}
	}

}
