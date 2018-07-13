<%@page import="db.Connect_db"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=new Connect_db().getConnection();
            String id = request.getParameter("id");
            String header = request.getParameter("head");
            String des = request.getParameter("des");
            PreparedStatement pst;
             String query = "INSERT INTO about_us(header,description) values(?,?);";
             pst=con.prepareStatement(query);             
             pst.setString(1, header);
              pst.setString(2, des);
              //javax.swing.JOptionPane.showMessageDialog(null, "Updati");
              if(id== null){
                int i=pst.executeUpdate();
                if(i>0)
                {
                    //out.println("success");
                    out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Added!');");
                   out.println("window.location.href = 'viewaboutus.jsp'");
                   out.println("</script>");
                   // response.sendRedirect("viewaboutus.jsp");
                }
                else
                {
                       out.println("Try Again!");
                }
              } else
            {
                  // javax.swing.JOptionPane.showMessageDialog(null, "Updati");           
                String quer="UPDATE about_us SET header=?,description=? WHERE id=?;";
                PreparedStatement ps2;
                ps2=con.prepareStatement(quer);             
                ps2.setString(1, header);
                ps2.setString(2, des);
                ps2.setString(3, id);
                int i= ps2.executeUpdate();
                if(i>0)
               {
                   out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Updated!');");
                   out.println("window.location.href = 'viewaboutus.jsp'");
                   out.println("</script>");
            	   //out.println("About Us Updated succesfully");
                   //response.sendRedirect("viewaboutus.jsp");
               }
               else
               {
            	   out.println("error while updating!Try again");
               }
            }
    %>
<!DOCTYPE html>
<html lang="en">

<head>
</head>

<body>
    
    
      
</body>
                            </html>