<%-- 
    Document   : orgregistrjsp
    Created on : Feb 7, 2018, 1:38:45 PM
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
    
            <body>

     <%
        String name="",con="",address="", email="",runby="",proof="",logo="",dis="",place="",org="",uname="",pswd="";
        
    
    if(request.getParameter("btnsub")!=null)
        {
      
            String log="";
            name=request.getParameter("txtname");
            con=request.getParameter("txtcon");
            address=request.getParameter("add");
            email=request.getParameter("txtemail");
             runby=request.getParameter("txtrun");
             
             proof=request.getParameter("txtproof");
             logo=request.getParameter("txtlogo");
            dis=request.getParameter("district");
            place=request.getParameter("place");
             org=request.getParameter("orgType");
            uname=request.getParameter("txt_uname");
            pswd=request.getParameter("ptxt1");
            
            
            String insQry1="insert into tbl_login(user_type,username,password)values('organization','"+uname+"','"+pswd+"')";
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
            
            String insQry="insert into tbl_org(org_name,org_contact,org_address,email,run_by,proof,logo,pl_id,dis_id,orgty_id,login_id,status)values('"+name+"','"+con+"','"+address+"','"+email+"','"+ runby+"','"+ proof+"','"+logo+"','"+place+"','"+dis+"','"+ org+"','"+log+"','0')";
            
            
                    
             boolean b=obj.executeCommand(insQry);
            
            
           
        }
 
    %>
       <center><h1>ORGANIZATION REGISTRATION</h1></center>
       <form>           
            <table  align="center">
                <tr>
                    <td>
                        Organization Name
                    </td>
                    
                    <td>
                        <input type="text" name="txtname" required>
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
                        Address
                    </td>
                   
                    <td>
                        <textarea name="add"> </textarea>
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
                        Run By
                    </td>
                    
                    <td>
                        <input type="text" name="txtrun" required  >
                    </td>
                </tr>
                   
                 <tr>
                    <td>
                        proof
                    </td>
                    
                    <td>
                        <input type="file" name="txtproof" required  >
                    </td>
                </tr>
                
                 <tr>
                    <td>
                        Logo
                    </td>
                    
                    <td>
                        <input type="file" name="txtlogo" required  >
                    </td>
                </tr>
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
                        Organization Type 
                    </td>
                    <td>
                        <select name="orgType" required="">
                            <option value="">
                                --select--
                            </option>
                            <%
                            String str2="select * from tbl_orgtype";
                            ResultSet rs2=obj.selectCommand(str2);
                            while (rs2.next())
                            {
                           %>
                           <option value="<%=rs2.getString("orgty_id")%>">
                               <%=rs2.getString("orgty_name")%>
                           </option>
                            <%
                            }
                            %>
                            
                        </select>
                    </td>
                </tr>
                 
                <tr> 
                    <td>
                        Username
                    </td>
                   
                    <td>
                        <input type="text"  name="txt_uname" required  >
                    </td>
                </tr>
                
                
                 <tr> 
                    <td>
                        Password
                    </td>
                  
                    <td>
                        <input type="password"  name="ptxt1" required  >
                    </td>
                </tr>
                
                
                 <tr> 
                    <td>
                        Confirm password
                    </td>
                   
                    <td>
                        <input type="password"  name="cftxt1" required  >
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
