package mailer;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.util.Properties;  
      
    import javax.mail.*;  
    import javax.mail.internet.InternetAddress;  
    import javax.mail.internet.MimeMessage;  
      
    public class Mailer {                
    
    public static void send(String to, String subject, String messageBody){  
        //final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
        final String USER="tempdiction@gmail.com";//change accordingly  
        final String PASSWORD="tempDiction123@";
    
    

    Session session = Session.getDefaultInstance(getInitProp(),  
     new javax.mail.Authenticator() {           
      @Override
      protected PasswordAuthentication getPasswordAuthentication() {  
       return new PasswordAuthentication(USER,PASSWORD);  
       }  
    });  
    //2nd step)compose message  
    try {  
        MimeMessage message = new MimeMessage(session);  
        message.setFrom(new InternetAddress(USER));  
        message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
        message.setSubject(subject);  
        message.setText(messageBody);  
        message.setContent(messageBody, "text/html; charset=utf-8");
        //3rd step)send message  
        Transport.send(message);  

        System.out.println("Done");  

        } catch (MessagingException e) {  
           throw new RuntimeException(e);  
        }  
          
    }
    private static Properties getInitProp()
    {
        Properties props = new Properties();  
        props.setProperty( "mail.smtp.host", "smtp.gmail.com");//change accordingly  
        props.put("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.port", "465");
        props.setProperty("mail.smtp.socketFactory.port", "465");
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    
        return props;
    }
}  