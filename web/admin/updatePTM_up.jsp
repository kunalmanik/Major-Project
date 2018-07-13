<%-- 
    Document   : updatePTM_up
    Created on : 17 May, 2018, 7:39:24 PM
    Author     : kunal
--%>

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
            String des = request.getParameter("des");
            String query = "UPDATE ptm SET des = ? WHERE id=1;";
            PreparedStatement ps = new db.Connect_db().getConnection().prepareStatement(query);
            ps.setString(1, des.trim());
            ps.executeUpdate();
        %>
        <script type="text/javascript">
            alert("UPDATED");
        </script>
        <%
            response.sendRedirect("updatePTM.jsp");
        %>
    </body>
</html>
