package com.myapp.logicBeans;

import java.sql.*;

public class DatabaseConn {
	private Connection conn;
	public DatabaseConn() {
		conn=null;
		try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/irctc","root","root");
		}catch(Exception e) {
			System.out.println("connection error: "+e);
		}
	}
	public boolean mobileExists(String mobile) {
		boolean exists=false;
		Statement stmt;
		ResultSet rs;
		try {
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select * from user where mobile='"+mobile+"';");
		if(rs.next()){
			exists = true;
		}
		}catch(Exception e){
            System.out.println("Registration error......."+e);
        }
		return exists;
	}

    public boolean login(String mobile,String password) {
        ResultSet rs;
        Statement stmt;
        boolean flag=false;
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from user where mobile='"+mobile+"';");
            if(rs.next()){
                if(rs.getString("password").equals(password)){
                    flag=true;
                }
            }
        }catch(Exception e){
            System.out.println("login: "+e);
        }
        return flag;
    }

    
}
