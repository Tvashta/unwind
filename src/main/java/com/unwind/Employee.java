package com.unwind;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Employee extends HttpServlet {
	static String url="jdbc:mysql://localhost:3306/unwind";
	static String username ="root";
	static String password = "root";
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/xml;charset=UTF-8");
	    PrintWriter writer = response.getWriter();
	    writer.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
	    writer.append("<employees>");
	    try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Select empid, name, role, manager_id,email,phno from employee where company_id = (Select company_id from company_admin where email =?)");
			st.setString(1, session.getAttribute("username").toString());
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				writer.append("<employee>");
			    writer.append("<id>").append(rs.getString("empid")).append("</id>");
			    writer.append("<name>").append(rs.getString("name")).append("</name>");
			    writer.append("<role>").append(rs.getString("role")).append("</role>");
			    writer.append("<reports>").append(rs.getString("manager_id")).append("</reports>");
			    writer.append("<email>").append(rs.getString("email")).append("</email>");
			    writer.append("<phno>").append(rs.getString("phno")).append("</phno>");
			    writer.append("</employee>");
			}
	    } catch (Exception e) {
			e.printStackTrace();
		}
	    writer.append("</employees>");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String[] employees = request.getParameter("employees").substring(1,request.getParameter("employees").length()-1).split("},");
		String uname=session.getAttribute("username").toString();
		com.unwind.Utilities.deleteEmployees(uname);
		for(int i=0;i<employees.length;i++) {
			String [] emp = employees[i].substring(1, employees[i].length()-1).split(",");
			int id = Integer.parseInt(emp[0].split(":")[1].replaceAll("^\"|\"$", ""));
			String name = emp[1].split(":")[1].replaceAll("^\"|\"$", "");
			String role = emp[2].split(":")[1].replaceAll("^\"|\"$", "");
			String reports = emp[3].split(":")[1].replaceAll("^\"|\"$", "");
			String email = emp[4].split(":")[1].replaceAll("^\"|\"$", "");
			String phno = emp[5].split(":")[1].replaceAll("^\"|\"$", "");
			System.out.println(id+name+role+reports+email+phno);
			if(reports.equals("None")|| reports.equals("null")||reports.equals(""))reports=null;
			com.unwind.Utilities.updateEmployee(uname, id, name, role, reports,email,phno);
		}
	}

}
