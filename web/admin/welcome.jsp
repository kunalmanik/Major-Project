<%-- 
    Document   : welcome
    Created on : 6 Feb, 2018, 12:35:08 PM
    Author     : kunal
--%>

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
    <link href="assets/css/lib/vector-map/jqvmap.min.css" rel="stylesheet">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>
<body>


        <!-- Left Panel -->

  <%
                                if(session.getAttribute("adminname")==null || session.getAttribute("password")==null)
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
               <a class="navbar-brand" href="welcome.jsp">E.M.S School</a>
                <a class="navbar-brand hidden" href="welcome.jsp"><img src="images/logo1.png" alt="Logo"></a>
            </div>

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="welcome.jsp"> <i class="menu-icon fa fa-dashboard"></i>Dashboard </a>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon ti-notepad"></i>Pages</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-chevron-circle-right"></i><a href="aboutus.jsp">About Us</a></li>
                            <li><i class="fa fa-chevron-circle-right"></i><a href="viewaboutus.jsp">View About Us</a></li>                            
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-laptop"></i>Banner</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-file-image-o"></i><a href="add_banner.jsp">Add Banner</a></li>
                            <li><i class="fa fa-file-image-o"></i><a href="view_banner.jsp">View Banner</a></li>
                            
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon ti-gallery"></i>Gallery</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa ti-plus"></i><a href="add_galleryCategory.jsp">Add Category</a></li>
                            <li><i class="fa ti-plus"></i><a href="add_gallery.jsp">Add Images</a></li>
                            <li><i class="fa ti-plus"></i><a href="view_gallery.jsp">View Images</a></li>
                            
                        </ul>
                    </li>
					<li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-comments"></i>Testimonials</a>
                        <ul class="sub-menu children dropdown-menu">
                            
                            <li><i class="fa fa-comments"></i><a href="view_testimonial.jsp">View Testimonial </a></li>
                        </ul>
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
                    
					<li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-list"></i>Orders</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-circle-o"></i><a href="Orders.jsp">View</a></li>
                            
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-envelope"></i>Public Queries</a>
                        <ul class="sub-menu children dropdown-menu">
<!--                            <li><i class="fa fa-chevron-circle-right"></i><a href="contactus.jsp">About Us</a></li>-->
                            <li><i class="fa fa-chevron-circle-right"></i><a href="contactus.jsp">Contact Us (Queries)</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon ti-book"></i>Terms & Condition</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-chevron-circle-right"></i><a href="addTC.jsp">Add</a></li>
                            <li><i class="fa fa-chevron-circle-right"></i><a href="viewTC.jsp"> View</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon ti-face-smile"></i>Our Team</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-chevron-circle-right"></i><a href="addTeam.jsp">Add</a></li>
                            <li><i class="fa fa-chevron-circle-right"></i><a href="viewTeam.jsp"> View</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon ti-time"></i>Timings</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-chevron-circle-right"></i><a href="addTimings.jsp">Add</a></li>
                            <li><i class="fa fa-chevron-circle-right"></i><a href="viewTimings.jsp">View</a></li>
                        </ul>
                    </li>
<!--                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon ti-id-badge"></i>Query</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-chevron-circle-right"></i><a href="viewService.jsp">View Service Query</a></li>
                            <li><i class="fa fa-chevron-circle-right"></i><a href="OrderQueryAction.jsp"> Order Query Action</a></li>
                        </ul>
                    </li>-->
                  <!--  <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon ti-gift"></i>Coupon Code</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-chevron-circle-right"></i><a href="AddCoupon.jsp">Add</a></li>
                            <li><i class="fa fa-chevron-circle-right"></i><a href="ViewCoupon.jsp"> View</a></li>
                        </ul>
                    </li> -->
                   <!-- <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon ti-gift"></i>empty</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-chevron-circle-right"></i><a href="empty.jsp">Add</a></li>
                            <li><i class="fa fa-chevron-circle-right"></i><a href="empty.jsp"> View</a></li>
                        </ul>
                    </li> -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon ti-themify-favicon"></i>Admin Management</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-chevron-circle-right"></i><a href="AddSubAdmin.jsp">Add Sub Admin</a></li>
                            <li><i class="fa fa-chevron-circle-right"></i><a href="ViewSubAdmin.jsp"> View Sub Admin</a></li>
                            <li><i class="fa fa-chevron-circle-right"></i><a href="ChangeAdminPassword.jsp"> Change Password</a></li>
                        </ul>
                    </li>
                   <!-- <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon ti-gift"></i>Pin Code</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-chevron-circle-right"></i><a href="AddPinCode.jsp">Add</a></li>
                            <li><i class="fa fa-chevron-circle-right"></i><a href="ViewPinCode.jsp">View</a></li>
                        </ul>
                    </li>-->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon ti-power-off"></i>Rules</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-chevron-circle-right"></i><a href="Add_Rules.jsp">Add</a></li>
                            <li><i class="fa fa-chevron-circle-right"></i><a href="ViewRules.jsp">View</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon ti-help"></i>FAQs</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-chevron-circle-right"></i><a href="AddFAQ.jsp">Add</a></li>
                            <li><i class="fa fa-chevron-circle-right"></i><a href="ViewFAQ.jsp">View</a></li>
                        </ul>
                    </li>
