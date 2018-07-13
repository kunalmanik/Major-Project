<%-- 
    Document   : deletesubsubcat
    Created on : 20 Feb, 2018, 4:13:03 AM
    Author     : kunal
--%>

<%@page import="db.Connect_db"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
</head>

<body>
    
 <form  method="post">               
<table align="center"  >
    
    <br><br>
    <tr>
    <thead>
        
         <th>Category</th>
         
</thead>
    </tr>
    
      
 <% 
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=new Connect_db().getConnection();
            Statement st=con.createStatement();
            String id1 = request.getParameter("id");
            
            
                String query = "delete  from products where id='"+id1+"' ";
                
                int x=st.executeUpdate(query);
                if(x>0)
                {
                    out.println("success");
    
                    response.sendRedirect("viewSubSubCat.jsp");
                }
                else
                {
                       out.println("Try Again!");
                }
            
       
    %>
</table>
</div>
</form>
</div>
</html>