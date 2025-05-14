package com.servlet;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailUtil {
    public static void sendResetLink(String toEmail, String resetLink) {
        final String fromEmail = "";
        final String password = "";

        Properties props = new Properties();
        props.put("mail.smtp.host", "");
        props.put("mail.smtp.port", "");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail, "Farmer App"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Reset Your Password");
            message.setText("Click the link to reset your password:\n\n" + resetLink);

            Transport.send(message);

            System.out.println("Email Sent Successfully to " + toEmail);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
