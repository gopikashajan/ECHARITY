<%@include file="../user/guestheader.jsp" %>
<%-- 
    Document   : Sponership
    Created on : Feb 13, 2018, 3:34:30 PM
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
    </head>
    <script>
       function check()
       {
          if(document.getElementById('stud').checked)
          {
              window.location="../user/student.jsp";
         
           
            
          }else if(document.getElementById('senior').checked){
              window.location="../user/senior.jsp";
          }
       
       }
    </script>

    <body>
        <h1 align="center">SPONSORING</h1>
      
                   <table id="sponsoring" border="1"  align="center" cellpadding="8" bgcolor="#fff" width="30%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">
                <tr>
                    <td>
                        <input type="radio" name="type" id="stud">STUDENT</td>
               
                </tr>
                <tr>
                    <td>
                        <input type="radio" name="type" id="senior">SENIOR CITIZENS</td>
                    
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" name="btnsub" value="SUBMIT" onclick="check()">
                    </td>
                </tr>
                
            </table>
                
    </body>
</html>
   
 <%@include  file="footer.jsp" %>                    
                    
                    
                    
                    
               