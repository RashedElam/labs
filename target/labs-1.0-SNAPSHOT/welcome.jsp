<%-- 
    Document   : welcome
    Created on : 24-Nov-2022, 12:03:24 PM
    Author     : 236356
--%>

<%@page import="com.model.dao.UserDAO"%>
<%@page import="com.model.Users"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>welcome</title>
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body onload="startTime()">
        <%String filename = application.getRealPath("/WEB-INF/users.xml");%>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
            <jsp:setProperty name="userDAO" property="filePath" value="<%=filename%>"/>
        </jsp:useBean>
        <% 
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
            
            User user = new User(name, email, password, dob);
      
            Users users = userDAO.getUsers();
            
            User userXML = users.user(user.getEmail());
            
            
            
            String emailRegEx = "([a-zA-Z]+)[._-]([a-zA-Z]+)@example.com";
            String passRegEx = "[A-Z][a-z]{5,15}\\d{1,3}";
            if(!email.matches(emailRegEx) && !password.matches(passRegEx)){
                session.setAttribute("emailError", "Incorrect email format");
                session.setAttribute("passError", "Incorrect password format");
                response.sendRedirect("register.jsp");                       
            }else if(!email.matches(emailRegEx)){               
                session.setAttribute("emailError", "Incorrect email format");
                response.sendRedirect("register.jsp");                
            }else if(!password.matches(passRegEx)){
                session.setAttribute("passError", "Incorrect password format");
                response.sendRedirect("register.jsp");                       
            }else if(userXML != null){
                session.setAttribute("error", "User Already exist");
                response.sendRedirect("register.jsp");
            }                             
            /*else{
                User user = new User(name, email, password, dob);
                Users users = new Users();
                users.add(user);

                session.setAttribute("user", user);
                session.setAttribute("users", users);
            }*/
            else{
                users.add(user);
                userDAO.save(users, filename);
                session.setAttribute("user", user);
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

        <div >
            <table class="center">
                <thead class="thead">
                    <th></th>
                    <th>Welcome</th>
                    <th></th>
                </thead>
                <tr><td>Name: </td><td><%=name%></td></tr>
                <tr><td>email: </td><td><%=email%></td></tr>
                <tr><td>DOB: </td><td><%=dob%></td></tr>
            </table>
        </div>
        
        <div id="clock" class="footer"></div>
    </body>
</html>
