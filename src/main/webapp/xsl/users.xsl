<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : users.xsl
    Created on : 13 December 2022, 1:40 PM
    Author     : 236358
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>users.xsl</title>
                <link rel="stylesheet" href="css/layout.css"/>
                <script type="text/javascript" src="js/index.js"></script>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
            </head>
            <body>
                <nav class="navbar navbar-dark bg-dark">
                    <div class="contianer-fluid">
                        <div class="navbar-header">
                            <table>
                                <tr>
                                    <td><h1 class="header">Fronter</h1></td>
                                    <td><a class="button" href="index.jsp">Home</a></td>
                                    <form class="center" method="Post" action="admin1.jsp">
                                                                              
                                        <td>
                                            <input type="number" name="ID" placeholder="write an ID"/>                                                                                                                               
                                        </td>
                                        <td><input class="button" type="submit" value="submit"/></td>
                                    </form>
                         
                                </tr>                                                              
                            </table>

                        </div>
                    </div>
                </nav>
                
            </body>
        </html>
    
        <table class="center">
            <thead class="thead">
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Date of Birth</th>
            </thead>
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="//user">
        
                <tr>
                    <td>
                        <xsl:value-of select="ID"/>
                    </td>
                    <td>
                        <xsl:value-of select="name"/>
                    </td>
                    <td>
                        <xsl:variable name="emailurl" select="email"></xsl:variable>
                        <a href="http://localhost:8080/labs/account.jsp?email={$emailurl}">
                            <xsl:value-of select="email"/>
                        </a>
                    </td>
                    <td>
                        <xsl:value-of select="dob"/>
                    </td>
                </tr>       
    </xsl:template>

</xsl:stylesheet>
