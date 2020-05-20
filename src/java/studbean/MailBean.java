/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package studbean;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class MailBean {
    final String username = "animeshchourasia64@gmail.com" ;
    final String password = "7582836709";
    String subject,message,to;
    String error="";
    String host = "smtp.gmail.com";
    public void setSubject(String subject){
        this.subject=subject;
    }
    public void setMessage(String message){
        this.message=message;
    }
    public void setTo(String to){
        this.to=to;
    }
    public String getError(){
        return error ;
    }
    
    /**
     *
     * @return
     */
    public boolean sendMail(){
        boolean state = false;
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
         props.put("mail.smtp.host", "smtp.gmail.com");
          props.put("mail.smtp.port", "587");
          try{
              Session session;
            session = Session.getInstance(props, new javax.mail.Authenticator() {
                
                @Override
                protected PasswordAuthentication getPasswordAuthentication(){
                    return new PasswordAuthentication(username,password);
                }
            });
              
              Message mes = new MimeMessage(session);
              mes.setFrom(new InternetAddress(username));
              mes.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
              mes.setSubject(subject);
              mes.setText(message);
              Transport.send(mes);
              state=true;
              
              
          }catch(MessagingException ex){
              error = ex.getMessage();
              ex.printStackTrace();
          }
              
        return state;
    }
}
