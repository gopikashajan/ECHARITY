<%@include file="../guest/guestheader.jsp" %>
<%-- 
    Document   : CompanyRegistration
    Created on : Feb 13, 2018, 3:30:27 PM
    Author     : ckc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<!DOCTYPE html>
<html>
<div>
    
    <head>
         <script src="jq.js" type="text/javascript"></script>
        <script>
            function getPlace(v)
            {
                         // alert(v);
             $.ajax({url: "ajax_place.jsp?id="+v, success: function(result){
        $("#pl").html(result);
    }});
            }
            </script>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company</title>
    </head>
    
        
   
   
    <body>
       <center><h1>COMPANY REGISTRATION</h1></center>
       <form action="CompanyRegistrationUploadaction.jsp" method="post" enctype="multipart/form-data">           
           <table id ="registrationTable" border="1"  align="center" cellpadding="8" bgcolor="#fff" width="50%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">
                
                 
                 <tr>
                    <td>
                
                        District Name
                    </td>

                     <td>
                         <select name="district" onchange="getPlace(this.value)">
                             <option value="">
                                --select--
                            </option>
                            
                             <%
                            String str1="select * from tbl_district";
                            ResultSet rs1=obj.selectCommand(str1);
                            while (rs1.next())
                            {
                           %>
                           <option value="<%=rs1.getString("dis_id")%>">
                               <%=rs1.getString("dis_name")%>
                           </option>
                            <%
                            }
                            %>
                            
                        </select><br> 
                    </td>
                
               
                    
                 <tr>
                    <td>
                        Place Name
                    </td>
                   
                    <td>
                       <select name="place" id="pl" required="">
                           <option value="">
                                --select--
                            </option>
                            
                                                 
                        </select>
                   </td>
                </tr>
                
                <tr>
                    <td>
                        Company Name
                    </td>
                    
                    <td>
                        <input type="text" name="txtname" required="" pattern="[a-zA-Z]{3,20}">
                    </td>
                </tr>
                
                
                <tr>
                    <td>
                        Address
                    </td>
                    
                    <td>
                         <textarea name="add"> </textarea>
                       
                    </td>
                </tr>
                
                
                <tr>
                    <td>
                        Contact
                    </td>
                   
                    <td>
                        <input type="contact" name="txtcon" required="" pattern="[0-9]{3,20}"  >
                    </td>
                </tr>
                 
                
                <tr>
                    <td>
                        Email
                    </td>
                    
                    <td>
                        <input type="email" name="txtemail" required  >
                    </td>
                </tr>
                 
               
               
                  
                <tr> 
                    <td>
                        Username
                    </td>
                   
                    <td>
                        <input type="uname"  name="txt_uname" required  >
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
                    <td>
                        Logo
                    </td>
                    
                    <td>
                        <input type="file" name="photo" required  >
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
</div>
                            <%@include  file="footer.jsp" %>