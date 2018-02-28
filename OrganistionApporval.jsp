<%-- 
    Document   : OrganistionApporval
    Created on : Feb 13, 2018, 3:16:54 PM
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
     <%
           if(request.getParameter("eid")!=null)
        {
          String del="update  tbl_org set status=1 where org_id='"+request.getParameter("eid")+"'";
          boolean b=obj.executeCommand(del);
          if(b)
          {
//              response.sendRedirect("userapprove.jsp");
          }
          else
          {
              out.print(del);
          }
        }        
         if(request.getParameter("did")!=null)
        {
          String del="update  tbl_org set status=2 where org_id='"+request.getParameter("did")+"'";
          boolean b=obj.executeCommand(del);
          if(b)
          {
//              response.sendRedirect("userapprove.jsp");
      }
          else
          {
              out.print(del);
          }
        }        
         %> 
    <body>
        
        <h1 align="center">Organization Approval</h1>
          <form name="approve" method="post">
            <table align="center" border="2">
                 <tr><th>Sl.No</th>
                     <th>Organization Name</th>
                     <th>Organization Type</th>
                    <th>Contact</th>
                    <th>Address</th>
                    <th>Email</th>
                    <th>proof</th>
                    <th>Logo</th>
                    <th>Run By</th>
                    
                    
                    <th>District</th>
                    <th>place</th></tr>
               
               <%int i=1;
                String sel="select * from tbl_org where status=0";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
                {%>
                <tr>
                    <td><%=i%></td>
                    
               
                    <td><%=rs.getString("org_name")%> </td>
                
                    <td><%=rs.getString("orgty_id")%></td>
                    <td><%=rs.getString("org_contact")%></td> 
                    <td><%=rs.getString("org_address")%></td>
                    <td><%=rs.getString("email")%></td>
                     <td><%=rs.getString("proof")%></td>
                      <td><%=rs.getString("logo")%></td>
                       <td><%=rs.getString("run_by")%></td>
                     
                    <td><%=rs.getString("dis_id")%></td>
                    <td><%=rs.getString("pl_id")%></td>
                    
                    
                    <td><a href="OrganistionApporval.jsp?eid=<%=rs.getString("org_id")%>">APPROVE</a></td><br>
                 <td><a href="OrganistionApporval.jsp?did=<%=rs.getString("org_id")%>">Delete</a></td>
                 </tr>
                <%i++;}
                
                
                %>
                 </table>
                 <br><br>
                 <h1 align="center">Approved List</h1>
            <table align="center" border="2">
                 <tr><th>Sl.No</th>
                     <th>Organization Name</th>
                     <th>Organization Type</th>
                    <th>Contact</th>
                    <th>Address</th>
                    <th>Email</th>
                    <th>proof</th>
                    <th>Logo</th>
                    <th>Run By</th>
                    
                    
                    <th>District</th>
                    <th>place</th></tr>
               
               <%int j=1;
                String sel1="select * from tbl_org where status=1";
                ResultSet rs1=obj.selectCommand(sel1);
                while(rs1.next())
                {%>
                <tr>
                    <td><%=i%></td>
                    
               
                    <td><%=rs1.getString("org_name")%> </td>
                
                    <td><%=rs1.getString("orgty_id")%></td>
                    <td><%=rs1.getString("org_contact")%></td> 
                    <td><%=rs1.getString("org_address")%></td>
                    <td><%=rs1.getString("email")%></td>
                     <td><%=rs1.getString("proof")%></td>
                      <td><%=rs1.getString("logo")%></td>
                       <td><%=rs1.getString("run_by")%></td>
                     
                    <td><%=rs1.getString("dis_id")%></td>
                    <td><%=rs1.getString("pl_id")%></td>
                    
                    
                    
                 </tr>
                <%i++;}
                
                
                %>
                 </table>
        
          </form>
                 
    </body>
    
    
    
</html>
