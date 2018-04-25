<%@include file="../admin/guestheader.jsp" %>
<%-- 
    Document   : CompanyList
    Created on : Mar 11, 2018, 10:29:22 AM
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
          String del="update  tbl_company set status=1 where comp_id='"+request.getParameter("eid")+"'";
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
          String del="update tbl_company set status=2 where comp_id='"+request.getParameter("did")+"'";
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
        
        <h1 align="center">Company Approval</h1>
          <form name="approve" method="post">
            <table id="companilist" border="1"  align="center" cellpadding="8" bgcolor="#fff" width="50%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">
                 <tr><th>Sl.No</th>
                     <th>Company Name</th>
                     <th>Address</th>
                     <th>Contact</th>
                     <th>Email</th>
                     <th>Logo</th>
                     <th>District</th>
                     <th>place</th></tr>
               
               <%int i=1;
                String sel="select * from tbl_company co  inner join tbl_place pl on pl.pl_id=co.pl_id inner join tbl_district di on di.dis_id=pl.dis_id where co.status=0";
                ResultSet rs=obj.selectCommand(sel);
                System.out.println("SEL\t"+sel);
                while(rs.next())
                {
              
               %>
                <tr>
                    <td><%=i%></td>
                    
               
                    <td><%=rs.getString("comp_name")%> </td>
                
                    <td><%=rs.getString("comp_address")%></td>
                    <td><%=rs.getString("comp_contact")%></td> 
                    <td><%=rs.getString("comp_email")%></td>
                    <td><img height="50" src="../Company/Logo/<%=rs.getString("logo") %>"></td>
                    <td><%=rs.getString("dis_name")%></td>
                    <td><%=rs.getString("pl_name")%></td>
                    
                    
                    <td><a href="CompanyList.jsp?eid=<%=rs.getString("comp_id")%>">APPROVE</a></td><br>
                    <td><a href="CompanyList.jsp?did=<%=rs.getString("comp_id")%>">REJECT</a></td>
                 </tr>
                <%i++;}
                
                
                %>
                 </table>
                 <br><br>
                 <h1 align="center">Approved List</h1>
            <table align="center" border="2">
                 
                     <tr><th>Sl.No</th>
                     <th>Company Name</th>
                     <th>Address</th>
                     <th>Contact</th>
                     <th>Email</th>
                     <th>Logo</th>
                     <th>District</th>
                     <th>place</th></tr>
               
               <%int j=1;
                String sel1="select * from tbl_company co  inner join tbl_place pl on pl.pl_id=co.pl_id inner join tbl_district di on di.dis_id=pl.dis_id  where status=1";
                ResultSet rs1=obj.selectCommand(sel1);
                while(rs1.next())
                {
                System.out.print(rs1.getString("logo"));
               %>
                <tr>
                    <td><%=i%></td>
                    
               
                    <td><%=rs1.getString("comp_name")%> </td>
                
                    <td><%=rs1.getString("comp_address")%></td>
                    <td><%=rs1.getString("comp_contact")%></td> 
                    <td><%=rs1.getString("comp_email")%></td>
                   <td><img height="50" src="../Company/Logo/<%=rs1.getString("logo")%>"></td>
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
                     <th>Company Name</th>
                     <th>Address</th>
                     <th>Contact</th>
                     <th>Email</th>
                     <th>Logo</th>
                     <th>District</th>
                     <th>place</th></tr>
               <%int k=1;
                String sel2="select * from tbl_company co  inner join tbl_place pl on pl.pl_id=co.pl_id inner join tbl_district di on di.dis_id=pl.dis_id   where status=2";
                ResultSet rs2=obj.selectCommand(sel2);
                while(rs2.next())
                {%>
                <tr>
                    <td><%=i%></td>
                    
               
                     <td><%=rs2.getString("comp_name")%> </td>
                
                    <td><%=rs2.getString("comp_address")%></td>
                    <td><%=rs2.getString("comp_contact")%></td> 
                    <td><%=rs2.getString("comp_email")%></td>
                    <td><img height="50" src="../Company/Logo/<%=rs.getString("logo")%>"></td>
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