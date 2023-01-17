<%-- 
    Document   : countString
    Created on : 27-Nov-2022, 6:28:03 PM
    Author     : 236358
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>countString</title>
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

                private Map<Character,Integer> frequencyMap(String s){
                    Map<Character,Integer> tree = new HashMap();
                    String vowels = "aieou";
                    for(int i = 0; i < vowels.length(); i++)
                        tree.put(vowels.charAt(i), frequency(vowels.charAt(i),s.toLowerCase()));
                    return tree;
                }
                private int frequency(char v, String s){
                    int count = 0;
                    for(int i = 0; i < s.length(); i++){
                        if(v == s.charAt(i)){
                            count++;
                        }
                    }
                    return count;
                }
                
            %>
            <table class="table table-bordered tab">
                <thead class="thead"><th>vowel</th><th>frequency</th></thead>
                <% 
                    Map<Character,Integer> treeMap = frequencyMap(string);
                    for(Map.Entry<Character,Integer> entry :treeMap.entrySet()){
                    char key = entry.getKey();
                    int value = entry.getValue();
                 
                %>
                
                <tr>
                    <td><%= key%></td>                            
                    <td><%= value%></td>
                </tr> 
                <%}%>
            </table>
        </div>
    </body>
</html>
