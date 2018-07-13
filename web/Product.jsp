<%-- 
    Document   : Empty
    Created on : 4 Apr, 2018, 3:36:29 PM
    Author     : kunal
--%>

<%@page import="javax.swing.JOptionPane"%>
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
#mySidenav input {
    position: fixed;
    left: -120px;
    transition: 0.5s;
    padding: 15px;
    width: 160px;
    text-decoration: none;
    font-size: 20px;
    color: white;
    display: block;
    border-radius: 0 5px 5px 0;
    float: left;
}

#mySidenav input:hover {
    left: 0;
}

#about {
    top: 20px;
    background-color: #4CAF50;
}

#blog {
    top: 80px;
    background-color: #2196F3;
}

#projects {
    top: 140px;
    background-color: #f44336;
}

#contact {
    top: 200px;
    background-color: #555
}
</style>


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

        <br>
        <br>
        
        <div class="container" style="margin-left: 120px;"> 
            <div class="w3ls-title"> 
	        <h3 class="agileits-title w3title1">Products</h3>
	    </div>
            <center>
            <p style="color: red; font-size: 30px; margin-bottom: 20px">Please select the major categories from the navigation on the Left!</p>
            </center>
            <div id="mySidenav" class="sidenav">
                <%  int top = 180;
                    PreparedStatement ps = new db.Connect_db().getConnection().prepareStatement("SELECT * FROM category;");
                    ResultSet rs = ps.executeQuery();
                    while(rs.next())
                    {
                        String px = "px";
                        top += 65;
                        String toppx = top+px;                   
                %>
                <input type="submit" onclick="otpCall(this.value)" style="top: <%=toppx%>; background-color: #2196F3;" class="btn btn-info" value="<%=rs.getString("cat_name")%>" />
                <%
                    }
                %>
            </div>
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
            <script type="text/javascript"> 
                function prodCall(str, strCat)
                {
                            //alert(str + strCat);
                    
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
                            document.getElementById("product").innerHTML=xreq.responseText;
                        }
                    }
                    xreq.open("GET","Prod.jsp?subcat=" + str + "&cat=" + strCat,"true");
                    
                    //xreq.onreadystatechange = call;
                    xreq.send();
                    return true;
                
                }
        </script>
            <script type="text/javascript"> 
                function otpCall(str)
                {
                    //alert(str);
                    
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
                            document.getElementById("subcat").innerHTML=xreq.responseText;
                        }
                    }
                    xreq.open("GET","SubCat.jsp?cat=" + str,"true");
                    
                    //xreq.onreadystatechange = call;
                    xreq.send();
                    return true;
                
            }
        </script>
            
        <div id="subcat"></div>

        </div>
              
        <br>
            <!-- footer -->
          <jsp:include page="include/footer.jsp"></jsp:include>
	<!-- //footer -->
        
         <script src="js/bootstrap.js"></script>
    </body>
</html>

