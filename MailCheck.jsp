<%-- 
    Document   : MailCheck
    Created on : Nov 17, 2017, 10:35:50 AM
    Author     : ckc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>


<%
String ss=request.getParameter("usname");

String s="select * from tbl_office where user_name='"+ss+"'";
ResultSet rs=obj.selectCommand(s);
if(rs.next())
{

}
else
{
    out.println("Not Exist");
}
%>