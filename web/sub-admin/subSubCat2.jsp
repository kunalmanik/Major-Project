<%@page import="db.Connect_db"%>
<%@page import="java.sql.*"%>
<%
String country=request.getParameter("count");  
 String buffer="<select name='state' style='width: 100%' required><option value='-1'>Select</option>";  
 try{
 Class.forName("com.mysql.jdbc.Driver").newInstance();  
 Connection con=new Connect_db().getConnection();  
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select * from sub_category where cat_name='"+country+"' ");  
   while(rs.next()){
   buffer=buffer+"<option value='"+rs.getString("subcat")+"'>"+rs.getString("subcat")+"</option>";  
   }  
 buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }

 %>