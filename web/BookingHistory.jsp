<%-- 
    Document   : BookingHistory
    Created on : 6 Apr, 2018, 3:16:57 PM
    Author     : kunal
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E.M.S. School</title>
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
            if(session.getAttribute("email") == null)
            {
                response.sendRedirect("SignIn.jsp");
            }
        %>
        <!-- header -->
        <jsp:include page="include/header.jsp" />
	<!-- //header -->
        <div class="banner-1">
	</div>
        <br><br>
        <div class="w3ls-title"> 
	        <h3 class="agileits-title w3title1">Booking History</h3>
	    </div>
        <%
            
            String email = session.getAttribute("email").toString();
            //JOptionPane.showMessageDialog(null, cat + subcat);
            
            String query = "SELECT * FROM products p JOIN bookings b ON p.id = b.prod_id WHERE b.email = ?;";
            PreparedStatement psProd = new db.Connect_db().getConnection().prepareStatement(query);
            psProd.setString(1, email);            
            ResultSet rsProd = psProd.executeQuery();
            while(rsProd.next())
            {
                String concatID = rsProd.getString("booking_id");
                String booking = "booking" + concatID;
                String cancelBooking = "cancelBooking" + concatID;
        %>
        <div class="container" style="margin-top: 10px">
        <div class="cont_btn col-lg-6 col-md-6">
            <img src="products/<%=rsProd.getString("product_image")%>" style="width:250px; height:250px;">              
            <%
                if(rsProd.getString("status").equals("booked"))
                {
            %>
            <input type="button" class="btn_on_img" id="<%=booking%>" onclick="" value="<%=rsProd.getString("status")%>" />
            <input type="button" class="btn_on_img" id="<%=cancelBooking%>" onclick="return cancelBooking('<%=rsProd.getString("booking_id")%>');" value="Cancel" />
            <%
                }
                else
                {
            %>
            <input type="button" class="btn_on_img" id="<%=booking%>" onclick="" value="<%=rsProd.getString("status")%>" />
            <%
                }
            %>
        </div>
        <script type="text/javascript"> 
                function cancelBooking(id)
                {
                            //alert(str + strCat);
                            var cancelBooking = "cancelBooking" + id;
                            document.getElementById(cancelBooking).value = 'Cancelled';
                            document.getElementById(cancelBooking).disabled = true;
                    
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
                    xreq.open("GET","CancelProd.jsp?id=" + id,"true");
                    
                    //xreq.onreadystatechange = call;
                    xreq.send();
                    return true;
                
                }
            </script>
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
            <!-- footer -->
          <jsp:include page="include/footer.jsp"></jsp:include>
	<!-- //footer -->
        
         <script src="js/bootstrap.js"></script>
    </body>
</html>