<!--                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon ti-layout-grid3-alt"></i>Vendor Management</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-chevron-circle-right"></i><a href="viewVendors.jsp">View Vendors</a></li>
                            <li><i class="fa fa-chevron-circle-right"></i><a href="VendorsRecord.jsp"> Vendors Record</a></li>
                        </ul>
                    </li>-->
                   
                </ul>
                 <!-- Icons tab for editing -->
				 				 				 							 
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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><h6>Welcome <%=session.getAttribute("adminname")%> </h6>
                            
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
                        <h1>Dashboard</h1>                        
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li class="active">Dashboard</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="content mt-3">

            <div class="col-sm-12">
                <div class="alert  alert-success alert-dismissible fade show" role="alert">
                    <span class="badge badge-pill badge-success" style="padding: 10px">Successfully Logged In</span> Welcome back Admin!!
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            </div>


           <!--<div class="col-sm-6 col-lg-3">
                <div class="card text-white bg-flat-color-1">
                    <div class="card-body pb-0">
                        <div class="dropdown float-right">
                            <button class="btn bg-transparent dropdown-toggle theme-toggle text-light" type="button" id="dropdownMenuButton" data-toggle="dropdown">
                                <i class="fa fa-cog"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <div class="dropdown-menu-content">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div>
                        </div>
                        <h4 class="mb-0">
                            <span class="count">10468</span>
                        </h4>
                        <p class="text-light">Members online</p>

                        <div class="chart-wrapper px-0" style="height:70px;" height="70"/>
                            <canvas id="widgetChart1"></canvas>
                        </div>

                    </div>

                </div>
            </div>
            <!--/.col-->

            <!--<div class="col-sm-6 col-lg-3">
                <div class="card text-white bg-flat-color-2">
                    <div class="card-body pb-0">
                        <div class="dropdown float-right">
                            <button class="btn bg-transparent dropdown-toggle theme-toggle text-light" type="button" id="dropdownMenuButton" data-toggle="dropdown">
                                <i class="fa fa-cog"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <div class="dropdown-menu-content">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div>
                        </div>
                        <h4 class="mb-0">
                            <span class="count">10468</span>
                        </h4>
                        <p class="text-light">Members online</p>

                        <div class="chart-wrapper px-0" style="height:70px;" height="70"/>
                            <canvas id="widgetChart2"></canvas>
                        </div>

                    </div>
                </div>
            </div>
            <!--/.col-->

            <!--<div class="col-sm-6 col-lg-3">
                <div class="card text-white bg-flat-color-3">
                    <div class="card-body pb-0">
                        <div class="dropdown float-right">
                            <button class="btn bg-transparent dropdown-toggle theme-toggle text-light" type="button" id="dropdownMenuButton" data-toggle="dropdown">
                                <i class="fa fa-cog"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <div class="dropdown-menu-content">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div>
                        </div>
                        <h4 class="mb-0">
                            <span class="count">10468</span>
                        </h4>
                        <p class="text-light">Members online</p>

                    </div>

                        <div class="chart-wrapper px-0" style="height:70px;" height="70"/>
                            <canvas id="widgetChart3"></canvas>
                        </div>
                </div>
            </div>
            <!--/.col-->

            <!--<div class="col-sm-6 col-lg-3">
                <div class="card text-white bg-flat-color-4">
                    <div class="card-body pb-0">
                        <div class="dropdown float-right">
                            <button class="btn bg-transparent dropdown-toggle theme-toggle text-light" type="button" id="dropdownMenuButton" data-toggle="dropdown">
                                <i class="fa fa-cog"></i>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <div class="dropdown-menu-content">
                                    <a class="dropdown-item" href="#">Action</a>
                                    <a class="dropdown-item" href="#">Another action</a>
                                    <a class="dropdown-item" href="#">Something else here</a>
                                </div>
                            </div>
                        </div>
                        <h4 class="mb-0">
                            <span class="count">10468</span>
                        </h4>
                        <p class="text-light">Members online</p>

                        <div class="chart-wrapper px-3" style="height:70px;" height="70"/>
                            <canvas id="widgetChart4"></canvas>
                        </div>

                    </div>
                </div>
            </div>
            <!--/.col-->

            <div class="col-lg-3 col-md-6">
                <div class="social-box facebook">
                    <i class="fa fa-facebook"></i>
