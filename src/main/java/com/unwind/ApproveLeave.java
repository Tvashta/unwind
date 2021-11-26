package com.unwind;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ApproveLeave extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int status = Integer.valueOf(request.getParameter("status"));
		int id = Integer.valueOf(request.getParameter("id"));
		System.out.println(status+id);
		com.unwind.Utilities.changeLeaveStatus(id, status);
		RequestDispatcher view = request.getRequestDispatcher("employee/company.jsp");
		view.forward(request, response);
	}

}
