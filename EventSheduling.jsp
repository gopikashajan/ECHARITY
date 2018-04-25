<%@include file="../admin/guestheader.jsp" %>
<%-- 
    Document   : EventSheduling
    Created on : Feb 13, 2018, 3:19:36 PM
    Author     : ckc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>evnet sheduling</title>
    </head>
     <%
        String name="",date="",Fromtime="",Totime="",venue="",add="",org="";
        
    
    if(request.getParameter("btnsub")!=null)
    {
      
            
            name=request.getParameter("event");
            date=request.getParameter("shedate");
            Fromtime=request.getParameter("shetime1");
            Totime=request.getParameter("shetime2");
            venue=request.getParameter("sheven");
            add=request.getParameter("sheadd");
             org=request.getParameter("org");
             
             String insQry="insert into tbl_evenshedule(shed_date,shed_fromtime,shed_totime,venue,address,org_id,eventy_id)values('"+date+"','"+Fromtime+"','"+ Totime+"','"+venue+"','"+add+"','"+org+"','"+name+"')";
      out.println(insQry);
            boolean b=obj.executeCommand(insQry);
            
            
            if(b==true)
            {
                  response.sendRedirect("EventSheduling.jsp");
            }
                else
                {
                  out.println(insQry);
                }
        
    }    
     %>
         
    <body>
        <h1 align="center">EVENT SHEDULE</h1>
        
        <form>
            <table id="she" border="1"  align="center" cellpadding="8" bgcolor="#fff" width="50%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">
                <tr>
                    <td>
                        Event Name
                    </td>
                   <td>
                        <select name="event" required="">
                            <option value="">
                                --select--
                            </option>
                            <%
                            String str="select * from tbl_eventype";
                            ResultSet rd=obj.selectCommand(str);
                            while (rd.next())
                            {
                           %>
                           <option value="<%=rd.getString("eventy_id")%>">
                               <%=rd.getString("eventy_name")%>
                           </option>
                            <%
                            }
                            %>
                            
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Organization Name
                    </td>
                   <td>
                        <select name="org" required="">
                            <option value="">
                                --select--
                            </option>
                            <%
                            String str1="select * from tbl_org where status=1";
                            ResultSet rd1=obj.selectCommand(str1);
                            while (rd1.next())
                            {
                           %>
                           <option value="<%=rd1.getString("org_id")%>">
                               <%=rd1.getString("org_name")%>
                           </option>
                            <%
                            }
                            %>
                            
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Date
                    </td>
                    <td>
                        <input type="date" name="shedate">
                    </td>
                </tr>
                <tr>
                    <td>
                       From-Time
                    </td>
                    <td>
                        <input type="time" name="shetime1">
                    </td>
                </tr>
                 <tr>
                    <td>
                      To-Time
                    </td>
                    <td>
                        <input type="time" name="shetime2">
                    </td>
                </tr>
                  
                 <tr>
                    <td>
                        Venue
                    </td>
                    <td>
                        <input type="text" name="sheven">
                    </td>
                </tr>
                 <tr>
                     <td> Address </td>
                    <td>
                        <textarea name='sheadd'></textarea>
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