package com.inheritor.mycompany.quickcabsservice.dao;

import com.inheritor.mycompany.quickcabsservice.dto.NotificationDto;

import java.util.ArrayList;

/**
 * Created by Chathura on 9/29/2018.
 */
public interface NotificationDao {

    public ArrayList<NotificationDto> loadnotificationData();
}
