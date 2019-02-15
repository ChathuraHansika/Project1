package com.inheritor.mycompany.quickcabsservice.controller;

import com.inheritor.mycompany.quickcabsservice.dto.NotificationDto;
import com.inheritor.mycompany.quickcabsservice.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;

/**
 * Created by Chathura on 9/29/2018.
 */
@Controller
public class NotificationController {
    @Autowired
    NotificationService notificationService;

    @RequestMapping(value = "/loadNotification")
    public @ResponseBody    ArrayList<NotificationDto>  loadNotification() {

        System.out.println("Controller runnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn");
        ArrayList<NotificationDto> notificationDtos = notificationService.loadnotificationData();
        return notificationDtos;
    }

}
