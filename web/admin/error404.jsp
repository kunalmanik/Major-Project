<%-- 
    Document   : error404
    Created on : 11 Feb, 2018, 10:46:48 PM
    Author     : kunal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error 404</title>
        <style> 
            body{
          background-color : #660066;
        }
            .container_16{
             width: 500px;
          height: auto;
          background:#edeff1;
          margin-top:70px;
          margin-left:450px;
          padding-top: 20px;
          border-radius: 10px;
            }
             input[type="submit"]{
          display: block;
          background:#660066;
          width: 170px;
          height: 40px;
          cursor: pointer;
          color: #fff;
          border: 0;
          margin-top: 50px;
          margin-left: 130px;
          border-radius: 5px;
          font-size: 17px;
        }
        p{
            font-family:Trebuchet MS;
          font-weight: bold;
        }
        </style>
    </head>
    <body>
        <div class="container_16">
            <div class="grid_14 push_1" id="whiteBox" style="padding: 10px;">
                <br/><h1 style="padding: 10px;"><span>Error</span>
                </h1><hr/><br/>
                <p  class="grid_4" style="text-align: center; font-size: 40px;">Session Expired or Not Logged In</p>
                <p class="grid_7">
                It seems that the page you've requested has not been found or has a broken link
                please check the requested web page again or try again Later!! 
                <br/> We are extremely sorry about the inconvenience for not finding the requested webpage, Please Do co-operate!! We wish you best
                </p>
                <form action="admin_login.jsp">
                <input type="submit" value="Go Back" name="Go Back" />
                </form>
            </div>
        </div>
    </body>
</html>
