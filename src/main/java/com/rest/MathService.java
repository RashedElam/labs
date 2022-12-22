/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rest;

import com.model.Circle;
import com.model.Maths;
import com.model.Rectangle;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

/**
 *
 * @author 236358
 */
@Path("mathapi")
public class MathService {
    
    public MathService(){}
    
    @GET
    @Path("hello")
    @Produces(MediaType.TEXT_PLAIN)
    public String hello(){
        return "Welcome to Math Service";
    }
    
    @GET
    @Path("/circle/radius/{N}")
    @Produces(MediaType.APPLICATION_XML)
    public Circle values(@PathParam("N") double radius){
        return new Circle(radius);
    }
    
    @GET
    @Path("rectangle")
    @Produces(MediaType.APPLICATION_XML)
    public Rectangle rectangle(@QueryParam("H") int h, @QueryParam("W")int w){
        return new Rectangle(h,w);
    }
    
    @GET
    @Path("/math/n/{N}")
    @Produces(MediaType.APPLICATION_XML)
    public Maths mathValues(@PathParam("N") double n){
        return new Maths(n);
    }
}
