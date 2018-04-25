<%@include file="../user/guestheader.jsp" %>
<%-- 
    Document   : RequestView
    Created on : Jan 1, 2009, 1:07:57 AM
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
        <h1 align="center">ORGANISATION REQUEST VIEW</h1>
        <form>
            <table id="orgrequest" border="1"  align="center" cellpadding="8" bgcolor="#fff" width="50%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">
                <tr><th>Sl.No</th>
                     <th>Organisation Name</th>
                    <th>Subject</th>
                    <th>Description</th>
                    <th>Date</th></tr>
            
                   
                <%int i=1;
                String str="select * from tbl_organi_request c  inner join tbl_org o on o.org_id=c.org_id and c.status <> 2";
                ResultSet rs=obj.selectCommand(str);
                while(rs.next())
                {
                    %>
                    <tr>
                         <td><%=i%></td>
                    
                   
                        
                            <td><%=rs.getString("org_name")%></td>
                        <td><%=rs.getString("req_subject")%></td>
                        <td><%=rs.getString("req_details")%></td>
                          <td><%=rs.getString("req_date")%></td>
                          <td> <a href='updateOrgRequest.jsp?id=<%=rs.getString("req_id")%>'>Report Action</a></td>
                    
                     
                        
                    </tr>
                 
                
               <%i++;}
                
                
                %>
              
                   
            </table>
        </form>
       
                
    </body>
</html>
<%@include  file="footer.jsp" %>