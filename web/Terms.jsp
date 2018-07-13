<%-- 
    Document   : Empty
    Created on : 4 Apr, 2018, 3:36:29 PM
    Author     : kunal
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
	        <h3 class="agileits-title w3title1">Terms Of Use</h3>
	    </div>
            <h5 style="color:teal;"><strong>PLEASE READ THESE TERMS AND CONDITIONS CAREFULLY .</strong></h5>
            <div style="margin-top:30px; margin-bottom:30px;">
				
                <a data-toggle="collapse"  data-target="#demo"><strong>License & Site access</strong></a>
                                <br>
				<div id="demo" class="collapse">
                                    
                                    <%
                                        PreparedStatement ps = new db.Connect_db().getConnection().prepareStatement("SELECT * FROM terms;");
                                        ResultSet rs = ps.executeQuery();
                                        while(rs.next())
                                        {
                                    %>
                                    <p><%=rs.getString("description")%></p><br>
                                    <%
                                        }
                                    %>
				
                                 <br>
				</div>	
                       </div>
                 </div>
	   </div>
        </div>
        <!-- footer -->
          <jsp:include page="include/footer.jsp"></jsp:include>
	<!-- //footer -->
        
         <script src="js/bootstrap.js"></script>
    </body>
</html>
