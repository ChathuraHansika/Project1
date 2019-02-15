package com.inheritor.mycompany.quickcabsservice.serviceimpl;

import com.inheritor.mycompany.quickcabsservice.dao.NotificationDao;
import com.inheritor.mycompany.quickcabsservice.dto.NotificationDto;
import com.inheritor.mycompany.quickcabsservice.model.Orders;
import com.inheritor.mycompany.quickcabsservice.service.NotificationService;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Chathura on 9/29/2018.
 */
@Service
public class NotiifcationServiceImpl implements NotificationService {
    @Autowired
    NotificationDao notificationDao;

    @Override
    public ArrayList<NotificationDto> loadnotificationData() {
        System.out.println("notificationDaocallllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll = " + notificationDao);
        return notificationDao.loadnotificationData();
    }
}
