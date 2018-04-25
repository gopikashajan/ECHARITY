<%@include file="../user/guestheader.jsp" %>
<%-- 
    Document   : payment.jsp
    Created on : Feb 27, 2018, 3:05:24 PM
    Author     : ckc
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script>
       function check()
       {
          if(document.getElementById('card').checked)
          {
              window.location="../user/CardPayment.jsp";
         
           
            
          }else if(document.getElementById('net').checked){
              window.location="../user/NetBanking.jsp";
          }
       
       }
    </script>
    </head>
       <%
   
   
//    out.println(session.getAttribute("date"));
//     out.println(session.getAttribute("amt"));
    %>
    <body>
     
        <h1 align="center">DONATION</h1>
        <form>
            <table border="1"  align="center" cellpadding="8" bgcolor="#fff" width="30%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">
                <tr>
                    <td>
                        <input type="radio" name="cash" id="card">Credit card </td></tr>
                <tr>
                    <td><input type="radio" name="cash" id="net">Net Banking </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" name="submit" value="TRANSFER" onclick="check()">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
<%@include  file="footer.jsp" %>