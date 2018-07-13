<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!--
Author: dictiontechnology
Author URL: http://dictiontechnology.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="en">
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Edify Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<link href="css/font-awesome.css" rel="stylesheet">  <!-- font-awesome icons --> 
<link href="css/index.css" rel="stylesheet" type="text/css" media="all" /> <!-- filter css --> 
<link rel="stylesheet" href="css/swipebox.css"> <!-- filter css --> 
<!-- //Custom Theme files -->
<!-- js -->
<script src="js/jquery-2.2.3.min.js"></script>   
<!-- //js -->
<!-- web-fonts -->
<link href="//fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

</head>
<body>
	<!-- header -->
		<jsp:include page="include/header.jsp"></jsp:include>	

	<!-- //header -->
	<!-- banner -->
	<div class="banner-1">
	</div> 
	<!-- //banner -->
	<!-- about -->
	<div class="about">
		<div class="container">  
			<div class="w3ls-title">
				<h3 class="agileits-title">About Us</h3> 
			</div> 
			<div class="about-w3ls-row"> 
				<div class="col-md-5 about-left">
					<img src="images/about.jpg" class="img-responsive" alt=""/>
				</div>
				<div class="col-md-7 about-right"> 
					<div class="about-agile-row">
						<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
							<ul id="myTab" class=" nav-tabs" role="tablist">
								<li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="true">About</a></li>
								<li role="presentation"><a href="#carl" role="tab" id="carl-tab" data-toggle="tab" aria-controls="carl"> History</a></li>
							</ul> 
							<div class="clearfix"> </div>
							<div id="myTabContent" class="tab-content">
								<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
									<div class="tabcontent-grids">
										
										<ul>
                                                                                <%
                                                                                    String query = "SELECT description FROM about_us WHERE header = 'about';";
                                                                                    PreparedStatement ps = new db.Connect_db().getConnection().prepareStatement(query);
                                                                                    ResultSet rs = ps.executeQuery();
                                                                                    while(rs.next())
                                                                                    {
                                                                                %>
											<li><i class="fa fa-check-square-o"></i> <%=rs.getString("description")%> </li>
										<%
                                                                                    }
                                                                                %>	
										</ul>
									</div>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="carl" aria-labelledby="carl-tab">
									<div class="tabcontent-grids">
										<%
                                                                                    String query2 = "SELECT description FROM about_us WHERE header = 'history';";
                                                                                    PreparedStatement ps2 = new db.Connect_db().getConnection().prepareStatement(query2);
                                                                                    ResultSet rs2 = ps2.executeQuery();
                                                                                    while(rs2.next())
                                                                                    {
                                                                                %>
                                                                                    <p> <%=rs2.getString("description")%> </p>
										<%
                                                                                    }
                                                                                %>
									</div>
								</div>
								<div class="clearfix"> </div>
							</div>
						</div>
					</div>
				</div> 
				<div class="clearfix"> </div> 
			</div>
		</div>
	</div>
	<!-- //about -->
<!-- work start here -->
	<div class="work jarallax">
		<div class="container">
			<div class="work-agileinfo">
				<h3>Are You Impressed By Our Work?</h3>
				<p>Nor again is there anyone who loves or pursues or desires to obtain pain.</p>
				<div class="w3btns-agile">
					<a href="contact.jsp">Get In Touch</a>
				</div>
			</div>
		</div>
	</div>
	<!-- work end here -->

		<!-- team -->
                <div class="team agileits-dictiontechnology" style="margin-top: 20px;">
		<div class="container">
			<div class="w3ls-title"> 
				<h3 class="agileits-title w3title1">Our Hardworking Team</h3>
			</div>
			<div class="gallery_gds agileits-dictiontechnology">
				<ul class="simplefilter">
					<li class="active" data-filter="all">All</li>
                                        <%
                                            
                                            PreparedStatement psTeam = new db.Connect_db().getConnection().prepareStatement("SELECT * FROM team_dept;");
                                            ResultSet rsTeam = psTeam.executeQuery();
                                            while(rsTeam.next())
                                            {
                                        %>
                                        <li data-filter="<%=rsTeam.getString("id")%>" style="text-transform: capitalize"><%=rsTeam.getString("department")%></li>
					<%
                                            }
                                        %>
				</ul>
				<div class="filtr-container">
                                    <%
                                        PreparedStatement psG = new db.Connect_db().getConnection().prepareStatement("SELECT t.department, t.name, t.title, t.image, td.id AS id FROM team t JOIN team_dept td ON t.department = td.department;");
                                        ResultSet rsG = psG.executeQuery();
                                        while(rsG.next())
                                        {
                                    %>
                                    <div class="col-sm-4 col-xs-6 filtr-item" data-category="<%=rsG.getString("id")%>" data-sort="<%=rsG.getString("name")%>">
						<div class="hover ehover14">
                                                    <a href="team/<%=rsG.getString("image")%>" class="swipebox" >
                                                        <img src="team/<%=rsG.getString("image")%>" style="width:290px; height: 290px;" alt="" class="img-responsive" />
								<div class="overlay">
									<h4><%=rsG.getString("name")%><br><%=rsG.getString("title")%></h4>
									<div class="info nullbutton button" data-toggle="modal" data-target="#modal14">Show More</div>
								</div>
							</a>	
						</div>
					</div>
                                    <%
                                        }
                                    %>
				   <div class="clearfix"> </div>
				</div>
                                   <br><br>
			</div>
		</div>
	</div>
	<!-- //team -->
	<!-- footer -->
		<jsp:include page="include/footer.jsp"></jsp:include>	

	<!-- //footer -->    
	
    <script src="js/bootstrap.js"></script>
    <!-- Include jQuery & Filterizr -->
  <script src="js/jquery.filterizr.js"></script>
  <script src="js/controls.js"></script>
<!-- Kick off Filterizr -->
  <script type="text/javascript">
      $(function() {
        //Initialize filterizr with default options
        $('.filtr-container').filterizr();
      });
  </script>
<!--//gallery-->
<!-- swipe box js -->
	<script src="js/jquery.swipebox.min.js"></script> 
	<script type="text/javascript">
			jQuery(function($) {
				$(".swipebox").swipebox();
			});
	</script>
	<!-- //swipe box js -->
    <script src="js/bootstrap.js"></script>

</body>
</html>