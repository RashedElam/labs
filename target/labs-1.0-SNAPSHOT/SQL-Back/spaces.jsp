<%-- 
    Document   : spaces
    Created on : 02-Dec-2022, 11:58:02 AM
    Author     : 236358
--%>

<%@page import="java.util.Arrays"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>spaces</title>
        <link rel="stylesheet" href="css/layout.css"/>
        <script type="text/javascript" src="js/index.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <div>
            <%
               String string = request.getParameter("string");
            %>
            <%!
                //String string = request.getParameter("string");
                private int frequency(String s){
                    int spaceCount = s.split(" ").length - 1;     
                    return spaceCount;
                }
                private String mergeString(String s){
                    String[] str = s.split(" ");
                    String string = String.join("", str);
//                    for(int i=0; i<str.length; i++){ 
//                         string += 
//                    }
                    return string;
                }
                
            %>
            <table class="table table-bordered tab">
                <thead class="thead"><th>Merge String</th><th>Spaces</th></thead>
                <tr>
                    <td><%= mergeString(string)%></td>                            
                    <td><%= frequency(string)%></td>
                </tr> 
            </table>
            
        </div>
    </body>
</html>
