<%-- 
    Document   : RegisterUpdate
    Created on : 4 Apr, 2018, 5:55:25 PM
    Author     : kunal
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="keywords" content="Edify Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
                SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- Custom Theme files -->
        <link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
        <link href="css/style.css" type="text/css" rel="stylesheet" media="all">
        <link href="css/font-awesome.css" rel="stylesheet">  <!-- font-awesome icons --> 
        <!-- //Custom Theme files -->
        <!-- js -->
        <script src="js/jquery-2.2.3.min.js"></script>   
        <!-- //js -->
        <!-- web-fonts -->
        <link href="//fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <!-- //web-fonts --> 

    </head>
    <body>
        <%
            String otp_session, otp = null, ph_number = null, fullname = null, password = null, email = null, role = null, stu_id = null;
            try{
            otp_session = session.getAttribute("OTP").toString();            
            }
            catch(Exception e)
            {
                //JOptionPane.showMessageDialog(null, e);
                otp_session = null;
            }
                    
            otp = request.getParameter("otp");
            ph_number = request.getParameter("ph");
            fullname = request.getParameter("fullname");
            password = request.getParameter("password");
            email = request.getParameter("email");
            role = request.getParameter("role");
            stu_id = request.getParameter("stu_id");
            
            //JOptionPane.showMessageDialog(null, ph_number + " " + fullname + " " + password + " " + email + " " + role);
                    
            if(!otp_session.equals(otp) || otp_session == null || otp_session == "USED")
            {
                //JOptionPane.showMessageDialog(null, "EXPIRED!");
                %>
                    <div class="alert alert-danger alert-dismissible fade in">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Error!</strong> Either your OTP is wrong or it has expired!
                    </div>
                <%
            }
            else
            {
                //JOptionPane.showMessageDialog(null, "Chal raha hai!");
                Connection connection = new db.Connect_db().getConnection();
                PreparedStatement ps = connection.prepareStatement("INSERT INTO user(ph_number, email, password, full_name, role, stu_id) VALUES(?,?,?,?,?,?)");
                ps.setString(1, ph_number);
                ps.setString(2, email);
                ps.setString(3, password);
                ps.setString(4, fullname);
                ps.setString(5, role);
                ps.setString(6, stu_id);
                ps.executeUpdate();
                session.setAttribute("OTP", "USED");
                %>
                    <div class="alert alert-success alert-dismissible fade in">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>SUCCESS!</strong> You have been successfully Registered! Please login to continue!
                        <%
                            String messageBody = "Hello " +  email + "<br><br>You have been successfully Registered!";
                            mailer.Mailer.send(email, "Registration Successful", messageBody);
                        %>
                    </div>
                    <a href="SignIn.jsp">
                        <input type="submit" class="btn btn-success" value="Continue to Sign In" style="width: 100%"/>
                    </a>
                    
                <%
            }
        %>
    </body>
</html>
