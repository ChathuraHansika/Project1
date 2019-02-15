package com.inheritor.mycompany.quickcabsservice.dto;

/**
 * Created by Chathura on 9/23/2018.
 */
public class NotificationBean {
    String not_id;
    String not_status;
    String not_description;
    String date_time;

    public NotificationBean() {
    }

    @Override
    public String toString() {
        return "NotificationBean{" +
                "not_id='" + not_id + '\'' +
                ", not_status='" + not_status + '\'' +
                ", not_description='" + not_description + '\'' +
                ", date_time='" + date_time + '\'' +
                '}';
    }

    public String getNot_id() {
        return not_id;
    }

    public void setNot_id(String not_id) {
        this.not_id = not_id;
    }

    public String getNot_status() {
        return not_status;
    }

    public void setNot_status(String not_status) {
        this.not_status = not_status;
    }

    public String getNot_description() {
        return not_description;
    }

    public void setNot_description(String not_description) {
        this.not_description = not_description;
    }

    public String getDate_time() {
        return date_time;
    }

    public void setDate_time(String date_time) {
        this.date_time = date_time;
    }
}
