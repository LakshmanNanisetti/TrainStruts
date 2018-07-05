/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.actions;
import com.myapp.formBeans.BookForm;
import com.myapp.formBeans.TrainForm;
import com.myapp.logicBeans.Booker;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.*;

/**
 *
 * @author Administrator
 */
public class TrainAction extends Action{

    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session= request.getSession();
        TrainForm tf = (TrainForm) form;
        BookForm bf = (BookForm) session.getAttribute("BookForm");
        Map values = tf.getValues();
        ArrayList<String> names = tf.getNames();
        ArrayList<Integer> ages = tf.getAges();
        ArrayList<Integer> gens = tf.getGens();
        if(Booker.book((String)session.getAttribute("mobile"),tf.getTrainNo(),bf.getDay()
		,tf.getCategory(),names,ages,gens))
        return mapping.findForward("success"); 
        else
            return mapping.findForward("failure");
    }
    
}
