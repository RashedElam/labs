<%-- 
    Document   : account
    Created on : 29-Nov-2022, 3:27:36 PM
    Author     : 236358
--%>

<%@page import="com.model.Users"%>
<%@page import="com.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account</title>
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        
    </head>
    <body onload="startTime()">
        
        <nav class="navbar navbar-dark bg-dark">
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
        <%! 
            User user;
        %>
        <% String filename = application.getRealPath("/WEB-INF/users.xml");%>
        <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
            <jsp:setProperty name="userDAO" property="filePath" value="<%=filename%>"/>
        </jsp:useBean>
        <%
            String submitted = request.getParameter("submitted");
            String emailView = request.getParameter("email");
            Users users = userDAO.getUsers();
            if(emailView != null){
                user = users.user(emailView);
                session.setAttribute("emailView", emailView);
            }else{
                user = (User) session.getAttribute("user");
            }

            if (submitted != null && submitted.equals("submitted")) {
                int ID = Integer.parseInt(request.getParameter("ID"));
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");

                if(emailView != null)
                    user = users.user(emailView);
                user.update(ID, name, email, password, dob);
        
                userDAO.update(users, user);
                
                session.setAttribute("user", user);
            }
        %>
        <div style="margin: auto;">
            <form method="POST" action="account.jsp">
                <table class="tab">

                    <thead class="thead">
                        <tr>
                            <th></th>
                            <th>Edit User </th>
                            <th></th>
                        </tr>
                        <tr>
                            <th></th>
                            <th><span class="message"><%= (submitted != null) ? "Update is Successful" : ""%></span></th>
                            <th></th>
                        </tr>
                    </thead>
                    
                    <tr><td class="td">ID </td><td><input class="input" type="text" name="ID" value="<%= user.getID()%>" readonly="true" /></td></tr>
                    <tr><td class="td">Name</td><td><input class="input" type="text" name="name" value="<%= user.getName()%>" /></td></tr>
                    <tr><td class="td">Email</td><td><input class="input" type="text" name="email" value="<%= user.getEmail()%>" readonly="true"/></td></tr>
                    <tr><td class="td">Password</td><td><input class="input" type="password" name="password" value="<%= user.getPassword()%>" /></td></tr>
                    <tr><td class="td">DOB</td><td><input class="input" type="date" name="dob" value="<%= user.getDob()%>"/></td></tr>
                    <tr><td><input class="input" type="hidden" name="submitted" value="submitted"  %></td></tr>
                    <tr>
                        <%if(emailView != null) {%>
                        <td><a class="button tabButton" href="index.jsp">Home</a></td>
                            
                        <%}else {%>
                        <td><a class="button" href="main.jsp">Main</a></td>
                        <%}%>
                        <td>
                            <input class="button tabButton" type="submit" value="Update" />
                            <a class="button tabButton" href="delete.jsp" >Delete</a>                        
                    </tr>
                </table>
            </form>
        </div>
        <%
            submitted = "";
            session.setAttribute("submitted", submitted);
        %>
        <div id="clock" class="footer"></div>
    </body>
</html>
