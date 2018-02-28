<%-- 
    Document   : add_district
    Created on : Jan 31, 2018, 12:24:15 PM
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
        String distId = "", distName = "";

        if (request.getParameter("btnsub") != null) 
        {
            if (!request.getParameter("hid").equals("")) 
            {
                String dname = request.getParameter("txtname");
                String upQuery = "update tbl_district set dis_name='" + dname + "'where dis_id='" + request.getParameter("hid") + "'";
                out.println(upQuery);
                boolean b = obj.executeCommand(upQuery);
                if (b == true) {
                    response.sendRedirect("add_district.jsp");
                } else
                {
                    out.println(upQuery);
                }

            } 
            else
            {

                String name = request.getParameter("txtname");
                String insQry = "insert into tbl_district(dis_name) values('" + name + "')";
                out.println(insQry);
                boolean b = obj.executeCommand(insQry);
                if (b == true)
                {
                    response.sendRedirect("add_district.jsp");
                } else
                {
                    out.println(insQry);
                }
            }
        }

        if (request.getParameter("did") != null) 
        {
            String del = "delete from tbl_district where dis_id='" + request.getParameter("did") + "'";
            boolean b = obj.executeCommand(del);
            if (b) {
                response.sendRedirect("add_district.jsp");
            } else {
                out.print(del);
            }
        }

        if (request.getParameter("eid") != null) 
        {
            String sel = "select * from tbl_district where dis_id='" + request.getParameter("eid") + "'";
            ResultSet rs1 = obj.selectCommand(sel);
            while (rs1.next())
            {
                distId = rs1.getString("dis_id");
                distName = rs1.getString("dis_name");

            }

        }


    %>
    <body>
        <h1 align="center">District</h1>

        
        <form>
            <input type="hidden" name="hid" value="<%=distId%>">
            <table border="1" align="center">
                <tr>
                    <td>
                        District Name
                    </td>
                    <td>
                        <input type="text" name="txtname" value="<%=distName%>" required  >
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">

                        <input type="submit" name="btnsub" value="SUBMIT">
                        <input type="reset" name="delid" value="Cancel">
                    </td>
                </tr>
            </table>
                    <br>
            <table border="1" align="center">
                <tr><th>Sl.No</th><th>District Name</th></tr>
                        <%int i = 1;
                            String sel = "select * from tbl_district";
                            ResultSet rs = obj.selectCommand(sel);
                            while (rs.next()) {%>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("dis_name")%></td>
                    <td><a href="add_district.jsp?did=<%=rs.getString("dis_id")%>">Delete</a></td>
                    <td><a href="add_district.jsp?eid=<%=rs.getString("dis_id")%>">Edit</a></td></tr>
                    <%i++;
                        }


                    %>



            </table>
        </form>


    </body>
</html>
