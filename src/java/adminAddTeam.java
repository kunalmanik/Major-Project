/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.awt.HeadlessException;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
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
public class adminAddTeam extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final String filePath = "C:\\Users\\kunal\\Documents\\NetBeansProjects\\EMS_School\\web\\team";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String cat_id = request.getParameter("team_id");                        
             String team_name = request.getParameter("name");
             String team_title = request.getParameter("title");
             String department = request.getParameter("department");
             Part filePart = request.getPart("image");
             
                        
            
            try
    		{
    		//JOptionPane.showMessageDialog(null, "before try");
                Class.forName("com.mysql.jdbc.Driver");  
                Connection con = new db.Connect_db().getConnection();
            
                File file = new File(filePath);
            if(!file.exists()){
                file.mkdir();                          
            }
            String fileName = extractName(filePart);
            fileName = new File(fileName).getName();
            filePart.write(filePath + File.separator +fileName);
            
                
            if(cat_id == null)
            {
                String query="INSERT INTO team (name, image, title,department) VALUES (?,?,?,?);";
                PreparedStatement pst;
                pst=con.prepareStatement(query);
                pst.setString(1,team_name);    
                pst.setString(2, fileName);
                pst.setString(3, team_title);
                pst.setString(4, department);
               int i = pst.executeUpdate();
               if(i>0)
               {
                   out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Added');");
                   out.println("window.location.href = 'admin/viewTeam.jsp'");
                   out.println("</script>");
            	      //JOptionPane.showMessageDialog(null, "success");
                  //response.sendRedirect("admin/viewTeam.jsp");
               }
               else
               {
            	   out.println("error while Inserting!Try again");
               }
               //response.sendRedirect("upload.jsp?msg=success");
            }
            else
            {
                 //javax.swing.JOptionPane.showMessageDialog(null, "Updati");
              
                
                String query="UPDATE team SET name=?,title=?,department=? WHERE id=?;";
                PreparedStatement pst;
                pst=con.prepareStatement(query);
                pst.setString(1, team_name);
                pst.setString(2, team_title);
                pst.setString(3, department);
                pst.setString(3, cat_id);
               int i= pst.executeUpdate();
               if(i>0)
               {
                   out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Updated!');");
                   out.println("window.location.href = 'admin/view_team.jsp'");
                   out.println("</script>");
            	   //out.println("Catagory Updated succesfully");
                   //response.sendRedirect("admin/view_team.jsp");
               }
               else
               {
            	   out.println("error while updating!Try again");
               }
            }                
    }
            catch(HeadlessException | IOException | ClassNotFoundException | SQLException e)
            {
                out.print(e.toString());
            response.sendRedirect("welcome.jsp?msg=error");

            	//System.out.println(e);
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
