/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SupportClasses;


import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class MailService {
    
    
    private static String mailAddress = "insurancekarapelit@gmail.com";
    private static String password = "hQfHBq{U0Fap";
   
    
    public static void addPolicyMail(String customerMailAddress, String customerName){
        String title = customerName.toUpperCase() + " Congratulations!  You have a new Policy!";
        String context = "You have a new Policy! This is an informational message\n please don't reply\n";
        sendEMail(customerMailAddress, title, context);
    }
    public static void welcomeCustomerMail(String customerMailAddress, String customerName){
        String title = customerName.toUpperCase() + ", Welcome to " + AppInfo.APP_NAME + "!";
        String context = AppInfo.APP_NAME + ", you have successfully registered. This is an informational message\n please don't reply\n";
        sendEMail(customerMailAddress, title, context);
    }
    
    private static boolean sendEMail(String toMail,String mailTitle , String mailContent ){
        try {
            String[] to = { toMail };
            String host = "smtp.gmail.com";
            Properties props = System.getProperties();
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.user", mailAddress);
            props.put("mail.smtp.password", password);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            Session session = Session.getDefaultInstance(props, null);
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(mailAddress));
            InternetAddress[] toAddress = new InternetAddress[to.length];
            for (int i = 0; i < to.length; i++) {
             toAddress[i] = new InternetAddress(to[i]);
            }
            for (int i = 0; i < toAddress.length; i++) {
             message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }
            message.setSubject(mailTitle);
            message.setText(mailContent);
            Transport transport = session.getTransport("smtp");
            transport.connect(host, mailAddress, password);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
           } catch (Exception e) {
                return false;
           }
        return true;
    }

    
}
