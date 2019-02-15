package com.inheritor.mycompany.quickcabsservice.dto;

/**
 * Created by Chathura on 9/12/2018.
 */

public class AdminDataDto {

    private Long orders;
    private Long customers;
    private Long Vehicle;


    public Long getOrders() {
        return orders;
    }

    public void setOrders(Long orders) {
        this.orders = orders;
    }

    public Long getCustomers() {
        return customers;
    }

    public void setCustomers(Long customers) {
        this.customers = customers;
    }

    public Long getVehicle() {
        return Vehicle;
    }

    public void setVehicle(Long vehicle) {this.Vehicle = vehicle;}
}
