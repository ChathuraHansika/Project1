/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.inheritor.mycompany.quickcabsservice.service;

/**
 *
 * @author Chathura
 */
public interface SentEmail {

    public void sendEmail(String toAddress, String fromAddress, String subject, String msgBody);
}