<!--                    <ul>
                        <li>
                            <sctrong><span class="count">40</span> k</strong>
                            <span>friends</span>
                        </li>
                        <li>
                            <sctrong><span class="count">450</span></strong>
                            <span>feeds</span>
                        </li>
                    </ul>-->
                </div>
                <!--/social-box-->
            </div><!--/.col-->


            <div class="col-lg-3 col-md-6">
                <div class="social-box twitter">
                    <i class="fa fa-twitter"></i>
<!--                    <ul>
                        <li>
                            <sctrong><span class="count">30</span> k</strong>
                            <span>friends</span>
                        </li>
                        <li>
                            <sctrong><span class="count">450</span></strong>
                            <span>tweets</span>
                        </li>
                    </ul>-->
                </div>
                <!--/social-box-->
            </div><!--/.col-->


            <div class="col-lg-3 col-md-6">
                <div class="social-box linkedin">
                    <i class="fa fa-linkedin"></i>
<!--                    <ul>
                        <li>
                            <sctrong><span class="count">40</span> +</strong>
                            <span>contacts</span>
                        </li>
                        <li>
                            <sctrong><span class="count">250</span></strong>
                            <span>feeds</span>
                        </li>
                    </ul>-->
                </div>
                <!--/social-box-->
            </div><!--/.col-->


            <div class="col-lg-3 col-md-6">
                <div class="social-box google-plus">
                    <i class="fa fa-google-plus"></i>
