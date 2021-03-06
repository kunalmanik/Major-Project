<%-- 
    Document   : FeeStructure
    Created on : 6 Apr, 2018, 1:02:21 PM
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
            <button type="button" style="margin-bottom:60px;" class="btn btn-info" data-toggle="collapse" data-target="#demo">Show Fee Structure</button>
            <div id="demo" class="collapse">
            <table class="table">
                <thead>
                
                    
                <th><label style="color: black;">Class</label></th>
                <th><label style="color: black;">Board-Tuition</label></th>
                <th><label style="color: black;">One Time Fee</label></th>
                <th><label style="color: black;">Student Fund</label></th>
                <th><label style="color: black;">Infrastructure Fund</label></th>
                <th><label style="color: black;">Extra Charges</label></th>                
                <th><label style="color: black;">Total</label></th>                
                
              
                
                    <% int  c, b, o, s, i,e,tot;
                        PreparedStatement ps = new db.Connect_db().getConnection().prepareStatement("SELECT * FROM fee;");
                        ResultSet rs = ps.executeQuery();
                        while(rs.next())
                        {
                             b = rs.getInt("board");
                             o = rs.getInt("onetime");
                            s =rs.getInt("student");
                            i =rs.getInt("infra");
                            e = rs.getInt("extra");
                            tot = b+o+s+i+e;
                    %>
                    <tbody>
                            <td> <%=rs.getString("class")%> </td> 
                            <td> <%=rs.getString("board")%> </td> 
                            <td> <%=rs.getString("onetime")%> </td> 
                            <td> <%=rs.getString("student")%> </td> 
                            <td> <%=rs.getString("infra")%> </td> 
                            <td> <%=rs.getString("extra")%> </td> 
                            <td>&#8377; <%=tot%>/- </td> 
                    </tbody>
                    <%
                        }
                    %>
                
            </table>
        </div>
        </div>
        <!-- footer -->
          <jsp:include page="include/footer.jsp"></jsp:include>
	<!-- //footer -->
        
         <script src="js/bootstrap.js"></script>
    </body>
</html>
