/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import db.Connect_db;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
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
@MultipartConfig(
        fileSizeThreshold=1024*1024*2, 
        maxFileSize=1024*1024*10,
        maxRequestSize=1024*1024*50
)

public class updatesubsubcatimg extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final String filePath = "C:\\Users\\kunal\\Documents\\NetBeansProjects\\EMS_School\\web\\products";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            Part filePart = request.getPart("image");                        
            String id = request.getParameter("proid");
            //String photo;
     
            File file = new File(filePath);
            
            if(!file.exists()){
                file.mkdir();                          
            }
            
            String fileName = extractName(filePart);
            fileName = new File(fileName).getName();
            filePart.write(filePath + File.separator + fileName);
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = new db.Connect_db().getConnection();
                
                PreparedStatement preparedStatement = con.prepareStatement("UPDATE products SET product_image=? WHERE id=? ;");
                preparedStatement.setString(1, fileName);
                preparedStatement.setString(2, id);
                preparedStatement.executeUpdate();
                out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Image Updated Successfully');");
                   out.println("window.location.href = 'admin/viewSubSubCat.jsp?msg=success'");
                   out.println("</script>");
                //JOptionPane.showMessageDialog(frmOpt, "Image Uploaded Successfully");
                //frmOpt.dispose();
                //response.sendRedirect("admin/viewSubSubCat.jsp?msg=success");
            }
            catch(Exception e){
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
