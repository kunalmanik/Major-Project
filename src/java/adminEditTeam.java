/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kunal
 */
public class adminEditTeam extends HttpServlet {

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
            PreparedStatement preparedStatement;
            String id = request.getParameter("team_id");
            String name = request.getParameter("name");
            String title = request.getParameter("title");
            String department = request.getParameter("department");
            //String image  = request.getParameter("image");
            try
            {                
                Class.forName("com.mysql.jdbc.Driver");
                preparedStatement = new db.Connect_db().getConnection().prepareStatement("UPDATE team SET name=?, title=?,department=? WHERE id=?");
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, title);
                preparedStatement.setString(3, department);
                preparedStatement.setString(4, id);
                preparedStatement.executeUpdate();
                out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Updated!');");
                   out.println("window.location.href = 'admin/viewTeam.jsp'");
                   out.println("</script>");
                //response.sendRedirect("admin/viewTeam.jsp");
                
            }
            catch(Exception e)
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
