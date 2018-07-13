/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import db.Connect_db;
import java.awt.HeadlessException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import mailer.Mailer;

/**
 *
 * @author kunal
 */
public class SendMessage extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String name = request.getParameter("name");
            String subject = request.getParameter("subject");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String message = request.getParameter("message");
            
            
            try {
                
                Class.forName("com.mysql.jdbc.Driver");
               Connection con=new Connect_db().getConnection();
                
                PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO contact(id,name,subject,email,mobile,message) VALUES(NULL,?,?,?,?,?);");
                preparedStatement.setString(1, name);   
                preparedStatement.setString(2, subject);
                preparedStatement.setString(3, email);
                preparedStatement.setString(4, mobile);
                preparedStatement.setString(5, message);
                
                preparedStatement.executeUpdate();
                //JOptionPane.showMessageDialog(null, "Updated!");
               
                
                //String subject = "Status Confirmation";
                String messageBody = "Hello " + name + "\n\nWe have successfully received your query.\n\n" + "\"" + message + "\"";                                
                try{
                    Mailer.send(email, subject, messageBody);
                    //JOptionPane.showMessageDialog(null, "Sent!");
                }
                catch(HeadlessException e){JOptionPane.showMessageDialog(null, "NOT SENT!\n"+e.toString());}
                   out.println("<script type=\"text/javascript\">"); 
                    out.println("alert('Recieved your query! Check your mail for a copy.');");
                   out.println("window.location.href = 'contact.jsp?success=success'");
                   out.println("</script>");
               // response.sendRedirect("contact.jsp?success=success");                                
            }
            catch(ClassNotFoundException | SQLException e){
                //response.sendError(1000, "ERROR");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SendMessage.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SendMessage.class.getName()).log(Level.SEVERE, null, ex);
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
