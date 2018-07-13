<%-- 
    Document   : pyCall
    Created on : 5 May, 2018, 8:04:14 PM
    Author     : kunal
--%>

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
            //JOptionPane.showMessageDialog(null, "ENTRY");
            String command = "python C://Users//kunal//Documents//NetBeansProjects//EMS_School//web//call.py";
            Process p = Runtime.getRuntime().exec(command);            
        %>
    </body>
</html>
