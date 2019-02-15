package com.inheritor.mycompany.quickcabsservice.serviceimpl;

import com.inheritor.mycompany.quickcabsservice.service.SentEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

/**
 * @author Chathura
 *
 */
@Service
public class SentEmailImpl implements SentEmail {
    
    @Autowired
    private MailSender mailSender;    
    
    @Override
    public void sendEmail(String toAddress, String fromAddress, String subject, String msgBody) {
        System.out.println("msgBody = " + msgBody);
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom(fromAddress);
        mailMessage.setTo(toAddress);
        mailMessage.setSubject(subject);
        mailMessage.setText(msgBody);
        mailSender.send(mailMessage);
    }
}
