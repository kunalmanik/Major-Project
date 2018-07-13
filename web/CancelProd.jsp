<%-- 
    Document   : CancelProd
    Created on : 7 Apr, 2018, 10:27:44 AM
    Author     : kunal
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement"%>
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
            //JOptionPane.showMessageDialog(null, id);
            String query = "DELETE FROM bookings WHERE booking_id=?;";
            PreparedStatement ps = new db.Connect_db().getConnection().prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        %>
    </body>
</html>
