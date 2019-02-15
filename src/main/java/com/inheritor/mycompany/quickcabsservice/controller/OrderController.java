package com.inheritor.mycompany.quickcabsservice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Chathura on 9/19/2018.
 */
@Controller
public class OrderController {


    @RequestMapping(value = "/home/order")
    public String getOrderView(){
        return "Orders";
    }

}
