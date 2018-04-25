<%@include file="../user/guestheader.jsp" %>
<%-- 
    Document   : MyProfile
    Created on : Mar 11, 2018, 10:30:00 AM
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
               String name="",con="",address="", email="",photo="",dis="",district="",place="";
               String sell="select * from tbl_user c  inner join tbl_place p on p.pl_id=c.pl_id inner join tbl_district dt on dt.dis_id=p.dis_id where c.user_id='"+session.getAttribute("userid")+"'";
               ResultSet rs1=obj.selectCommand(sell);
               if(rs1.next())
               {
                   name=rs1.getString("user_name");
                   address=rs1.getString("address");
                   con=rs1.getString("contact_no");
                   district=rs1.getString("dis_name");
                   place=rs1.getString("pl_name");
                   email=rs1.getString("email");
                  photo=rs1.getString("photo");
                  
                   
               }
               
               
            %>
    <form>
        <h1 align="center">View Profile</h1>
        <table id="myprifile1" border="1"  align="center" cellpadding="8" bgcolor="#fff" width="30%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">            <tr>
                <th>
                   User Name
                </th>
                <td><%=name%></td>
            
            </tr>
            <tr>
                <th>
                Address
                </th>
                <td><%=address%></td>
            </tr>
            <tr><th>
                Contact
                </th>
                <td><%=con%></td>
            </tr>
            <tr>
            <tr>
                <th>
                    Place
                </th>
                <td><%=place%></td>
            </tr>
            
            
                <th>
                    Email
                </th>
                <td><%=email%></td>
            </tr>
                
            <tr>
            <th>
                District
                </th>
                <td><%=district%></td>
            </tr>
            <tr>
               
                   <th>
                      Photo
                   </th>
                  <td><img height="60" src="Logo/<%=photo%>"></td>
            </tr>
             
            <tr>
                <td align="center" colspan="2">
                    <a href="EditProfile.jsp">Edit profile</a>
                </td>
                <tr>
                <td align="center" colspan="2">
                    <a href="ChangePassword.jsp">Change Password</a>
                </td>
            
            </tr>
            
                   
                   
                    </table>
    </form>
        
    </body>
</html>
<%@include  file="footer.jsp" %>