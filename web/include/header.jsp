<%-- 
    Document   : header
    Created on : 4 Apr, 2018, 2:35:07 PM
    Author     : kunal
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="header">
		<nav class="navbar navbar-default">
			<div class="container">
				<div class="navbar-header navbar-left wthree">
                                   <!-- <a href="index.jsp" ><image src="images/ems.png" style="width:50%;" class="img-responsive"/></a> -->
					<h1><a href="index.jsp">E.M.S<span>School</span></a></h1>
				</div>
				<!-- navigation -->
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<div class="header-right wthree">
					<div class="top-nav-text">
						<p>Call Us:
                                                    
                                                    <%
                                                        Connection con = new db.Connect_db().getConnection();
                                                        PreparedStatement ps = con.prepareStatement("SELECT value from reach WHERE category = 'phone';");
                                                        ResultSet rs = ps.executeQuery();
                                                        while(rs.next())
                                                        {
                                                    %>
                                                    <span><%=rs.getString("value")%></span>
                                                    <%
                                                        }
                                                    %>
                                                </p>
						<div id="sb-search" class="sb-search">
							<form action="Products.jsp" method="post">
								<input type="search" class="sb-search-input" name="Search" placeholder="Enter your search term..." id="search" required="">
								<input class="sb-search-submit" type="submit" value="">
								<span class="sb-icon-search"> </span>
							</form>
							<div class="clearfix"> </div>
							 
							<script src="js/classie.js"></script>
							<script src="js/uisearch.js"></script>
							<script>
								new UISearch( document.getElementById( 'sb-search' ) );
							</script>
							 
						</div>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">					
						<ul class="nav navbar-nav navbar-left cl-effect-14">
							<li><a href="index.jsp">Home</a></li>
							<li><a href="about.jsp">About</a></li>
<!--							<li><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Pages <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="icons.jsp">Web Icons</a></li>
									<li><a href="codes.jsp">Short Codes</a></li>
								</ul>
							</li> -->

							<li><a href="portfolio.jsp">Portfolio</a></li>
							<li><a href="contact.jsp">Contact Us</a></li>	
                                                        <%
                                                            String email = "empty";
                                                            try{
                                                                email = session.getAttribute("email").toString();
                                                            }
                                                            catch(Exception e)
                                                            {
                                                                
                                                            }
                                                            if(!email.equals("empty"))
                                                            {
                                                        %>
                                                            <li><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Hello, <%=email%> <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="ChangePassword.jsp">Change Password</a></li>
									<li><a href="BookingHistory.jsp">Booking History </a></li>                                                                        
                                                                        <li><a href="AddTestimonial.jsp">Add Testimonial </a></li>
                                                                        <li><a href="Product.jsp">Booking</a></li>                                                                        
                                                                        <%
                                                                            String role = "";
                                                                            String sql = "SELECT role FROM user WHERE email = ?";
                                                                            PreparedStatement psRole = new db.Connect_db().getConnection().prepareStatement(sql);
                                                                            psRole.setString(1, email);
                                                                            
                                                                            ResultSet rsRole = psRole.executeQuery();
                                                                            if(rsRole.next())
                                                                            {
                                                                                role = rsRole.getString("role");
                                                                            }                                                                            
                                                                        %>
                                                                        <%
                                                                            if(role.equals("parent"))
                                                                            {
                                                                        %>
                                                                        <li><a href="PTM.jsp">Upcoming PTMs </a></li>
                                                                        <li><a href="Books.jsp">Recommended Books </a></li>
                                                                        <%
                                                                            }                                                                        
                                                                        %>
                                                                        <li><a href="Pay.jsp">Pay your Fee or any other payment</a></li>
                                                                        <li><a href="SignOut">Sign Out </a></li>
								</ul>
							</li>
                                                        <%
                                                            }
                                                            else
                                                            {
                                                        %>
                                                            <li><a href="Register.jsp">Register</a></li>
                                                            <li><a href="SignIn.jsp">Sign In</a></li>
                                                        <%
                                                            }
                                                        %>
						</ul>		
						<div class="clearfix"> </div>
					</div><!-- //navigation -->
				</div>
				<div class="clearfix"> </div>
			</div>	
		</nav>		
	</div>
    </body>
</html>
