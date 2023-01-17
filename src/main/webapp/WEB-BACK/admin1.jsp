<%@page import="com.model.User"%>
<%@page import="com.model.dao.UserDAO"%>
<%@page import="com.rest.client.UserServiceClient"%>
<%@page import="javax.xml.transform.stream.StreamResult"%>
<%@page import="com.model.dao.XmlTransformer"%>
<%@page import="com.model.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin View - User Service Client</title>
    </head>
    <body>
        <% String filename = application.getRealPath("/WEB-INF/users.xml");%>       
            <jsp:useBean id="userDAO" class="com.model.dao.UserDAO" scope="application">
                <jsp:setProperty name="userDAO" property="filePath" value="<%=filename%>"/>
            </jsp:useBean>
        <%
            session.invalidate();
            request.setAttribute("email", null);
            request.removeAttribute("email");
        %>        
        <% 
            int ID = Integer.parseInt(request.getParameter("ID"));
            
            Users users = userDAO.getUsers();
            User user = users.user(ID);
            String xslPath = application.getRealPath("/xsl/users.xsl");
            XmlTransformer transformer = new XmlTransformer();
            transformer.transform(xslPath, UserServiceClient.fetchUser(ID), new StreamResult(out));
            if (user != null) {
                session.setAttribute("user", user);
            } else {
                session.setAttribute("error", "user does not exist");
                response.sendRedirect("admin2.jsp");
            }
            
            
        %>

    </body>
</html>
