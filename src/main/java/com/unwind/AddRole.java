package com.unwind;

import java.io.IOException;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AddRole extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String[] roles = request.getParameterValues("roles[]");
		String uname=session.getAttribute("username").toString();
		com.unwind.Utilities.deleteRoles(uname);
		for(int i=0;i<roles.length;i++) {
			com.unwind.Utilities.addRole(uname,roles[i]);
			System.out.println(roles[i]);
		}
		com.unwind.Utilities.deleteRoleReports(uname);
		String[] roleReports =request.getParameter("roleReports").substring(1, request.getParameter("roleReports").length() - 1).split(",");
		for(int i=0;i<roleReports.length;i++) {
			if(roleReports[i].split(":").length>1) {
				String role = roleReports[i].split(":")[0];
				String reports = roleReports[i].split(":")[1];
				com.unwind.Utilities.addRoleReports(uname, role, reports);
			}
		}
		response.sendRedirect("admin/company.jsp");	
		}

}
