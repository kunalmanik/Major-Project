/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import db.Connect_db;
import java.awt.HeadlessException;
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
public class subSubProd_subAdmin extends HttpServlet {

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
            JFrame frmOpt = new JFrame();
        //Rectangle r = frmOpt.getBounds();
        //frmOpt.dispose();
        //frmOpt.setVisible(true);                
        //frmOpt.setLocationRelativeTo(null);
        //frmOpt.setAlwaysOnTop(true);
            String fileName = null;
            String category = request.getParameter("country");           
            String subcat = request.getParameter("state");
            String pro_id = request.getParameter("pro_id");
            String name = request.getParameter("name");
            String des = request.getParameter("des");
            int price = Integer.parseInt(request.getParameter("price"));
            //int discount = Integer.parseInt(request.getParameter("discount"));
            String enability = request.getParameter("enability");
            //String featured = request.getParameter("featured");
            
            //String playerString = request.getParameter("player");
           // String visibilityString = request.getParameter("visibility");
            try
            {
                Part image = request.getPart("image");
                File file = new File(filePath);
            if(!file.exists()){
                file.mkdir();                          
            }
            fileName = extractName(image);
            fileName = new File(fileName).getName();
            image.write(filePath + File.separator +fileName);
            }
            catch(Exception e)
            {
                fileName = "default.jpg";
            }
            
            
            try{
            //out.println(countryString + stateString + playerString);
            Class.forName("com.mysql.jdbc.Driver");
             Connection con=new Connect_db().getConnection();
                String query = "INSERT INTO products(product_id, product_name, product_image, product_price, product_desc,category, sub_category, visibility) VALUES(?,?,?,?,?,?,?,?);";
                PreparedStatement ps = con.prepareStatement(query);
                
                ps.setString(1, pro_id);
                ps.setString(2, name);
                ps.setString(3, fileName);
                ps.setInt(4, price);
                ps.setString(5, des);
              
                ps.setString(6, category);
                ps.setString(7, subcat);
                ps.setString(8, enability);
                
                if(ps.executeUpdate() > 0)
                {
                    out.println("<script type=\"text/javascript\">");  
                   out.println("alert('Successfully Added!');");
                   //out.println("window.location.href = 'index.jsp'");
                   out.println("</script>");
                    //JOptionPane.showMessageDialog(frmOpt, "SUCCESS");                    
                }
                else
                {
                    JOptionPane.showMessageDialog(frmOpt, "FAILURE");
                }
               // frmOpt.dispose();
                //response.sendRedirect("admin/subSubCat.jsp?msg=success");
                out.println("<script type=\"text/javascript\">");  
                   //out.println("alert('Successfully Added!');");
                   out.println("window.location.href = 'sub-admin/subSubCat.jsp?msg=success'");
                   out.println("</script>");
            }
            catch(HeadlessException | ClassNotFoundException | SQLException e)
            {
                JOptionPane.showMessageDialog(null, e.toString());
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
