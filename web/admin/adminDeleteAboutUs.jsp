<%-- 
    Document   : adminDeleteCat
    Created on : 6 Feb, 2018, 3:53:25 PM
    Author     : kunal
--%>

<%@page import="db.Connect_db"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver");
  Connection con=new Connect_db().getConnection();
  String id =request.getParameter("id");
  String query="DELETE FROM about_us WHERE id = ?";
  PreparedStatement ps = null;
  ps = con.prepareStatement(query); 
  ps.setString (1, id);
   
  int i = ps.executeUpdate();

 if (i > 0){
                   out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Deleted!');");
                   out.println("window.location.href = 'viewaboutus.jsp'");
                   out.println("</script>");
     //out.println("success");
     //response.sendRedirect("viewaboutus.jsp");
 }
 else{
     out.println("fail");
 }   %>    
  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
