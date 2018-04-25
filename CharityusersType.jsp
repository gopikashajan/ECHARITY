<%@include file="../admin/guestheader.jsp" %>
<%-- 
    Document   : add_organization.jsp
    Created on : Feb 7, 2018, 12:07:05 PM
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

    <%
        String charId = "", charName="",ename = "",ageFrom="",ageTo="";

        if (request.getParameter("btnsub") != null) 
        {
            if (!request.getParameter("hid").equals("")) 
            {
                       ename = request.getParameter("txtname");
                       ageFrom=request.getParameter("txtagefrom");
                        ageTo=request.getParameter("txtageto");
                String upQuery = "update tbl_usertype set charityuserty_name='"+ename+"',charityuser_agefrom='"+ageFrom+"',charityuser_ageto='"+ageTo+"' where charityuserty_id='" + request.getParameter("hid") + "'";
                out.println(upQuery);
                boolean b = obj.executeCommand(upQuery);
                if (b == true) {
                   response.sendRedirect("CharityusersType.jsp");
                } else
                {
                    out.println(upQuery);
                }

            } 
            else
            {

                String name = request.getParameter("txtname");
                String ageFrom1=request.getParameter("txtagefrom");
                String ageTo1=request.getParameter("txtageto");
                String insQry = "insert into tbl_usertype (charityuserty_name,charityuser_agefrom,charityuser_ageto) values('"+name+"','"+ageFrom1+"','"+ageTo1+"')";
               
                boolean b = obj.executeCommand(insQry);
                if (b == true)
                {
                   response.sendRedirect("CharityusersType.jsp");
                } else
                {
                    out.println(insQry);
                }
            }
        }

        if (request.getParameter("did") != null) 
        {
            String del = "delete from tbl_usertype where charityuserty_id='" + request.getParameter("did") + "'";
            boolean b = obj.executeCommand(del);
            if (b) {
                response.sendRedirect("CharityusersType.jsp");
            } else {
                out.print(del);
            }
        }

        if (request.getParameter("eid") != null) 
        {
            String sel = "select * from tbl_usertype where charityuserty_id='" + request.getParameter("eid") + "'";
            ResultSet rs1 = obj.selectCommand(sel);
            while (rs1.next())
            {
               charId = rs1.getString("charityuserty_id");
                charName = rs1.getString("charityuserty_name");
                ageFrom=rs1.getString("charityuser_agefrom");
                ageTo=rs1.getString("charityuser_ageto");
            }

        }


    %>
    <body>
        <h1 align="center">Charity users Types</h1>

        
        <form>
            <input type="hidden" name="hid" value="<%=charId%>">
            <table id="usertype"  border="1"  align="center" cellpadding="8" bgcolor="#fff" width="50%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">
                <tr>
                    <td>
                  charity users type
                    </td>
                    <td>
                        <input type="text" name="txtname" value="<%=charName%>" required  >
                    </td>
                </tr>
                <tr>
                    <td>
                        Age-from
                    </td>
                    <td>
                        <input type="text" name="txtagefrom" value="<%=ageFrom%>" >
                    </td>
                    
                </tr>
                 <tr>
                    <td>
                        Age-to
                    </td>
                    <td>
                        <input type="text" name="txtageto" value="<%=ageTo%>" >
                    </td>
                    
                </tr>
                <tr>
                    <td colspan="2" align="center">

                        <input type="submit" name="btnsub" value="SUBMIT">
                        <input type="reset" name="delid" value="Cancel">
                    </td>
                </tr>
            </table>
            <table border="1" align="center">
                <tr><th>Sl.No</th><th>Charity users Type</th><th>Age-From</th><th>Age-to</th></tr>
                        <%int i = 1;
                            String sel = "select * from tbl_usertype";
                            ResultSet rs = obj.selectCommand(sel);
                            while (rs.next()) {%>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("charityuserty_name")%></td>
                    <td><%=rs.getString("charityuser_agefrom")%></td>
                    <td><%=rs.getString("charityuser_ageto")%></td>
                    <td><a href="CharityusersType.jsp?did=<%=rs.getString("charityuserty_id")%>">Delete</a></td>
                    <td><a href="CharityusersType.jsp?eid=<%=rs.getString("charityuserty_id")%>">Edit</a></td></tr>
                    <%i++;
                        }


                    %>



            </table>
        </form>


    </body>
</html>
<%@include  file="footer.jsp" %>