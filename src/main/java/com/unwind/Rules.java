package com.unwind;

import java.io.IOException;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class Rules extends HttpServlet {	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String uname=session.getAttribute("username").toString();
		String fromRole = request.getParameter("fromRole");
		String toRole= request.getParameter("toRole");
		Float from,to;
		try {
			from = Float.valueOf(request.getParameter("from"));
		}catch(Exception e) {
			from=(float) 0;
		}
		try {
			to = Float.valueOf(request.getParameter("to"));
		}catch(Exception e) {
			to=(float) 0;
		}
		com.unwind.Utilities.addRule(uname, fromRole, toRole, from, to);
	}

}
