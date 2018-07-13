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

/**
 *
 * @author kunal
 */
public class ForgotPassword extends HttpServlet {

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
                int flag = 0;
                String password = null;
                String email = request.getParameter("forgot-email");
                String query = "SELECT email, password FROM user;";
                PreparedStatement ps = new db.Connect_db().getConnection().prepareStatement(query);
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                    if(email.equals(rs.getString("email")))
                    {
                        flag = 1;
                        password = rs.getString("password");
                        break;
                    }
                }
                if(flag == 1)
                {
                    try{
                        mailer.Mailer.send(email, "PASSWORD", "Hello " + email + "!<br><br>Here is the password your forgot! <b>" + password + "</b>");
                        out.print("<script type=\"text/javascript\">");
                        out.print("alert(\"Email sent!Please check your email for your Password!\");");
                        out.print("window.location.href = 'SignIn.jsp'");
                        out.print("</script>");
                    }
                    catch(Exception e)
                    {
                        out.print("<script type=\"text/javascript\">");
                        out.print("alert(\"Sorry we couldn't process your request at the moment!\");");
                        out.print("window.location.href = 'SignIn.jsp'");
                        out.print("</script>");
                    }
                }
                else
                {
                    
                    out.print("<script type=\"text/javascript\">");
                    out.print("alert(\"Either your email is wrong or we couldn't process the information yet!\");");
                    out.print("window.location.href = 'SignIn.jsp'");
                    out.print("</script>");
                }
                //response.sendRedirect("");
            }
            catch(Exception e)
            {
                out.print(e);
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
