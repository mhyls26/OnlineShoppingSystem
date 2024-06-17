/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Mhyls
 */
import java.util.Properties;
import java.util.ResourceBundle;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class JavaMailUtil {

    private static final String EMAIL_RESOURCE_BUNDLE = "application"; // Name of resource bundle

    public static void sendRegistrationEmail(String recipientEmail) throws MessagingException {
        ResourceBundle rb = ResourceBundle.getBundle(EMAIL_RESOURCE_BUNDLE);

        String host = "smtp.gmail.com";
        String port = "587";
        String username = rb.getString("mailer.email");
        String password = rb.getString("mailer.password");

        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Welcome to Glam Shop");

            String registrationMessage = "Hi there!\n\n"
                                       + "Welcome to Glam Shop! We're thrilled to have you with us.\n"
                                       + "Start exploring our collection and find what brings out your style!\n\n"
                                       + "Enjoy shopping!\n\n"
                                       + "Best regards,\n"
                                       + "The Glam Shop Team";

            message.setText(registrationMessage);

            Transport.send(message);

            System.out.println("Registration email sent to " + recipientEmail);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public static void sendOrderConfirmationEmail(String recipientEmail, String orderId, double amountPaid) throws MessagingException {
        ResourceBundle rb = ResourceBundle.getBundle(EMAIL_RESOURCE_BUNDLE);

        String host = "smtp.gmail.com";
        String port = "587";
        String username = rb.getString("mailer.email");
        String password = rb.getString("mailer.password");

        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Order Confirmation");

            String orderConfirmationMessage = "Hi there!\n\n"
                                            + "Your order has been confirmed!\n"
                                            + "Order ID: " + orderId + "\n\n"
                                            + "Amount Paid: $" + amountPaid + "\n\n"
                                            + "Thank you for shopping at Glam Shop!\n\n"
                                            + "Best regards,\n"
                                            + "The Glam Shop Team";

            message.setText(orderConfirmationMessage);

            Transport.send(message);

            System.out.println("Order confirmation email sent to " + recipientEmail);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public static void sendStockAvailabilityEmail(String recipientEmail, String itemName) throws MessagingException {
        ResourceBundle rb = ResourceBundle.getBundle(EMAIL_RESOURCE_BUNDLE);

        String host = "smtp.gmail.com";
        String port = "587";
        String username = rb.getString("mailer.email");
        String password = rb.getString("mailer.password");

        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Item Availability Update");

            String availabilityMessage = "Hi there!\n\n"
                                       + "Great news! The item '" + itemName + "' you were interested in is now available in our store.\n"
                                       + "Hurry and place your order before it sells out again!\n\n"
                                       + "Happy shopping!\n\n"
                                       + "Best regards,\n"
                                       + "The Glam Shop Team";

            message.setText(availabilityMessage);

            Transport.send(message);

            System.out.println("Stock availability update email sent to " + recipientEmail);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    public static void sendShipmentDeliveryEmail(String recipientEmail, String orderId) throws MessagingException {
        ResourceBundle rb = ResourceBundle.getBundle(EMAIL_RESOURCE_BUNDLE);

        String host = "smtp.gmail.com";
        String port = "587";
        String username = rb.getString("mailer.email");
        String password = rb.getString("mailer.password");

        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Shipment and Delivery Update");

            String shipmentMessage = "Hi there!\n\n"
                                   + "We are pleased to inform you that your order with Order ID " + orderId + " has been shipped!\n"
                                   + "It's on its way to you now. We hope you enjoy your purchase!\n\n"
                                   + "Thank you for shopping with Glam Shop.\n\n"
                                   + "Best regards,\n"
                                   + "The Glam Shop Team";

            message.setText(shipmentMessage);

            Transport.send(message);

            System.out.println("Shipment and delivery update email sent to " + recipientEmail);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
