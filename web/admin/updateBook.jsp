<%-- 
    Document   : updateBook
    Created on : 21 May, 2018, 10:17:41 PM
    Author     : kunal
--%>

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
            String command = "python C://Users//kunal//Documents//NetBeansProjects//EMS_School//web//parent_books.py";
            Process p = Runtime.getRuntime().exec(command);            
        %>
    </body>
</html>
