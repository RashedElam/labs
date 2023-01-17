<%-- 
    Document   : index
    Created on : 23-Nov-2022, 2:59:13 PM
    Author     : 236358
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.model.dao.AdminSqlDAO"%>
<%@page import="com.model.dao.SqlDBConnector"%>
<%@page import="com.model.dao.UserSqlDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>labs</title>
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body onload="startTime()">
        <nav class="navbar navbar-dark bg-orange">
            <div class="contianer-fluid">
                <div class="navbar-header">
                    <table>
                        <tr>
                            <td><h1 class="header">Fronter</h1></td>
                            <td><a class="button" href="register.jsp">Register</a></td>
                            <td><a class="button" href="login.jsp">Login</a></td>
                            <td><a class="button" href="strings.jsp">Strings</a></td>
                            <td><a class="button" href="adminLogin.jsp">Admin</a></td>
                            
                        </tr>
                        
                    </table>
                    
                </div>
            </div>
        </nav>
        <h1>Welcome to Fronter software</h1>
        <div id="clock" class="footer"></div>
        <% 
            UserSqlDAO userSqlDAO = new UserSqlDAO(new SqlDBConnector().connection());
            AdminSqlDAO adminSqlDAO = new AdminSqlDAO(new SqlDBConnector().connection());
            
            session.setAttribute("adminSqlDAO", adminSqlDAO);
            session.setAttribute("userSqlDAO", userSqlDAO);
            
        %>
    </body>
</html>
