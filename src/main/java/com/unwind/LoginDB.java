package com.unwind;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDB {
	String url="jdbc:mysql://localhost:3306/unwind";
	String username ="root";
	String password = "root";
	public boolean check(String uname, String pwd) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Select * from users where uname=? and pwd=?");
			st.setString(1, uname);
			st.setString(2, pwd);
			ResultSet rs = st.executeQuery();
			if(rs.next())return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean checkAdmin(String uname, String pwd) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Select * from users where admin_flag=true and uname=? and pwd=?");
			st.setString(1, uname);
			st.setString(2, pwd);
			ResultSet rs = st.executeQuery();
			if(rs.next())return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean checkUnique(String uname) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Select * from users where uname=?");
			st.setString(1, uname);
			ResultSet rs = st.executeQuery();
			if(rs.next())return false;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	public boolean register(String uname, String pwd, int admin_flag) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Insert into users(uname,pwd,admin_flag) values(?,?,?);");
			st.setString(1, uname);
			st.setString(2, pwd);
			st.setLong(3, admin_flag);
			int rs = st.executeUpdate();
			System.out.println(rs);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean editProfile(String email, String name, String phno) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Update employee set name=?,phno=? where email=?;");
			st.setString(3, email);
			st.setString(1, name);
			st.setString(2, phno);
			int rs = st.executeUpdate();
			System.out.println(rs);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
