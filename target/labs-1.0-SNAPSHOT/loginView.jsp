<%-- 
    Document   : loginAction
    Created on : 29-Nov-2022, 3:12:53 PM
    Author     : 236358
--%>
<%@page import="com.model.dao.UserSqlDAO"%>
<%@page import="com.model.Users"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login Action</title>
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body onload="startTime()">
        
        <% 
            String email = request.getParameter("email");
            String password = request.getParameter("password");        
        %>
        <nav class="navbar navbar-dark bg-orange">
            <div class="contianer-fluid">
                <div class="navbar-header">
                    <table>
                        <tr>
                            <td><h1 class="header">Fronter</h1></td>
                            <td><a class="button" href="/labs/MainServlet">Main-Page</a></td>
                            <td><a class="button" href="/labs/LogoutServlet">Logout</a></td>
                        </tr>                                                              
                    </table>
                    
                </div>
            </div>
        </nav>
        <table class="center">
            <thead class="thead">
                <th></th>
                <th>Welcome</th>
                <th></th>
            </thead>
            <tr><td>Email: </td><td> <%= email%></td></tr>
            <tr><td>Password: </td><td> <%= password%></td></tr>
        </table>
        <div id="clock" class="footer"></div>
    </body>
</html>
