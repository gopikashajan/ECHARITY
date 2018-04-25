<%@include file="../organization/guestheader.jsp" %>
<%-- 
    Document   : UpdateView
    Created on : Jan 1, 2009, 1:25:33 AM
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
            <table id="updateview" border="1"  align="center" cellpadding="8" bgcolor="#fff" width="40%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">
               
                <%
                String str="select * from tbl_organi_request t1,tbl_req_reply t2,tbl_user t3 where t1.req_id= t2.req_id and t2.user_id=t3.user_id and t1.org_id='"+session.getAttribute("orgid").toString()+"'";
               
                ResultSet rs=obj.selectCommand(str);
                while(rs.next())
                {
                    %>
                    <tr>
                        <td>
                    <table>
                        <tr><td colspan="3" align="left"><b><%=rs.getString("user_name")%></b></td></tr>
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
