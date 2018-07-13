<%-- 
    Document   : updatePayment
    Created on : 21 May, 2018, 11:24:46 PM
    Author     : kunal
--%>

<%@page import="java.util.Calendar"%>
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
            // 1) create a java calendar instance
            Calendar calendar = Calendar.getInstance();

            // 2) get a java.util.Date from the calendar instance.
            //    this date will represent the current instant, or "now".
            java.util.Date now = calendar.getTime();

            // 3) a java current time (now) instance
            java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(now.getTime());
            
            String book_id = request.getParameter("book_id");
            String email = request.getParameter("email");
            PreparedStatement ps = new db.Connect_db().getConnection().prepareStatement("UPDATE bookings SET payed='yes', time=? WHERE booking_id=?;");
            ps.setTimestamp(1, currentTimestamp);
            ps.setString(2, book_id);
            ps.executeUpdate();
            mailer.Mailer.send(email, "PAYEMENT CONFIRMATION", "THANK YOU " + email + "<br><br>WE have received your payment!");
            response.sendRedirect("Orders.jsp");
        %>
    </body>
</html>
