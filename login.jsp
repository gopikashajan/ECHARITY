<%@include file="../guest/guestheader.jsp" %>
<%-- 
    Document   : login.jsp
    Created on : Feb 20, 2018, 11:02:05 AM
    Author     : ckc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<!DOCTYPE html>
<div>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
    </head>
    <body>
        <form>
        <%
        String uname="",pwd="";
        if(request.getParameter("btnsub")!=null)
        {
            uname=request.getParameter("nametxt");
             pwd=request.getParameter("passtxt");
           
        String sel="select * from tbl_user u inner join tbl_login lo on u.login_id=lo.login_id where lo.username='"+uname+"' and lo.password='"+pwd+"'"; 
          System.out.println(sel);
        ResultSet rs=obj.selectCommand(sel);
        
         String sel1="select * from tbl_org o inner join tbl_login l on o.login_id=l.login_id where username='"+uname+"' and password='"+pwd+"' and status=1"; 
             System.out.println(sel1);
            ResultSet rs1=obj.selectCommand(sel1);
         String sel2="select * from tbl_company c inner join tbl_login l on c.login_id=l.login_id where username='"+uname+"' and password='"+pwd+"' and status=1"; 
                 ResultSet rs2=obj.selectCommand(sel2);
               String sel3="select * from  tbl_login   where username='"+uname+"' and password='"+pwd+"' and user_type='admin'" ; 
                 ResultSet rs3=obj.selectCommand(sel3);
                     String sel4="select * from tbl_counselor u inner join tbl_login lo on u.login_id=lo.login_id where lo.username='"+uname+"' and lo.password='"+pwd+"'"; 
          System.out.println(sel);
        ResultSet rs4=obj.selectCommand(sel4);
          if(rs.next())
          {
            session.setAttribute("userid", rs.getString("user_id"));
            response.sendRedirect("../user/userhomepage.jsp");
            
          }else if(rs1.next())
           {
             session.setAttribute("orgid", rs1.getString("org_id"));
             response.sendRedirect("../organization/organization_home.jsp"); 
          }else if(rs2.next())
                
          {
              session.setAttribute("compid", rs2.getString("comp_id"));
              response.sendRedirect("../Company/companyhomepage.jsp");  
                  }
             else if(rs3.next())
                
          {
              //session.setAttribute("adminid", rs3.getString("login_id"));
              response.sendRedirect("../admin/adminhome.jsp");  
                  }
         else if(rs4.next())
                
          {
              session.setAttribute("counid", rs4.getString("coun_id"));
              response.sendRedirect("../counsellor/counsellorHome.jsp");  
                  }
        }
             
        
            
        
        %>
        <h1 align="center">Login</h1>
    
   
       
          
   
      
       <table id="logintable" border="1"  align="center" cellpadding="8" bgcolor="#fff" width="40%" height="100%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">                <tr>
                    <td colspan="2">
          
                           
            
                    </td>
                </tr>
<!--                <tr><th colspan="2">Registered Members only</th></tr>-->
                
                <tr><td>
                    User Name:
                    </td>
                    <td>
                        <input type="text" name="nametxt">
                    </td></tr>
                <tr><td>
                    Password:
                    </td>
                    <td>
                        <input type="password" name="passtxt">
                    </td></tr>
                <tr>
                <td colspan="2" align="center">
                 
                <input type="submit" name="btnsub" value="LOGIN" >
               <input type="Reset" name="btnrst" value="Cancel" >
                </td>
                </tr>
              
            </table>
        </form>
    </body>

</html>
</div>
<%@include  file="footer.jsp" %>