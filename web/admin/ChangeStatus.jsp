<%-- 
    Document   : ChangeStatus
    Created on : 7 Apr, 2018, 12:24:29 PM
    Author     : kunal
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
             int id = Integer.parseInt(request.getParameter("id"));
            String status = request.getParameter("statuss");  
            String email = request.getParameter("buyer_email");
            String query = "UPDATE bookings SET status = ? WHERE booking_id=?";
           
               //JOptionPane.showMessageDialog(null, request.getParameter("buyer_email"));
                PreparedStatement ps = new db.Connect_db().getConnection().prepareStatement(query);
                ps.setInt(2, id);
                ps.setString(1, status);
                ps.executeUpdate();
                String message = "Hello " + request.getParameter("buyer_email");
                message += "<br><br>" + "Your order containing <b>" + request.getParameter("pr_name") + "</b>";
                message += " has been <b>" + status + "</b>";
                mailer.Mailer.send(email,"Booking Status", message);
                //javax.swing.JOptionPane.showMessageDialog(null, email + status +id);
                    out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Changed');");
                   out.println("window.location.href = 'Orders.jsp'");
                   out.println("</script>");
           
               
%>
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
