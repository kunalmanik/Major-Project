/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import db.Connect_db;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kunal
 */
public class sub_adminAddCat extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
             String cat_id = request.getParameter("cat_id");
            
             String cat_name = request.getParameter("name");
             String status = request.getParameter("status");
            // javax.swing.JOptionPane.showMessageDialog(null, status + cat_name);
           try
    		{
    		
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=new Connect_db().getConnection();
                
                
            if(request.getParameter("cat_id")== null){
                String query="INSERT INTO category (cat_id, cat_name, visibility) VALUES (NULL,?,?)";
                PreparedStatement pst;
                pst=con.prepareStatement(query);
                pst.setString(1,cat_name);
                pst.setString(2,status);
               int i= pst.executeUpdate();
               if(i>0)
               {
            	   out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Inserted!');");
                   out.println("window.location.href = 'sub-admin/view_category.jsp'");
                   out.println("</script>");
                  //response.sendRedirect("admin/view_category.jsp");
               }
               else
               {
            	   out.println("error while Inserting!Try again");
               }
               //response.sendRedirect("upload.jsp?msg=success");
            }
            else
            {
                 //javax.swing.JOptionPane.showMessageDialog(null, "Updati");
              
                
                String query="UPDATE category SET cat_name=?, visibility=? WHERE cat_id=?;";
                String query2 = "UPDATE sub_category SET visibility=? WHERE cat_name=?;";
                String query3 = "UPDATE products SET availability = ? WHERE category=?;";
                PreparedStatement pst, pst2, pst3;
                pst=con.prepareStatement(query);
                pst2=con.prepareStatement(query2);
                pst3=con.prepareStatement(query3);
                pst.setString(1, cat_name);
                pst.setString(2, status);
                pst.setString(3, cat_id);
                
                pst2.setString(2, cat_name);
                pst2.setString(1, status);
                
                pst3.setString(2, cat_name);
                pst3.setString(1, status);
                
               int i= pst.executeUpdate();
               
                pst2.executeUpdate();
                pst3.executeUpdate();
               if(i>0)
               {
                   out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Catagory Updated succesfully');");
                   out.println("window.location.href = 'sub-admin/view_category.jsp'");
                   out.println("</script>");
            	   //out.println("Catagory Updated succesfully");
                   //response.sendRedirect("admin/view_category.jsp");
               }
               else
               {
            	   out.println("error while updating!Try again");
               }
            }
                
    }
            catch(ClassNotFoundException | SQLException e)
            {
            //response.sendRedirect("Welcome.jsp?msg=error");
            out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Catagory Updated succesfully');");
                   out.println("window.location.href = 'sub-admin/view_category.jsp'");
                   out.println("</script>");

            	//System.out.println(e);
            }
    }
 
         
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(adminAddCat.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(adminAddCat.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}