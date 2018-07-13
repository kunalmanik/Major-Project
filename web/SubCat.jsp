<%-- 
    Document   : SubCat
    Created on : 6 Apr, 2018, 5:01:45 PM
    Author     : kunal
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <div>
            <%
                String cat = request.getParameter("cat");
                PreparedStatement psSub = new db.Connect_db().getConnection().prepareStatement("SELECT * FROM sub_category WHERE cat_name = ?");
                psSub.setString(1, cat);
                ResultSet rsSub = psSub.executeQuery();
                //JOptionPane.showMessageDialog(null, str + );
                while(rsSub.next())
                {
                    String subcat = rsSub.getString("subcat");
            %>
            <input type="button" class="btn btn-danger" value="<%=rsSub.getString("subcat")%>" onclick="return prodCall('<%=subcat%>', '<%=cat%>');" />
            <%
                }
            %>
        </div>
        
        <div id="product" style="margin-top: 50px">
           Your Non-Booked products will appear here!
        </div>
    </body>
</html>
