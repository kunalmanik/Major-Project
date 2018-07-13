<%-- 
    Document   : Books
    Created on : 21 May, 2018, 7:14:59 PM
    Author     : kunal
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.FileReader"%>
<%@page import="org.json.simple.JSONObject"%>
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
        <%
            String accType = null;
            PreparedStatement psAcc = new db.Connect_db().getConnection().prepareStatement("SELECT role FROM user WHERE email=?;");
            psAcc.setString(1, session.getAttribute("email").toString());
            ResultSet rsAcc = psAcc.executeQuery();
            while(rsAcc.next())
            {
                accType = rsAcc.getString("role");
            }            
        %>
        <%
            if(accType.equals("parent"))
            {
        %>
	<!-- icons -->
<div class="w3_wthree_agileits_icons main-grid-border">
		<div class="container">
			<div class="w3ls-title"> 
				<h3 class="agileits-title w3title1">Books for Parents</h3>
			</div>
			
		</div>
    
	</div>
<!-- //icons -->
<div style="margin-left: 40px">
    <%            
            JSONParser parser = new JSONParser();
            try{
                JSONObject jSONObject = (JSONObject) parser.parse(new FileReader("C://Users//kunal//Documents//NetBeansProjects//EMS_School//web//data.json"));
                for(Object key : jSONObject.keySet())
                {
                    //System.out.println(key  + " : " + jSONObject.get(key));
                    %>
                    <a href="https://www.amazon.in/s/ref=nb_sb_noss?url=search-alias%3Dstripbooks&field-keywords=<%=key%>" target="_blank">
                    <div class="col-lg-6 col-md-6">        
                        <div>
                            <img src="<%=jSONObject.get(key)%>" alt="<%=key%>" style="width: 400px; height: 400px">
                        </div>
                        <div>
                            <%=key%>                            
                        </div>      
                        <br>
                    </div>                     
                        </a>
                    <%
                }
                //JOptionPane.showMessageDialog(null, jSONObject.size());
            }
            catch(Exception e)
            {
                out.print(e);
                //JOptionPane.showMessageDialog(null, e);
            }
        %>
</div>
        <%
            }                           
        %>
<div class="clearfix"></div>
	<!-- footer -->
	<jsp:include page="include/footer.jsp"></jsp:include>	
	<!-- //footer -->    
	
	<!-- //End-slider-script -->
    <script src="js/bootstrap.js"></script>
</body>
</html>
