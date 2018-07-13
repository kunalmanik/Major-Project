<%-- 
    Document   : Empty
    Created on : 4 Apr, 2018, 3:36:29 PM
    Author     : kunal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <title>E.M.S School</title> 
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
<!--Spinner-->
<style>
html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  background-color: #33ccff;
  color: white;
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: black;
}


.button:hover {
  background-color: #555;
}
</style>
    </head>
    <body>
        <!-- header -->
		<jsp:include page="include/header.jsp"></jsp:include>
	<!-- //header -->
        <div class="banner-1">
	</div>

        <br>
        <br>
        
        <div class="container"> 
            <div class="w3ls-title"> 
	        <h3 class="agileits-title w3title1">Our Hardworking Team</h3>
	    </div>
            <br>
           <div class="row">
  <div class="column">
    <div class="card">
      <img src="images/1.png" alt="Jane" style="width:150px; height:150px; margin-left:115px; margin-top:20px;">
      <div class="container">
          <h2 style="margin-left:115px;">Jane Doe</h2>
        <p class="title" style="margin-left:150px;">CEO & Founder</p>
       
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img src="images/2.png" alt="Mike" style="width:150px; height:150px; margin-left:115px; margin-top:20px;">
      <div class="container">
        <h2 style="margin-left:115px;">Mike Ross</h2>
        <p class="title" style="margin-left:150px;">Art Director</p>
        
      </div>
    </div>
  </div>
  <div class="column">
    <div class="card">
      <img src="images/3.png" alt="John" style="width:150px; height:150px; margin-left:115px; margin-top:20px;">
      <div class="container">
          <h2 style="margin-left:115px;">John Doe</h2>
        <p class="title" style="margin-left:150px;">Designer</p>
        
      </div>
    </div>
  </div>
</div>

        </div>
        <br>
        <!-- footer -->
          <jsp:include page="include/footer.jsp"></jsp:include>
	<!-- //footer -->
        
         <script src="js/bootstrap.js"></script>
    </body>
</html>
