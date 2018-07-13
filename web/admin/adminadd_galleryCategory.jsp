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
            String ques = request.getParameter("name");
            String answer = request.getParameter("answer");
            PreparedStatement pst;
             String query = "INSERT INTO gallery_cat(id,gallery_cat) values(NULL,?);";
             pst=con.prepareStatement(query);             
            // pst.setString(1, phead);
             pst.setString(1, ques);
             // pst.setString(2, answer);
              //javax.swing.JOptionPane.showMessageDialog(null, "Updati");
              if(id== null){
                int i=pst.executeUpdate();
                if(i>0)
                {
                    out.println("<script type=\"text/javascript\">");  
                   out.println("alert('succesfully added!');");
                   out.println("window.location.href = 'viewGalleryCat.jsp'");
                   out.println("</script>");
                }
                else
                {
                       out.println("Try Again!");
                }
              } else
            {
                  // javax.swing.JOptionPane.showMessageDialog(null, "Updati");           
                String quer="UPDATE gallery_cat SET gallery_cat=? WHERE id=?;";
                PreparedStatement ps2;
                ps2=con.prepareStatement(quer);   
               // ps2.setString(1, phead);
                ps2.setString(1, ques);
                //ps2.setString(2, answer);
                ps2.setString(2, id);
                int i= ps2.executeUpdate();
                if(i>0)
               {
                   out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Updated succesfully');");
                   out.println("window.location.href = 'viewGalleryCat.jsp'");
                   out.println("</script>");
            	   //out.println("About Us Updated succesfully");
                   //response.sendRedirect("viewGalleryCat.jsp");
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