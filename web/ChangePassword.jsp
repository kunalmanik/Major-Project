<%-- 
    Document   : ChangePassword
    Created on : 6 Apr, 2018, 2:04:39 PM
    Author     : kunal
--%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>E.M.S. School</title> 
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
				<h3 class="agileits-title w3title1">Change Password</h3>
			</div>
                    <form class="form-group" method="post" action="UserChangePassword">        
                        <div class="form-group">
                            <input type="password" name="old_password" id="oldPass" placeholder="Enter your Current Password" class="form-control" required="">
                        </div>
                        <div class="form-group">
                            <input type="password" name="new_password" id="newPass" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" title="Your Password must be 8 carachters long\nIt must contain a lower case, an upper case and a special symbol." placeholder="Enter your New Password" class="form-control" required="">
                        </div>
                        <div class="form-group">
                            <input type="password" name="conf_password" id="confPass" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" title="Your Password must be 8 carachters long\nIt must contain a lower case, an upper case and a special symbol." placeholder="Re-Enter your New Password" class="form-control" required="">
                        </div>
                        <div class="form-group">
                            <input type="submit" name="sub-btn" id="sub-btn" value="SUBMIT" class="btn btn-block btn-info" onclick="return checkPass();" required="">
                        </div>            
                        </form>
                                <script type="text/javascript">
                                    function checkPass()
                                    {
                                        //alert("Hello!");
                                        var oldPass = document.getElementById("oldPass").value;
                                        var newPass = document.getElementById("newPass").value;
                                        var confPass = document.getElementById("confPass").value;
                                        
                                        if(oldPass == newPass)
                                        {
                                            alert("Your New Password must be different from the old one!");
                                            return false;
                                        }
                                        else if(newPass != confPass)
                                        {
                                           alert("New Passwords must be same!")
                                           return false;
                                        }
                                        else
                                        {
                                            return true;
                                        }
                                    }
                                </script>
		</div>	
	</div>
<!-- //icons -->

	<!-- footer -->
	<jsp:include page="include/footer.jsp"></jsp:include>	
	<!-- //footer -->    
	
	<!-- //End-slider-script -->
    <script src="js/bootstrap.js"></script>
</body>
</html>