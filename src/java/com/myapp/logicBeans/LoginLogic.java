/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.logicBeans;
import java.sql.*;
/**
 *
 * @author Administrator
 */
public class LoginLogic {
    public boolean login(String mobile,String password){
        DatabaseConn dbc = new DatabaseConn();
        return dbc.login(mobile,password);
    }
}
