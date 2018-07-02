/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.actions;

import com.myapp.formBeans.BookForm;
import com.myapp.logicBeans.Booker;
import com.myapp.logicBeans.DatabaseConn;
import java.util.HashMap;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.*;
import org.apache.struts.action.*;

/**
 *
 * @author Administrator
 */
public class BookAction extends Action{

    

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        BookForm bf = (BookForm) form;
        HttpSession session = request.getSession();
        session.setAttribute("BookForm",bf);
        return new ActionForward("/user/train.jsp");
    }
}
