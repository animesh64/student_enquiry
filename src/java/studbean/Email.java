/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package studbean;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class Email {

String USER_NAME = "animeshchourasia64@gmail.com";  // GMail user name (just the part before "@gmail.com")
String PASSWORD = "7582836709"; // GMail password

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
    




public boolean sendFromGmail() {
    String from = USER_NAME;
    String pass = PASSWORD;
    String receiver = to ; // list of recipient email addresses
    String subj = subject;
    String body = message;
    
     boolean state = false;
    Properties props = System.getProperties();
  String hostt = "smtp.gmail.com";

    props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.host", hostt);

    props.put("mail.smtp.ssl.trust", hostt);
    props.put("mail.smtp.user", from);
    props.put("mail.smtp.password", pass);
    props.put("mail.smtp.port", "587");//587
    props.put("mail.smtp.auth", "true");


    Session session = Session.getDefaultInstance(props);
    MimeMessage messag = new MimeMessage(session);

    try {


        messag.setFrom(new InternetAddress(from));
     

        // To get the array of addresses
       messag.addRecipient(Message.RecipientType.TO, new InternetAddress(to));


        messag.setSubject(subject);
        messag.setText(body);


        try (Transport transport = session.getTransport("smtp")) {
            transport.connect(hostt, from, pass);
            transport.sendMessage(messag, messag.getAllRecipients());
        }
 state=true;
    }
    catch (AddressException ae) {
    }
    catch (MessagingException me) {
    }
      return state;
 }

 }