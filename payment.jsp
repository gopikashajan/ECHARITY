<%-- 
    Document   : payment.jsp
    Created on : Feb 27, 2018, 3:05:24 PM
    Author     : ckc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>CHARITY</h1>
        <form>
            <table align="center">
                <tr>
                    <td>
                        <input type="radio" name="cash">Credit card </td></tr>
                <tr>
                    <td><input type="radio" name="cash">Net Banking </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" name="btnsub" value="TRANSFER">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
