<%-- 
    Document   : Register
    Created on : 4 Apr, 2018, 2:30:38 PM
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
				<h3 class="agileits-title w3title1">Register</h3>
			</div>
			
		</div>	
	</div>
<!-- //icons -->
        <div class="container" style="width:40%; margin-bottom: 20px">        
            
                <div class="form-group">
                    <input type="text" name="fullname" id="fullname" placeholder="Full Name" class="form-control">
                </div>
                <div class="form-group">
                    <input type="email" name="email" id="email" placeholder="Email" class="form-control">
                </div>
                <div class="form-group">
                    <input type="text" name="ph_number" id="ph_number" placeholder="Phone Number" class="form-control" >
                </div>
                <div class="form-group">
                    <input type="password" name="password" id="password" placeholder="Password" class="form-control" >
                </div>
                <div class="form-group">        
                    <input type="radio" name="role" id="parent" value="Parent" /> Parent
                </div>
                <div class="form-group">
                    <input type="radio" name="role" id="student" value="Student" checked=""/> Student
                </div>
                <div class="form-group">
                    <input type="text" name="stu_id" id="stu_id" placeholder="Student ID - In case of more than one ward, add the ID of senior ward" class="form-control" required="" onkeyup="return checkStuID();">
                </div>
                <div class="form-group" id='subID'>
                    <input type="submit" name="submit" id="btn-sub" disabled="" value="SUBMIT" class="btn btn-block btn-info" required="" onclick="return otpCall();">
                </div>           
            
            <div id="page" style="margin-top: 20px">                
                                
            </div>
            
        </div>
            

        <script type="text/javascript"> 
            
                function undisableID()
                {
                    alert("ID Exists");
                    document.getElementById("btn-sub").disabled = false;
                }
                function disableID()
                {
                    alert("ID does not exists");
                    document.getElementById("btn-sub").disabled = true;
                }
                function checkStuID()
                {
                    var stu_id = document.getElementById("stu_id").value;
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
                            document.getElementById("subID").innerHTML=xreq.responseText;
                        }
                    }
                    xreq.open("GET","CheckID.jsp?stu_id=" + stu_id,"true");
                    //xreq.onreadystatechange = call;
                    xreq.send();
                }
            
                function otpCall()
                {
                    
                    var email = document.getElementById("email"); 
                    var mobile = document.getElementById("ph_number");
                    var full_name = document.getElementById("fullname");
                    var password = document.getElementById("password");
                    filter = /^([a-zA-Z0-9-\.\_])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                    filterMobile = /^([6-9])([0-9]){9}$/;
                    filterName = /^([A-Za-z .])+$/;
                    filterPassword = /^(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$$/;
                    if(!filterName.test(full_name.value))
                    {
                        alert("Enter a valid Name");
                        return false;
                    }
                    else if(!filter.test(email.value))
                    {
                        alert("Enter a Valid Email");
                        return false;
                    }
                    else if (!filterMobile.test(mobile.value))
                    {
                        alert("Enter a valid Mobile Number")
                        return false;
                    }
                    else if(!filterPassword.test(password.value))
                    {
                        alert("Your Password must be 8 characters long\nIt must contain a lower case, an upper case and a special symbol.");
                        return false;
                    }
                    else{
                    
                    //alert("hello");
                    document.getElementById("page").innerHTML="<strong>Please wait while we are processing your request...</strong>";
                    
                    
                    var xreq;
                    var role;
                    
                    if(document.getElementById("parent").checked)
                    {
                        role = "parent";
                    }
                    else if(document.getElementById("student").checked)
                    {
                        role = "student";
                    }
                    
                    
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
                    xreq.open("GET","CheckEmail.jsp?fullname=" + document.getElementById("fullname").value + "&role="+ role + "&email=" + document.getElementById("email").value + "&password=" + document.getElementById("password").value + "&ph=" + document.getElementById("ph_number").value + "&stu_id=" + document.getElementById("stu_id"),"true");
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