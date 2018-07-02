/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.formBeans;

import com.myapp.actions.BookAction;
import com.myapp.logicBeans.Booker;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.*;


/**
 *
 * @author Administrator
 */
public class BookForm extends ActionForm{
    private String from,to,trainName;
    private int day,trainNo;
    private final Map values = new HashMap();
    public String getTrainName() {
        return trainName;
    }

    public void setTrainName(String trainName) {
        this.trainName = trainName;
    }

    public int getTrainNo() {
        return trainNo;
    }

    public void setTrainNo(int trainNo) {
        this.trainNo = trainNo;
    }
    
    public void setValue(String key, Object value) {
        values.put(key, value);
    }

    public Object getValue(String key) {
        return values.get(key);
    }

    public String getFrom() {
        return from;
    }

    public String getTo() {
        return to;
    }

    public int getDay() {
        return day;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public void setDay(int day) {
        this.day = day;
    }

    @Override
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        HashMap<Integer,String> trains= Booker.getTrains(from,to,day);
        if(trains.isEmpty()){
            errors.add("trainNotAvl",new ActionMessage("trainError.notAvl"));
        }
        return errors;
    }
}
