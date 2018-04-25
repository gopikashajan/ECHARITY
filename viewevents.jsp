<%@include file="../user/guestheader.jsp" %>
<%-- 
    Document   : viewevents
    Created on : Mar 14, 2018, 11:47:20 AM
    Author     : ckc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>viewevents</title>
    </head>
     
    <body>
      
        <form>
            
          <h1 align="center">EVENT LIST</h1>
            
                <table id="viewevents" border="1"  align="center" cellpadding="8" bgcolor="#fff" width="40%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">
                 <tr><th>Sl.No</th>
                     <th>Event Name</th>
                     <th>Date</th></tr>
                       
               <%int i=1;
                String sel1="select * from tbl_eventype e inner join tbl_evenshedule ev on ev.eventy_id=e.eventy_id";
                ResultSet rs1=obj.selectCommand(sel1);
                while(rs1.next())
                {%>
                <tr>
                    <td><%=i%></td>
                    
               
                    <td><%=rs1.getString("eventy_name")%> </td>
                
                    <td><%=rs1.getString("shed_date")%></td>
                    
                    
                    <td><a href="viewevents.jsp?sid=<%=rs1.getString("eventy_id")%>">More Detalils..</a></td><br>
                    
                    
                 </tr>
               
                <%i++;}
                
                
                %> 
                </table>
                <%
         if(request.getParameter("sid") != null)
         {
             %>
             <table align="center" border="2">
                <input type="hidden" name="hid" value="<%=request.getParameter("sid")%>" >
         
            
                <h1 align="center">EVENT SPONSORING</h1>
       
            
                  
                 <tr><th>Sl.No</th>
                     <th>Event Name</th>
                      <th>Organization Name</th>
                     <th>Date</th>
                     <th> From-Time</th>
                     <th>To-Time</th>
                     <th>Venue</th>
                     <th>Address</th></tr>
                    
               <%int j=1;
                String sel2="select * from tbl_eventype e inner join tbl_evenshedule ev on ev.eventy_id=e.eventy_id inner join tbl_org o on o.org_id=ev.org_id where ev.shed_id='"+request.getParameter("sid")+"'";
                System.out.println("SELECT:  "+sel2);
                ResultSet rs2=obj.selectCommand(sel2);
                while(rs2.next())
                {%>
                <tr>
                    <td><%=i%></td>
                    
               
                    <td><%=rs2.getString("eventy_name")%> </td>
                    <td><%=rs2.getString("org_name")%> </td>
                    <td><%=rs2.getString("shed_date")%></td>
                    <td><%=rs2.getString("shed_fromtime")%> </td>
                    <td><%=rs2.getString("shed_totime")%> </td>
                    <td><%=rs2.getString("venue")%> </td>
                     <td><%=rs2.getString("address")%> </td>
                    <td><a href="Eventsponsoring.jsp?eid=<%=rs2.getString("shed_id")%>">Sponsoring</a></td><br>
                    
                    
                 </tr>
                <%i++;}
                
                
                %>
            </table>
            <%
         }
     
         
     %>
                
                 
            </form>
    </body>
</html>
<%@include  file="footer.jsp" %>
            