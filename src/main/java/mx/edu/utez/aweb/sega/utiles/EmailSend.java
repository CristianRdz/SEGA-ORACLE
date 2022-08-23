package mx.edu.utez.aweb.sega.utiles;

import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.PasswordAuthentication;


public class EmailSend {
    public boolean Enviar(String correoReceptor, String sujeto, String mensaje) {
        // Quien lo recibira
        //String correoReceptor = "redalphasiete@gmail.com";
        //String sujeto = "Actualización de revisión";
        //String mensaje ="Su auto a pasado a la siguiente fase";
        //String estilo="<style>.cuerpo{color:green;}</style><br>";

        String cuerpo = "<div style='font-family:sans-serif; color: #444444; background-color: #f5f5f5; border:solid 2px black; border-radius:20px; padding:10%;'><h4>Hola, este mensaje es automático</h4><h3>" + mensaje +
                "</h3></div>";
        //<a style='background-color: #14A4C4; color:#fff;  text-decoration: none; padding: 5%; border:solid 2px black; border-radius:20px;' href='www.google.com'>Google</a>

        //Quien envia el correo
        String correoRemitente = "email@email.com";
        String passwordRemitente = "contrasena";

        // Colocamos las propiedades del servidor
        Properties props = new Properties();
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.port", "587");
        props.setProperty("mail.smtp.auth", "true");

        // Obtenemos el objeto de la session y le colocamos las propiedades
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication(correoRemitente, passwordRemitente);

            }

        });

        // Podemos debugear la sesión para ver si hay errores
        //session.setDebug(true);

        try {
            // Creamos un  objeto MimeMessage
            MimeMessage message = new MimeMessage(session);

            // Enviado por:
            message.setFrom(new InternetAddress(correoRemitente));

            // Enviado para:
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(correoReceptor));

            // Colocar el sujeto:
            message.setSubject(sujeto);

            // Colocamos el mensaje como html
            message.setText(cuerpo, "ISO-8859-1", "html");

            //Enviamos el mensaje
            Transport t = session.getTransport("smtp");
            t.connect(correoRemitente, passwordRemitente);
            t.sendMessage(message, message.getRecipients(Message.RecipientType.TO));

            //Cerramos Transport
            t.close();
            return true;
        } catch (MessagingException mex) {
            Logger.getLogger(EmailSend.class.getName()).log(Level.SEVERE, null, mex);
            return false;
        }
    }
}
