<%@include file="../user/guestheader.jsp" %>
<%-- 
    Document   : ChangePassword
    Created on : Mar 11, 2018, 10:30:24 AM
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
    <body>
        <%
            String current="";
            String newpwd="";
            String retype="";
            if(request.getParameter("btnsubmit")!=null)
            {
                current=request.getParameter("txtcpwd");
                newpwd=request.getParameter("txtnpwd");
                retype=request.getParameter("txtrpwd");
                if(newpwd.equals(retype))
                {
                   String sel="select l.login_id from tbl_login l inner join tbl_company c on l.login_id=c.login_id where l.password='"+current+"' and c.comp_id='"+session.getAttribute("compid")+"'";
                   ResultSet rs=obj.selectCommand(sel);
                   if(rs.next())
                   {
                       String logid=rs.getString("l.login_id");
                       String update="update tbl_login set password='"+newpwd+"' where login_id="+logid;
                       
                       boolean b=obj.executeCommand(update);
                       if(b==true)
                       {
                            %>
                    <script>
                        alert("Password Changed");
                    </script>
                    <%
                       }
                   }
                   else
                   {
                        %>
                    <script>
                        alert("Current Password Missmatch");
                    </script>
                    <%
                   }
                }
                else
                {
                    %>
                    <script>
                        alert("New Password Missmatch");
                    </script>
                    <%
                }
            }
        
        %>
        
        <form>
            <br>
            <table id="changepassword1" border="1"  align="center" cellpadding="8" bgcolor="#fff" width="30%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">
                <tr>
                    <th>Current Password</th>
                    <td><input type="password" name="txtcpwd" required=""></td>
                </tr>
                <tr>
                    <th>New Password</th>
                    <td><input type="password" name="txtnpwd" required=""></td>
                </tr>
                <tr>
                    <th>Retype Password</th>
                    <td><input type="password" name="txtrpwd" required=""></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Change">
                        <input type="reset" name="btnreset" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
<%@include  file="footer.jsp" %>