<%@include file="../admin/guestheader.jsp" %>
<%-- 
    Document   : counciller
    Created on : Apr 4, 2018, 3:27:52 PM
    Author     : ckc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <script src="jq.js" type="text/javascript"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>councrllor</title>
    </head>
    
    <body>
      
     <form action="councillerUploadaction.jsp" method="post" enctype="multipart/form-data">               
            <table id="reg"  border="1"  align="center" cellpadding="8" bgcolor="#fff" width="50%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">
                <tr>
                    <td>
                        Councellor Name
                    </td>
                    
                    <td>
                        <input type="text" name="txtname" required>
                    </td>
                </tr>
                
                
                <tr>
                    <td>
                        Address
                    </td>
                    
                    <td>
                        <textarea name="add" rows="5"> </textarea>
                       
                    </td>
                </tr>
                
                
                <tr>
                    <td>
                        Contact
                    </td>
                    
                    <td>
                        <input type="text" name="txtcon" required  >
                    </td>
                </tr>
                 
               
                <tr>
                    <td>
                        Email
                    </td>
                    
                    <td>
                        <input type="text" name="txtemail" required  >
                    </td>
                </tr>
                 
                <tr>
                    <td>
                        Adhar No
                    </td>
                    
                    <td>
                        <input type="text" name="txtadhar" required  >
                    </td>
                </tr>
                   
                 <tr>
                    <td>
                        Photo
                    </td>
                    
                    <td>
                        <input type="file" name="txtphoto" required  >
                    </td>
                </tr>
               
                <tr> 
                    <td>
                        Username
                    </td>
                   
                    <td>
                        <input type="uname"  name="txt_uname">
                    </td>
                </tr>
                
                
                 <tr> 
                    <td>
                        Password
                    </td>
                  
                    <td>
                        <input type="password"  name="txt_pswd" required  >
                    </td>
                </tr>
                
                
                 <tr> 
                    <td>
                        Confirm password
                    </td>
                   
                    <td>
                        <input type="password"  name="txt_conpswd" required  >
                    </td>
                </tr>
                
                
                <tr>
                <td colspan="2" align="center">
                 
                <input type="submit" name="btnsub" value="Register" >
                <input type="reset" name="delid"  value="CANCEL" >
                </td>
                </tr>
                
                </table>
          
        </form>
    </body>
</html>
<%@include  file="footer.jsp" %>