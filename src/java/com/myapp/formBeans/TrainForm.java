/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.formBeans;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.*;

/**
 *
 * @author Administrator
 */
public class TrainForm extends ActionForm{
    private int trainNo,seats;
    private String category;
    private final Map values = new HashMap();
    private ArrayList<String> names;
    private ArrayList<Integer> ages,gens;

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }
    
    public ArrayList<String> getNames() {
        return names;
    }

    public ArrayList<Integer> getAges() {
        return ages;
    }

    public ArrayList<Integer> getGens() {
        return gens;
    }
    
    public Map getValues() {
        return values;
    }
    
    public int getSeats() {
        return seats;
    }

    public void setSeats(int seats) {
        this.seats = seats;
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
    
    @Override
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        if(values.isEmpty()){
            errors.add("emptyPass",new ActionMessage("passError.empty"));
        }
        try{
        names = new ArrayList<>();
        ages = new ArrayList<>();
        gens = new ArrayList<>();
        for(int i=1;i<=values.size()/3;i++){
            String name = (values.get("name"+i)).toString();
            names.add(name);
            int age = Integer.parseInt((values.get("age"+i)).toString());
            ages.add(age);
            int gen = Integer.parseInt((values.get("gen"+i)).toString());
            gens.add(gen);
            if(name.equals("")){
                errors.add("emptyPass",new ActionMessage("passError.empty"));
                break;
            }
        }
        }
        catch(Exception e){
            errors.add("emptyPass",new ActionMessage("passError.empty"));
            System.out.println("hell\n\n\n\n\n\n\n\n\n\n");
            FileWriter f;
            try {
                f = new FileWriter("/msg/log.txt");
                f.write("hello");
                f.close();
            } catch (IOException ex) {
                Logger.getLogger(TrainForm.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            e.printStackTrace();
        }
        return errors;
    }
    
}
