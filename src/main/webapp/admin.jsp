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
    users.addAll(userSqlDAO.getUsers());
%>

<c:import url="/xsl/users.xsl" var="xslt"/>
<c:set var="xml">
    <users>
        <% for (User user : users.getUsers()) {%>
        <user>
            <ID><%= user.getID()%></ID>
            <name><%= user.getName()%></name>
            <email><%=user.getEmail()%></email>
            <dob><%= user.getDob()%></dob>
        </user>
        <% }%>
    </users>
</c:set> 

<x:transform xml="${xml}" xslt="${xslt}"></x:transform>