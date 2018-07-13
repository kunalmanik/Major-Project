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
<style>
             /* Container needed to position the button. Adjust the width as needed */
.cont_btn {
  position: relative;
  width: 50%;
}

/* Make the image responsive */
.cont_btn img {
  width: 100%;
  height: auto;
}

/* Style the button and place it in the middle of the cont_btn/image */
.cont_btn .btn_on_img {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  background-color: #e0e0e0;
  color: white;
  font-size: 16px;
  padding: 12px 24px;
  border: none;
  cursor: pointer;
  border-radius: 5px;
}

.cont_btn .btn_on_img:hover {
  background-color: black;
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
        
        
        <%
            String search = request.getParameter("Search");
            String query = "";
            String type = request.getParameter("type");
            
            if(type == null)
                type = "blank";
            else if (search == null)
                search = "blank";
            
            if(type.equals("1"))
                //query = "SELECT * FROM products WHERE id IN(SELECT prod_id FROM bookings WHERE prod_id NOT IN (SELECT DISTINCT prod_id FROM bookings WHERE email=? AND status='booked') GROUP BY prod_id ORDER BY COUNT(*) DESC) AND visibility='enabled' AND gender='none' AND class='none';";
                query = "SELECT * FROM products WHERE id IN(SELECT id FROM bookings WHERE id NOT IN (SELECT DISTINCT prod_id FROM bookings WHERE email=? AND status='booked') GROUP BY id ORDER BY COUNT(*) DESC) AND visibility='enabled' AND gender='none' AND class='none';";
            else if(type.equals("2"))
                //query = "SELECT * FROM products WHERE id IN(SELECT prod_id FROM bookings WHERE prod_id NOT IN (SELECT DISTINCT prod_id FROM bookings WHERE email=? AND status='booked') GROUP BY prod_id ORDER BY COUNT(*) DESC) AND gender=(SELECT gender FROM products WHERE id IN (SELECT DISTINCT prod_id FROM bookings WHERE email = ?) GROUP BY gender ORDER BY COUNT(*) LIMIT 1) AND class='none';";
                query = "SELECT * FROM products WHERE id IN(SELECT id FROM bookings WHERE id NOT IN (SELECT DISTINCT prod_id FROM bookings WHERE email=? AND status='booked') GROUP BY id ORDER BY COUNT(*) DESC) AND gender=(SELECT gender FROM products WHERE id IN (SELECT DISTINCT prod_id FROM bookings WHERE email = ?) GROUP BY gender ORDER BY COUNT(*) LIMIT 1) AND class='none';";
            else if(type.equals("3"))
                //query = "SELECT * FROM products WHERE id IN(SELECT prod_id FROM bookings WHERE prod_id NOT IN (SELECT DISTINCT prod_id FROM bookings WHERE email=? AND status='booked') GROUP BY prod_id ORDER BY COUNT(*) DESC) AND gender=(SELECT class FROM products WHERE id IN (SELECT DISTINCT prod_id FROM bookings WHERE email = ?) GROUP BY class ORDER BY COUNT(*) LIMIT 1) AND gender='none'";
                query = "SELECT * FROM products WHERE id IN(SELECT id FROM products WHERE id NOT IN (SELECT DISTINCT prod_id FROM bookings WHERE email=? AND status='booked') GROUP BY id ORDER BY COUNT(*) DESC) AND gender='none';";
            else if(search != null)
                query = "SELECT * FROM products WHERE id NOT IN (SELECT DISTINCT(prod_id) FROM bookings WHERE email = ? AND status='booked') AND visibility='enabled' AND (product_name LIKE ? OR tags LIKE ?) ;";
                
            
            PreparedStatement psProd = new db.Connect_db().getConnection().prepareStatement(query);
            
            
            if(type.equals("1"))
                psProd.setString(1, session.getAttribute("email").toString());            
            else if(type.equals("2"))
            {
                psProd.setString(1, session.getAttribute("email").toString());            
                psProd.setString(2, session.getAttribute("email").toString());            
            }
            else if(type.equals("3"))
            {
                psProd.setString(1, session.getAttribute("email").toString());            
                psProd.setString(2, session.getAttribute("email").toString());            
            }
            else if(search != null)
            {
                psProd.setString(1, session.getAttribute("email").toString());
                psProd.setString(2, '%' + search + '%');
                psProd.setString(3, '%' + search + '%');
            }
            int counter = 0;
            ResultSet rsProd = psProd.executeQuery();
            while(rsProd.next())
            {
                counter = 1;
                String booking = "booking" + rsProd.getString("id");
        %>
        <div class="container">
        <div class="cont_btn col-lg-6 col-md-6">
            <img src="products/<%=rsProd.getString("product_image")%>" style="width:250px; height:250px;">
            <input type="button" class="btn_on_img" id="<%=booking%>" onclick="return updateBooking('<%=rsProd.getString("id")%>', '<%=session.getAttribute("email").toString()%>');" value="Book this product" />
            
        </div>
            <div col-lg-6 col-md-6>
                <strong>Product Name : </strong><%=rsProd.getString("product_name")%><br><br>
                <strong>Product Price : </strong> &#x20B9;<%=rsProd.getString("product_price")%><br><br>
                <strong>Product Description : </strong><%=rsProd.getString("product_desc")%>
            </div>
        </div>
            <br>
        <%
            }
        %>
        <%
            if(counter == 0)
            {
        %>
        
                    <div class="alert alert-danger alert-dismissible fade in" style="margin: 20px; font-size: 20px" >
                        <center>
<!--                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>-->
                            <strong>Sorry!</strong> We could not find any Product related to that search!
                        </center>
                    </div>
                    <div class="work jarallax">
                            <div class="container">
                                    <div class="work-agileinfo">
                                            <h3>Do you want to refine your search?</h3>

                                            <div class="w3btns-agile">
                                                    <a href="Product.jsp">Search Here</a>
                                            </div>
                                    </div>
                            </div>
                    </div>
        <%
            }
        %>
        <script type="text/javascript"> 
                function updateBooking(id, email)
                {
                            //alert(str + strCat);
                            var booking = "booking" + id;
                            document.getElementById(booking).value = 'Booked';
                            document.getElementById(booking).disabled = true;
                    
                    if(window.XMLHttpRequest)
                    {
                        xreq=new XMLHttpRequest();
                    }
                    else
                    {
                        xreq=new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    xreq.onreadystatechange = function ()
                    {
                        if((xreq.readyState==4) && (xreq.status==200))
                        {
                            //document.getElementById("product").innerHTML=xreq.responseText;
                        }
                    }
                    xreq.open("GET","ProdUpdate.jsp?id=" + id + "&email=" + email,"true");
                    
                    //xreq.onreadystatechange = call;
                    xreq.send();
                    return true;
                
                }
            </script>
        <!-- footer -->
          <jsp:include page="include/footer.jsp"></jsp:include>
	<!-- //footer -->
        
         <script src="js/bootstrap.js"></script>
    </body>
</html>
