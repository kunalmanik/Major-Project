<%-- 
    Document   : editsubsubcat
    Created on : 20 Feb, 2018, 4:08:03 AM
    Author     : kunal
--%>

<%@page import="db.Connect_db"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>

<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>My Admin</title>
    <meta name="description" content="Sufee Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="apple-icon.png">
    <link rel="shortcut icon" href="favicon.ico">

    <link rel="stylesheet" href="assets/css/normalize.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
    <!-- <link rel="stylesheet" href="assets/css/bootstrap-select.less"> -->
    <link rel="stylesheet" href="assets/scss/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
    <style>
        .card-header {
            padding-left: 400px;
                    }
                    #card-header{
                        padding-left: 250px;
                    }
    </style>
</head>
<body>
        <!-- Left Panel -->

    <%
                                if(session.getAttribute("subadminname")==null || session.getAttribute("subpassword")==null)
                                {
                                    %> 
                                    <jsp:include page="error404.jsp"></jsp:include>
                                    
                                     <%
                                }
                            
                                else
                                {
                            %>
     <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            <div class="navbar-header">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main-menu" aria-controls="main-menu" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
               <a class="navbar-brand" href="welcome.jsp">Blossom Flower Gallery</a>
                <a class="navbar-brand hidden" href="welcome.jsp"><img src="images/logo1.png" alt="Logo"></a>
            </div>

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="welcome.jsp"> <i class="menu-icon fa fa-dashboard"></i>Dashboard </a>
                    </li>
                    			<li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-list"></i>Category</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-circle-o"></i><a href="add_category.jsp">Add Category</a></li>
                            <li><i class="fa fa-circle-o"></i><a href="view_category.jsp">View Category </a></li>
			    <li><i class="fa fa-circle-o"></i><a href="subcat.jsp">Add Sub-Category</a></li>
                            <li><i class="fa fa-circle-o"></i><a href="viewsubcat.jsp">View Sub-Category</a></li>
                            <li><i class="fa fa-circle-o"></i><a href="subSubCat.jsp">Add Products</a></li>
                            <li><i class="fa fa-circle-o"></i><a href="viewSubSubCat.jsp">View Products</a></li>
                        </ul>
                    </li>
                    		 
            </div><!-- /.navbar-collapse --> 
        </nav>
    </aside><!-- /#left-panel -->    <!-- Left Panel -->

    <!-- Right Panel -->

    <div id="right-panel" class="right-panel">

        <!-- Header-->
        <header id="header" class="header">

            <div class="header-menu">

                <div class="col-sm-7">
                    
                    <a id="menuToggle" class="menutoggle pull-left"><i class="fa fa fa-tasks"></i></a>
                    </div>
                     <div class="col-sm-12">
                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><h6>Welcome <%=session.getAttribute("subadminname")%> </h6>
                            
                        </a>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img class="user-avatar rounded-circle" src="images/adminimg.jpg" alt="User Avatar">
                        </a>

                        <div class="user-menu dropdown-menu">
                                <a class="nav-link" href="welcome.jsp"><i class="fa fa- user"></i>My Profile</a>

                                <a class="nav-link" href="adminLogout.jsp"><i class="fa fa-power -off"></i>Logout</a>
                        </div>
                    </div>

                

                </div>
                    

                </div>
            

        </header>

        <!-- Header-->

        <div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>Edit Product</h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li><a href="#">Dashboard</a></li>
                            <li class="active">View Sub Category</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="content mt-3">
            <div class="animated fadeIn">


                <div class="row">
                  <!--/.col-->

                 
                 

                  <div class="col-md-12" >
                    <div class="card">
                      <div class="card-header">
                        <strong>Edit </strong>Product
                      </div>
<table align="center"  class="table" >                        
                        <form  action="../sub_updatesubsubcat" method="post" >               

    
    <br><br>
   
     
    
      
<%
//String category=request.getParameter("cat_name");
String id1=request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = new Connect_db().getConnection();
String query = "select * from products where id='"+id1+"'";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
while(rs.next())
{
%>

<tr> <td>  <th> Sub Category</th></td>
    <td><input type="text" hidden="" name="proid" value="<%=id1%>"/> <input type="text" name="sub_id" value="<%=rs.getString("sub_category")%>" readonly></td>
</tr>
<tr> <td> <th>Product Name</th></td>
<td><input type="text" name="productName" value="<%=rs.getString("product_name")%>"></td>
</tr>
<!--<tr> <td> <th>Image</th></td>
<td> <input type="file" name="image" value="" /></td>
</tr>-->
<tr> <td><th>Description</th> </td>
    <td> <textarea name="productDes" rows="6" cols="48"><%=rs.getString("product_desc")%></textarea> </td>
</tr> 
<tr> <td> <th>Price</th></td> 
<td><input type="text" name="price" value="<%=rs.getString("product_price")%>"></td>
</tr>

<tr> <td> <th>Enability</th></td> 
    <td>
<select name="enability">
    <option value="enabled">enabled</option>
    <option value="disabled">disabled</option>
</select>
    </td>
</tr>

<tr>
    <td>
        
    </td>
    <td></td></tr>
<tr></tr>
<tr>
    <td></td>
    <td> </td>
<td><input type="submit" name="Submit" value="Update" size="25"></td>

</tr>

    
<%
}
%>
</div>
</form>
</table>    
             </div>
          </div>
                    </div>
            </div><!-- .animated -->
        </div><!-- .content -->


    </div><!-- /#right-panel -->

    <!-- Right Panel -->


    <script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>
    <% } %>
   
</body>
</html>
