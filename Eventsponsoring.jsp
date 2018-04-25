<%@include file="../user/guestheader.jsp" %>
<%-- 
    Document   : Eventsponsoring
    Created on : Mar 14, 2018, 10:30:08 AM
    Author     : ckc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>event sponsoring</title>
    </head>
    <%
        String date="", amount="",event="";
        
    
    if(request.getParameter("btnsub")!=null)
    {
      
            
            date=request.getParameter("date");
            amount=request.getParameter("amount");
           // event=request.getParameter("");
             
             String insQry="insert into tbl_eventsponsoring(eventy_id,spon_date,amount,user_id)values('"+request.getParameter("hid")+"','"+date+"','"+amount+"','"+session.getAttribute("userid")+"')";
             System.out.println("insss\t"+insQry);
            boolean b=obj.executeCommand(insQry);
            
            
            if(b==true)
            {
                  response.sendRedirect("Eventsponsoring.jsp");
            }
                else
                {
                  out.println(insQry);
                }
        
    }    
     %>
         
    <body>
        <form>
        <h1 align="center">EVENT SPONSORING</h1>
         <input type="hidden" name="hid" value=" <%=request.getParameter("eid")%>" >
              <table border="1"  align="center" cellpadding="8" bgcolor="#fff" width="30%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">
            
            <tr>
                <td>
                    Sponsoring-Date
                </td>
                <td>
                    <input type="date" name="date">
                </td>
            </tr>
             <tr>
                <td>
                    Amount
                </td>
                <td>
                    <input type="text" name="amount">
                </td>
            </tr>
               <tr>
                <td colspan="2" align="center">
                 
                <input type="submit" name="btnsub" value="SUBMIT">
                <input type="reset" name="delid" value="Cancel">
                </td>
                </tr>
        </table>
        </form>
    </body>
</html>
<%@include  file="footer.jsp" %>