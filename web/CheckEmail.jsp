<%-- 
    Document   : CheckEmail
    Created on : 4 Apr, 2018, 3:36:55 PM
    Author     : kunal
--%>

<%@page import="mailer.Mailer"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                                        
            out.println("<script type='text/javascript'> alert('hello'); </script>");
            String email = request.getParameter("email");                                   
            String role = request.getParameter("role");       
            String ph_number = request.getParameter("ph");
            String password = request.getParameter("password");
            String fullname = request.getParameter("fullname");
            String stu_id = request.getParameter("stu_id");
            //JOptionPane.showMessageDialog(null, email + role + ph_number + password);
            
            Connection con = new db.Connect_db().getConnection();            
            PreparedStatement preparedStatementEmail = con.prepareStatement("SELECT email FROM user;");            
            ResultSet rs = preparedStatementEmail.executeQuery();            
            while(rs.next())            
            {            
                //JOptionPane.showMessageDialog(null, email + role);                
                if(rs.getString("email").equals(email))                
                {               
                    //JOptionPane.showMessageDialog(null, "User already exists!");                
                                                              
                    flag = 0;                    
                    break;                    
                }                
            }                
            if(flag == 0)            
            {
                %>
                
                    <div class="alert alert-danger alert-dismissible fade in">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Error!</strong> User already Exists!
                    </div>
                    
                <%
            }
            else
            {
                char[] chars = "1234567890".toCharArray();
                StringBuilder sb = new StringBuilder(6);
                Random random = new Random();

                for (int i = 0; i < 6; i++) {
                    char c = chars[random.nextInt(chars.length)];
                    sb.append(c);
                }
                String otp_text = sb.toString();
                session.setAttribute("OTP", otp_text);
                //JOptionPane.showMessageDialog(null, otp_text);
                String message = "Please register using this OTP quickly since it will expire in some time.<br><br>";                                            
                try{
                    Mailer.send(email, "Registration OTP", message + "<b>" + otp_text + "</b>");                                           
                }
                catch(Exception e)
                {
                    out.print(e.toString());
                }
                %>
                    <div class="alert alert-success alert-dismissible fade in">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>OTP Sent!</strong> Please check your email for the OTP!                        
                    </div>
                    
                    <form action="OTP.jsp" method="post">
                            <input type="hidden" name="email" value="<%=email%>"/>
                            <input type="hidden" name="ph_number" value="<%=ph_number%>"/>
                            <input type="hidden" name="role" value="<%=role%>"/>
                            <input type="hidden" name="password" value="<%=password%>"/>
                            <input type="hidden" name="fullname" value="<%=fullname%>"/>
                            <input type="hidden" name="stu_id" value="<%=stu_id%>"/>
                            <input type="submit" class="btn btn-info" name="submit" value="GO TO OTP Screen" style="width: 100%"/>
                    </form>
                            
                <%
            }
        %>
    </body>
</html>
