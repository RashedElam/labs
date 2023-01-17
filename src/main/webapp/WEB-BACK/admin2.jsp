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
        
        <%
            session.invalidate();
            request.setAttribute("email", null);
            request.removeAttribute("email");
        %>        
        <% 
            String xslPath = application.getRealPath("/xsl/users.xsl");
            XmlTransformer transformer = new XmlTransformer();
            transformer.transform(xslPath, UserServiceClient.xmlPath(), new StreamResult(out));
            //transformer.transform(xslPath, UserServiceClient.fetchUser(), new StreamResult(out));
        %>

    </body>
</html>
