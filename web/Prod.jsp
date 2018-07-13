<%-- 
    Document   : Prod
    Created on : 6 Apr, 2018, 6:10:50 PM
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
        <%
            String subcat = request.getParameter("subcat");
            String cat = request.getParameter("cat");
            String email = session.getAttribute("email").toString();
            //JOptionPane.showMessageDialog(null, cat + subcat);
            
            String query = "SELECT * FROM products WHERE id NOT IN (SELECT DISTINCT(prod_id) FROM bookings WHERE email = ? AND status='booked') AND visibility='enabled' AND category=? AND sub_category=?;";
            PreparedStatement psProd = new db.Connect_db().getConnection().prepareStatement(query);
            psProd.setString(1, email);
            psProd.setString(2, cat);
            psProd.setString(3, subcat);
            ResultSet rsProd = psProd.executeQuery();
            while(rsProd.next())
            {
                String booking = "booking" + rsProd.getString("id");
        %>
        <div class="container">
        <div class="cont_btn col-lg-6 col-md-6">
            <img src="products/<%=rsProd.getString("product_image")%>" style="width:250px; height:250px;">
            <input type="button" class="btn_on_img" id="<%=booking%>" onclick="return updateBooking('<%=rsProd.getString("id")%>', '<%=email%>');" value="Book this product" />
            
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
    </body>
</html>
