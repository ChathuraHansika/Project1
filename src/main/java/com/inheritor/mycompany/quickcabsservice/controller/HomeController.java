/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.inheritor.mycompany.quickcabsservice.controller;

import com.inheritor.mycompany.quickcabsservice.dto.*;
import com.inheritor.mycompany.quickcabsservice.queue.NotificationQueue;
import com.inheritor.mycompany.quickcabsservice.service.CarBrandsService;
import com.inheritor.mycompany.quickcabsservice.service.CarModelService;
import com.inheritor.mycompany.quickcabsservice.service.OrderSerivce;
import com.inheritor.mycompany.quickcabsservice.service.SentEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.SessionTrackingMode;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author Chathura
 */
@Controller
public class HomeController {

    @Autowired
    OrderSerivce orderSerivce;

    @Autowired
    CarBrandsService carBrandsService;

    @Autowired
    CarModelService carModelService;

    @Autowired
    SentEmail sentEmail;

    @Autowired
    HttpServletRequest httpServletRequest;

    @RequestMapping(value = "/")
    public String getHomeView() {
        return "home";
    }

    @RequestMapping(value = "/save")
    public void save(HttpServletRequest hsr, HttpServletResponse httpServletResponse) throws IOException, ParseException {

        PrintWriter writer = httpServletResponse.getWriter();
        String brand = hsr.getParameter("car_brand_name");
        String model = hsr.getParameter("car_model_name");
        String bookingDateTime = hsr.getParameter("Booking_datetime_name");

        //Convert Booking_Date
        System.out.println("bookingDateTime = " + bookingDateTime);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MMM-dd");
        SimpleDateFormat dateFormat1 = new SimpleDateFormat();
        Date booking_date = dateFormat.parse(bookingDateTime);
        String handoverDateTime = hsr.getParameter("Hndover_datetime_name");
        Date handover_date = dateFormat.parse(handoverDateTime);

        String title = hsr.getParameter("Title_name");
        String name = hsr.getParameter("name");
        String email = hsr.getParameter("email");
        String phone = hsr.getParameter("phone");
		String uid="uid";

        CustomerDto customerDto = new CustomerDto();
        customerDto.setTitle(title);
        customerDto.setName(name);
        customerDto.setEmail(email);
        customerDto.setPhoneNumber(phone);

        OrdersDto ordersDto = new OrdersDto(brand, model, booking_date, handover_date);
        String order_number = orderSerivce.addOrder(ordersDto, customerDto);
        order_number = "QC" + order_number;
        //sent mail to the customer
        // sentEmail(order_number);

        //sent notification
        NotificationDto notificationDto = new NotificationDto();
        notificationDto.setOrderid(order_number);
        notificationDto.setTitle(title);
        notificationDto.setName(name);
        notificationDto.setEmail(email);
        notificationDto.setTelephonenumber(phone);
        notificationDto.setBookingdate(bookingDateTime);
        notificationDto.setHandoverdate(handoverDateTime);
        String brands = ordersDto.getCarbrand();
        String models = ordersDto.getCarmodel();

        notificationDto.setVehicle(brands + models);
        try {
            NotificationQueue.addNotification(notificationDto);
        } catch (Exception e) {
            e.printStackTrace();
        }
        httpServletRequest.getSession().setAttribute("Order_Number", order_number);

    }

    @RequestMapping(value = "/sentEmail")
    public void sentEmail(String order_number) {
        String toEmail = "chathurahansikadigital@gmail.com";
        String fromEmail = "chathurahansikadigital@gmail.com";
        String subject = "Welcome to Quick Cabs";
        String body = order_number;
        sentEmail.sendEmail(toEmail, fromEmail, subject, body);

    }

    @RequestMapping(value = "/checkEmail", method = RequestMethod.POST)
    public
    @ResponseBody
    CustomerDto checkEmail(@RequestParam("Email") String Email) {
        CustomerDto user = orderSerivce.findUser(Email);
        return user;
    }


    @RequestMapping(value = "/loadBrands", method = RequestMethod.GET, headers = "Accept=*/*", produces = "application/json")
    public
    @ResponseBody
    ArrayList<CarBrandDto> loadBrands() {
        ArrayList<CarBrandDto> loadCarBrands = (ArrayList<CarBrandDto>) carBrandsService.loadCarBrands();
        return loadCarBrands;
    }

    @RequestMapping(value = "/loadModels", method = RequestMethod.POST)
    public
    @ResponseBody
    List<CarModelDataBean> getmodel(HttpServletRequest httpServletRequest) {
        String model = httpServletRequest.getParameter("carModel");
        int carModel = Integer.parseInt(model);
        List<CarModelDataBean> carmodels = carModelService.getCarmodel(carModel);
        ArrayList<String[]> s = null;
        String[] a = null;
        for (CarModelDataBean c : carmodels) {
            System.out.println(c.getId());
            System.out.println(c.getName());

        }
        return carmodels;
    }

    @RequestMapping(value = "/checkVehicleNotDate")
    public void checkVehicleNotDate() throws ParseException {
        String booking_date = httpServletRequest.getParameter("bookingdate");
        String handover_date = httpServletRequest.getParameter("handoverdate");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MMM-dd");
        SimpleDateFormat dateFormat1 = new SimpleDateFormat();
        Date converted_booking_date = dateFormat.parse(booking_date);
        Date converted_handover_date = dateFormat.parse(handover_date);
        CheckDatesNotVehicleDto checkDatesNotVehicleDto = new CheckDatesNotVehicleDto();
        checkDatesNotVehicleDto.setBookingDate(converted_booking_date);
        checkDatesNotVehicleDto.setHandOverDate(converted_handover_date);
        orderSerivce.checkVehicleNotDate(checkDatesNotVehicleDto);


    }


    @RequestMapping(value = "/websocket")
    public String getWebSocket() {
        return "websocket";
    }
}
