<%@include file="../user/guestheader.jsp" %>
<%-- 
    Document   : CardPayment
    Created on : 16 Feb, 2018, 8:04:23 PM
    Author     : AkHiLeSh
--%>

<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<jsp:useBean id="mail" class="db.mailconnection"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    
        <script>
            function  show(show)
            {
                document.getElementById(show).style.display='block';
                return false;
                
            }
            
        </script>
    </head>
    <body>
        <div>
            
        
        <%
            int i=0;
        String emailid="";
            String name="", otp="";
             String text="";
        String dat=session.getAttribute("date").toString();
          String ant=session.getAttribute("amt").toString();
           String user=session.getAttribute("userid").toString();
           String sel="select * from tbl_user where user_id='"+session.getAttribute("userid")+"'";
           ResultSet rs=obj.selectCommand(sel);
           while(rs.next())
           
           {
             emailid=rs.getString("email");
           }
          //out.println(dat);
           //out.println(ant);
           //out.println(emailid);
//           if(request.getParameter("btnsub") != null)
         
         
            if(request.getParameter("submit")!= null)
            {
    
                String SALTCHARS="ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
                StringBuilder salt= new StringBuilder();
                Random rndl=new Random();
                while(salt.length() < 6)
                {
                    int index=(int) (rndl.nextFloat() * SALTCHARS.length());
                    salt.append(SALTCHARS.charAt(index));
                }
                text=salt.toString();
   
                String to[]={emailid};
                String sub="OTP";
                out.println(sub);
                mail.sendMail(to, sub, text);   
               
                  
            
         
            }
            
          if(request.getParameter("CONFIRM")!= null)
          {
            if(request.getParameter("txt_otp").equals(request.getParameter("hotp")))  
            {
                String insqry="insert into tbl_donation(date,amount,user_id) values('"+dat+"','"+ant+"','"+session.getAttribute("userid")+"')";
                    System.out.println(insqry);
                      boolean b=obj.executeCommand(insqry); 

                      if(b==true)
                      {
                          out.print("done");
                      }else
                     {
                         out.print("notdone");
                     } 
            }else
            {
               out.print("eeeeeee");
            }
          }
            
        
        %>
       
        
        <form>  
       
      
        <table align="center">
            <tr align="center">
                
                 <td> 
                 <input type="date" name="date" style="width: 50%;padding: 12px 20px; margin: 8px 0;
                    box-sizing: border-box;border-radius: 5px; background-image: url('../purchase/icon/calendar.png'); background-position: 2px 2px; background-repeat: no-repeat;">
                   <input type="text" name="txt_cvv" placeholder="CVV" style="width: 20%;padding: 12px 20px; margin: 8px 0;
                        box-sizing: border-box;border-radius: 5px; background-position: 2px 2px; background-repeat: no-repeat;"><br>
                  <input type="text" name="txt_pin" placeholder="Enter pin" style="width: 70%;padding: 12px 20px; margin: 8px 0;
                         box-sizing: border-box;border-radius: 5px; background-image: url('../purchase/icon/at.png'); background-position: 2px 2px; background-repeat: no-repeat;">
                 </td>
                 <td>
                    <input type="text" name="txt_name" placeholder="Enter hard holder name" style="width: 100%;padding: 12px 20px; margin: 8px 0;
                        box-sizing: border-box;border-radius: 5px; background-image: url('../purchase/icon/add-contact(1).png'); background-position: 2px 2px; background-repeat: no-repeat;"><br>
               
                 <input type="text" name="txt_cardno" placeholder="Enter Card Number" style="width: 100%;padding: 12px 20px; margin: 8px 0;
                        box-sizing: border-box;border-radius: 5px; background-image: url('../purchase/icon/credit-card.png'); background-position: 2px 2px; background-repeat: no-repeat;"><br>
                 </td>
            </tr> 
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="submit" size="20" style="background-color:#81D4FA;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" value="Verify"><br>
                    <input type="hidden" name="hotp" value="<%=text%>">
                </td>
            </tr>
        </table>
            
        </div><br><br>
        <div id="otp">
            <table align="center">
                <tr align="center">
                    <td>
                    <input type="text" name="txt_otp" placeholder="Enter OTP number"> 
               </td>
                </tr><br><br>
                <td colspan="2" align="center"><br><br>
                    <input type="submit" name="CONFIRM" size="20" style="background-color:#81D4FA;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" value="CONFIRM" >
                  
                </td>
            </table>
        </div>
        </form> 
    </body>
</html>
<%@include  file="footer.jsp" %>