/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.formBeans;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.*;

/**
 *
 * @author Administrator
 */
public class LoginForm extends ActionForm{
    private String mobile,password;
    public void setMobile(String mobile){
        this.mobile = mobile;
    }
    public void setPassword(String password){
        this.password = password;
    }
    public String getPassword(){
        return password;
    }
    public String getMobile(){
        return mobile;
    }
    @Override
    public ActionErrors validate(ActionMapping mapping,HttpServletRequest request){
        ActionErrors errors = new ActionErrors();
        if(mobile.length()!=10){
            errors.add("loginMobileSizeError",new ActionMessage("loginError.mobileSizeError"));
        }
        try{
            Long.parseLong(mobile);
        }catch(Exception e){
            errors.add("loginMobileError",new ActionMessage("loginError.mobileError"));
        }
        if(password.length()==0){
            errors.add("loginPasswordError",new ActionMessage("loginError.passwordError"));
        }
        return errors;
    }
}
