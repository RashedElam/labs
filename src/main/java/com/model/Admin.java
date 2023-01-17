/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.util.Random;

/**
 *
 * @author 236358
 */
public class Admin {
    private int ID;
    private String name;
    private String email;
    private String password;
    private String dob;

    public Admin(String name, String email, String password, String dob) {
        this.ID = new Random().nextInt(999);
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;
    }
    
    public Admin(int ID, String name, String email, String password, String dob) {
        this.ID = ID;
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;
    }
    
    public Admin(){}
    
    public boolean login(String email, String password){
        return this.email.equals(email)&&this.password.equals(password);
    } 
    
    public boolean match(int ID){
        return this.ID == ID;
    }
    
    public boolean match(String email){
        return this.email.equals(email);
    }
    
    public boolean match(Admin other){
        return this.ID == other.ID;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDOB() {
        return dob;
    }

    public void setDOB(String DOB) {
        this.dob = DOB;
    }
    
     @Override
    public String toString() {
        return  ID + "\t" + name + "\t" + email + "\t" + dob;
    } 
}
