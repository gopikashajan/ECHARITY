<%@include file="../admin/guestheader.jsp" %>
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
            <table id="org" border="1"  align="center" cellpadding="8" bgcolor="#fff" width="50%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">
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
                String sel="select * from tbl_org og inner join tbl_orgtype ot on og.orgty_id=ot.orgty_id  inner join tbl_place p on p.pl_id=og.pl_id inner join tbl_district d on d.dis_id=p.dis_id where og.status=0";
                ResultSet rs=obj.selectCommand(sel);
                while(rs.next())
                {%>
                <tr>
                    <td><%=i%></td>
                    
               
                    <td><%=rs.getString("org_name")%> </td>
                
                    <td><%=rs.getString("orgty_name")%></td>
                    <td><%=rs.getString("org_contact")%></td> 
                    <td><%=rs.getString("org_address")%></td>
                    <td><%=rs.getString("email")%></td>
                    <td><img height="50" src="../organization/proof/<%=rs.getString("proof")%>"></td>
                    <td><img height="50" src="../organization/Logo/<%=rs.getString("logo")%>"></td>
                       <td><%=rs.getString("run_by")%></td>
                     
                    <td><%=rs.getString("dis_name")%></td>
                    <td><%=rs.getString("pl_name")%></td>
                    
                    
                    <td><a href="OrganistionApporval.jsp?eid=<%=rs.getString("org_id")%>">APPROVE</a></td><br>
                 <td><a href="OrganistionApporval.jsp?did=<%=rs.getString("org_id")%>">REJECT</a></td>
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
                String sel1="select * from tbl_org og inner join tbl_orgtype ot on og.orgty_id=ot.orgty_id  inner join tbl_place p on p.pl_id=og.pl_id inner join tbl_district d on d.dis_id=p.dis_id  where status=1";
                ResultSet rs1=obj.selectCommand(sel1);
                while(rs1.next())
                {%>
                <tr>
                    <td><%=i%></td>
                    
               
                    <td><%=rs1.getString("org_name")%> </td>
                
                    <td><%=rs1.getString("orgty_name")%></td>
                    <td><%=rs1.getString("org_contact")%></td> 
                    <td><%=rs1.getString("org_address")%></td>
                    <td><%=rs1.getString("email")%></td>
                    <td><img height="50" src="../organization/proof/<%=rs1.getString("proof")%>"></td>
                    <td><img height="50" src="../organization/Logo/<%=rs1.getString("logo")%>"></td>
                       <td><%=rs1.getString("run_by")%></td>
                     
                    <td><%=rs1.getString("dis_name")%></td>
                    <td><%=rs1.getString("pl_name")%></td>
                    
                    
                    
                 </tr>
                <%i++;}
                
                
                %>
                 </table>
                  <br><br>
                 <h1 align="center">Rejected List</h1>
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
               
               <%int k=1;
                String sel2="select * from tbl_org og inner join tbl_orgtype ot on og.orgty_id=ot.orgty_id  inner join tbl_place p on p.pl_id=og.pl_id inner join tbl_district d on d.dis_id=p.dis_id  where status=2";
                ResultSet rs2=obj.selectCommand(sel2);
                while(rs2.next())
                {%>
                <tr>
                    <td><%=i%></td>
                    
               
                    <td><%=rs2.getString("org_name")%> </td>
                
                    <td><%=rs2.getString("orgty_name")%></td>
                    <td><%=rs2.getString("org_contact")%></td> 
                    <td><%=rs2.getString("org_address")%></td>
                    <td><%=rs2.getString("email")%></td>
                    <td><img height="50" src="../organization/proof/<%=rs2.getString("proof")%>"></td>
                    <td><img height="50" src="../organization/Logo/<%=rs2.getString("logo")%>"></td>
                       <td><%=rs2.getString("run_by")%></td>
                     
                    <td><%=rs2.getString("dis_name")%></td>
                    <td><%=rs2.getString("pl_name")%></td>
                    
                    
                    
                 </tr>
                <%i++;}
                
                
                %>
                 </table>
        
        
          </form>
                 
    </body>
    
    
    
</html>
<%@include  file="footer.jsp" %>