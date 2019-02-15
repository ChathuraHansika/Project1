/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.inheritor.mycompany.quickcabsservice.dto;

import sun.util.calendar.BaseCalendar;


import java.util.Date;

/**
 *
 * @author Chathura
 */
public class OrdersDto {

    private String carbrand;

    private String carmodel;

    private Date pickupDate;

    private Date handOverDate;

    public OrdersDto(String carbrand, String carmodel, Date pickupDate, Date handOverDate) {
        this.carbrand = carbrand;
        this.carmodel = carmodel;
        this.pickupDate = pickupDate;
        this.handOverDate = handOverDate;
    }

    public String getCarbrand() {
        return carbrand;
    }

    public void setCarbrand(String carbrand) {
        this.carbrand = carbrand;
    }

    public String getCarmodel() {
        return carmodel;
    }

    public void setCarmodel(String carmodel) {
        this.carmodel = carmodel;
    }

    public Date getPickupDate() {
        return pickupDate;
    }

    public void setPickupDate(Date pickupDate) {
        this.pickupDate = pickupDate;
    }

    public Date getHandOverDate() {
        return handOverDate;
    }

    public void setHandOverDate(Date handOverDate) {
        this.handOverDate = handOverDate;
    }
}
