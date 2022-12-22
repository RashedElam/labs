/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.io.Serializable;
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
public class Circle implements Serializable{
    private double radius;
    
    public Circle(){
        super();
    }
    
    public Circle(double radius){
        super();
        this.radius = radius;
    }
    @XmlElement
    public double getRadius(){
        return this.radius;
    }
    @XmlElement
    public double getPerimeter(){
        double perimeter = 2 * Math.PI * radius;
        return perimeter;
    }
    @XmlElement
    public double getArea(){
        Double area = Math.PI * radius * radius;
        return area;
    }
    
    
    
    
    
    
}
