/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.io.Serializable;
import java.util.Random;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author 236358
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "user")
public class User implements Serializable{
    private int ID;
    private String name;
    private String email;
    private String password;
    private String dob;

    public User(String name, String email, String password, String dob) {
        this.ID = new Random().nextInt(999999);
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;
    }
    
    public User(){}

    public boolean login(String email, String password){
        return this.email.equals(email)&&this.password.equals(password);
    }  
    
    public void update(int ID, String name, String email, String password, String DOB){
        this.ID = ID;
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = DOB;
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

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }
    
    public boolean match(String email){
        return this.email.equals(email);
    }
    
    public boolean match(User other){
        return this.ID == other.ID;
    }
    
    public boolean match(int ID){
        return this.ID == ID;
    }
    
}
