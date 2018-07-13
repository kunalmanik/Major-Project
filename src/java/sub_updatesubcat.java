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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kunal
 */

public class sub_updatesubcat extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
       
            String category =request.getParameter("category");
            String subcat =request.getParameter("subcat");
            String status =request.getParameter("status");
            try
    		{
    		
                Class.forName("com.mysql.jdbc.Driver");  
                 Connection con=new Connect_db().getConnection();
                String id1=request.getParameter("id");
                String query="UPDATE sub_category SET  subcat=?,visibility=? WHERE sub_id='"+id1+"' ";
                String query2 = "UPDATE products SET visibility = ? WHERE sub_category = ?;";

                PreparedStatement pst, pst2;
                pst=con.prepareStatement(query);
               
                pst.setString(1,subcat);
                 pst.setString(2,status);
                
                 pst2= con.prepareStatement(query2);
               pst2.setString(1, status);
               pst2.setString(2, subcat);
               
               
               int i= pst.executeUpdate();
               pst2.executeUpdate();
               if(i>0)
               {
            	   out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Updated!');");
                   out.println("window.location.href = 'sub-admin/viewsubcat.jsp'");
                   out.println("</script>");
                   //response.sendRedirect("admin/viewsubcat.jsp");
               }
               else
               {
            	   out.println("error while updating!Try again");
               }
            
              
    }
            catch(ClassNotFoundException | SQLException e)
            {
            
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
        } catch (SQLException ex) {
            Logger.getLogger(updatesubcat.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(updatesubcat.class.getName()).log(Level.SEVERE, null, ex);
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
