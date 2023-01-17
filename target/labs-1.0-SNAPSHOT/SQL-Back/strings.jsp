<%-- 
    Document   : strings
    Created on : 23-Nov-2022, 3:35:30 PM
    Author     : 236358
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Strings</title>
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
                            <td><a class="button" href="index.jsp">Home</a></td>
                            <form class="center" method="Post" action="strings.jsp">
                                <td><input id="string" type="text" name="string" placeholder="write text"/></td>
                                <td><input class="button" type="submit" value="submit"/></td>
                            </form>
                        </tr>                                                              
                    </table>
                </div>
            </div>
        </nav>
       
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-4">
                    <jsp:include page="countString.jsp" flush="true"/>
                </div>
                <div class="col-xl-4">
                    <jsp:include page="spaces.jsp" flush="true"/>
                </div>
            </div>
            <div class="row">
                
            </div>
            
        </div>
        <div id="clock" class="footer"></div>
    </body>
</html>
