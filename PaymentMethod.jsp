<%-- 
    Document   : PaymentMethod
    Created on : 16 Feb, 2018, 8:00:52 PM
    Author     : AkHiLeSh
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
    <script>
function check()
{
    if(document.getElementById('card').checked)
    {
        window.location="../purchase/CardPayment.jsp"; 
    }else if(document.getElementById('netbanking').checked)
    {
        window.location="../purchase/NetBanking.jsp";
    }else if(document.getElementById('emi').checked)
    {
        window.location="../purchase/EMI.jsp";
    }else if(document.getElementById('cash').checked)
    {
        window.location="../purchase/FinalPage.jsp";
    }
  

}
</script>
    <body>
        <table cellpadding="7" align="center" bgcolor="#FAFAFA" width="45%" style="box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)">
            <%
           String sel="select * from tbl_cart c inner join tbl_item i on c.Item_id=i.Item_id where Cart_id='"+session.getAttribute("buyid")+"'";
           ResultSet rs=obj.selectCommand(sel);
           if(rs.next()){
            String name=rs.getString("Cart_quantity");   
           
           
           
            %>
            
            <tr align="center">
                <td colspan="2">
                    <img src="../Company/ProductImage/<%=rs.getString("Item_image")%>" width="90" height="95" style="box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
                </td>
                
                <td colspan="3"  align="center">
                    Name:<%=rs.getString("Item_name")%><br><br>
                    Price:<%=rs.getString("Item_price")%><br><br>
                  Discription:<%=rs.getString("Item_description")%>
                </td>     
            </tr>
            <tr align="center">
                <td>
                    Total Quantity:<%=rs.getString("Cart_quantity")%>
                </td>
            </tr>
            <tr align="center">
                <td>
                    Total Price:<%=rs.getString("Cart_unittotal")%>
                </td>
            </tr>
              
            <%
            }
            %>
        </table >
               
        <table align="center" bgcolor="#FAFAFA"  width="45%" style="box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
            <tr>
                <td>
                    <img src="../purchase/img/icon-benefitinvoicing-getpaid.png" width="350" height="200">
                </td>
                <td>
                    <input type="radio" name="method"  id="card">Credit/Debit/ATM Card<br><br>
                    <input type="radio" name="method" id="netbanking">Net Banking<br><br>
                    <input type="radio" name="method" id="emi">EMI<br><br>
                    <input type="radio" name="method" id="cash">Cash On Delivery<br><br>
                    <input type="button" name="submit" size="20" style="background-color:#81D4FA;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19)" value="PAY &#8377; <%=rs.getString("Item_price")%>" onclick="check()">
                    
                </td>
            </tr>
        </table>
    </body>
</html>
