<%@include file="../user/guestheader.jsp" %>
<%-- 
    Document   : updateOrgRequest
    Created on : Jan 1, 2009, 1:13:18 AM
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
       String user=session.getAttribute("userid").toString();
    
       String insQry="insert into tbl_req_reply(rep_date,user_id,req_description,req_id)values(curdate(),'"+user+"','"+des+"','"+session.getAttribute("reqid")+"')";
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
       
        <h1 align='center'></h1>
        <form>
          
                   <table border="1"  align="center" cellpadding="8" bgcolor="#fff" width="30%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">
                <tr>
                    <td>
                         Description
                    </td>
                    <td>
                        <textarea name='des'></textarea>
                    </td>
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