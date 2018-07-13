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
            String clas = request.getParameter("class");
            String board = request.getParameter("board");
            String onetime = request.getParameter("onetime");
            String student = request.getParameter("student");
            String infra = request.getParameter("infra");
            String extra = request.getParameter("extra");
            String total = request.getParameter("total");
            PreparedStatement pst;
             String query = "INSERT INTO fee(id,class,board,onetime,student,infra,extra) values(NULL,?,?,?,?,?,?);";
             pst=con.prepareStatement(query);             
             pst.setString(1, clas);
             pst.setString(2, board);
             pst.setString(3, onetime);
             pst.setString(4, student);
             pst.setString(5, infra);
             pst.setString(6, extra);
              //javax.swing.JOptionPane.showMessageDialog(null, "Updati");
              if(id== null){
                int i=pst.executeUpdate();
                if(i>0)
                {
                    out.println("<script type=\"text/javascript\">");  
                   out.println("alert('succesfully added!');");
                   out.println("window.location.href = 'viewFee.jsp'");
                   out.println("</script>");
                }
                else
                {
                       out.println("Try Again!");
                }
              } else
            {
                  // javax.swing.JOptionPane.showMessageDialog(null, "Updati");           
                String quer="UPDATE fee SET class=?,board=?,onetime=?,student=?,infra=?,extra=?,total=? WHERE id=?;";
                PreparedStatement ps2;
                ps2=con.prepareStatement(quer);   
               ps2.setString(1, clas);
               ps2.setString(2, board);
              ps2.setString(3, onetime);
               ps2.setString(4, student);
               ps2.setString(5, infra);
              ps2.setString(6, extra);
               ps2.setString(7, total);
                ps2.setString(8, id);
                int i= ps2.executeUpdate();
                if(i>0)
               {
                   out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Updated succesfully');");
                   out.println("window.location.href = 'viewFee.jsp'");
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