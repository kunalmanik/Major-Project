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
import javax.swing.JFrame;
import javax.swing.JOptionPane;

/**
 *
 * @author kunal
 */
@WebServlet(urlPatterns = {"/addProd"})
public class addProd extends HttpServlet {

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
                          JFrame frmOpt = new JFrame();
        frmOpt.dispose();
        frmOpt.setVisible(false);
        frmOpt.setLocationRelativeTo(null);
        frmOpt.setAlwaysOnTop(true);
        PrintWriter out = response.getWriter();   
                 String category= request.getParameter("Category");
                 String subcat =request.getParameter("subcat");
                 String status =request.getParameter("visibility");
                 //javax.swing.JOptionPane.showMessageDialog(null, category + status + subcat);
                 try{
                     
                 Class.forName("com.mysql.jdbc.Driver");  
               Connection con=new Connect_db().getConnection();
              
                  PreparedStatement r=con.prepareStatement("INSERT into sub_category(cat_name,subcat,visibility) values(?,?,?)");
                    r.setString(1,category);
                    r.setString(2,subcat);
                     r.setString(3,status);
                  int rs=r.executeUpdate();
                  if(rs==1)
                  {
                      //JOptionPane.showMessageDialog(null, "added");
                     // response.sendRedirect("admin/viewsubcat.jsp");
                   out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Added Successfully');");
                   out.println("window.location.href = 'admin/viewsubcat.jsp'");
                   out.println("</script>");
                      
                  }
                  else
                  {
                   JOptionPane.showMessageDialog(null, "Failed");
                   response.sendRedirect("admin/subcat.jsp");
                   
                   
                  }
                 }
                 catch(IOException | ClassNotFoundException e)
                         {}
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
            Logger.getLogger(addProd.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(addProd.class.getName()).log(Level.SEVERE, null, ex);
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
