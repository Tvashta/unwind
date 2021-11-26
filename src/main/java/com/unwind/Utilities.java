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
	
	public static String getRole(int empid) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Select role from employee where empid=?");
			st.setInt(1, empid);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				return rs.getString("role");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
		}
	
	public static int getManager(String empid) {
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, username, password);
		PreparedStatement st = con.prepareStatement("Select manager_id from employee where empid=?;");
		st.setString(1, empid);
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			return rs.getInt(1);
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public static int getApprover(String empid, float days) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Select to_role from rules where from_role=(Select role from employee where empid=?) and from_leave<=? and to_leave>=?;");
			String apprRole="";
			st.setString(1, empid);
			st.setFloat(2, days);
			st.setFloat(3, days);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				apprRole= rs.getString(1);
			}
			if(apprRole.equals(""))
				return getManager(empid);
			else 
				if(apprRole.equals("Automatic"))
					return 0;
				else {
					int manager =getManager(empid);
					String mRole = getRole(manager);
					
					while(manager>0 && (!mRole.equals(apprRole))) {
						manager=getManager(String.valueOf(manager));
						mRole=getRole(manager);
					}
					if(manager==0)
						return getManager(empid);
					else
						return manager;
				}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static void applyLeave(String empid, String days, String reason) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			int approver = getApprover(empid,Float.valueOf(days));
			String stmt;
			if(approver!=0)
			stmt="Insert into leave_request(reqempid,reason,days,status,company_id,approver) values(?,?,?,0,(Select company_id from employee where empid=?),?);";
			else
			stmt="Insert into leave_request(reqempid,reason,days,status,company_id,approver) values(?,?,?,1,(Select company_id from employee where empid=?),?);";
			PreparedStatement st = con.prepareStatement(stmt);
			st.setString(1, empid);
			st.setString(2, reason);
			st.setString(3, days);
			st.setString(4, empid);
			st.setInt(5, approver);
			System.out.println(st);
			int rs = st.executeUpdate();
			System.out.println(rs);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	public static int totalLeaves(int empid) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Select sum(days) from leave_request where reqempid=? and status!=0;");
			st.setInt(1, empid);
			ResultSet rs = st.executeQuery();
			if(rs.next())
				return rs.getInt(1);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
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
	if(leaves.length()>2)
	leaves=  leaves.substring(0, leaves.length() - 1)+"]";
	else
		leaves+="]";
	System.out.println(leaves);
	return leaves;
	}
	
	public static String getApproveRequests(String uname) {
		String leaves="[";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("select id,reqempid,reason,days,status,name,role from leave_request r, employee e where e.empid=r.reqempid and approver = (Select empid from employee where email=?)");
			st.setString(1, uname);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				if(rs.getInt(5)==0)
				leaves+="["+rs.getInt(2)+",'"+rs.getString(3)+"',"+rs.getFloat(4)+","+rs.getInt(1)+",'"+rs.getString(6)+"','"+rs.getString(7)+"',"+(totalLeaves(rs.getInt("reqempid"))-20)+"],";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	leaves=  leaves.substring(0, leaves.length() - 1)+"]";
	return leaves;
	}
	
	public static void changeLeaveStatus(int id,int status) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Update leave_request set status=? where id=?;");
			st.setInt(1, status);
			st.setInt(2, id);
			int rs = st.executeUpdate();
			System.out.println(rs);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void deleteRoles(String uname) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Delete from roles where company_id=(Select company_id from company_admin where email = ?);");
			st.setString(1, uname);
			int rs = st.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void deleteRoleReports(String uname) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Delete from role_reports where company_id=(Select company_id from company_admin where email = ?);");
			st.setString(1, uname);
			int rs = st.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static boolean addRole(String uname, String role) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Insert into roles(role_name,company_id) values(?,(Select company_id from company_admin where email = ?));");
			st.setString(2, uname);
			st.setString(1, role);
			System.out.println(st);
			int rs = st.executeUpdate();
			System.out.println(rs);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static boolean addRule(String uname, String fromRole, String toRole, float from, float to) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Insert into rules(from_role, from_leave,to_leave,to_role,company_id) values(?,?,?,?,(Select company_id from company_admin where email = ?));");
			st.setString(5, uname);
			st.setString(1, fromRole);
			st.setString(4, toRole);
			st.setFloat(2, from);
			st.setFloat(3, to);
			System.out.println(st);
			int rs = st.executeUpdate();
			System.out.println(rs);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public static boolean addRoleReports(String uname, String role, String reports) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Insert into role_reports(role,reports,company_id) values(?,?,(Select company_id from company_admin where email = ?));");
			st.setString(2,reports.substring(1,reports.length()-1));
			st.setString(3, uname);
			st.setString(1, role.substring(1, role.length()-1));
			System.out.println(st);
			int rs = st.executeUpdate();
			System.out.println(rs);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static String getRoles(String uname) {
		String roles="";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Select * from roles where company_id = (Select company_id from company_admin where email=?)");
			st.setString(1, uname);
			System.out.println(st);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				roles+="'"+rs.getString(2)+"',";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	if(roles.length()>1)
	roles= "["+roles.substring(0, roles.length() - 1)+"]";
	else
		roles="[]";
	System.out.println(roles);
	return roles;
	}
	
	public static String getRoleReports(String uname) {
		String roles="";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Select * from role_reports where company_id = (Select company_id from company_admin where email=?)");
			st.setString(1, uname);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				roles+="['"+rs.getString(2)+"','"+rs.getString(3)+"'],";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	if(roles.length()>1)
	roles= "["+roles.substring(0, roles.length() - 1)+"]";
	else
		roles="[]";
	return roles;
	}
	
	public static void deleteEmployees(String uname) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Delete from employee where company_id=(Select company_id from company_admin where email = ?);");
			st.setString(1, uname);
			int rs = st.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static boolean updateEmployee(String uname, int empid, String name, String role, String reports, String email, String phno) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("INSERT INTO employee"
					+ "  (empid,name,role,manager_id,company_id,email,phno)"
					+ "VALUES"
					+ "  (?,?, ?, ?, (Select company_id from company_admin where email=?),?,?)"
					+ "ON DUPLICATE KEY UPDATE"
					+ "  name     = ?,"
					+ "  role = ?,"
					+ "  manager_id = ?,"
					+ "  email = ?,"
					+ "  phno=?;");
			st.setInt(1, empid);
			st.setString(2, name);
			st.setString(3, role);
			st.setString(4, reports);
			st.setString(5, uname);
			st.setString(6, email);
			st.setString(7, phno);
			st.setString(8, name);
			st.setString(9, role);
			st.setString(10, reports);
			st.setString(11, email);
			st.setString(12, phno);
			System.out.println(st);
			int rs = st.executeUpdate();
			System.out.println(rs);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static String getRules(String uname) {
		String rules="";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement st = con.prepareStatement("Select * from rules where company_id = (Select company_id from company_admin where email=?)");
			st.setString(1, uname);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				rules+="['"+rs.getString("from_role")+"',"+rs.getFloat("from_leave")+","+rs.getFloat("to_leave")+", '"+rs.getString("to_role")+"'],";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	if(rules.length()>1)
	rules= "["+rules.substring(0, rules.length() - 1)+"]";
	else
		rules="[]";
	return rules;
	}
	
	public static int totalLeaves(String uname) {
		return totalLeaves(Integer.valueOf(getEmpId(uname)));
	}
}
