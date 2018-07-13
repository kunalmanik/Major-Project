<%-- 
    Document   : adminLogout
    Created on : 11 Feb, 2018, 11:31:36 PM
    Author     : kunal
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.io.IOException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
     try{
                HttpSession session2 = request.getSession(true);
    

                session2.removeAttribute("adminname");
                session2.removeAttribute("password");
               // session.setAttribute("", null);

                //JOptionPane.showMessageDialog(null, "LOGOUT SUCCESSFUL!");
                response.sendRedirect("admin_login.jsp");
            }
            catch(IOException e)
            {
                JOptionPane.showMessageDialog(null, e.toString());
            }
    %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout Page</title>
    </head>
    <body>
        
    </body>
</html>
