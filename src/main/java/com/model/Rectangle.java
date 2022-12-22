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
public class Rectangle implements Serializable{
    private int width;
    private int height;
    
    public Rectangle(){}
    
    public Rectangle(int width, int height){
        this.width = width;
        this.height = height;
    }
    
    @XmlElement
    public int getPerimeter(){
        int perimeter = 2 * (height + width);
        return perimeter;
    }
    @XmlElement
    public int getArea(){
        int area = height * width;
        return area;
    }
}
