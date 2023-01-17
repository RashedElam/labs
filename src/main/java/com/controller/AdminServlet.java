/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.Admin;
import com.model.dao.AdminSqlDAO;
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
public class AdminServlet extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        AdminSqlDAO adminSqlDAO = (AdminSqlDAO) session.getAttribute("adminSqlDAO");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Admin admin = null;

        if (email != null) {
            try {
                admin = adminSqlDAO.login(email, password);
            } catch (SQLException ex) {
                Logger.getLogger(AdminServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            admin = (Admin) session.getAttribute("admin");
        }

        if (admin == null) {
            session.setAttribute("error", "Admin does not exist");
            request.getRequestDispatcher("adminLogin.jsp").include(request, response);
        } else {
            session.setAttribute("admin", admin);
            request.getRequestDispatcher("admin.jsp").include(request, response);
        }
    }


}
