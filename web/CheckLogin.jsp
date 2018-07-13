<%-- 
    Document   : CheckLogin
    Created on : 5 Apr, 2018, 12:10:45 PM
    Author     : kunal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="mailer.Mailer"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.swing.JOptionPane"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">        
        <script src="bootstrap/js/bootstrap.min.js"></script>

    </head>
    <body>
        <%
            int flag = 1;
                                                    
            String email = request.getParameter("email");                                              
            String password = request.getParameter("password");
                        
            //JOptionPane.showMessageDialog(null, email + password);
            
            Connection con = new db.Connect_db().getConnection();            
            PreparedStatement preparedStatementEmail = con.prepareStatement("SELECT * FROM user;");            
            ResultSet rs = preparedStatementEmail.executeQuery();            
            while(rs.next())            
            {            
                //JOptionPane.showMessageDialog(null, email + role);                
                if(rs.getString("email").equals(email) && rs.getString("password").equals(password) && rs.getString("active").equals("yes"))                
                {               
                    //JOptionPane.showMessageDialog(null, "User already exists!");                
                                                              
                    flag = 0;                    
                    break;                    
                }                
            }            
            if(flag == 1)            
            {
                %>
                
                    <div class="alert alert-danger alert-dismissible fade in">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Error!</strong> Email Id or Password is Wrong!
                    </div>
                    
                <%
            }
            else
            {                
                session.setAttribute("email", email);
                session.setAttribute("user_password", password);
                //session.setAttribute("tempSession", "log");
                %>
                <div class="alert alert-success alert-dismissible fade in">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success!</strong> You have logged in successfully
                    </div>
                <a href="index.jsp">
                    <input type="submit" class="btn btn-block btn-success" value="Proceed to Home Page"/>
                </a>
                <%
            }
        %>
    </body>
</html>
