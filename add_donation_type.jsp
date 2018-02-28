<%-- 
    Document   : add_donation_type.jsp
    Created on : Feb 7, 2018, 9:39:33 AM
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
        String donationId = "", donationName = "";

        if (request.getParameter("btnsub") != null) 
        { 
            String dname = request.getParameter("txtname");
            if (!request.getParameter("hid").equals("")) 
            {
               
                String upQuery = "update tbl_dtntype set dtntype_name='" + dname + "'where dtntype_id='" + request.getParameter("hid") + "'";
               // out.println(upQuery);
                boolean b = obj.executeCommand(upQuery);
            
            } 
           else 
            {

                String name = request.getParameter("txtname");
                String insQry = "insert into tbl_dtntype (dtntype_name) values('" + name + "')";
               
                boolean b = obj.executeCommand(insQry);
                if (b == true)
                {
                    %>
                    <script>
                        alert("inserted");
                    </script>
                    <%
                   
                } 
                else 
                {
                     %>
                    <script>
                        alert("not inserted");
                    </script>
                    <%
                }
            }
       }

        if (request.getParameter("did") != null)
        {
          String del = "delete from tbl_dtntype where dtntype_id='" + request.getParameter("did") + "'";
           boolean b = obj.executeCommand(del);
          if (b==true)
           {
               response.sendRedirect("add_donation_type.jsp");
           } else 
           {
            
              out.print(del);
           }
        }

        if (request.getParameter("eid") != null) 
        {
            String sel = "select * from tbl_dtntype where dtntype_id='" + request.getParameter("eid") + "'";
            ResultSet rs1 = obj.selectCommand(sel);
            while (rs1.next()) 
            {
                donationId = rs1.getString("dtntype_id");
                donationName = rs1.getString("dtntype_name");

            }

        }


    %>
   
        <h1 align="center">Donation Types</h1>


        <form>
            <input type="hidden" name="hid" value="<%=request.getParameter("eid")%>">
            <table border="1" align="center">
                <tr>
                    <td>
                        Donation type
                    </td>
                    <td>
                        <input type="text" name="txtname" value="<%=donationName%>" ><br>
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
                <tr><th>Sl.No</th><th>Donation Type</th></tr>
                        <%
                        int i = 1;
                            String sel = "select * from tbl_dtntype";
                            ResultSet rs = obj.selectCommand(sel);
                            while (rs.next()) 
                            
                            {
                                i++;
                        %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("dtntype_name")%></td>
                    <td><a href="add_donation_type.jsp?did=<%=rs.getString("dtntype_id")%>">Delete</a></td>
                    <td><a href="add_donation_type.jsp?eid=<%=rs.getString("dtntype_id")%>">Edit</a></td></tr>
                    <%
                        }


                    %>



            </table>
        </form>


    </body>
</html>
