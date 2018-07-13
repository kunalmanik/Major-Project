<%-- 
    Document   : subadminDeleteCat
    Created on : 20 Feb, 2018, 1:41:20 AM
    Author     : kunal
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="db.Connect_db"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver");
  Connection con=new Connect_db().getConnection();
  String cat_id =request.getParameter("id");
  String cat_name = null;
  PreparedStatement psCat = new db.Connect_db().getConnection().prepareStatement("SELECT * FROM category WHERE cat_id=?");
  psCat.setString(1, cat_id);
  ResultSet resultSet = psCat.executeQuery();
  while(resultSet.next())
  {
      cat_name = resultSet.getString("cat_name");
  }
  
  String query="DELETE FROM category WHERE cat_id = ?";
  PreparedStatement ps = null;
  ps = con.prepareStatement(query); 
  ps.setString (1, cat_id);
  int i = ps.executeUpdate();

  String query2 = "DELETE FROM sub_category WHERE cat_name = ?;";
  PreparedStatement ps2 = con.prepareStatement(query2);
  ps2.setString(1, cat_name);
  ps2.executeUpdate();

  String query3 = "DELETE FROM products WHERE category = ?;";
  PreparedStatement ps3 = con.prepareStatement(query3);
  ps3.setString(1, cat_name);
  ps3.executeUpdate();
  
 if (i > 0){
     out.println("success");
     response.sendRedirect("view_category.jsp");
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
