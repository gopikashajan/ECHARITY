<%-- 
    Document   : ajax_bankins
    Created on : 20 Feb, 2018, 1:31:34 PM
    Author     : AkHiLeSh
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<%
    
    String a=request.getParameter("id");
    String emirate="";
    String month="";
    String total="";
   

      String sel1="select * from tbl_cart where Cart_id='"+session.getAttribute("buyid")+"'";
           ResultSet rs1=obj.selectCommand(sel1);
           if(rs1.next()){
             total=rs1.getString("Cart_unittotal");   
           }
    
   
   String sel="select * from tbl_bankintrest where bank_id='"+a+"'";
   ResultSet rs=obj.selectCommand(sel);
   while(rs.next())
   {
      emirate=rs.getString("bin_rate");
      month=rs.getString("bin_month");
     Float intotal=(Float.parseFloat(total)*Float.parseFloat(emirate))/100;
     Float totrate=Float.parseFloat(total)+intotal;
    Float permonth=totrate/Float.parseFloat(month);
    %>
       
    <input type="radio" name="emi"> &#8377; &nbsp; <%=permonth%>  &nbsp; for &nbsp;  <%=month%> &nbsp; Months &nbsp; @ <%=emirate%> %  &nbsp;for &nbsp; <%=total%> <br><br>
    
    
      
 <%     
   }

%>
