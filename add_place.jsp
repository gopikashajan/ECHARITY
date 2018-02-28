<%-- 
    Document   : add_place.jsp
    Created on : Feb 6, 2018, 11:05:58 AM
    Author     : ckc
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        String name="",did="";
        
    
    if(request.getParameter("btnsub")!=null)
        {
      
            
            name=request.getParameter("txt_place");
            did=request.getParameter("district");
            String insQry="insert into tbl_place(pl_name,dis_id)values('"+name+"','"+did+"')";
            
          out.println(insQry);
            boolean b=obj.executeCommand(insQry);
            
            
            if(b==true)
            {
                  response.sendRedirect("add_place.jsp");
            }
                else
                {
                  out.println(insQry);
        }
    }
        
    %>
    <body>
         <center><h1>PLACES</h1></center>
        <form>
            <table border="0" align="center">
                <tr>
                    <td>
                        place Name
                    </td>
                    <td>
                        <input type="text" name="txt_place" required  >
                    </td>
                </tr>
                <tr>
                    <td>
                        District 
                    </td>
                    <td>
                        <select name="district" required="">
                            <option value="">
                                --select--
                            </option>
                            <%
                            String str="select * from tbl_district";
                            ResultSet rs=obj.selectCommand(str);
                            while (rs.next())
                            {
                           %>
                           <option value="<%=rs.getString("dis_id")%>">
                               <%=rs.getString("dis_name")%>
                           </option>
                            <%
                            }
                            %>
                            
                        </select>
                    </td>
                </tr>
                <tr>
                <td colspan="2" align="center">
                 
                <input type="submit" name="btnsub" value="SUBMIT">
                <input type="reset" name="delid" value="Cancel">
                </td>
                </tr>
            </table>
            
    </body>
</html>
