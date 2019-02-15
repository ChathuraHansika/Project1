package com.inheritor.mycompany.quickcabsservice.dto;

import java.util.Date;

/**
 * Created by Chathura on 9/30/2018.
 */
public class CheckDatesNotVehicleDto {

    private Date bookingDate;
    private Date handOverDate;


    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }

    public Date getHandOverDate() {
        return handOverDate;
    }

    public void setHandOverDate(Date handOverDate) {
        this.handOverDate = handOverDate;
    }
}
