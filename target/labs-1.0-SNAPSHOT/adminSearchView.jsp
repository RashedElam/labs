<%@page import="com.model.dao.UserSqlDAO"%>
<%@page import="com.model.User"%>
<%@page import="com.model.Users"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>


<%
    request.setAttribute("emailView", null);
    request.removeAttribute("emailView");
%>
<% 
    UserSqlDAO userSqlDAO = (UserSqlDAO) session.getAttribute("userSqlDAO"); 
    Users users = new Users();
    User user = (User) session.getAttribute("user");
    
    users.add(user);
    
    
%>

<c:import url="/xsl/users.xsl" var="xslt"/>
<c:set var="xml">
    <users>
        <% for (User u : users.getUsers()) {%>
        <user>
            <ID><%= u.getID()%></ID>
            <name><%= u.getName()%></name>
            <email><%=u.getEmail()%></email>
            <dob><%= u.getDob()%></dob>
        </user>
        <% }%>
    </users>
</c:set> 

<x:transform xml="${xml}" xslt="${xslt}"></x:transform>