<%-- 
    Document   : AddTestimonial
    Created on : 6 Apr, 2018, 2:27:05 PM
    Author     : kunal
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    
    <%
        try{
            if(session.getAttribute("email").toString() == null)
            {
                response.sendRedirect("index.jsp");
            }
        }
        catch(Exception e)
        {
            response.sendRedirect("index.jsp");
        }
    %>
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
				<h3 class="agileits-title w3title1">Add Testimonial</h3>
			</div>
                    <%
                        String email = session.getAttribute("email").toString();
                        String testimonial = "";
                        int flag = 0;
                        PreparedStatement ps = new db.Connect_db().getConnection().prepareStatement("SELECT * FROM testimonial;");
                        //PreparedStatement psUpdate = new db.Connect_db().getConnection().prepareStatement("UPDATE testimonial SET description = ? WHERE email = ?;");
                        ResultSet rs = ps.executeQuery();
                        while(rs.next())
                        {
                            if(email.equals(rs.getString("email")))
                            {
                                flag = 1;
                                testimonial = rs.getString("description");
                                break;
                            }
                        }                                            
                    %>
                    <center>
                        <form class="form-group" method="post" style="width: 40%" action="AddTestimonial">        
                            <input type="hidden" value="<%=flag%>" name="event"/>
                            <div class="form-group">
                                <textarea class="form-group" name="testimonial" required="" rows="10" cols="50"><%=testimonial%></textarea>
                            </div>

                            <div class="form-group">
                                <input type="submit" name="sub-btn" id="sub-btn" value="ADD Testimonial" class="btn btn-block btn-info" onclick="return loginCall();" required="">
                            </div>        
                            
                        </form>
                    </center>
			
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