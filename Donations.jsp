<%-- 
    Document   : Donations
    Created on : Feb 13, 2018, 3:33:47 PM
    Author     : ckc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<!DOCTYPE <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <form>
            <%
                
            String name="",address="",contact="",email="",photo="";
            String sel="select * from tbl_user where user_id='"+session.getAttribute("userid")+"'";
            ResultSet rs=obj.selectCommand(sel);
            while (rs.next())
            {
                name=rs.getString("user_name");
                address=rs.getString("address");
                contact=rs.getString("contact_no");
                email=rs.getString("email");
                photo=rs.getString("photo");
            }
            String amount="",date="";
            if(request.getParameter("btnsub")!=null)
            {
                 date=request.getParameter("txtdate");
                amount=request.getParameter("txtamt");
                String insqry="insert into tbl_fund(date,amount,user_id) values('"+date+"','"+amount+"','"+session.getAttribute("userid")+"')";
                boolean b=obj.executeCommand(insqry);
                response.sendRedirect("../user/payment.jsp");
              
            }
            
            %>
        <h1 align="center">DONATION</h1>
        <table align="center">
                    <tr>
                        <td>
                        Name
                        </td>
                        <td>
                            <label>
                                <%=name%>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Address
                        </td>
                        <td>
                            <label>
                                <%=address%>
                            </label>
                        </td>
                    </tr>
                     <tr>
                        <td>
                          Contact
                        </td>
                        <td>
                            <label>
                                <%=contact%>
                            </label>
                        </td>
                    </tr>
                     <tr>
                        <td>
                         Email
                        </td>
                        <td>
                            <label>
                                <%=email%>
                            </label>
                        </td>
                    </tr>
                        <tr>
                        <td>
                       Photo
                        </td>
                        <td>
                            <label>
                                <%=photo%>
                            </label>
                        </td>
                    </tr>
                     <tr>
                        <td>
                         Date
                        </td>
                        <td>
                            <input type="text" name="txtdate">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Amount
                        </td>
                        <td>
                            <input type="text" name="txtamt">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" name="btnsub" value="DONATE">
                            <input type="reset" name="reset" value="CANCEL">
                        </td>
                    </tr>
        </table>
       </form>
    </body>
</html>
