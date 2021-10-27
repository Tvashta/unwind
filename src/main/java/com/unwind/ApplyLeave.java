package com.unwind;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class ApplyLeave extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String empid = request.getParameter("empid");
		String days = request.getParameter("days");
		String reason = request.getParameter("reason");
		HttpSession session = request.getSession();
		if(days!="" && empid!="" && reason!="") {
			com.unwind.Utilities.applyLeave(empid,days,reason);
			session.removeAttribute("error");
			response.sendRedirect("employee/applyLeave.jsp");
		}
		else {
			session.setAttribute("error","Please fill in all details");
			response.sendRedirect("employee/applyLeave.jsp");
		}
		
	}

}
