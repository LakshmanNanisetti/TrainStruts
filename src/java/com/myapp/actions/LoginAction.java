/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.actions;

import com.myapp.formBeans.LoginForm;
import javax.servlet.http.*;
import org.apache.struts.action.*;
import com.myapp.logicBeans.LoginLogic;
/**
 *
 * @author Administrator
 */
public class LoginAction extends Action{
    public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response){
        LoginForm lf = (LoginForm) form;
        String mobile = request.getParameter(lf.getMobile());
        String password = request.getParameter(lf.getPassword());
        LoginLogic ll = new LoginLogic();
        if(ll.login(mobile, password)){
            HttpSession session = request.getSession();
            session.setAttribute("mobile",mobile);
            return mapping.findForward("userHome");
        }
        request.setAttribute("error","error");
        return new ActionForward("/index.jsp");
    }
}
