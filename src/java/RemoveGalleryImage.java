/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kunal
 */
@WebServlet(urlPatterns = {"/RemoveGalleryImage"})
public class RemoveGalleryImage extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final String filePath = "C:\\Users\\kunal\\Documents\\NetBeansProjects\\EMS_School\\web\\gallery";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            
            try{                              
                Class.forName("com.mysql.jdbc.Driver");
                Connection co = new db.Connect_db().getConnection();
                
                PreparedStatement preparedStatement = co.prepareStatement("DELETE FROM gallery WHERE id = ?;");
                preparedStatement.setInt(1, id);
                preparedStatement.executeUpdate();
                                
            }
            catch(ClassNotFoundException | SQLException e)
            {
                out.print(e.toString());
            }
            try{
                File file = new File(filePath + File.separator + name);
                if(file.delete())
                    out.println("FILE DELETED SUCCESSFULLY");
            }
            catch(Exception e)
            {
                out.println(e.toString());
            }
                     out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Deleted!');");
                   out.println("window.location.href = 'admin/view_gallery.jsp?msg=success'");
                   out.println("</script>");
            //response.sendRedirect("admin/view_gallery.jsp?msg=success");
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
