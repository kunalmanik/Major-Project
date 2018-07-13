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
            //String phead = request.getParameter("phead");
            String header = request.getParameter("head");
            String des = request.getParameter("des");
            PreparedStatement pst;
             String query = "INSERT INTO terms(description) values(?);";
             pst=con.prepareStatement(query);             
            // pst.setString(1, phead);
              pst.setString(1, des);
              //javax.swing.JOptionPane.showMessageDialog(null, "Updati");
              if(id== null){
                int i=pst.executeUpdate();
                if(i>0)
                {
                   out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Inserted!');");
                   out.println("window.location.href = 'viewTC.jsp'");
                   out.println("</script>");
                   // response.sendRedirect("viewTC.jsp");
                }
                else
                {
                       out.println("Try Again!");
                }
              } 
              else
            {
                  // javax.swing.JOptionPane.showMessageDialog(null, "Updati");           
                String quer="UPDATE terms SET description=? WHERE id=?;";
                PreparedStatement ps2;
                ps2=con.prepareStatement(quer);   
               // ps2.setString(1, phead);
                
                ps2.setString(1, des);
                ps2.setString(2, id);
                int i= ps2.executeUpdate();
                if(i>0)
               {
            	   out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Updated!');");
                   out.println("window.location.href = 'viewTC.jsp'");
                   out.println("</script>");
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