<%@include file="../organization/guestheader.jsp" %>
<%-- 
    Document   : organizationRequest
    Created on : Jan 1, 2009, 12:55:49 AM
    Author     : ckc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<!DOCTYPE html>
<html>
    <div>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    
       
        
   
        
<%
    String subject="",des="";
    
      if(request.getParameter("btnsub")!=null)
        {
      
            
            subject=request.getParameter("subtxt");
            des=request.getParameter("des");
             String user=session.getAttribute("orgid").toString();
            String insQry="insert into tbl_organi_request(req_date,req_subject,req_details,status,org_id)values(curdate(),'"+subject+"','"+des+"','0','"+user+"')";
    
           //out.println(insQry);
            boolean b=obj.executeCommand(insQry);
           
            if(b==true)
            {
               
             %>
              <script type="text/javascript">
            alert("upload successfully!!!!!");
             </script>
             <%
              
//           response.sendRedirect("add_complaint.jsp");
            }
                else
                {
                  out.println(insQry);
                }
        }
    %>
   
    <body>
        
        <h1 align="center"></h1>
        <form>
            <table id="orgreq" border="1"  align="center" cellpadding="8" bgcolor="#fff" width="30%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">
                
                 
                <tr>
                    <td>
                         Subject
                    </td>
                    <td>
                        <input type="text" name="subtxt">
                    </td>
                </tr>
                
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
                        <input type="submit" name="btnsub" value="SUBMIT" class="btn btn-success">
                        <input type="reset" name="delid" class="btn btn-danger" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
     
    </body>
</html>
</div>
<%@include  file="footer.jsp" %>