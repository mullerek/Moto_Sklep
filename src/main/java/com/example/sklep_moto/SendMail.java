package com.example.sklep_moto;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

@Service
public class SendMail extends Authenticator{

    public SendMail()
    {
        super();
    }

    @Override
    public PasswordAuthentication getPasswordAuthentication() {
        String username = "pawel.muller1998@gmail.com";
        String password = "yrjcsbuywldzswfp";
        if ((username != null) && (username.length() > 0) && (password != null)
                && (password.length   () > 0)) {

            return new PasswordAuthentication(username, password);
        }

        return null;
    }

    public void sendMail(String to, String subj, String body) throws MessagingException {
        final String  from = "pawel.muller1998@gmail.com";
        final String password = "yrjcsbuywldzswfp";
        final String host = "localhost";

        SendMail auth = new SendMail();

        Properties properties = System.getProperties();
        properties.put("mail.smtp.host","smtp.gmail.com");
        properties.put("mail.smtp.port","587");
        properties.put("mail.smtp.auth","true");
        properties.put("mail.smtp.starttls.enable","true");
        properties.setProperty("mail.user", "pawel.muller1998@gmail.com");
        properties.setProperty("mail.password", "yrjcsbuywldzswfp");


        javax.mail.Message message = new MimeMessage(Session.getDefaultInstance(properties,auth));
        message.setFrom(new InternetAddress(from));
        message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
        message.setSubject(subj);
        message.setContent(
                "<h3> Właśnie odebraliśmy Twoje zamówienie </h3> "+
                        "<table>" +
                        "                <tr>" +
                        "                    <td><b>Nazwa</b></td>" +
                        "                    <td><b>Ilość</b></td>" +
                        "                    <td><b>Cena</b></td>" +
                        "                </tr>"+
                        body+
                        "</table>"+
                        "</br>" +
                        "<p>Dziękujemy za zakupy! <p>"+
                        "</br> Dołożymy wszelkich starań, aby zostało one zrealizowane jak najszybciej",
                "text/html; charset=UTF-8"
        );

        Transport.send(message);

        System.out.println("Mail sended ...");
    }
}
