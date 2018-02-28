<%-- 
    Document   : place
    Created on : Nov 7, 2017, 1:36:03 PM
    Author     : ckc
--%>

<%@page import="java.sql.ResultSet"%>

<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      
        <script src="jq.js" type="text/javascript"></script>
        <script>
            function getDistrict(v)
            {
                        //    alert(v);
             $.ajax({url: "ajax_state.jsp?id="+v, success: function(result){
        $("#dis").html(result);
    }});
            }
            </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form>
          

           
           <select name="state"  required="" onchange="getDistrict(this.value)">
                            <option value="">
                                --select--
                            </option>
                            <%
                            String str="select * from tbl_state";
                            ResultSet rs=obj.selectCommand(str);
                            while (rs.next())
                            {
                           %>
                           <option value="<%=rs.getString("state_id")%>">
                               <%=rs.getString("state_name")%>
                           </option>
                            <%
                            }
                            %>
                            
                        </select><br>
            <select name="district" id="dis" required="">
                            <option value="">
                                --select--
                            </option>
            </select>
       </form>
        
    </body>
</html>
