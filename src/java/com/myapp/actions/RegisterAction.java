package com.myapp.actions;

import com.myapp.formBeans.RegisterForm;
import com.myapp.logicBeans.Booker;
import org.apache.struts.action.*;
import javax.servlet.http.*;

public class RegisterAction extends Action{
	public ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response) {
            RegisterForm rf = (RegisterForm) form;
            Booker.register(rf.getName(), rf.getMobile(), rf.getPassword(), rf.getAge());
            return mapping.findForward("success");
	}
}
