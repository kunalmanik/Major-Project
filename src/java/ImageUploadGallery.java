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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
@WebServlet("/Upload_g")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)
/**
 *
 * @author kunal
 */
public class ImageUploadGallery extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final String SAVE_DIR ="Users\\kunal\\Documents\\NetBeansProjects\\EMS_School\\web\\gallery";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            //JFrame frmOpt = new JFrame();
        //Rectangle r = frmOpt.getBounds();
        
            PrintWriter out = response.getWriter();
        String savePath = "C:" + File.separator + SAVE_DIR;
        File fileSaveDir=new File(savePath);
        if(!fileSaveDir.exists()){
            fileSaveDir.mkdir();
           }            
            //int id=Integer.parseInt(request.getParameter("id"));
            String category=request.getParameter("category"); 
            Part part=request.getPart("image");
            String fileName=extractFileName(part);
            fileName=new File(fileName).getName();
            /*if you may have more than one files with same name then you can calculate some random characters and append that characters in fileName so that it will  make your each image name identical.*/
            part.write(savePath + File.separator + fileName);
           /* 
            //You need this loop if you submitted more than one file
            for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            part.write(savePath + File.separator + fileName);
        }*/
            try
    		{
    		//JOptionPane.showMessageDialog(null, "Image Uploaded Successfully");
                Class.forName("com.mysql.jdbc.Driver");  
               Connection con=new Connect_db().getConnection(); 
                
                
            if(request.getParameter("id")==null){
                String query="INSERT INTO gallery(category,image) values(?,?);";
                PreparedStatement pst;
                pst=con.prepareStatement(query);
           //     pst.setInt(3, id);
               // pst.setString(1,type);
                pst.setString(1,category);
               String filePath=  fileName ;
                pst.setString(2,filePath);
                
               
               int i= pst.executeUpdate();
               if(i>0)
               {
            	   System.out.println("File uploaded succesfully");
               }
               else
               {
            	   out.println("error while uploading!Try again");
               }
               // JOptionPane.showMessageDialog(frmOpt, "Operation Completed!");
                //frmOpt.dispose();
                   out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Uploaded!');");
                   out.println("window.location.href = 'admin/view_gallery.jsp?msg=success'");
                   out.println("</script>");
               //response.sendRedirect("admin/view_gallery.jsp?msg=success");
            }
            else
            {
                int id = Integer.parseInt(request.getParameter("id"));
                
                String query="UPDATE gallery SET category=?, image=? WHERE id=?;";
                PreparedStatement pst;
                pst=con.prepareStatement(query);
                pst.setString(1,category);
                pst.setInt(3, id);
                //pst.setString(1,type);
                
               String filePath=  fileName ;
                pst.setString(2,filePath);
               
               int i= pst.executeUpdate();
               if(i>0)
               {
                   out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Updated!');");
                   out.println("window.location.href = 'admin/view_gallery.jsp?msg=success'");
                   out.println("</script>");
            	   //out.println("File Updated succesfully");
                  // JOptionPane.showMessageDialog(frmOpt, "Operation Completed!");
                //frmOpt.dispose();
                 // response.sendRedirect("admin/view_gallery.jsp?msg=success");
               }
               else
               {
            	   out.println("error while updating!Try again");
               }
            }
                
    }
            catch(ClassNotFoundException | SQLException e)
            {
            response.sendRedirect("Welcome.jsp?msg=error");

            	//System.out.println(e);
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

  private String extractFileName(Part part) {
      String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}
