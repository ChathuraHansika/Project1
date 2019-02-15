package com.inheritor.mycompany.quickcabsservice.dto;

/**
 * Created by Chathura on 9/29/2018.
 */
public class NotificationDto {
    private String orderid;
    private String title;
    private String name;
    private String email;
    private String telephonenumber;
    private String bookingdate;
    private String handoverdate;
    private String vehicle;


    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephonenumber() {
        return telephonenumber;
    }

    public void setTelephonenumber(String telephonenumber) {
        this.telephonenumber = telephonenumber;
    }

    public String getBookingdate() {
        return bookingdate;
    }

    public void setBookingdate(String bookingdate) {
        this.bookingdate = bookingdate;
    }

    public String getHandoverdate() {
        return handoverdate;
    }

    public void setHandoverdate(String handoverdate) {
        this.handoverdate = handoverdate;
    }

    public String getVehicle() {
        return vehicle;
    }

    public void setVehicle(String vehicle) {
        this.vehicle = vehicle;
    }
}
