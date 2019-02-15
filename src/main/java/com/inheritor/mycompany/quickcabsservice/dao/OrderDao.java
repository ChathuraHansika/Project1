/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.inheritor.mycompany.quickcabsservice.dao;

import com.inheritor.mycompany.quickcabsservice.dto.CheckDatesNotVehicleDto;
import com.inheritor.mycompany.quickcabsservice.dto.CustomerDto;
import com.inheritor.mycompany.quickcabsservice.dto.OrdersDto;

/**
 * @author Chathura
 */
public interface OrderDao {

    String addOrder(OrdersDto ordersDto, CustomerDto customerdto);

    CustomerDto findUser(String Email);

    void checkVehicleNotDate(CheckDatesNotVehicleDto checkDatesNotVehicleDto);
}
