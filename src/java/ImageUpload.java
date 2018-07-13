/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.awt.Rectangle;
import java.sql.PreparedStatement;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

/**
 *
 * @author kunal
 */
@WebServlet(urlPatterns = {"/ImageUpload"})
@MultipartConfig(
        fileSizeThreshold=1024*1024*2, 
        maxFileSize=1024*1024*10,
        maxRequestSize=1024*1024*50
)
public class ImageUpload extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final String filePath = "C:\\Users\\kunal\\Documents\\NetBeansProjects\\EMS_School\\web\\banner";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //JFrame frmOpt = new JFrame();
        //Rectangle r = frmOpt.getBounds();
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Part filePart = request.getPart("image");                        
            //String title = request.getParameter("title");
            String banner_id = request.getParameter("id");
            String name = request.getParameter("name");
            //String photo;
            
            File file = new File(filePath);
            if(!file.exists()){
                file.mkdir();                          
            }
            String fileName = extractName(filePart);
            fileName = new File(fileName).getName();
            filePart.write(filePath + File.separator +fileName);
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = new db.Connect_db().getConnection();
                
                if(banner_id == null)
                {
                    PreparedStatement preparedStatement = con.prepareStatement("INSERT INTO banner (banner_image) VALUES (?);");
                    preparedStatement.setString(1, fileName);
                    //preparedStatement.setString(2, title);
                    preparedStatement.executeUpdate();

                    //JOptionPane.showMessageDialog(frmOpt, "Image Uploaded Successfully");
                    //frmOpt.dispose();
                    //response.sendRedirect("admin/view_banner.jsp?msg=success");
                             out.println("<script type=\"text/javascript\">");  
                             out.println("alert('Image Uploaded Successfully');");
                             out.println("window.location.href = 'admin/view_banner.jsp?msg=success'");
                             out.println("</script>");
                }
                else
                {
                    PreparedStatement preparedStatement = con.prepareStatement("UPDATE banner SET banner_image=? WHERE banner_id=?");                    
                    try{
                        //File fileUpdate = new File(filePath + File.separator + name);
                            //JOptionPane.showMessageDialog(frmOpt, "Operation Completed!");
                            //frmOpt.dispose();
                            //response.sendRedirect("admin/view_banner.jsp?msg=success");
                            out.println("<script type=\"text/javascript\">");  
                             out.println("alert('Done!');");
                            out.println("window.location.href = 'admin/view_banner.jsp?msg=success'");
                              out.println("</script>");
                        
                        
                    }
                    catch(Exception e)
                    {
                        out.println(e.toString());
                    }
                    preparedStatement.setString(1, fileName);
                    //preparedStatement.setString(2, title);
                    preparedStatement.setInt(2, Integer.parseInt(banner_id));
                    preparedStatement.executeUpdate();
                }
            }
            catch(Exception e){}            
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

    private String extractName(Part filePart) {
        String content = filePart.getHeader("content-disposition");
        
        String[] array = content.split(";");
        for(String s : array)
        {
            if(s.trim().startsWith("filename"))
            {
                return s.substring(s.indexOf("=")+2, s.length()-1);
            }
        }
        
        return "";
    }

}
