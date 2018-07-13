<%@page import="javax.swing.JOptionPane"%>
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
<title>E.M.S. School | Home </title> 
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
	<script src="slide/js/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="slide/js/jssor.slider-27.1.0.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {

            var jssor_1_SlideshowTransitions = [
              {$Duration:800,x:-0.3,$During:{$Left:[0.3,0.7]},$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2},
              {$Duration:800,x:0.3,$SlideOut:true,$Easing:{$Left:$Jease$.$InCubic,$Opacity:$Jease$.$Linear},$Opacity:2}
            ];

            var jssor_1_options = {
              $AutoPlay: 1,
              $SlideshowOptions: {
                $Class: $JssorSlideshowRunner$,
                $Transitions: jssor_1_SlideshowTransitions,
                $TransitionsOrder: 1
              },
              $ArrowNavigatorOptions: {
                $Class: $JssorArrowNavigator$
              },
              $ThumbnailNavigatorOptions: {
                $Class: $JssorThumbnailNavigator$,
                $Orientation: 2,
                $NoDrag: true
              }
            };

            var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

            /*#region responsive code begin*/

            var MAX_WIDTH = 3000;

            function ScaleSlider() {
                var containerElement = jssor_1_slider.$Elmt.parentNode;
                var containerWidth = containerElement.clientWidth;

                if (containerWidth) {

                    var expectedWidth = Math.min(MAX_WIDTH || containerWidth, containerWidth);

                    jssor_1_slider.$ScaleWidth(expectedWidth);
                }
                else {
                    window.setTimeout(ScaleSlider, 30);
                }
            }

            ScaleSlider();

            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
            /*#endregion responsive code end*/
        });
    </script>
    <style>
        /*jssor slider loading skin spin css*/
        .jssorl-009-spin img {
            animation-name: jssorl-009-spin;
            animation-duration: 1.6s;
            animation-iteration-count: infinite;
            animation-timing-function: linear;
        }

        @keyframes jssorl-009-spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .jssora061 {display:block;position:absolute;cursor:pointer;}
        .jssora061 .a {fill:none;stroke:#fff;stroke-width:360;stroke-linecap:round;}
        .jssora061:hover {opacity:.8;}
        .jssora061.jssora061dn {opacity:.5;}
        .jssora061.jssora061ds {opacity:.3;pointer-events:none;}
    </style>
    <div id="jssor_1" style="position:relative;margin:0 auto;top:0px;left:0px;width:1320px;height:380px;overflow:hidden;visibility:hidden;">
        <!-- Loading Screen -->
        <div data-u="loading" class="jssorl-009-spin" style="position:absolute;top:0px;left:0px;width:100%;height:100%;text-align:center;background-color:rgba(0,0,0,0.7);">
            <img style="margin-top:-19px;position:relative;top:50%;width:38px;height:38px;" src="img/spin.svg" />
        </div>
        <div data-u="slides" style="cursor:default;position:relative;top:0px;left:0px;width:1320px;height:380px;overflow:hidden;">
            <%
                PreparedStatement psBanner = new db.Connect_db().getConnection().prepareStatement("SELECT * FROM banner;");
                ResultSet rsBanner = psBanner.executeQuery();
                while(rsBanner.next())
                {
            %>
            <div data-p="170.00">
                <img data-u="image" src="banner/<%=rsBanner.getString("banner_image")%>" />
                <div u="thumb"></div>
            </div>
            <%
                }
            %>
        </div>
        <!-- Thumbnail Navigator -->
        <div u="thumbnavigator" style="position:absolute;bottom:0px;left:0px;width:1320px;height:50px;color:#FFF;overflow:hidden;cursor:default;background-color:rgba(0,0,0,.5);">
            <div u="slides">
                <div u="prototype" style="position:absolute;top:0;left:0;width:1320px;height:50px;">
                    <div u="thumbnailtemplate" style="position:absolute;top:0;left:0;width:100%;height:100%;font-family:arial,helvetica,verdana;font-weight:normal;line-height:50px;font-size:16px;padding-left:10px;box-sizing:border-box;"></div>
                </div>
            </div>
        </div>
        <!-- Arrow Navigator -->
        <div data-u="arrowleft" class="jssora061" style="width:55px;height:55px;top:0px;left:25px;" data-autocenter="2" data-scale="0.75" data-scale-left="0.75">
            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <path class="a" d="M11949,1919L5964.9,7771.7c-127.9,125.5-127.9,329.1,0,454.9L11949,14079"></path>
            </svg>
        </div>
        <div data-u="arrowright" class="jssora061" style="width:55px;height:55px;top:0px;right:25px;" data-autocenter="2" data-scale="0.75" data-scale-right="0.75">
            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <path class="a" d="M5869,1919l5984.1,5852.7c127.9,125.5,127.9,329.1,0,454.9L5869,14079"></path>
            </svg>
        </div>
    </div>
	<!-- modal-sign -->
	<div class="modal bnr-modal fade" id="myModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>						
				</div> 
				<div class="modal-body modal-spa">
					<img class="img-responsive" src="images/g1.jpg" alt="">
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras rutrum iaculis enim, non convallis felis mattis at. Donec fringilla lacus eu pretium rutrum. Cras aliquet congue ullamcorper. Etiam mattis eros eu ullamcorper volutpat. Proin ut dui a urna efficitur varius. uisque molestie cursus mi et congue consectetur adipiscing elit cras rutrum iaculis enim, Lorem ipsum dolor sit amet, non convallis felis mattis at. Maecenas sodales tortor ac ligula ultrices dictum et quis urna. Etiam pulvinar metus neque, eget porttitor massa vulputate in. Fusce lacus purus, pulvinar ut lacinia id, sagittis eu mi. Vestibulum eleifend massa sem, eget dapibus turpis efficitur at. Aliquam viverra quis leo et efficitur. Nullam arcu risus, scelerisque quis interdum eget, fermentum viverra turpis. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut At vero eos </p>
				</div> 
			</div>
		</div>
	</div>
	<!-- //modal-sign -->    
	<!-- //banner -->
		<!-- welcome -->
                
	<div class="welcome" id="welcome"> 
		<div class="container">
		<div class="col-md-6 welcome-w3lright">
				<div class="welcome-grids">
                                    <%
                                        if(session.getAttribute("email") != null)
                                        {
                                    %>
                                    
					<div class="service-box">
						<div class="agileits-wicon">
							<i class="fa fa-user" aria-hidden="true"></i>
						</div>
						<h5>Register</h5> 
					</div> 
                                    
                                    <%
                                        }
                                        else
                                        {
                                    %>
                                    <a href="Register.jsp">
					<div class="service-box">
						<div class="agileits-wicon">
							<i class="fa fa-user" aria-hidden="true"></i>
						</div>
						<h5>Register</h5> 
					</div> 
                                    </a>
                                    <%
                                        }
                                    %>
					<div class="clearfix"> </div>
				</div>
				<div class="welcome-grids">
                                    <%
                                        if(session.getAttribute("email") != null)
                                        {
                                    %>
                                    
					<div class="col-md-6 col-sm-6 col-xs-6 service-box">
						<div class="agileits-wicon">
							<i class="fa fa-sign-in" aria-hidden="true"></i>
						</div>
						<h5>Sign In</h5> 
					</div>
                                    
                                    <%
                                        }
                                        else
                                        {
                                    %>
                                    <a href="SignIn.jsp">
					<div class="col-md-6 col-sm-6 col-xs-6 service-box">
						<div class="agileits-wicon">
							<i class="fa fa-sign-in" aria-hidden="true"></i>
						</div>
						<h5>Sign In</h5> 
					</div>
                                    </a>
                                    <%
                                        }
                                    %>
                                    <%
                                        if(session.getAttribute("email") != null)
                                        {
                                    %>
                                    <a href="SignOut">
					<div class="col-md-6 col-sm-6 col-xs-6 service-box">
						<div class="agileits-wicon">
							<i class="fa fa-sign-out" aria-hidden="true"></i>
						</div>
						<h5>Sign Out</h5> 
					</div>
                                    </a>
                                    <%
                                        }
                                        else
                                        {
                                    %>
                                    
					<div class="col-md-6 col-sm-6 col-xs-6 service-box">
						<div class="agileits-wicon">
							<i class="fa fa-sign-out" aria-hidden="true"></i>
						</div>
						<h5>Sign Out</h5> 
					</div>
                                    
                                    <%
                                        }
                                    %>
					<div class="clearfix"> </div>
				</div>
			</div> 
			<div class="col-md-6 welcome-w3lleft">
				<h3 class="agileits-title">Welcome !</h3>
				<h4>EMS School</h4>
                                <%
                                    Connection con = new db.Connect_db().getConnection();
                                    PreparedStatement ps = con.prepareStatement("SELECT description FROM about_us WHERE header = 'about';");
                                    ResultSet rs = ps.executeQuery();
                                    while(rs.next())
                                    {
                                %>
				<p><%=rs.getString("description")%></p>   
                                <%
                                    }
                                %>
			</div>  
			
			<div class="clearfix"> </div>
		</div> 
	</div>
	<!-- //welcome -->
	<!-- testimonials -->
                
	<div class="testimonials">
		<div class="container"> 
		<div class="w3ls-title">
			<h3 class="w3ls-title">Testimonials</h3>
		</div>
			<div class="slidw3-agileits"> 
                            <%
                                String query = "SELECT * FROM testimonial WHERE approved = 'approved' ORDER BY id DESC LIMIT 3;";
                                PreparedStatement psTest = new db.Connect_db().getConnection().prepareStatement(query);
                                ResultSet rsTest = psTest.executeQuery();
                                while(rsTest.next())
                                {
                            %>
				<div class="col-md-4 slid-w3text"> 
					<h4><%=rsTest.getString("name")%></h4>
					<p>"<%=rsTest.getString("description")%>"</p>
				</div> 
                            <%
                                }
                            %>
				<div class="clearfix"> </div>
			</div>   
		</div>
	</div>
	<!-- //testimonials -->
	<!-- features -->
	
	<!-- //features -->
<!-- work start here -->
	<div class="work jarallax">
		<div class="container">
			<div class="work-agileinfo">
				<h3>Are You Impressed By Our Work?</h3>
				
				<div class="w3btns-agile">
					<a href="contact.jsp">Get In Touch</a>
				</div>
			</div>
		</div>
	</div>
	<!-- work end here -->
	<!-- news -->
	<div class="news">
		<div class="container"> 
			<div class="w3ls-title">
				<h3 class="agileits-title">Latest News</h3> 
			</div> 
			<div class="agileits_dictiontechnology_news_grids"> 
                            <%
                                PreparedStatement psNews = con.prepareStatement("SELECT * FROM events ORDER BY date DESC LIMIT 4;");
                                ResultSet rsNews = psNews.executeQuery();
                                while(rsNews.next())
                                {
                            %>
				<div class="col-md-3 col-xs-6 agileits_dictiontechnology_news_grid">
					<div class="w3_agileits_news_grid">
                                            <img src="events/<%=rsNews.getString("image")%>" alt=" " class="img-responsive" />
						<div class="w3_agileits_news_grid_pos">
							<h4><%=rsNews.getString("date")%></h4>
						</div>
					</div>
					
					<h5><a>Text  Text  Text</a></h5>
					<p><%=rsNews.getString("description")%></p>
				</div>
                            <%
                                }
                            %>    
				
				<div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!-- //news --> 
        
        <%
            if(session.getAttribute("email") != null)
            {
        %>        
        <!-- top products -->
        <div class="news">
		<div class="container"> 
			<div class="w3ls-title">
				<h3 class="agileits-title">From Our Corner</h3> 
			</div> 
                    <!-- TOP -->
			<div class="agileits_dictiontechnology_news_grids"> 
                            <%
                                int TOP_PROD = 0;
                                PreparedStatement psTopProd = con.prepareStatement("SELECT * FROM products WHERE id IN(SELECT id FROM bookings WHERE id NOT IN (SELECT DISTINCT prod_id FROM bookings WHERE email=? AND status='booked') GROUP BY id ORDER BY COUNT(*) DESC) AND visibility='enabled' AND gender='none' AND class='none' LIMIT 5;");
                                psTopProd.setString(1, session.getAttribute("email").toString());
                                ResultSet rsTopProd = psTopProd.executeQuery();
                                while(rsTopProd.next())
                                {
                                    TOP_PROD = 1;
                            %>
				<div class="col-md-2 col-xs-6 agileits_dictiontechnology_news_grid">
					<div class="w3_agileits_news_grid">
                                            <img src="products/<%=rsTopProd.getString("product_image")%>" alt="<%=rsTopProd.getString("product_image")%>" class="img-responsive" />
						<div class="w3_agileits_news_grid_pos">
							<h4><%=rsTopProd.getString("product_name")%> &#8377;<%=rsTopProd.getString("product_price")%></h4>
						</div>
					</div>										
				</div>
                            <%
                                }
                            %>   
                            <%
                                if(TOP_PROD == 1) 
                                {
                            %>
                            <div class="col-md-2 col-xs-6 agileits_dictiontechnology_news_grid">
					<div class="w3_agileits_news_grid">
                                            <img src="images/see_more.jpg" alt="See More" class="img-responsive" />
						<div class="w3_agileits_news_grid_pos">
                                                    <a href="Products.jsp?type=1"><h4>See More</h4></a>
						</div>
					</div>										
				</div>
                                <%
                                    }
                                %>
				<div class="clearfix"> </div>
			</div>
                                <br>
                                <hr>    
                    <!-- gender -->
                        <div class="agileits_dictiontechnology_news_grids"> 
                            <%
                                int TOP_FEA = 0;
                                PreparedStatement psTopFea = con.prepareStatement("SELECT * FROM products WHERE id IN(SELECT id FROM bookings WHERE id NOT IN (SELECT DISTINCT prod_id FROM bookings WHERE email=? AND status='booked') GROUP BY id ORDER BY COUNT(*) DESC) AND gender=(SELECT gender FROM products WHERE id IN (SELECT DISTINCT prod_id FROM bookings WHERE email = ?) GROUP BY gender ORDER BY COUNT(*) LIMIT 1) AND class='none' LIMIT 5;");
                                psTopFea.setString(1, session.getAttribute("email").toString());
                                psTopFea.setString(2, session.getAttribute("email").toString());
                                ResultSet rsTopFea = psTopFea.executeQuery();
                                //JOptionPane.showMessageDialog(null, "EETRY");
                                while(rsTopFea.next())
                                {
                                    //JOptionPane.showMessageDialog(null, "EETRY - 1");
                                    TOP_FEA = 1;                                    
                            %>
				<div class="col-md-2 col-xs-6 agileits_dictiontechnology_news_grid">
					<div class="w3_agileits_news_grid">
                                            <img src="products/<%=rsTopFea.getString("product_image")%>" alt="<%=rsTopFea.getString("product_image")%>" class="img-responsive" />
						<div class="w3_agileits_news_grid_pos">
							<h4><%=rsTopFea.getString("product_name")%> &#8377;<%=rsTopFea.getString("product_price")%></h4>
						</div>
					</div>										
				</div>
                            <%
                                }
                            %>   
                            <%
                                if(TOP_FEA == 1) 
                                {
                            %>
                            <div class="col-md-2 col-xs-6 agileits_dictiontechnology_news_grid">
					<div class="w3_agileits_news_grid">
                                            <img src="images/see_more.jpg" alt="See More" class="img-responsive" />
						<div class="w3_agileits_news_grid_pos">
                                                    <a href="Products.jsp?type=2"><h4>See More</h4></a>
						</div>
					</div>										
				</div>
                                <%
                                    }
                                %>
				<div class="clearfix"> </div>
			</div>
                                <br>
                                <hr>
                    <!-- class -->
<!--                        <div class="agileits_dictiontechnology_news_grids"> 
                            <%
                                int TOP_GEN = 0;
                                PreparedStatement psTopGen = con.prepareStatement("SELECT * FROM products WHERE id IN(SELECT id FROM products WHERE id NOT IN (SELECT DISTINCT prod_id FROM bookings WHERE email=? AND status='booked') GROUP BY id ORDER BY COUNT(*) DESC) AND gender='none' LIMIT 5;");
                                psTopGen.setString(1, session.getAttribute("email").toString());
                                //psTopGen.setString(2, session.getAttribute("email").toString());
                                ResultSet rsTopGen = psTopGen.executeQuery();
                                //JOptionPane.showMessageDialog(null, "ENTRY");
                                while(rsTopGen.next())
                                {
                                    //JOptionPane.showMessageDialog(null, "ENTRY - q");
                                    TOP_GEN = 1;
                            %>
				<div class="col-md-2 col-xs-6 agileits_dictiontechnology_news_grid">
					<div class="w3_agileits_news_grid">
                                            <img src="products/<%=rsTopGen.getString("product_image")%>" alt="<%=rsTopGen.getString("product_image")%>" class="img-responsive" />
						<div class="w3_agileits_news_grid_pos">
							<h4><%=rsTopGen.getString("product_name")%> &#8377;<%=rsTopGen.getString("product_price")%></h4>
						</div>
					</div>										
				</div>
                            <%
                                }
                            %>   
                            <%
                                if(TOP_GEN == 1) 
                                {
                            %>
                            <div class="col-md-2 col-xs-6 agileits_dictiontechnology_news_grid">
					<div class="w3_agileits_news_grid">
                                            <img src="images/see_more.jpg" alt="See More" class="img-responsive" />
						<div class="w3_agileits_news_grid_pos">
                                                    <a href="Products.jsp?type=3"><h4>See More</h4></a>
						</div>
					</div>										
				</div>
                                <%
                                    }
                                %>
				<div class="clearfix"> </div>
			</div>-->
		</div>
	</div>
        <!-- //top products -->
        <%
            }
        %>
	<!-- footer -->
	<jsp:include page="include/footer.jsp"></jsp:include>	
	<!-- //footer -->    
	<!-- banner Slider starts Here -->
	<script src="js/responsiveslides.min.js"></script>
	<script>
		// You can also use "$(window).load(function() {"
		$(function () {
		  // Slideshow 3
		  $("#slider3").responsiveSlides({
			auto:false,
			pager: true,
			nav: false,
			speed: 500,
			namespace: "callbacks",
			before: function () {
			  $('.events').append("<li>before event fired.</li>");
			},
			after: function () {
			  $('.events').append("<li>after event fired.</li>");
			}
		  });
	
		});
	</script>
	<!-- //End-slider-script -->
    <script src="js/bootstrap.js"></script>
    
<!--<script src="https://www.gstatic.com/firebasejs/4.13.0/firebase.js"></script>
<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyCIpTkiuaRy-QPnFRv7c9wx1tkzZM60lFA",
    authDomain: "emsschool-8f91c.firebaseapp.com",
    databaseURL: "https://emsschool-8f91c.firebaseio.com",
    projectId: "emsschool-8f91c",
    storageBucket: "",
    messagingSenderId: "836684926136"
  };
  firebase.initializeApp(config);
</script>-->

</body>
</html>