<%-- 
    Document   : ReceiveOTP
    Created on : 4 Apr, 2018, 2:51:20 PM
    Author     : kunal
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mailer.Mailer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Receive OTP</title>
    </head>
    <body>
    <%
        
                                        char[] chars = "1234567890".toCharArray();
                                        StringBuilder sb = new StringBuilder(6);
                                        Random random = new Random();
                                        for (int i = 0; i < 6; i++) {
                                            char c = chars[random.nextInt(chars.length)];
                                            sb.append(c);
                                        }
                                        String otp_text = sb.toString();
                                        //String otp_text = "209812";
                                        int flag = 1;
                                        String full_name = request.getParameter("fullname");
                                        String ph_number = request.getParameter("ph_number");
                                        String email = request.getParameter("email");
                                        String password = request.getParameter("password");
                                        String role = request.getParameter("role");
                                        String stu_id = request.getParameter("stu_id");
                                        JOptionPane.showMessageDialog(null, role);
                                        Connection con = new db.Connect_db().getConnection();
                                        PreparedStatement preparedStatementEmail = con.prepareStatement("SELECT email FROM user;");
                                        ResultSet rs = preparedStatementEmail.executeQuery();
                                        while(rs.next())
                                        {
                                        //JOptionPane.showMessageDialog(null, email + password);
                                        if(rs.getString("email").equals(email))
                                        {
                                            //JOptionPane.showMessageDialog(null, "User already exists!");                
                                            //response.sendRedirect("my-account/index.jsp?msg=failure");  
                                            flag = 0;
                                            break;
                                        }
                                        }
                                        if(flag == 0)
                                        {
                                            out.println("<script type=\"text/javascript\">");  
                                               out.println("alert('User already exists!');");
                                               out.println("window.location.href = 'Register.jsp?msg=failure'");
                                               out.println("</script>");                                               
                                        }
                                        else
                                        {
                                            String message = "Please register using this OTP quickly since it will expire in some time.<br><br>";
                                            session.setAttribute("OTP", otp_text);
                                            try{
                                            Mailer.send(email, "Registration OTP", message + "<b>" + otp_text + "</b>");
                                            out.println("<script type=\"text/javascript\">");  
                                               out.println("alert('Mail Sent! Please check your mail for the OTP!');");
                                               //out.println("window.location.href = '../index.jsp?msg=failure'");
                                               out.println("</script>");
                                            }
                                            catch(Exception e)
                                            {
                                                out.print(e.toString());
                                            }
                                        }
                                    %>
                                    <form method="post" action="../../Register" style="margin: 50px">

                                        <input type="text" hidden name="full_name" value="<%=full_name%>"/>
                                        <input type="text" hidden name="ph_number" value="<%=ph_number%>"/>
                                        <input type="text" hidden name="email" value="<%=email%>"/>
                                        <input type="text" hidden name="password" value="<%=password%>"/>
                                        <input type="text" hidden name="stu_id" value="<%=stu_id%>"/>

                                            <p>Enter the OTP you received on your email!</p>

                                            <p class="woocommerce-form-row woocommerce-form-row--first form-row form-row-first">
                                                    <label for="user_otp">Enter your OTP</label>
                                                    <input required="" class="woocommerce-Input woocommerce-Input--text input-text" type="text" name="user_otp" id="user_otp" />
                                            </p>

                                            <div class="clear"></div>


                                            <p class="woocommerce-form-row form-row">
                                                    <input type="hidden" name="wc_reset_password" value="true" />
                                                    <input type="submit" class="btn btn-danger" value="Submit" />
                                            </p>

                                            <input type="hidden" id="_wpnonce" name="_wpnonce" value="ff606a35bc" /><input type="hidden" name="_wp_http_referer" value="/wp/byhands/home1/my-account/lost-password/" />
                                    </form>
    </body>
</html>
