<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
<link href="css/index.css" rel="stylesheet" type="text/css" media="all" /> <!-- filter css --> 
<link rel="stylesheet" href="css/swipebox.css"> <!-- filter css --> 
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
	<!-- portfolio -->
	<div class="portfolio">
		<div class="container">
			<div class="w3ls-title"> 
				<h3 class="agileits-title w3title1">Portfolio</h3>
			</div>
			<div class="gallery_gds agileits-dictiontechnology">
				<ul class="simplefilter">
					<li class="active" data-filter="all">All</li>
                                        <%
                                            Connection con = new db.Connect_db().getConnection();
                                            PreparedStatement ps = con.prepareStatement("SELECT * FROM gallery_cat;");
                                            ResultSet rs = ps.executeQuery();
                                            while(rs.next())
                                            {
                                        %>
                                        <li data-filter="<%=rs.getString("id")%>" style="text-transform: capitalize"><%=rs.getString("gallery_cat")%></li>
					<%
                                            }
                                        %>
				</ul>
				<div class="filtr-container">
                                    <%
                                        PreparedStatement psG = con.prepareStatement("SELECT g.category, g.image, gc.id AS id FROM gallery g JOIN gallery_cat gc ON g.category = gc.gallery_cat;");
                                        ResultSet rsG = psG.executeQuery();
                                        while(rsG.next())
                                        {
                                    %>
                                    <div class="col-sm-4 col-xs-6 filtr-item" data-category="<%=rsG.getString("id")%>" data-sort="Busy streets">
						<div class="hover ehover14">
                                                    <a href="gallery/<%=rsG.getString("image")%>" class="swipebox" >
								<img src="gallery/<%=rsG.getString("image")%>" alt="" class="img-responsive" />
								<div class="overlay">
									<h4>Portfolio</h4>
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
			</div>
		</div>
	</div>
	<!-- //portfolio -->
	<!-- footer -->
		<jsp:include page="include/footer.jsp"></jsp:include>	

	<!-- //footer -->    
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