package com.myapp.formBeans;

import org.apache.struts.action.*;

import com.myapp.logicBeans.RegisterLogic;

import javax.servlet.http.*;

public class RegisterForm extends ActionForm{
	/**
	 * 
	 */
	private String mobile,name,password;
	private int age;
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getMobile() {
		return mobile;
	}
	public String getName() {
		return name;
	}
	public String getPassword() {
		return password;
	}
	public int getAge() {
		return age;
	}
	public ActionErrors validate(ActionMapping mapping,HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		if(name.length()>30||name.length()==0) {
			errors.add("nameError", new ActionMessage("registerError.nameMessage"));
		}
		if(password.length()<8||password.length()==0) {
			errors.add("passwordError", new ActionMessage("registerError.passwordMessage"));
		}
		if(age<18||age>100) {
			errors.add("ageError", new ActionMessage("registerError.ageMessage"));
		}
		if(mobile.length()!=10) {
			errors.add("mobileSizeError", new ActionMessage("registerError.mobileSizeMessage"));
		}
		try {
			Long.parseLong(mobile);
		}catch(Exception e) {
			errors.add("mobileError",new ActionMessage("registerError.mobileMessage"));
		}
		RegisterLogic rl = new RegisterLogic();
		if(rl.exists(mobile)) {
			errors.add("mobileExistsError",new ActionMessage("registerError.mobileExistsMessage"));
		}
			
		return errors;
	}
}
