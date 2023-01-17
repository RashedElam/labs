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
            String emailRegEx = "([a-zA-Z]+)[._-]([a-zA-Z]+)@example.com";
            String passRegEx = "[A-Z][a-z]{5,15}\\d{1,3}";
            
            UserSqlDAO userSqlDAO = (UserSqlDAO) session.getAttribute("userSqlDAO");
            
            User user = userSqlDAO.login(email, password);
            
            if(!email.matches(emailRegEx) && !password.matches(passRegEx)){
                session.setAttribute("emailError", "Incorrect email format");
                session.setAttribute("passError", "Incorrect password format");
                response.sendRedirect("login.jsp");                       
            }else if(!email.matches(emailRegEx)){               
                session.setAttribute("emailError", "Incorrect email format");
                response.sendRedirect("login.jsp");                
            }else if(!password.matches(passRegEx)){
                session.setAttribute("passError", "Incorrect password format");
                response.sendRedirect("login.jsp");
            }else if(user != null){
                session.setAttribute("user", user);
            }else{
                session.setAttribute("error", "User Does not Exist!");
                response.sendRedirect("login.jsp");
            }
        
        %>
        <nav class="navbar navbar-dark bg-orange">
            <div class="contianer-fluid">
                <div class="navbar-header">
                    <table>
                        <tr>
                            <td><h1 class="header">Fronter</h1></td>
                            <td><a class="button" href="main.jsp">Main-Page</a></td>
                            <td><a class="button" href="logout.jsp">Logout</a></td>
                        </tr>                                                              
                    </table>
                    
                </div>
            </div>
        </nav>
        <% if (user != null) {%>
        <table class="center">
            <thead class="thead">
                <th></th>
                <th>Welcome</th>
                <th></th>
            </thead>
            <tr><td>Email: </td><td> <%= email%></td></tr>
            <tr><td>Password: </td><td> <%= password%></td></tr>
        </table>
        <%} else {%>
            <p></p>
        <%}%>
        <div id="clock" class="footer"></div>
    </body>
</html>
