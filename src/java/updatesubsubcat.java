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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author kunal
 */
public class updatesubsubcat extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           //String category =request.getParameter("category");
            String name =request.getParameter("productName");
            String id1 = request.getParameter("proid");
             String des =request.getParameter("productDes");
             String price =request.getParameter("price");
             String sub_name = request.getParameter("sub_id");
             
             
             String enability = request.getParameter("enability");
             
             
             //System.out.println(featured + ":" + enability);
             //JOptionPane.showMessageDialog(null, featured + " : " + enability);
             //JOptionPane.showMessageDialog(null, id1);
            try
    		{
    		
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con=new Connect_db().getConnection(); 
                
                    //JOptionPane.showMessageDialog(null, id1);
                String query="UPDATE products SET sub_category=?, product_name=?, product_desc=?, product_price=?, visibility=? WHERE id=?;";
                PreparedStatement pst;
                pst=con.prepareStatement(query);
               
                pst.setString(1, sub_name);
                pst.setString(2, name);
                pst.setString(3, des);
                pst.setString(4, price);
               
                pst.setString(5, enability);
               
                pst.setString(6, id1);
               int i = pst.executeUpdate();
               if(i>0)
               {
            	    out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Uodated!');");
                   out.println("window.location.href = 'admin/viewSubSubCat.jsp'");
                   out.println("</script>");
                   //response.sendRedirect("admin/viewSubSubCat.jsp");
               }
               else
               {
                  
            	   //out.println("error while updating!Try again");
               }
            
              
    }
            catch(ClassNotFoundException | SQLException e)
            {
                out.print(e.toString());
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
        processRequest(request, response);
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
        processRequest(request, response);
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
