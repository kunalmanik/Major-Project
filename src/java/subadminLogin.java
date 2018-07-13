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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kunal
 */
public class subadminLogin extends HttpServlet {

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
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
               Connection con=new Connect_db().getConnection();
        
                
                PreparedStatement ps = con.prepareStatement("SELECT * FROM sub_admin WHERE sub_admin_email=? AND sub_admin_password=?;");
                ps.setString(1, email);
                ps.setString(2, pass);
                
                ResultSet rs = ps.executeQuery();
                if (rs.next())
                {                    
                //javax.swing.JOptionPane.showMessageDialog(null, "SUCCESS");
                  String n = rs.getString("sub_admin_name");
                   String p = rs.getString("sub_admin_password");
                   HttpSession session2 = request.getSession(true);
                   session2.setAttribute("subadminname", n);
                  session2.setAttribute("subpassword", p);
                  //session.setAttribute("pic", pc);
                 // out.println("Welcome, " +name);               
                  response.sendRedirect("sub-admin/welcome.jsp");
                  //javax.swing.JOptionPane.showMessageDialog(null, "SUCCESS");
                }
                else
                {
                    //javax.swing.JOptionPane.showMessageDialog(null, "FAIL");
                    out.println("INVALID USER!");
                    response.sendRedirect("sub-admin/subadmin_login.jsp");
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
