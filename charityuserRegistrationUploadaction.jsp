<%-- 
    Document   : userRegistrationUploadaction
    Created on : Mar 14, 2018, 2:34:11 PM
    Author     : ckc
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<jsp:useBean id="obj" class="db.ConnectionClass"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
             <%
            
        File savedFile=null; 
        FileItem f_item=null;
        
        

String field_name="";
String file_name="";
String fn="";
String log="";
String field[] = new String[20];
String value[]=new String[20];

//checking if request cotains multipart data
boolean isMultipart=ServletFileUpload.isMultipartContent(request);

if(isMultipart)
{
    System.out.println("ifff");

    FileItemFactory factory=new DiskFileItemFactory();
    ServletFileUpload upload=new ServletFileUpload(factory);

    //declaring a list of form fields
    List items_list=null;

    //assigning fields to list 'items_list'
    try
    {
    items_list=upload.parseRequest(request);
    }
    catch(FileUploadException ex)
    {
        out.println(ex);
    }

          //declaring iterator
   Iterator itr=items_list.iterator();
    int k=0;
    //iterating through the list 'items_list'
    while(itr.hasNext())
    {
        
        //typecasting next element in items_list as fileitem
        f_item=(FileItem)itr.next();

        //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
       if(f_item.isFormField())
        {
          
            //getting fieldname and value
            field[k]=f_item.getFieldName();
            value[k]=f_item.getString();
                
                k++;
        }
       else
       {
		   
		   
           //f_item=(FileItem)itr.next();
            
          file_name=f_item.getName();
           field_name=f_item.getFieldName();
           if(field_name.equals("txtphoto"))
           {
         String ext=file_name.substring(file_name.lastIndexOf("."));
            //setting path to store image
            File proj_path=new File(config.getServletContext().getRealPath("/"));
            String file_path=proj_path.getParentFile().getParentFile().getPath()+"\\web\\organization\\charitylogo\\";
            Random r=new Random();
             int r_num=r.nextInt(1111)+999;
             
            fn="LOGO_"+r_num+ext;
            //creating a file object
            savedFile=new File(file_path+fn);
            try
            {
                //writing the file object
                f_item.write(savedFile);               
                
            }
            catch(Exception ex)
            {
                out.println(ex);
            }
            }
           
           
           
          
           
       }
           
           }
  
             String insQry1="insert into tbl_login(user_type,username,password)values('charityusers','"+value[8]+"','"+value[9]+"')";
            boolean b2=obj.executeCommand(insQry1);
                  
            if(b2==true)
               {
                   String sel="select max(login_id) as login from tbl_login";
                   ResultSet rs=obj.selectCommand(sel);
                   if(rs.next())
                   {
                       log=rs.getString("login");
                   }
               }
           
            String insQry="insert into tbl_charityusers(char_name,address,contact_no,email,adhar_no,photo,pl_id,charityuserty_id,login_id)values('"+value[0]+"','"+value[1]+"','"+value[2]+"','"+value[3]+"','"+value[4]+"','"+fn+"','"+value[6]+"','"+value[7]+"','"+log+"')";
                                                      
            System.out.println("INSERT:\t"+insQry);
            
                    
             boolean b=obj.executeCommand(insQry);
            
            
         
        }
 
      %> 
       <script type="text/javascript">
            alert("Upload Successfully..");
            setTimeout(function(){window.location.href='CharityUsers.jsp'},100);
        </script>
     <%
            


      

        %>
    </body>
</html>
