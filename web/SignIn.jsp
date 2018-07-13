<%-- 
    Document   : signin
    Created on : 4 Apr, 2018, 1:37:36 PM
    Author     : kunal
--%>

<!--
Author: dictiontechnology
Author URL: http://dictiontechnology.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="en">
<head>
<title></title> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
	<!-- header -->
	<jsp:include page="include/header.jsp"></jsp:include>	
	<!-- //header -->
	<!-- banner -->
	<div class="banner-1">
	</div> 
	<!-- //banner -->
	<!-- icons -->
<div class="w3_wthree_agileits_icons main-grid-border">
		<div class="container">
			<div class="w3ls-title"> 
				<h3 class="agileits-title w3title1">Sign In</h3>
			</div>			
		</div>	
	</div>
<!-- //icons -->
<div class="container" style="width:40% ">
    <%
        String email = "empty", password = "empty";
        
        try{
            email = session.getAttribute("email").toString();
            password = session.getAttribute("user_password").toString();
        }
        catch(Exception e)
        {
            //out.print(e);
        }
        
        if(email.equals("empty") || password.equals("empty"))
        {
    %>
    <form class="form-group" method="post">        
    <div class="form-group">
        <input type="email" name="email" id="email" placeholder="Email" class="form-control" required="">
    </div>
    <div class="form-group">
        <input type="password" name="password" id="password" placeholder="Password" class="form-control" required="">
    </div>
    
    <div class="form-group">
        <input type="button" name="sub-btn" id="sub-btn" value="SUBMIT" class="btn btn-block btn-info" onclick="return loginCall();" required="">
    </div>        
    <div class="form-group">
        <input type="button" name="forgot-btn" id="forgot-btn" value="FORGOT Password?" class="btn btn-block btn-danger" onclick="forgot()" required="">
    </div>
    </form>
    <script>
        function forgot(){
        document.getElementById("forgot-btn").disabled = true;    
        document.getElementById("forgot-form").hidden  = false;
            
        }
    </script>
    <form id="forgot-form" method="post" class="form-group" hidden="" action="ForgotPassword">
        <div class="form-group">
            <input type="email" name="forgot-email" id="forgot-email" placeholder="Enter your Email here" class="form-control" required="">
        </div>
        <div class="form-group">
            <input type="submit" name="frg-btn" id="frg-btn" value="Click here to receive your Password!" class="btn btn-block btn-danger">
        </div>
    </form>
    <%
        }
      else
      {
              response.sendRedirect("index.jsp");
              }
    %>
        <div id="page" style="margin-top: 20px; margin-bottom: 20px">                
                                
            </div>
</div>

<script type="text/javascript"> 
                function loginCall()
                {
                    
                    var email = document.getElementById("email");                     
                    var password = document.getElementById("password");
                    
                    if(email.value === null || password.value === null)
                    {
                        alert("Do not leave the fields empty!");
                        return false;
                    }
                    
                    else{
                    
                    //alert("hello");
                    //document.getElementById("page").innerHTML="<strong>Please wait while we are processing your request</strong>";
                    
                    
                    var xreq;                   
                    
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
                    }
                    xreq.open("GET","CheckLogin.jsp?email=" + document.getElementById("email").value + "&password=" + document.getElementById("password").value,"true");
                    //xreq.onreadystatechange = call;
                    xreq.send();
                    return true;
                }
            }
        </script>
	<!-- footer -->
	<jsp:include page="include/footer.jsp"></jsp:include>	
	<!-- //footer -->    
	
	<!-- //End-slider-script -->
    <script src="js/bootstrap.js"></script>
</body>
</html>