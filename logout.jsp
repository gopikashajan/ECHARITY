<%-- 
    Document   : logout
    Created on : Apr 12, 2018, 9:29:50 AM
    Author     : ckc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <% session.invalidate();%>
        <% response.sendRedirect("../guest/login.jsp");%>
    </body>
</html>
