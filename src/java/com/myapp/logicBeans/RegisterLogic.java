package com.myapp.logicBeans;
import java.sql.*;
public class RegisterLogic {
	public boolean exists(String mobile) {
		DatabaseConn dbc = new DatabaseConn();
		return dbc.mobileExists(mobile);
	}
}
