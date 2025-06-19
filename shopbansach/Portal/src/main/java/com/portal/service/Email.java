package com.portal.service;

import com.portal.entities.OrderProducts;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.File;

@Service
public class Email {

    @Autowired
    JavaMailSender mailSender;

    public JavaMailSender getMailSender() {
        return mailSender;
    }

    public void setMailSender(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }


    public void sendMail(String toEmail, String subject, String message) throws MessagingException {

        MimeMessage mess = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mess, true);

        helper.setSubject(subject);
        helper.setTo(toEmail);
        helper.setText(message, true);
        helper.setFrom("hydroiu@gmail.com");
        getMailSender().send(mess);
    }
}
