<%@include file="../user/guestheader.jsp" %>
<%-- 
    Document   : updateView.jsp
    Created on : Jan 1, 2009, 2:45:31 AM
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
       
        <h1 align='center'>VIEW UPDATES</h1>
         <form>
             <table id="counsellingnoti" border="1"  align="center" cellpadding="8" bgcolor="#fff" width="50%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">               
                <%
                String str="select * from tbl_counseling_request t1,tbl_counreply t2 where t1.coun_req_id= t2.coun_req_id and t1.user_id='"+session.getAttribute("userid").toString()+"'";
               
                ResultSet rs=obj.selectCommand(str);
                while(rs.next())
                {
                    %>
                    <tr>
                        <td>
                    <table>
                        <tr><td colspan="3" align="left"><b><%=rs.getString("coun_id")%></b></td></tr>
                        <tr><td colspan="3" align="center"><u><%=rs.getString("reply_des")%></u></td></tr>
                
                          <tr><td colspan="3" align="right"><%=rs.getString("reply_date")%></td></tr>
                         
                    </table>
                        </td>  
                        
                    </tr>
                <%
                }
                %>
              
            </table>
         </form>
              
</html>
<%@include  file="footer.jsp" %>