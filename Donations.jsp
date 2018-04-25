<%@include file="../user/guestheader.jsp" %>
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
        <title>donation</title>
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
                session.setAttribute("date", request.getParameter("txtdate"));
                 session.setAttribute("amt", request.getParameter("txtamt"));
//                String insqry="insert into tbl_fund(date,amount,user_id) values('"+date+"','"+amount+"','"+session.getAttribute("userid")+"')";
//                boolean b=obj.executeCommand(insqry);
                response.sendRedirect("../user/payment.jsp");
              
            }
            
            %>
        <h1 align="center">DONATION</h1>
              <table id="donation" border="1"  align="center" cellpadding="8" bgcolor="#fff" width="50%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">
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
                                 <img height="60" src="Logo/<%=photo%>">
                            </label>
                        </td>
                    </tr>
                     <tr>
                        <td>
                         Date
                        </td>
                        <td>
                            <input type="date" name="txtdate">
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
<%@include  file="footer.jsp" %>