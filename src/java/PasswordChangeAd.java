/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.awt.HeadlessException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
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
public class PasswordChangeAd extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            //JFrame frmOpt = new JFrame();
        //Rectangle r = frmOpt.getBounds();
        //frmOpt.dispose();
        //frmOpt.setVisible(true);                
        //frmOpt.setLocationRelativeTo(null);
       // frmOpt.setAlwaysOnTop(true);
            try{
            HttpSession session = request.getSession(true);
            String oldPassword = request.getParameter("oldPass");
            String pass = request.getParameter("pass");
            String Confpass = request.getParameter("Confpass");
                                  
            String name = session.getAttribute("adminname").toString();                        
            //JOptionPane.showMessageDialog(null, name);
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con=new db.Connect_db().getConnection();
                
                PreparedStatement preparedStatement = con.prepareStatement("SELECT admin_password FROM admin WHERE admin_email = ?");                               
                preparedStatement.setString(1, name);
                ResultSet rs = preparedStatement.executeQuery();
                
                while (rs.next())
                {
                    if(rs.getString("admin_password").equals(oldPassword))
                    {
                        PreparedStatement ps = con.prepareStatement("UPDATE admin SET admin_password=? WHERE admin_email=?;");
                        ps.setString(1, pass);
                        ps.setString(2, name);
                        //JOptionPane.showMessageDialog(null, "pass : " + pass);
                        //JOptionPane.showMessageDialog(null, "name : " + name);
                        ps.executeUpdate();                                                
                        //JOptionPane.showMessageDialog(frmOpt, "Password Updated Successfully!");
                        //frmOpt.dispose();
                        //response.sendRedirect("admin/admin_login.jsp");
                        out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Password Updated Successfully!');");
                   out.println("window.location.href = 'admin/admin_login.jsp'");
                   out.println("</script>");
                    }
                    else
                    {
                        out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Your password does not match');");
                   out.println("window.location.href = 'admin/ChangeAdminPassword.jsp'");
                   out.println("</script>");
                        //JOptionPane.showMessageDialog(frmOpt, "Your password does not match");
                        //frmOpt.dispose();
                       // response.sendRedirect("admin/ChangeAdminPassword.jsp");
                    }
                }                
            }
            catch(HeadlessException | ClassNotFoundException | SQLException e){
//                JOptionPane.showMessageDialog(frmOpt, e.toString());
            //    frmOpt.dispose();
            }
        }
            catch(Exception e)
        {
         //   JOptionPane.showMessageDialog(frmOpt, e.toString());
         //   frmOpt.dispose();
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
