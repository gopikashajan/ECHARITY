<%-- 
    Document   : Payment
    Created on : 13 Feb, 2018, 10:05:26 PM
    Author     : AkHiLeSh
--%>

<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<%
     if(request.getParameter("id")!=null)
           {
              session.setAttribute("buyid", request.getParameter("id"));  
           }
String id=request.getParameter("id");
String pr=request.getParameter("pr");
String q=request.getParameter("q");
int Tot=0;
Tot=Integer.parseInt(pr)*Integer.parseInt(q);
String up="update tbl_cart set Cart_quantity='"+q+"',Cart_unittotal='"+Tot+"' where Cart_id='"+id+"'";
boolean b=obj.executeCommand(up);
if(b){
    
}
else
{
    out.println(up);
}


%>
