
<%@include file="../counsellor/guestheader.jsp" %>
<%-- 
    Document   : requestview.jsp
    Created on : Jan 1, 2009, 2:42:44 AM
    Author     : ckc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<!DOCTYPE html>
<html>
    <div>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1 align="center">COUNSELLING REQUEST VIEW</h1>
        <form>
            <table id="reqTable" border="1"  align="center" cellpadding="8" bgcolor="#fff" width="50%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">
                <tr><th>Sl.No</th>
                     <th>USER Name</th>
                    <th>Subject</th>
                    <th>Description</th>
                    <th>Date</th></tr>
            
                   
                <%int i=1;
                String str="select * from tbl_counseling_request c  inner join tbl_user o on o.user_id=c.user_id and c.status <> 2";
                ResultSet rs=obj.selectCommand(str);
                while(rs.next())
                {
                    %>
                    <tr>
                         <td><%=i%></td>
                    
                   
                        
                            <td><%=rs.getString("user_name")%></td>
                        <td><%=rs.getString("subject")%></td>
                        <td><%=rs.getString("coun_des")%></td>
                          <td><%=rs.getString("coun_req_date")%></td>
                          <td> <a href='updateCounRequest.jsp?id=<%=rs.getString("coun_req_id")%>'>Report Action</a></td>
                    
                     
                        
                    </tr>
                 
                
               <%i++;}
                
                
                %>
              
                   
            </table>
        </form>
       
    </body>


</html>
 </div>
                <%@include  file="footer.jsp" %>