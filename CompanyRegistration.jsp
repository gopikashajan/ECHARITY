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
        <title>JSP Page</title>
    </head>
    
        
     <%
        String name="",con="",address="", email="",logo="",dis="",place="",uname="",pswd="";
        
    
    if(request.getParameter("btnsub")!=null)
        {
      
            String log="";
            name=request.getParameter("txtname");
            con=request.getParameter("txtcon");
            address=request.getParameter("add");
            email=request.getParameter("txtemail");
            logo=request.getParameter("txtphoto");
            
            dis=request.getParameter("district");
            place=request.getParameter("place");
            uname=request.getParameter("txt_uname");
            pswd=request.getParameter("txt_pswd");
            
            
             String insQry1="insert into tbl_login(user_type,username,password)values('company','"+uname+"','"+pswd+"')";
            boolean b2=obj.executeCommand(insQry1);
                  
            if(b2==true)
               {
                   String sel="select max(login_id) as login from tbl_login";
                   ResultSet rs=obj.selectCommand(sel);
                   if(rs.next())
                   {
                       log=rs.getString("login");
                   }
               }
           
            String insQry="insert into tbl_company(comp_name,comp_address,comp_contact,comp_email,logo,pl_id,dis_id,login_id,status)values('"+name+"','"+con+"','"+address+"','"+email+"','"+logo+"','"+place+"','"+dis+"','"+log+"','0');";
            
           
                    
             boolean b=obj.executeCommand(insQry);
            
            
          
        }
 
    %>
    <body>
       <center><h1>COMPANY REGISTRATION</h1></center>
       <form>           
            <table  align="center">
                <tr>
                    <td>
                        Company Name
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
                         <textarea name="add"> </textarea>
                       
                    </td>
                </tr>
                
                
                <tr>
                    <td>
                        Contact
                    </td>
                   
                    <td>
                        <input type="contact" name="txtcon" required  >
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
                 
             
                    <td>
                        Logo
                    </td>
                    
                    <td>
                        <input type="file" name="txtphoto" required  >
                    </td>
                </tr>
                <tr>
                    <td>
                
                        District Name
                    </td>
<!--                    <td>
                      
                         <select name="district" >
                             <option value="">
                                --select--
                            </option>
                            
                             <%
                            String str="select * from tbl_district";
                            ResultSet rs=obj.selectCommand(str);
                            while (rs.next())
                            {
                           %>
                           <option value="<%=rs.getString("dis_id")%>">
                               <%=rs.getString("dis_name")%>
                           </option>
                            <%
                            }
                            %>
                            
                        </select><br>
                   
                    </td>-->
                     <td>
                         <select name="district" onchange="getPlace(this.value)">
                             <option value="">
                                --select--
                            </option>
                            
                             <%
                            String str1="select * from tbl_district";
                            ResultSet rs1=obj.selectCommand(str);
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
                <td colspan="2" align="center">
                 
                <input type="submit" name="btnsub" value="Register" >
                <input type="reset" name="delid"  value="CANCEL" >
                </td>
                </tr>
                
                </table>
          
        </form>
    </body>
</html>
