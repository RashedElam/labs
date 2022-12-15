<%-- 
    Document   : delete
    Created on : 09-Dec-2022, 10:36:57 AM
    Author     : 236358
--%>

<%@page import="com.model.Users"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body onload="startTime()">
        <%!
            User user;
        %>
        <% String filename = application.getRealPath("/WEB-INF/users.xml");%>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
            <jsp:setProperty name="userDAO" property="filePath" value="<%=filename%>"/>
        </jsp:useBean>

        <%
            Users users = userDAO.getUsers();
            String emailView = (String) session.getAttribute("emailView");
            if(emailView != null){
                user = users.user(emailView);
            }else{
                user = (User) session.getAttribute("user");
            }
            if (user != null) {
                userDAO.delete(users, user);
            }
        %>
        <nav class="navbar navbar-dark bg-orange">
            <div class="contianer-fluid">
                <div class="navbar-header">
                    <table>
                        <tr>
                            <td><h1 class="header">Fronter</h1></td>
                            <td><a class="button" href="index.jsp">Home</a></td>
                        </tr>                                                              
                    </table>
                </div>
            </div>
        </nav>
       <% if(user != null){%>
        <h2 class="center"><%= user.getName()%> record has been deleted!</h2>
        <%}else{%>
                <h2 class="center"> record has been deleted!</h2>

        <%}%>
        <%
            session.invalidate();

        %>
        <h1 class="center">You have been logged out - Thank You!</h1>
        <div id="clock" class="footer"></div>
    </body>
</html>
