/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author 236358
 */
@XmlRootElement
@XmlAccessorType(XmlAccessType.PROPERTY)
public class Maths {
    private double n;
    
    public Maths(){}
    
    public Maths(double number){
        this.n = number;
    }
    
    @XmlElement
    public double getN(){
        return this.n;
    }
    
    @XmlElement
    public double getPower(){
        return Math.pow(n, 2);
    }
    
    @XmlElement
    public double getSquareroot(){
        return Math.sqrt(n);
    }
    
    private double factorial(double n){
        int f = 1;
        for(int i = 2; i <= n; i++)
            f *= i;
        return f;
    }
    
    @XmlElement
    public double getFactorial(){
        return factorial(n);
    }
    
}
