/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import mailer.Mailer;
import db.Connect_db;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
public class AdminForgetPass extends HttpServlet {

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
                try{
                    String userValue = request.getParameter("email");                        
                    //String newPass = request.getParameter("newPass");
                    
                    //JOptionPane.showMessageDialog(null, newPass + " - " + oldPass + " - " + userValue);
                    
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con=new Connect_db().getConnection();
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM admin;");
                    //PreparedStatement preparedStatement = con.prepareStatement("UPDATE user SET password=? WHERE password=?");
                    ResultSet rs = ps.executeQuery();
                    while(rs.next())
                    {
                        if(userValue.equals(rs.getString("admin_name")) || userValue.equals(rs.getString("admin_email")))
                        {
                            if(userValue.equals(rs.getString("admin_name")))
                            {
                               /** String email = "";
                                String pass = "";
                                PreparedStatement preparedStatementUser = con.prepareStatement("SELECT email,pass FROM user WHERE name=?");
                                preparedStatementUser.setString(1, rs.getString("username"));
                                
                                ResultSet subResultSet = preparedStatementUser.executeQuery();
                               /** while(subResultSet.next())
                                {
                                    email = subResultSet.getString("email");
                                    pass = subResultSet.getString("pass");
                                }     **/                           
                       /**         if (email != null)
                                {
                                    JOptionPane.showMessageDialog(null, email);
                                    try{
                                    Mailer.send(email, "Password Reset", "Hello\n\n" + pass);
                                    }
                                    catch(Exception e)
                                    {
                                        JOptionPane.showMessageDialog(null, e.toString());
                                    }
                                    JOptionPane.showMessageDialog(null, "MAIL SENT");
                                }**/
                            }
                            else
                            {
                                //String name = "";
                                String pass = "";
                                PreparedStatement psPass = con.prepareStatement("SELECT admin_password FROM admin WHERE admin_email=?;");
                                psPass.setString(1, userValue);
                                ResultSet rsPass = psPass.executeQuery();
                                while(rsPass.next())
                                {                                    
                                    pass = rsPass.getString("admin_password");
                                }
//                                JOptionPane.showMessageDialog(null, "Send Password To email");
                                out.println("<script type=\"text/javascript\">");  
                                out.println("alert('Send Password to Email!');");
                                //out.println("window.location.href = 'index.jsp'");
                                out.println("</script>");
                                
                                Mailer.send(rs.getString("admin_email"), "Password Reset", "Hello your username is : <b>" + userValue + "<b> password is : <b>" + pass +"</b>");
                                
                                //JOptionPane.showMessageDialog(null, "Check Your Mail For Password");
                                out.println("<script type=\"text/javascript\">");  
                                out.println("alert('Check your email for password');");
                                out.println("window.location.href = 'admin/admin_login.jsp'");
                                out.println("</script>");
                                //response.sendRedirect("admin/admin_login.jsp");
                            }
                          
                        }

                    }                    
                }
                catch(ClassNotFoundException | SQLException e)
                {
                    JOptionPane.showMessageDialog(null, e.toString());                            
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
