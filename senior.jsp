<%@include file="../user/guestheader.jsp" %>
<%-- 
    Document   : senior.jsp
    Created on : Feb 28, 2018, 11:45:25 AM
    Author     : ckc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>senior</title>
    </head>
   
         <%
      
    
    if(request.getParameter("eid")!=null)
    {
      
            
           
             
             String insQry="insert into tbl_sponsor(char_id,user_id,status)values('"+request.getParameter("eid")+"','"+session.getAttribute("userid")+"','1')";
             System.out.println("insss\t"+insQry);
            boolean b=obj.executeCommand(insQry);
            
            
            if(b==true)
            {
                  response.sendRedirect("senior.jsp");
            }
                else
                {
                  out.println(insQry);
                }
        
    }    
     %> 
    <body>
        <form>
             <input type="hidden" name="hid" value="<%=request.getParameter("eid")%>" >
          <h1 align="center">SENIOR CITIZENS LIST</h1>
                  <table border="1"  align="center" cellpadding="8" bgcolor="#fff" width="50%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">
                 <tr><th>Sl.No</th>
                     <th> Name</th>
                     <th>charity users Type</th>
                    <th>Contact</th>
                    <th>Address</th>
                    <th>Email</th>
                    <th>Adhar no</th>
                      <th>photo</th>
                    <th>District</th>
                    <th>place</th></tr>
                    
                    
               <%int i=1;
                String sel1="select * from tbl_charityusers ch inner join tbl_usertype ut on ut.charityuserty_id=ch.charityuserty_id inner join tbl_place p on p.pl_id=ch.pl_id  inner join tbl_district dt on dt.dis_id=p.dis_id where ch.charityuserty_id=9;";
                ResultSet rs1=obj.selectCommand(sel1);
                while(rs1.next())
                {%>
                <tr>
                    <td><%=i%></td>
                    
               
                    <td><%=rs1.getString("char_name")%> </td>
                
                    <td><%=rs1.getString("charityuserty_name")%></td>
                    <td><%=rs1.getString("contact_no")%></td> 
                    <td><%=rs1.getString("address")%></td>
                    <td><%=rs1.getString("email")%></td>
                     <td><%=rs1.getString("adhar_no")%></td>
                       <td><img height="50" src="../organization/charitylogo/<%=rs1.getString("photo")%>"></td>
                    <td><%=rs1.getString("dis_name")%></td>
                    <td><%=rs1.getString("pl_name")%></td>
                      <td><a href="senior.jsp?eid=<%=rs1.getString("char_id")%>">SPONSOR</a></td><br>
                    
                    
                 </tr>
                <%i++;}
                
                
                %>
            </table>
            </form>
    </body>
</html>
<%@include  file="footer.jsp" %>