/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ems;

import java.awt.HeadlessException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class UserChangePassword extends HttpServlet {

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
            JFrame frmOpt = new JFrame();
        //Rectangle r = frmOpt.getBounds();
        //frmOpt.dispose();
        //frmOpt.setVisible(true);                
        //frmOpt.setLocationRelativeTo(null);
       // frmOpt.setAlwaysOnTop(true);
            try{
            HttpSession session = request.getSession(true);
            String oldPassword = request.getParameter("old_password");
            String pass = request.getParameter("new_password");
            String Confpass = request.getParameter("conf_password");
                                  
            String name = session.getAttribute("email").toString();                        
            //JOptionPane.showMessageDialog(null, name);
            
            try{
                
                Connection con=new db.Connect_db().getConnection();
                
                PreparedStatement preparedStatement = con.prepareStatement("SELECT password FROM user WHERE email = ?");                               
                preparedStatement.setString(1, name);
                ResultSet rs = preparedStatement.executeQuery();
                
                while (rs.next())
                {
                    if(rs.getString("password").equals(oldPassword))
                    {
                        PreparedStatement ps = con.prepareStatement("UPDATE user SET password=? WHERE email=?;");
                        ps.setString(1, pass);
                        ps.setString(2, name);
                        //JOptionPane.showMessageDialog(null, "pass : " + pass);
                        //JOptionPane.showMessageDialog(null, "name : " + name);
                        ps.executeUpdate(); 
                         out.println("<script type=\"text/javascript\">");  
                         out.println("alert('Password Updated Successfully!');");
                         out.println("window.location.href = 'SignIn.jsp'");
                         out.println("</script>");
                        
                    }
                    else
                    {
                        out.println("<script type=\"text/javascript\">");  
                         out.println("alert('Your password does not match');");
                         out.println("window.location.href = 'ChangePassword.jsp'");
                         out.println("</script>");
                        
                    }
                }                
            }
            catch(HeadlessException | SQLException e){
                //JOptionPane.showMessageDialog(frmOpt, e.toString());
                //frmOpt.dispose();
            }
        }
            catch(Exception e)
        {
            //JOptionPane.showMessageDialog(frmOpt, e.toString());
           // frmOpt.dispose();
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
