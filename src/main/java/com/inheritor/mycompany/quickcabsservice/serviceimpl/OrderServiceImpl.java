/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.inheritor.mycompany.quickcabsservice.serviceimpl;

import com.inheritor.mycompany.quickcabsservice.dao.OrderDao;
import com.inheritor.mycompany.quickcabsservice.dto.CheckDatesNotVehicleDto;
import com.inheritor.mycompany.quickcabsservice.dto.CustomerDto;
import com.inheritor.mycompany.quickcabsservice.dto.OrdersDto;
import com.inheritor.mycompany.quickcabsservice.service.OrderSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Chathura
 */
@Service
public class OrderServiceImpl implements OrderSerivce {

    @Autowired
    OrderDao orderDao;

    @Override
    public String addOrder(OrdersDto ordersDto, CustomerDto customerDto) {
        return orderDao.addOrder(ordersDto, customerDto);
    }

    @Override
    public CustomerDto findUser( String Email) {
        return orderDao.findUser(Email);
    }

    @Override
    public void checkVehicleNotDate(CheckDatesNotVehicleDto checkDatesNotVehicleDto) {
         orderDao.checkVehicleNotDate(checkDatesNotVehicleDto);
    }

}
