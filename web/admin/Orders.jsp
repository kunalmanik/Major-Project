<%-- 
    Document   : Orders
    Created on : 19 Feb, 2018, 2:37:03 PM
    Author     : kunal
--%>

<%@page import="java.awt.Dimension"%>
<%@page import="javax.swing.UIManager"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Orders - Blossom Flower Gallery</title>
    <meta name="description" content="Contact Us - Blossom Flower Gallery">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
        table, td,th, tr
        {
            width:100%;
            border:2px solid gray;
            padding:2px;
            margin: 0px;
            align-content: center;
        }
        thead
        {
            background-color:gray;
        }
        .labelCls
        {
            
            margin: 5px;
        }
    </style>
    
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
                            <li><a href="#">Dashboard</a></li>
                            
                            <li class="active">Orders</li>
                        </ol>
                    </div>
                </div>
                </div>
        </div>
        <form action="ChangeStatus.jsp" method="post"> 
   
        <table> 
            <tr>
<!--                <th class="labelCls"><label>Id</label></th>-->
                <th class="labelCls"><label>Product Name</label></th>
                <th class="labelCls"><label>Product Image</label></th>
                <th class="labelCls"><label>Product Price</label></th>
<!--                <th class="labelCls"><label>Category</label></th>
                <th class="labelCls"><label>Sub-Category</label></th>-->
<!--                <th class="labelCls"><label>Booking Id</label></th>-->
                <th class="labelCls"><label>Email Id</label></th>
<!--                <th class="labelCls"><label>Product ID</label></th>-->
                <th class="labelCls"><label>Booking Status</label></th>
                <th class="labelCls"><label>Payed</label></th>
                <th colspan="3"><label> Booking Actions</label></th>
                <th colspan="3"><label> Payment Actions</label></th>
            </tr>
              <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = new db.Connect_db().getConnection();
            
        PreparedStatement ps = con.prepareStatement("SELECT * FROM products p JOIN bookings b ON p.id=b.`prod_id`;");
        ResultSet rs = ps.executeQuery();
        
        while(rs.next())
        {
            //String replyid = request.getParameter("request" + rs.getInt("id"));
    %>
        <tr>        
<!--            <td><label name="pr_name"><!--%rs.getString("id")--%></label></td>-->
            <td><label name="buyer"><%=rs.getString("product_name")%></label></td>
            <td><img src="../products/<%=rs.getString("product_image")%>" style="height: 100px; width: 100px"></td>                       
            <td><label name="buyer_email"><%=rs.getString("product_price")%></label></td>
<!--            <td><label name="qty"><!%=rs.getString("category")%></label></td>-->
<!--            <td><label><!%=rs.getString("sub_category")%></label></td>-->
<!--            <td><label><!%=rs.getString("booking_id")%></label></td>-->
            <td><label><%=rs.getString("email")%></label></td>
<!--            <td><label><!%=rs.getString("prod_id")%></label></td>-->
            <td><label><%=rs.getString("status")%></label></td>
            <td><center><label><%=rs.getString("payed")%></label></center></td>
            
            <% 
                if(rs.getString("status").equals("booked")) 
                { 
            %>
             <input type="hidden" name="id" value="<%=rs.getString("booking_id")%>"/>
        <input type="hidden" name="status" value="<%=rs.getString("status")%>"/>
        <input type="hidden" name="buyer_email" value="<%=rs.getString("email")%>"/>
            
            <td><input type="hidden" name="pr_name" value="<%=rs.getString("product_name")%>"></td>    
           
                <td>
                    <select name="statuss" style="margin: 15px">
                        <option value="booked">Booked</option>
                        <option value="confirmed">Confirmed</option>
                    </select>
                </td>
                
                <td><input type="submit" class="btn-danger" value="Save"/></td>
                
               <%
                } 
                else 
                { 
               %>
               <td colspan="3"><label><b>Booking Confirmed</b></label></td>
               <% } %>
            
               <% 
                if(rs.getString("payed").equals("no") && !rs.getString("status").equals("booked")) 
                { 
            %>                                        
                
        <td><a href="updatePayment.jsp?book_id=<%=rs.getString("booking_id")%>&email=<%=rs.getString("email")%>"><input type="button" class="btn btn-warning" value="Confirm Payment"/></a></td>
                
               <%
                } 
                else 
                { 
               %>
               <td><label><b>Payment Received</b></label></td>
               <% } %>   
              
             
        </tr>
    
    <%
        }
    %>                                 
    </table>                    
             </form>       </div>
        



    <!-- /#right-panel --> 

    <!-- Right Panel -->


    <script src="assets/js/vendor/jquery-2.1.4.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>

<% } %>
</body>
</html>
