/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ems;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kunal
 */
public class AddTestimonial extends HttpServlet {

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
                HttpSession session = request.getSession();
                String email = session.getAttribute("email").toString();
                String name = "";
                PreparedStatement temp = new db.Connect_db().getConnection().prepareStatement("SELECT full_name FROM user WHERE email=?;");
                temp.setString(1, email);
                ResultSet rsTemp = temp.executeQuery();
                if(rsTemp.next())
                {
                    name = rsTemp.getString("full_name");
                }
                
                PreparedStatement psUpdate = new db.Connect_db().getConnection().prepareStatement("UPDATE testimonial SET description = ?, approved = 'not_approved' WHERE email = ?;");
                PreparedStatement psInsert = new db.Connect_db().getConnection().prepareStatement("INSERT INTO testimonial(description, email, name) VALUES (?,?,?);");
                String testimonial = request.getParameter("testimonial");
                String event = request.getParameter("event");
                if(event.equals("1"))
                {
                    psUpdate.setString(1, testimonial);
                    psUpdate.setString(2, email);
                    psUpdate.executeUpdate();
                }
                else
                {
                    psInsert.setString(1, testimonial);
                    psInsert.setString(2, email);
                    psInsert.setString(3, name);
                    psInsert.executeUpdate();
                }
                        out.print("<script type=\"text/javascript\">");
                        out.print("alert(\"Your review has been received!\");");
                        out.print("window.location.href = 'AddTestimonial.jsp'");
                        out.print("</script>");
            }
            catch(Exception e)
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
