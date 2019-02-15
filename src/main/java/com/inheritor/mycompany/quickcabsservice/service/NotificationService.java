package com.inheritor.mycompany.quickcabsservice.service;

import com.inheritor.mycompany.quickcabsservice.dto.NotificationDto;

import java.util.ArrayList;

/**
 * Created by Chathura on 9/29/2018.
 */
public interface NotificationService {

   public ArrayList<NotificationDto> loadnotificationData();
}
