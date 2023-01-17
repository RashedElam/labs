<%-- 
    Document   : loginAction
    Created on : 29-Nov-2022, 3:12:53 PM
    Author     : 236358
--%>
<%@page import="com.model.dao.AdminSqlDAO"%>
<%@page import="com.model.Admins"%>
<%@page import="com.model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login Action</title>
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body onload="startTime()">
        
        <% 
            Admin admin = null;
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            AdminSqlDAO adminSqlDAO = (AdminSqlDAO) session.getAttribute("adminSqlDAO");

            if (email != null) {
                admin = adminSqlDAO.login(email, password);
            } else {
                admin = (Admin) session.getAttribute("admin");
            }
            
            if (admin != null) {
                session.setAttribute("admin", admin);
                response.sendRedirect("admin.jsp");
            } else {
                session.setAttribute("error", "Admin does not exist");
                response.sendRedirect("adminLogin.jsp");
            }       
        
        %>
        <div id="clock" class="footer"></div>
    </body>
</html>
