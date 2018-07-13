/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import db.Connect_db;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

/**
 *
 * @author kunal
 */
public class adminlogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
               Connection con=new Connect_db().getConnection();
               //JFrame frmOpt = new JFrame();
        //Rectangle r = frmOpt.getBounds();
        //frmOpt.dispose();
        //frmOpt.setVisible(true);                
       // frmOpt.setLocationRelativeTo(null);
       // frmOpt.setAlwaysOnTop(true);
               // frmOpt.dispose();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM admin WHERE admin_email=? AND admin_password=?;");
                ps.setString(1, email);
                ps.setString(2, pass);
                
                ResultSet rs = ps.executeQuery();
                if (rs.next())
                {                    
                //javax.swing.JOptionPane.showMessageDialog(null, "SUCCESS");
                  String n = rs.getString("admin_email");
                   String p = rs.getString("admin_password");
                   HttpSession session2 = request.getSession(true);
                   session2.setAttribute("adminname", n);
                  session2.setAttribute("password", p);
                  //session.setAttribute("pic", pc);
                 // out.println("Welcome, " +name); 
                 //frmOpt.dispose();
                  response.sendRedirect("admin/welcome.jsp");
                  //javax.swing.JOptionPane.showMessageDialog(null, "SUCCESS");
                }
                else
                {
                    //javax.swing.JOptionPane.showMessageDialog(null, "FAIL");
                    //out.println("INVALID USER!");
                     out.println("<script type=\"text/javascript\">");  
                     out.println("alert('Invalid Login');");
                     out.println("window.location.href = 'admin/admin_login.jsp'");
                     out.println("</script>");
                    //response.sendRedirect("admin/admin_login.jsp");
                }
            } catch (ClassNotFoundException | SQLException ex) {
                //Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
                  System.out.println(ex.toString());
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
           Logger.getLogger(adminlogin.class.getName()).log(Level.SEVERE, null, ex);
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
           Logger.getLogger(adminlogin.class.getName()).log(Level.SEVERE, null, ex);
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
