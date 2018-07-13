<%-- 
    Document   : ProdUpdate
    Created on : 7 Apr, 2018, 12:22:53 AM
    Author     : kunal
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            String email = request.getParameter("email");
            //JOptionPane.showMessageDialog(null, id + email);
            String queryUpdate = "INSERT INTO bookings(prod_id, email) VALUES (?,?);";
            PreparedStatement psUpdate = new db.Connect_db().getConnection().prepareStatement(queryUpdate);
            psUpdate.setString(1, id);
            psUpdate.setString(2, email);
            psUpdate.executeUpdate();
        %>
    </body>
</html>
