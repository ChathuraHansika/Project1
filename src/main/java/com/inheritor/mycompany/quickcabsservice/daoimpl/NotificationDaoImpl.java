package com.inheritor.mycompany.quickcabsservice.daoimpl;

import com.inheritor.mycompany.quickcabsservice.dao.NotificationDao;
import com.inheritor.mycompany.quickcabsservice.dto.NotificationDto;
import com.inheritor.mycompany.quickcabsservice.dto.OrdersDto;
import com.inheritor.mycompany.quickcabsservice.model.Orders;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import java.util.ArrayList;
import java.util.List;

/**
 * Created by Chathura on 9/29/2018.
 */
@Repository
public class NotificationDaoImpl implements NotificationDao {

    @Autowired
    SessionFactory sessionFactory;


    @Override
    @Transactional
    public ArrayList<NotificationDto> loadnotificationData() {
        System.out.println("sessionFactoryyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy = " + sessionFactory);

        ArrayList<Orders> list = (ArrayList<Orders>) sessionFactory.getCurrentSession().createCriteria(Orders.class)
                .add(Restrictions.eq("status", "online"))
                .list();
        ArrayList<NotificationDto> notificationDtos = new ArrayList<>();

        for (Orders orders : list) {
            NotificationDto notificationDto = new NotificationDto();
            notificationDto.setOrderid(String.valueOf(orders.getOid()));
            notificationDto.setTitle(orders.getCuid().getTitle());
            notificationDto.setName(orders.getCuid().getName());
            notificationDto.setEmail(orders.getCuid().getEmail());
            notificationDto.setBookingdate(String.valueOf(orders.getPickupDateTime()));
            notificationDto.setHandoverdate(String.valueOf(orders.getHandOverDateTime()));
            notificationDto.setTelephonenumber(orders.getCuid().getPhoneNumber());
            String model = orders.getCaid().getModelId().getModel();
            String brand = orders.getCaid().getBrandId().getBrand();
            notificationDto.setVehicle(brand + model);
            notificationDtos.add(notificationDto);
            System.out.println("orderssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss = " + orders.getOid());
        }

        for (NotificationDto notificationDto : notificationDtos) {
            System.out.println(
                    "notificationnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn" +
                            notificationDto.getOrderid() +
                            notificationDto.getEmail() +
                            notificationDto.getName() +
                            notificationDto.getVehicle() +
                            notificationDto.getTelephonenumber()
            );
        }

        System.out.println("dfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff" + list);
        return notificationDtos;

    }
}
