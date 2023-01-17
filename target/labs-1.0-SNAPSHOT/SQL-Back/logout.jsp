<%-- 
    Document   : logout
    Created on : 24-Nov-2022, 11:42:31 AM
    Author     : 236356
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
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
                        </tr>                                                              
                    </table>
                    
                </div>
            </div>
        </nav>
        <h1 class="center">You have been logged out - Thank You!</h1>
        <div id="clock" class="footer"></div>
    </body>
</html>
