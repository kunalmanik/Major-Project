/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.awt.Dimension;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.UIManager;

/**
 *
 * @author kunal
 */
public class ReplyQuery extends HttpServlet {

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
            //UIManager.put("OptionPane.minimumSize",new Dimension(500,500)); 
                      
            //JFrame frame = new JFrame("InputDialog Example #1");
            //String replyText = JOptionPane.showInputDialog(frame, "Enter your reply");
           // JFrame frmOpt = new JFrame();
        //Rectangle r = frmOpt.getBounds();
        //frmOpt.dispose();
       // frmOpt.setVisible(true);                
       // frmOpt.setLocationRelativeTo(null);
       // frmOpt.setAlwaysOnTop(true);
            String replyText = request.getParameter("replyText");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String query = request.getParameter("query");
            String message = "Hello " + name;
            int id = Integer.parseInt(request.getParameter("id"));
            message += "<br><br>This is response to your query!<br><br>";
            message += "\"<i>" + query + "\"</i><br><br>";
            message += replyText;
            try{
                //JOptionPane.showMessageDialog(frmOpt, "replyText : " + replyText);
               // frmOpt.dispose();
                if(replyText != "" || replyText != null){                    
                    PreparedStatement ps = new db.Connect_db().getConnection().prepareStatement("UPDATE contact SET answered='yes' WHERE id=?");
                    ps.setInt(1, id);
                    ps.executeUpdate();
                    mailer.Mailer.send(email, "Query Response", message);
                   // JOptionPane.showMessageDialog(frmOpt, "Mail Sent");
                    out.println("<script type=\"text/javascript\">");  
                   out.println("alert(' Replied');");
                   out.println("window.location.href = 'admin/ReplyQuery.jsp'");
                   out.println("</script>");
                   // frmOpt.dispose();
                }
                else
                {
                    out.println("<script type=\"text/javascript\">");  
                   out.println("alert('No Input added');");
                  // out.println("window.location.href = 'index.jsp'");
                   out.println("</script>");
                  //  JOptionPane.showMessageDialog(frmOpt, "NO INPUT ENTERED!");
                   // frmOpt.dispose();
                }
            }
            catch(Exception e)
            {
                out.print(e.toString());
            }
                   out.println("<script type=\"text/javascript\">");  
                   //out.println("alert('   ');");
                   out.println("window.location.href = 'admin/contactus.jsp'");
                   out.println("</script>");
            //response.sendRedirect("admin/contactus.jsp");
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
