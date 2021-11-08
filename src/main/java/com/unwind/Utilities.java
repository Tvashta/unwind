package com.unwind;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Hashtable;

import jakarta.servlet.http.HttpSession;

public class Utilities {
	
	static String url="jdbc:mysql://localhost:3306/unwind";
	static String username ="root";
	static String password = "root";
	
	public static String days(int company_id, int option) {
		Hashtable<String, String> opt = new Hashtable<>();
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, username, password);
				PreparedStatement st = con.prepareStatement("Select * from calender where compulsary_option=? and company_id=?");
				st.setInt(1, option);
				st.setInt(2, company_id);
				ResultSet rs = st.executeQuery();
				while(rs.next()) {
					Date date = rs.getDate(3);
					LocalDate localDate = date.toLocalDate();
					opt.put(String.valueOf(localDate.getDayOfMonth()),rs.getString(2));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		String days="[";
		int flag=0;
		for (String key : opt.keySet()) {
           days+="["+key+",'"+opt.get(key)+"'],";
           flag=1;
        }
		if(flag==1)
		days=  days.substring(0, days.length() - 1)+"]";
		return days;
	}
	
	public static String profile(int company_id, String uname) {
		String profile="{";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Select * from employee where email=? and company_id=?");
			st.setString(1, uname);
			st.setInt(2, company_id);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				profile+="name:'"+rs.getString(2)+"', email:'"+uname+"', role:'"+rs.getString(4)+"', phno: '"+rs.getString(5)+"'";
				
			}
			else {
				profile+="name: '', email:'', role:'', phno:''";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	profile+="}";
	System.out.println(profile);
	return profile;
		
	}
	
	public static String getEmpId(String uname) {
		String empid="";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Select * from employee where email=?");
			st.setString(1, uname);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				empid= String.valueOf(rs.getInt(1));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	System.out.println(empid);
	return empid;
	}

	public static void applyLeave(String empid, String days, String reason) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Insert into leave_request(reqempid,reason,days,status,company_id,approver) values(?,?,?,0,(Select company_id from employee where empid=?),'boss@ceo.com');");
			st.setString(1, empid);
			st.setString(2, reason);
			st.setString(3, days);
			st.setString(4, empid);
			int rs = st.executeUpdate();
			System.out.println(rs);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static String getLeaveRequests(String uname) {
		String leaves="[";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Select * from leave_request where reqempid = (Select empid from employee where email=?)");
			st.setString(1, uname);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				leaves+="["+rs.getInt(1)+",'"+rs.getString(3)+"',"+rs.getFloat(4)+",";
				if(rs.getInt(5)==0)
					leaves+="'Pending'";
				else if(rs.getInt(5)==-1)
					leaves+="'Rejected'";
				else if(rs.getInt(5)==1)
					leaves+="'Approved'";
				leaves+="],";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	leaves=  leaves.substring(0, leaves.length() - 1)+"]";
	System.out.println(leaves);
	return leaves;
	}
}
