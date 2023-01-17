/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 236358
 */
public class HelloServlet extends HttpServlet {

    private String message;
    private ArrayList<Integer> numbers;
    
    @Override
    public void init(){
       numbers = new ArrayList(); 
       numbers = (ArrayList) new Random().ints(1,10).limit(10).boxed().collect(Collectors.toList());
    }
            
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HelloServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HelloServlet at " + request.getContextPath() + "</h1>");
            out.println("<h2> HelloServlet URI: " + request.getRequestURI() + "</h2>");
            out.println("<ul>");
                for(Integer e: numbers)
                    out.println("<li> e = "+e+"</li>");
            out.println("</ul>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    //this will be last method run after we close the browser 
    //Last life cycle
    @Override
    public void destroy(){
        numbers.clear();
    }

}
