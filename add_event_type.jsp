<%@include file="../admin/guestheader.jsp" %>
<%-- 
    Document   : add_event_type
    Created on : Feb 6, 2018, 12:13:55 PM
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
        String evenId = "", evenName = "";

        if (request.getParameter("btnsub") != null) 
        {
            if (!request.getParameter("hid").equals("")) 
            {
                String ename = request.getParameter("txtname");
                String upQuery = "update tbl_eventype set eventy_name='" + ename + "'where eventy_id='" + request.getParameter("hid") + "'";
                out.println(upQuery);
                boolean b = obj.executeCommand(upQuery);
                if (b == true) {
                    response.sendRedirect("add_event_type.jsp");
                } else
                {
                    out.println(upQuery);
                }

            } 
            else
            {

                String name = request.getParameter("txtname");
                String insQry = "insert into tbl_eventype(eventy_name) values('" + name + "')";
                out.println(insQry);
                boolean b = obj.executeCommand(insQry);
                if (b == true)
                {
                    response.sendRedirect("add_event_type.jsp");
                } else
                {
                    out.println(insQry);
                }
            }
        }

        if (request.getParameter("did") != null) 
        {
            String del = "delete from tbl_eventype where eventy_id='" + request.getParameter("did") + "'";
            boolean b = obj.executeCommand(del);
            if (b) {
                response.sendRedirect("add_event_type.jsp");
            } else {
                out.print(del);
            }
        }

        if (request.getParameter("eid") != null) 
        {
            String sel = "select * from tbl_eventype where eventy_id='" + request.getParameter("eid") + "'";
            ResultSet rs1 = obj.selectCommand(sel);
            while (rs1.next())
            {
                evenId = rs1.getString("eventy_id");
                evenName = rs1.getString("eventy_name");

            }

        }


    %>
    <body>
        <h1 align="center">Event Types</h1>

        
        <form>
            <input type="hidden" name="hid" value="<%=evenId%>">
            <table id="event" border="1"  align="center" cellpadding="8" bgcolor="#fff" width="50%" style="border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19)">
                <tr>
                    <td>
                        Event type
                    </td>
                    <td>
                        <input type="text" name="txtname" value="<%=evenName%>" required  >
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
                <tr><th>Sl.No</th><th>Event Type</th></tr>
                        <%int i = 1;
                            String sel = "select * from tbl_eventype";
                            ResultSet rs = obj.selectCommand(sel);
                            while (rs.next()) {%>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("eventy_name")%></td>
                    <td><a href="add_event_type.jsp?did=<%=rs.getString("eventy_id")%>">Delete</a></td>
                    <td><a href="add_event_type.jsp?eid=<%=rs.getString("eventy_id")%>">Edit</a></td></tr>
                    <%i++;
                        }


                    %>



            </table>
        </form>


    </body>
</html>
<%@include  file="footer.jsp" %>