<%-- 
    Document   : Pay
    Created on : 21 May, 2018, 10:26:51 PM
    Author     : kunal
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
				<h3 class="agileits-title w3title1">Pay for your Confirmed Bookings</h3>
			</div>			
		</div>	
	</div>
        <!-- //icons -->
        <div class="col-lg-8 col-md-8">
        <table style="margin-left: 140px; margin-bottom: 40px">
            <tr>
                <th>Product Image</th>
                <th>Product Name    .</th>
                <th>.   Price</th>
            </tr>
        <%
            int total = 0;
            String query = "SELECT b.email, b.prod_id, p.product_name, p.product_price, p.product_image FROM bookings b JOIN products p ON b.prod_id = p.id WHERE b.status='confirmed' AND email = ? AND payed = 'no';";
            PreparedStatement psConfBookings = new db.Connect_db().getConnection().prepareStatement(query);
            psConfBookings.setString(1, session.getAttribute("email").toString());
            
//            ResultSet rsConfBookings = psConfBookings.executeQuery();
//            while(rsConfBookings.next())
//            {
//                total += Integer.parseInt(rsConfBookings.getString("product_price"));
//            }
            ResultSet rsConfBookings2 = psConfBookings.executeQuery();
            while(rsConfBookings2.next())
            {
                total += Integer.parseInt(rsConfBookings2.getString("product_price"));
                %>
                <tr>
                    <td><img src="products/<%=rsConfBookings2.getString("product_image")%>" height="200px" width="200px"></td>
                    <td><%=rsConfBookings2.getString("product_name")%></td>
                    <td><%=rsConfBookings2.getString("product_price")%></td>
                </tr>
                <%
            }
            
        %>
        <tr>
            <td></td>
            <td>Total</td>
            <td><strong><%=total%></strong></td>
        </tr>
        <input type="hidden" value="<%=total%>" name="total">
        </table>
        </div>
        
        
        <div class="col-md-4 col-lg-4">
            <h4>
                Pay &#8377;<%=total%> using PayTm. Please mention the reason as well! This would help us to manage easily!
                <br>
                Press <b>PAYED</b> after you have made the payment!
            </h4>
                <img src="gallery/paytm.jpeg" height="400px" width="300px">                
        </div>
                <div class="clearfix"></div>
                
                
	<!-- footer -->
	<jsp:include page="include/footer.jsp"></jsp:include>	
	<!-- //footer -->    
	
	<!-- //End-slider-script -->
    <script src="js/bootstrap.js"></script>
</body>
</html>
