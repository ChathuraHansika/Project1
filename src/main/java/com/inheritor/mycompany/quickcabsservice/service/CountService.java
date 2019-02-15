package com.inheritor.mycompany.quickcabsservice.service;

import org.springframework.stereotype.Service;

/**
 * Created by Chathura on 9/15/2018.
 */
@Service
public interface CountService {

    public int getCountOrders();
    public int getCountCustomers();
    public int getCountVehicle();
}
