<%-- 
    Document   : OTP
    Created on : 4 Apr, 2018, 5:35:51 PM
    Author     : kunal
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="mailer.Mailer"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OTP Screen</title>
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
        <script type="text/javascript"> 
                function otpFunc(emailPr, rolePr, ph_numberPr, passwordPr, fullnamePr, stu_id)
                {
                    if(document.getElementById("otp").value == null || document.getElementById("otp").value == "")
                    {
                        alert("Please do not leave the OTP field blank!");
                        //return false;
                    }
                    else{
                        //alert('hello');
                        var xreq;

                        document.getElementById("page").innerHTML = "<br><br><strong>Please wait while we are processing your request...</strong><br><br>"
                        
                        if(window.XMLHttpRequest)
                        {
                            xreq=new XMLHttpRequest();
                        }
                        else
                        {
                            xreq=new ActiveXObject("Microsoft.XMLHTTP");
                        }
                        xreq.onreadystatechange = function ()
                        {
                            if((xreq.readyState==4) && (xreq.status==200))
                            {
                                document.getElementById("page").innerHTML=xreq.responseText;
                            }
                        };
                        
                        xreq.open("GET","RegisterUpdate.jsp?otp=" + document.getElementById("otp").value + "&email=" + emailPr + "&ph=" + ph_numberPr + "&fullname=" + fullnamePr + "&password=" + passwordPr + "&role=" + rolePr + "&stu_id=" + stu_id,"true");
                        //xreq.onreadystatechange = call;
                        xreq.send();
                        //return true;
                    }
            }
        </script>
    </head>
    <body>
        
        <%
            String email = request.getParameter("email");                                   
            String role = request.getParameter("role");       
            String ph_number = request.getParameter("ph_number");
            String password = request.getParameter("password");
            String fullname = request.getParameter("fullname");
            String stu_id = request.getParameter("stu_id");
            //JOptionPane.showMessageDialog(null, email + " " + role + " " + ph_number + " " + password + " " + fullname);
        %>
                <div class="banner-1">
	</div>
                <br><br>
        <div class="w3ls-title">
            <h3 class="agileits-title w3title1">OTP</h3>
        </div>
    <center>
                <div id="page" style="margin-top: 20px; margin-bottom: 20px; width: 40%">
                    
                                        </div>
    </center>
                    <div class="container" style="width:40%; margin-bottom: 20px">                                              
                            <div class="form-group">
                                <input type="text" name="otp" id="otp"  placeholder="Enter your OTP here" class="form-control">
                            </div>                
                            <div class="form-group">
                                <input type="submit" name="submit" value="SUBMIT YOUR OTP" class="btn btn-block btn-info" 
                                       onclick="otpFunc('<%=email%>', '<%=role%>', '<%=ph_number%>', '<%=password%>', '<%=fullname%>', '<%=stu_id%>')">
                                
                            </div>                        
                            <div class="form-group">
                                <a href="Register.jsp">
                                <input type="submit" name="submit" value="GO BACK TO REGISTRATION SCREEN" class="btn btn-block btn-danger" >
                                </a>
                            </div>                        
                    </div>
                                       
                                       
                
                
                
    </body>
</html>
