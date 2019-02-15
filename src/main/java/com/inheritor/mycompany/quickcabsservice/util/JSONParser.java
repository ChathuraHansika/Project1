package com.inheritor.mycompany.quickcabsservice.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.inheritor.mycompany.quickcabsservice.dto.NotificationBean;
import com.inheritor.mycompany.quickcabsservice.dto.NotificationDto;

import java.util.List;

/**
 * Created by Chathura on 9/23/2018.
 */
public class JSONParser {

    public synchronized static String parse(NotificationDto notificationBean) {
        GsonBuilder gsonBuilder = new GsonBuilder();
        Gson gson = gsonBuilder.create();
        String JSONObject = gson.toJson(notificationBean);
        System.out.println("Coverted JSON -> " + JSONObject);
        return JSONObject;
    }
}
