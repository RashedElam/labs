/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.User;
import com.model.dao.UserSqlDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 236358
 */
public class LoginServlet extends HttpServlet {

   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String emailRegEx = "([a-zA-Z]+)[._-]([a-zA-Z]+)@example.com";
        String passRegEx = "[A-Z][a-z]{5,15}\\d{1,3}";

        UserSqlDAO userSqlDAO = (UserSqlDAO) session.getAttribute("userSqlDAO");

        User user = null;
        try {
            user = userSqlDAO.login(email, password);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
            
        if(!email.matches(emailRegEx) && !password.matches(passRegEx)){
            session.setAttribute("emailError", "Incorrect email format");
            session.setAttribute("passError", "Incorrect password format");
            request.getRequestDispatcher("login.jsp").include(request, response);                       
        }else if(!email.matches(emailRegEx)){               
            session.setAttribute("emailError", "Incorrect email format");
            request.getRequestDispatcher("login.jsp").include(request, response);                
        }else if(!password.matches(passRegEx)){
            session.setAttribute("passError", "Incorrect password format");
            request.getRequestDispatcher("login.jsp").include(request, response);
        }else if(user != null){
            session.setAttribute("user", user);
            request.getRequestDispatcher("loginView.jsp").include(request, response);
        }else{
            session.setAttribute("error", "User Does not Exist!");
            request.getRequestDispatcher("login.jsp").include(request, response);
        }
    } 
}
