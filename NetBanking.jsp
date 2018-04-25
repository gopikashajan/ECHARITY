<%@include file="../user/guestheader.jsp" %>
<%-- 
    Document   : NetBanking
    Created on : 18 Feb, 2018, 12:38:57 PM
    Author     : AkHiLeSh
--%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<jsp:useBean id="mail" class="db.mailconnection"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <script>
            function  show(show)
            {
                document.getElementById(show).style.display='block';
                return false;
                
            }
            
        </script>
    <body>
        <div>
        <%
             int i=0;
        String emailid="";
          String user="",otp="";
          String pass="";
           String text="";
          String dat=session.getAttribute("date").toString();
          String ant=session.getAttribute("amt").toString();
           String acc=request.getParameter("txtac");
           String sel="select * from tbl_user where user_id='"+session.getAttribute("userid")+"'";
           ResultSet rs=obj.selectCommand(sel);
           while(rs.next())
           
           {
             emailid=rs.getString("email");
           }
            if(request.getParameter("submit")!=null)
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
                mail.sendMail(to, sub, text);
                 out.print(request.getParameter("hotp"));
            }
             if(request.getParameter("CONFIRM")!= null)
          {
               if(request.getParameter("txt_otp").equals(request.getParameter("hotp")))  
            {
            user=request.getParameter("txtusername");
            pass=request.getParameter("txtpwd");
            String sel1="select * from tbl_login where username='"+user+"' and password='"+pass+"'";
            ResultSet rs1=obj.selectCommand(sel1);
            if(rs1.next())
            {
            String insqry="insert into tbl_donation(date,amount,user_id) values('"+dat+"','"+ant+"','"+session.getAttribute("userid")+"')";
              boolean b=obj.executeCommand(insqry); 
              if(b==true)
              {
              %>
              <script>
                  alert("done");
              </script>
              <%
              }else
              {
              %>
              <script>
                  alert("check your password");
              </script>
              <%
              }
            
            }
            }
          }
        %>
       
        <form>
            
           <table align="center" cellpadding="8" style=" box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);">
               <tr>
                   <td colspan="2">
                       
                   
                       <img src="../user/img/download3.png" width="60" height="60">
              </td>
               </tr>
               <tr>
                <td colspan="2">
                    <input type="radio" name="bank" value="HDFC"><img src="../user/img/download (1).png" width="15" height="15"> HDFC Bank
                    
                    <input type="radio" name="bank" value="SBI"><img src="../user/img/download2.jpg" width="20" height="19">State Bank Of India
                    
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="radio" name="bank" value="SBI"> AXIS Bank 
                    <input type="radio" name="bank" value="Kotak"> Kotak Mahindra Bank 
                </td>
            </tr>
            <tr>
                <td>
                    Other Banks
                </td>
                <td>
                    <select name="ddl_bank" style="width: 200px">
                        <option>...Select.....</option>
                        <option>Indian Bank</option>
                    </select>
                </td>
            </tr>
            
                 
                 <tr>
                    <td>UserName</td>
                    <td>
                        <input type="text" name="txtusername" style="width: 200px" required="">
                        </td>
                 </tr>
                 <tr>
                         <td>Password</td>
                         <td>
                             <input type="password" name="txtpwd" style="width: 200px" required="">
                         </td>
                     </tr>
            <tr>
                
            
            <td colspan="2" align="center">
                <input type="submit" name="submit" size="20" style="background-color:#81D4FA;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" value="Verify">
                </td>
            </tr>
           
        </table>
             </div>
       <div id="otp" >
            <table align="center">
                <tr align="center">
                    <td>
                    <input type="text" name="txt_otp" placeholder="Enter OTP number"> 
               </td>
                </tr><br><br>
                <td colspan="2" align="center"><br><br>
                    <input type="submit" name="CONFIRM" size="20" style="background-color:#81D4FA;height:40px; width:150px;border-radius: 12px;box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);" value="CONFIRM" >
                  <input type="hidden" name="hotp" value="<%=text%>">
                </td>
            </table>
        </div>
              </form>
      
    </body>
</html>
<%@include  file="footer.jsp" %>