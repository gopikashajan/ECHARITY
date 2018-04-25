<%@include file="../user/guestheader.jsp" %>
<%-- 
    Document   : EditProfile
    Created on : Mar 11, 2018, 10:30:12 AM
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
    <body>
        <%
    
        
        String username="";
        String Address="";
        String Con="";
        String Email="";
       
        String place="";
       String adhar="";
        String uname="";
        String logid="";
        String sel="select * from tbl_user c inner join tbl_login l on c.login_id=l.login_id  inner join tbl_place p on p.pl_id=c.pl_id  where c.user_id='"+session.getAttribute("userid")+"'";
        ResultSet rs1=obj.selectCommand(sel);
        
         if(rs1.next())
        {
            
            username=rs1.getString("user_name");
            Address=rs1.getString("address");
            Con=rs1.getString("contact_no");
            Email=rs1.getString("email");
            adhar=rs1.getString("adhar_no");
            
            place=rs1.getString("pl_id");
           
            uname=rs1.getString("username");
            logid=rs1.getString("login_id");
        }
        
        
           
          
          
          
         if(request.getParameter("btn_submit")!=null)
            
        {
          
           username =request.getParameter("txtname");
            Address =request.getParameter("txtaddress");
            Con=request.getParameter("txtcon");
            Email =request.getParameter("txtemail");
            adhar=request.getParameter("adhar");
            place=request.getParameter("place");
            
            uname=request.getParameter("txtuname");
            logid=request.getParameter("hid");
            String update="update tbl_login set username='"+uname+"' where login_id="+logid;
            boolean bb=obj.executeCommand(update);
            if(bb==true)
            {
        String up="update tbl_user set user_name='"+username+"',address='"+Address+"',contact_no='"+Con+"',email='"+Email+"',adhar_no='"+adhar+"',pl_id='"+place+"' where user_id='"+session.getAttribute("userid")+"'";
                boolean b=obj.executeCommand(up);
                if(b)
                {
                    response.sendRedirect("EditProfile.jsp");
                }
                else
                {
                    out.println(up);
                    
                }
                
            }
        }
       
           
        
       
        
        %>
                 
       
       
         <form>
            
                   <table id="editprofile1" border="1"  align="center" cellpadding="8" bgcolor="#fff" width="30%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">
                
              <tr>
                    <td>
                        Place Name
                    </td>
                   
                  
                            <td>
                                <select name="place">
                                    <option>---select place---</option>
                                    <%
                                        String sel1="select * from tbl_place";
                                        ResultSet rs=obj.selectCommand(sel1);
                                        while(rs.next())
                                        {
                                          String id=rs.getString("pl_id");   
                                        %>
                                        <option <%if(place.equals(id)){%> selected="" <%}%> value="<%=rs.getString("pl_id")%>"><%=rs.getString("pl_name")%></option>
                            
                                        <%    
                                        }
                                        %>
                                 </select>

                                </td>
                                                 
                   
                </tr>
                <tr>
                    <td>User Name</td>
                    <td>
                    <input type="text" name="txtname" value="<%=username%>" required="">
             
                    </td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td> <textarea name="txtaddress" required=""><%=Address%></textarea> </td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td>
                    <input type="text" name="txtcon" value="<%=Con%>" required="">
                    </td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>
                       <input type="text" name="txtemail" value="<%=Email%>" required="">
                    <input type="hidden" name="hid" value="<%=logid%>">
                    </td>
                </tr>
               <tr>
                    <td>Adhar no</td>
                    <td>
                    <input type="text" name="adhar" value="<%=adhar%>" required="">
                    </td>
                </tr>
              
                 <tr>
                    <td>Username</td>
                    <td> <input type="text" name="txtuname" value="<%=uname%>" required=""></td>
                </tr>
                 
                 <tr>
                    <td colspan="2" align="center">
                                   <input type="submit" name="btn_submit" value="SUBMIT">
                                   <input type="reset" name="btn_reset" value="CANCEL">
                    </td>
                  </tr>
                
            </table>
         </form>
             
    </body>

</html>
<%@include  file="footer.jsp" %>