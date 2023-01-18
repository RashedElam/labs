<%@page import="com.model.dao.UserSqlDAO"%>
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
      <% 
            //UserSqlDAO userSqlDAO = (UserSqlDAO) session.getAttribute("userSqlDAO");
            int ID = Integer.parseInt(request.getParameter("ID"));
        
            Users users = new Users();
            for(User user: users.getUsers()){
                user = users.user(ID);
                String xslPath = application.getRealPath("/xsl/users.xsl");
                XmlTransformer transformer = new XmlTransformer();
                transformer.transform(xslPath, UserServiceClient.fetchUser(ID), new StreamResult(out));
                if (user != null) {
                    session.setAttribute("ID", ID);
                    request.getRequestDispatcher("admin.jsp").include(request, response);
                } else {
                    session.setAttribute("error", "user does not exist");
                    request.getRequestDispatcher("admin.jsp").include(request, response);
                }
            }
            
            
            
            
        %>

    </body>
</html>
