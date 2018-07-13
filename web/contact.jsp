<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.Connect_db"%>
<!--
Author: dictiontechnology
Author URL: http://dictiontechnology.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="en">
<head>
<title>E.M.S. School | Contact </title> 
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
<script>
   function valid() {
        var mobile = document.getElementById('phone');
      var filter2 =/^([6-9])([0-9]){9}$/;
      var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
      
   if (!filter2.test(mobile.value)) {
     alert("Not a valid Mobile number");
     return false; 
       }
       else if(!email.value.match(mailformat)){
          alert("You have entered an invalid email address!");
          document.form1.email.focus();
          return false; 
       }
    
        else {
        return true;
    }
   }
   
  
  </script>
<style>
    #map {
                height: 425px;
                width: 100%;
                
            }
</style>
</head>
<body>
	<!-- header -->
        <jsp:include page="include/header.jsp"></jsp:include>	
	<!-- //header -->
	<!-- banner -->
	<div class="banner-1">
	</div> 
	<!-- //banner -->
		<!-- contact -->
	<div class="contact">
		<div class="team-info w3-agileits">
			<div class="container"> 
			<div class="w3ls-title"> 
				<h3 class="agileits-title w3title1">Contact Us</h3>
			</div>				
				<div class="contact-form">
					<form action="SendMessage" method="post">
						<input type="text" name="name" placeholder="Name" pattern="([A-Za-z .])+" title="Enter Alphabet Only" required="">
                                                <input type="email" class="email" pattern="([a-zA-Z0-9-\.\_])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]){2,4}" name="email" id ="email" placeholder="Email" required="">
                                                <input type="text" name="mobile" pattern="([6-9])([0-9]){9}" id ="phone" placeholder="Phone" required="">
                                                <input type="text" name="subject" id ="subject" placeholder="Subject" required="" style="width:100%;">
						<textarea name="message" placeholder="Message" required=""></textarea>
						<input type="submit" value="SUBMIT" >
					</form>
				</div>


			</div>
		</div>
	</div>		
	<!-- //contact -->
	<!-- map -->
	<div class="map dictiontechnology">
		<div class="col-md-8 map-left">
			
                    <div id="map" align="center">
                        <script>
                          function initialize() {
                            var locations = [
                                {lat: 28.609570, lng:77.387526},
                                {lat: 29.390946, lng: 76.963502},
                                {lat: 29.000000, lng: 77.000000}
                            ];
                            var names = [
                                'Diction Technology,Noida',
                                'Panipat,Haryana'
                            ];
                            var options = {
                                zoom: 8,
                                center: locations[1]
                            };
                            var map = new google.maps.Map(document.getElementById('map'), options);         

                            var i;

                            for (i=0; i<locations.length; i++)
                            {
                                addMarker(locations[i], names[i]);
                            }

                            function addMarker(location, name){
                                var marker = new google.maps.Marker({
                                    position: location,
                                    map: map,
                                    title: name
                                });
                            }        
                        }
                        </script>
                        <script
                        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyApw6bn2pzSyZ940-_6p1oz1PzJFGRsOEg&callback=initialize">

                        </script>
                    </div>   
		</div>
                  <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=new Connect_db().getConnection();
                    PreparedStatement psAdd =con.prepareStatement("SELECT value FROM reach where category = 'address';");
                    ResultSet rsAdd = psAdd.executeQuery(); 
                    PreparedStatement psPh =con.prepareStatement("SELECT value FROM reach where category = 'phone';");
                    ResultSet rsPh = psPh.executeQuery(); 
                    PreparedStatement psEmail =con.prepareStatement("SELECT value FROM reach where category = 'email';");
                    ResultSet rsEmail = psEmail.executeQuery(); 
                  %>
               
		<div class="col-md-4 map-wthree-right"> 
                    <h4><span class="glyphicon glyphicon-home" aria-hidden="true"></span> Address</h4>
                    <%   
                         if(rsAdd.next()) 
                         {
                    %>			
                        <p><%=rsAdd.getString("value")%></p>
                    <%
                        }
                        %>
                        <h4><span class="glyphicon glyphicon-phone" aria-hidden="true"></span> Phone</h4>
                        <%
                        if(rsPh.next())
                        {
                    %>                        
                        <p><%=rsPh.getString("value")%></p>
                    <%
                        }
                        %>
                        <h4><span class="glyphicon glyphicon-phone" aria-hidden="true"></span> Email</h4>
                        <%
                        if(rsEmail.next())
                        {
                    %>                        
                        <p><%=rsEmail.getString("value")%></p>
                    <%
                        }
                    %>
                </div>
		<div class="clearfix"> </div>
	</div>
	<!-- //map -->
	<!-- footer -->
	<jsp:include page="include/footer.jsp"></jsp:include>	
	<!-- //footer -->    
	
    <script src="js/bootstrap.js"></script>
</body>
</html>