<!--                    <ul>
                        <li>
                            <sctrong><span class="count">94</span> k</strong>
                            <span>followers</span>
                        </li>
                        <li>
                            <sctrong><span class="count">92</span></strong>
                            <span>circles</span>
                        </li>
                    </ul>-->
                </div>
                <!--/social-box-->
            </div><!--/.col-->

       <!--     <div class="col-xl-6">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-4">
                                <h4 class="card-title mb-0">Traffic</h4>
                                <div class="small text-muted">October 2017</div>
                            </div>
                            <!--/.col-->
                   <!--         <div class="col-sm-8 hidden-sm-down">
                                <button type="button" class="btn btn-primary float-right bg-flat-color-1"><i class="fa fa-cloud-download"></i></button>
                                <div class="btn-toolbar float-right" role="toolbar" aria-label="Toolbar with button groups">
                                    <div class="btn-group mr-3" data-toggle="buttons" aria-label="First group">
                                        <label class="btn btn-outline-secondary">
                                            <input type="radio" name="options" id="option1"> Day
                                        </label>
                                        <label class="btn btn-outline-secondary active">
                                            <input type="radio" name="options" id="option2" checked=""> Month
                                        </label>
                                        <label class="btn btn-outline-secondary">
                                            <input type="radio" name="options" id="option3"> Year
                                        </label>
                                    </div>
                                </div>
                            </div><!--/.col-->


                   <!--     </div><!--/.row-->
                    <!--    <div class="chart-wrapper mt-4" />
                            <canvas id="trafficChart" style="height:200px;" height="200"></canvas>
                        </div>

                    </div>
                    <div class="card-footer">
                        <ul>
                            <li>
                                <div class="text-muted">Visits</div>
                                <strong>29.703 Users (40%)</strong>
                                <div class="progress progress-xs mt-2" style="height: 5px;">
                                    <div class="progress-bar bg-success" role="progressbar" style="width: 40%;" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </li>
                            <li class="hidden-sm-down">
                                <div class="text-muted">Unique</div>
                                <strong>24.093 Users (20%)</strong>
                                <div class="progress progress-xs mt-2" style="height: 5px;">
                                    <div class="progress-bar bg-info" role="progressbar" style="width: 20%;" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </li>
                            <li>
                                <div class="text-muted">Pageviews</div>
                                <strong>78.706 Views (60%)</strong>
                                <div class="progress progress-xs mt-2" style="height: 5px;">
                                    <div class="progress-bar bg-warning" role="progressbar" style="width: 60%;" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </li>
                            <li class="hidden-sm-down">
                                <div class="text-muted">New Users</div>
                                <strong>22.123 Users (80%)</strong>
                                <div class="progress progress-xs mt-2" style="height: 5px;">
                                    <div class="progress-bar bg-danger" role="progressbar" style="width: 80%;" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </li>
                            <li class="hidden-sm-down">
                                <div class="text-muted">Bounce Rate</div>
                                <strong>40.15%</strong>
                                <div class="progress progress-xs mt-2" style="height: 5px;">
                                    <div class="progress-bar" role="progressbar" style="width: 40%;" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

           <div class="col-xl-3 col-lg-6">
                <section class="card">
                    <div class="twt-feed blue-bg">
                        <div class="corner-ribon black-ribon">
                            <i class="fa fa-twitter"></i>
                        </div>
                        <div class="fa fa-twitter wtt-mark"></div>

                        <div class="media">
                            <a href="#">
                                <img class="align-self-center rounded-circle mr-3" style="width:85px; height:85px;" alt="" src="images/adminimg.jpg">
                            </a>
                            <div class="media-body">
                                <h2 class="text-white display-6">Jim Doe</h2>
                                <p class="text-light">Project Manager</p>
                            </div>
                        </div>
                    </div>
                    <div class="weather-category twt-category">
                        <ul>
                            <li class="active">
                                <h5>750</h5>
                                Tweets
                            </li>
                            <li>
                                <h5>865</h5>
                                Following
                            </li>
                            <li>
                                <h5>3645</h5>
                                Followers
                            </li>
                        </ul>
                    </div>
                    <div class="twt-write col-sm-12">
                        <textarea placeholder="Write your Tweet and Enter" rows="1" class="form-control t-text-area"></textarea>
                    </div>
                    <footer class="twt-footer">
                        <a href="#"><i class="fa fa-camera"></i></a>
                        <a href="#"><i class="fa fa-map-marker"></i></a>
                        New Castle, UK
                        <span class="pull-right">
                            32
                        </span>
                    </footer>
                </section>
            </div>


            <div class="col-xl-3 col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <div class="stat-widget-one">
                            <div class="stat-icon dib"><i class="ti-money text-success border-success"></i></div>
                            <div class="stat-content dib">
                                <div class="stat-text">Total Profit</div>
                                <div class="stat-digit">1,012</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> -->


         <!--   <div class="col-xl-3 col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <div class="stat-widget-one">
                            <div class="stat-icon dib"><i class="ti-user text-primary border-primary"></i></div>
                            <div class="stat-content dib">
                                <div class="stat-text">New Customer</div>
                                <div class="stat-digit">961</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 

            <div class="col-xl-3 col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <div class="stat-widget-one">
                            <div class="stat-icon dib"><i class="ti-layout-grid2 text-warning border-warning"></i></div>
                            <div class="stat-content dib">
                                <div class="stat-text">Active Projects</div>
                                <div class="stat-digit">770</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> -->

