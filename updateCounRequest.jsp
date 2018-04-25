<%@include file="../counsellor/guestheader.jsp" %>
<%-- 
    Document   : updateCounRequest.jsp
    Created on : Jan 1, 2009, 2:44:16 AM
    Author     : ckc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
<%
  String des="",status="";
    if (request.getParameter("id")!=null)
    {
        session.setAttribute("reqid", request.getParameter("id"));
        out.println(session.getAttribute("reqid"));
    }
    if(request.getParameter("btnsub")!=null)
        {
   
//String str="update tbl_complaint set com_status=1 where com_id="+cid;
//boolean b=obj.executeCommand(str);
       des=request.getParameter("des");
       status=request.getParameter("status");
       String cid=request.getParameter("id");
       String user=session.getAttribute("counid").toString();
    
       String insQry="insert into tbl_counreply(reply_date,coun_id,reply_des,status,coun_req_id)values(curdate(),'"+user+"','"+des+"','"+status+"','"+session.getAttribute("reqid")+"')";
       String sels="update tbl_counseling_request set com_status=1 where coun_req_id="+cid;
       obj.executeCommand(sels);
       //out.println(insQry);
   
     boolean b=obj.executeCommand(insQry);
    
   if(b==true)
            {
             %>
              <script type="text/javascript">
            alert("upload successfully!!!!!");
             </script>
             <%
              
         
            }
                else
                {
                  out.println(insQry);
                }
        
        }
    %>
   
    <body>
       
        <h1 align='center'>COUNSELLING REPORT</h1>
        <form>
          
            <table id="updatetable" border="1"  align="center" cellpadding="8" bgcolor="#fff" width="50%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">
                <tr>
                    <td>
                         Description
                    </td>
                    <td>
                        <textarea name='des'></textarea>
                    </td>
                </tr>
                <tr>
                    <td>Counselling Status</td>
                    <td><select name="status">
                                    <option value="sel">----select----</option>
                                   
                                    <option value="2">Completed</option>
                        </select></td>
                </tr>
               
                <tr>
                <td colspan="2" align="center">
                 
                <input type="submit" name="btnsub" value="SUBMIT">
               
                </td>
                </tr>
            </table>
        </form>
    </body>
</html>
 <%@include  file="footer.jsp" %>