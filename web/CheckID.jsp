<%-- 
    Document   : CheckID
    Created on : 17 May, 2018, 6:50:26 PM
    Author     : kunal
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
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
            int flag = 0;
            String stu_id = request.getParameter("stu_id");
            //JOptionPane.showMessageDialog(null, stu_id);
            PreparedStatement preparedStatementStuID = new db.Connect_db().getConnection().prepareStatement("SELECT stu_id FROM students;");
            ResultSet rsID = preparedStatementStuID.executeQuery();
            while(rsID.next())
            {
                if(rsID.getString("stu_id").equals(stu_id))
                {
                    flag=1;
                }
            }
            if(flag == 1)
            {                
                %>
                <input type="submit" name="submit" id="btn-sub" value="SUBMIT" class="btn btn-block btn-info" required="" onclick="return otpCall();">
                <%
            }
            else
            {
                %>             
                <input type="submit" name="submit" id="btn-sub" disabled="" value="SUBMIT" class="btn btn-block btn-info" required="" onclick="return otpCall();">
                <%
            }
        %>
    </body>
</html>