<!--            <div class="col-xl-6">
                <div class="card" >
                    <div class="card-header">
                        <h4>World</h4>
                    </div>
                    <div class="Vector-map-js">
                        <div id="vmap" class="vmap" style="height: 265px;"></div>
                    </div>
                </div>
                 /# card 
            </div>
         <div class="col-lg-4 col-md-6">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title mb-3">Profile Card</strong>
                            </div>
                            <div class="card-body">
                                <div class="mx-auto d-block">
                                    <img class="rounded-circle mx-auto d-block" src="images/adminimg.jpg" alt="Card image cap">
                                    <h5 class="text-sm-center mt-2 mb-1"><%=session.getAttribute("adminname")%></h5>
                                    <div class="location text-sm-center"><i class="fa fa-map-marker"></i></div> 
                                </div>
                                <hr>
                                <div class="card-text text-sm-center">
                                    <a href="#"><i class="fa fa-facebook pr-1"></i></a>
                                    <a href="#"><i class="fa fa-twitter pr-1"></i></a>
                                    <a href="#"><i class="fa fa-linkedin pr-1"></i></a>
                                    <a href="#"><i class="fa fa-pinterest pr-1"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>-->
                                  <a href="AddFee.jsp"><input type="button" class="btn btn-success btn-block" value="Add Fee"/></a>                        
                        <a href="viewFee.jsp"><input type="button" class="btn btn-success btn-block" value="View Fee"/></a>
                        <br><br>
                        <a href="updatePTM.jsp"><input type="button" class="btn btn-danger btn-block" value="UPDATE PTM Schedule"/></a>                        
                        <input type="button" class="btn btn-info btn-block" value="UPDATE Books for Parents" onclick="return bookCall();"/>
<!--                        <a href="updateBookStu.jsp"><input type="button" class="btn btn-info btn-block" value="UPDATE Books for Students"/></a>-->
                        <br><br>
                                  <input type="button" class="btn btn-warning btn-block" value="Update New Status Reports" onclick="return prodCall();"/>
                                  <input type="button" class="btn btn-warning btn-block" value="Refresh the Graph Section" onclick="return refreshCall();"/>
                                  <br><br>
                                  <br>
                                  
        <script type="text/javascript"> 
                function refreshCall()
                {
                    alert("Refreshing on the press of OK Button");
                    
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
                            document.getElementById("graphs").innerHTML=xreq.responseText;
                        }
                    }
                    xreq.open("GET","refreshCall.jsp","true");
                    
                    //xreq.onreadystatechange = call;
                    xreq.send();                                                           
                    return true;                
                }
                function bookCall()
                {
                    alert("Updating on the press of OK Button");
                    
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
                            //document.getElementById("graphs").innerHTML=xreq.responseText;
                        }
                    }
                    xreq.open("GET","updateBook.jsp","true");
                    
                    //xreq.onreadystatechange = call;
                    xreq.send();                                                           
                    return true;                
                }
        </script>
                                  
        <script type="text/javascript"> 
                function prodCall()
                {
                    alert("Please reload this page after a while to see the reflected changes!");
                    
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
                    xreq.open("GET","../pyCall.jsp","true");
                    
                    //xreq.onreadystatechange = call;
                    xreq.send();                                                           
                    return true;                
                }
        </script>
        </div> <!-- .content -->
    <div id="graphs">
        <div  class="col-lg-6 col-md-6">
            <img src="graphs/top_prod.png">
        </div>
        <div  class="col-lg-6 col-md-6">
            <img src="graphs/top_prodCat.png">
        </div>
        <div  class="col-lg-6 col-md-6">
            <img src="graphs/top_prodSubCat.png">
        </div>
        <div  class="col-lg-6 col-md-6">
            <img src="graphs/top_prodGen.png">
        </div>
        <div  class="col-lg-6 col-md-6">
            <img src="graphs/top_prodClass.png">
        </div>
    </div>
    </div><!-- /#right-panel -->
    
    <!-- Right Panel -->

    <script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>


    <script src="assets/js/lib/chart-js/Chart.bundle.js"></script>
    <script src="assets/js/dashboard.js"></script>
    <script src="assets/js/widgets.js"></script>
    <script src="assets/js/lib/vector-map/jquery.vmap.js"></script>
    <script src="assets/js/lib/vector-map/jquery.vmap.min.js"></script>
    <script src="assets/js/lib/vector-map/jquery.vmap.sampledata.js"></script>
    <script src="assets/js/lib/vector-map/country/jquery.vmap.world.js"></script>
    <script>
        ( function ( $ ) {
            "use strict";

            jQuery( '#vmap' ).vectorMap( {
                map: 'world_en',
                backgroundColor: null,
                color: '#ffffff',
                hoverOpacity: 0.7,
                selectedColor: '#1de9b6',
                enableZoom: true,
                showTooltip: true,
                values: sample_data,
                scaleColors: [ '#1de9b6', '#03a9f5' ],
                normalizeFunction: 'polynomial'
            } );
        } )( jQuery );
    </script>
<% } %>
</body>
</html>

