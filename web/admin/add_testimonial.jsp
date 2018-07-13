<%-- 
    Document   : add_testinomial
    Created on : 6 Feb, 2018, 12:50:04 PM
    Author     : kunal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Blossom Flower Gallery</title>
    <meta name="description" content="Blossom Flower Gallery">
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
               <a class="navbar-brand" href="welcome.jsp">Blossom Flower Gallery</a>
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
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon ti-gift"></i>Coupon Code</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-chevron-circle-right"></i><a href="AddCoupon.jsp">Add</a></li>
                            <li><i class="fa fa-chevron-circle-right"></i><a href="ViewCoupon.jsp"> View</a></li>
                        </ul>
                    </li>
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
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon ti-gift"></i>Pin Code</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-chevron-circle-right"></i><a href="AddPinCode.jsp">Add</a></li>
                            <li><i class="fa fa-chevron-circle-right"></i><a href="ViewPinCode.jsp">View</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon ti-power-off"></i>Policy</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-chevron-circle-right"></i><a href="AddPolicy.jsp">Add</a></li>
                            <li><i class="fa fa-chevron-circle-right"></i><a href="ViewPolicy.jsp">View</a></li>
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

    <!-- Right Panel -->


        <!-- Header-->
     
        <!-- Header-->

        <div class="breadcrumbs">
            <div class="col-sm-4">
                <div class="page-header float-left">
                    <div class="page-title">
                        <h1>Add  Banner </h1>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="page-header float-right">
                    <div class="page-title">
                        <ol class="breadcrumb text-right">
                            <li><a href="#">Dashboard</a></li>
                            <li class="active">Add Banner</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>

        <div class="content mt-3">
            <div class="animated fadeIn">


                <div class="row">
                  <!--/.col-->

                  

                 

                  <div class="col-md-8 col-md offset-2" >
                    <div class="card">
                      <div class="card-header">
                        <strong>Add</strong> Testimonials
                      </div>
                      <div class="card-body card-block">
                        <form action="AddTestimonial" method="post" class="form-horizontal">
						  <div class="row form-group">
                            <div class="col col-md-3"><label for="hf-email" class=" form-control-label">Name</label></div>
                            <div class="col-12 col-md-9"><input type="name" name="name" placeholder="Enter name..." class="form-control"><span class="help-block"></span></div>
                          </div>
						  <div class="row form-group">
                            <div class="col col-md-3"><label  class=" form-control-label">Testimonial Description</label></div>
                            <div class="col-12 col-md-9"><textarea type="text" name="desc" placeholder="Enter description here..." class="form-control"></textarea></div>
                          </div>
                          <div class="row form-group">
                            <div class="col col-md-3"><label for="hf-email" class=" form-control-label">Image Title</label></div>
                            <div class="col-12 col-md-9"><input type="text" id="hf-email" name="img-title" placeholder="Enter Image Title..." class="form-control"><span class="help-block"></span></div>
                          </div>
                          <div class="row form-group">
                            <div class="col col-md-3"><label for="hf-password" class=" form-control-label">Image</label></div>
                            <div class="col-12 col-md-9"><input type="file" name="image"  class="form-control"><span class="help-block">Please choose Image</span></div>
                          </div>
                        </form>
                      </div>
                      <div class="card-footer">
                        <button type="submit" class="btn btn-primary btn-sm">
                          <i class="fa fa-dot-circle-o"></i> Submit
                        </button>
                        <button type="reset" class="btn btn-danger btn-sm">
                          <i class="fa fa-ban"></i> Reset
                        </button>
                      </div>
                    </div>
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
