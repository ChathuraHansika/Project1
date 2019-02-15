/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.inheritor.mycompany.quickcabsservice.controller;

import com.inheritor.mycompany.quickcabsservice.dto.AdminDataDto;
import com.inheritor.mycompany.quickcabsservice.dto.CarBrandDto;
import com.inheritor.mycompany.quickcabsservice.dto.CarDto;
import com.inheritor.mycompany.quickcabsservice.dto.CarModelDataBean;
import com.inheritor.mycompany.quickcabsservice.service.AdminHomeService;
import com.inheritor.mycompany.quickcabsservice.service.CarBrandsService;
import com.inheritor.mycompany.quickcabsservice.service.CarModelService;
import com.inheritor.mycompany.quickcabsservice.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author Chathura
 */
@Controller

public class AdminController {

    @Autowired
    AdminHomeService adminHomeService;

    @Autowired
    CarService carService;

    @Autowired
    CarBrandsService carBrandsService;

    @Autowired
    CarModelService carModelService;


    @Autowired
    HttpServletRequest httpServletRequest;

    @RequestMapping(value = "/Admin")
    public String getAdminView() {
        return "AdminLogin";
    }


    @RequestMapping(value = "/AdminLogin", method = RequestMethod.POST)
    public String adminLogin(HttpServletRequest httpServletRequest) throws Exception {

        //check again ip address in try catch

        String view_name = "";
        String name = httpServletRequest.getParameter("Adminname");
        System.out.println("name = " + name);
        String password = httpServletRequest.getParameter("adminpassword");
        System.out.println("password = " + password);

        //  try {
        String localHost = String.valueOf(InetAddress.getLocalHost());
        if (localHost.equals(localHost)) {
            System.out.println("\"sucess\" = " + "sucess");


            if (name.equals("Chathura") & password.equals("admin")) {

                view_name = "home";

                httpServletRequest.getSession().setAttribute("value", "correct");
                // return modelAndView;
            } else {

                view_name = "404";
                httpServletRequest.getSession().setAttribute("value", "incorrect");
                //  return modelAndView;
            }
        }
        System.out.println("localHost = " + localHost);
        // } catch (UnknownHostException ex) {

        // }

        return "redirect:/" + view_name;

    }


    /*@ExceptionHandler(Exception.class)
    public String test() {
        return "404";
    }*/

    @RequestMapping(value = "/adminhome")
    public String adminHome() {
        return "adminhome";
    }

    @RequestMapping(value = "/dashboard")
    public String dashBoard() {
        return "DashBoard";
    }

    @RequestMapping(value = "/404")
    public String error() {
        return "404";
    }

    @RequestMapping(value = "/adminhome/card")
    public String cards() {
        System.out.println("card called");
        return "cards";
    }

    @RequestMapping(value = "/name")
    public String name() {
        return "new";
    }

    @RequestMapping(value = "/loadAdminData")
    public
    @ResponseBody
    AdminDataDto loadAdminData() {
        System.out.println("Admin called");
        AdminDataDto adminDataDto = adminHomeService.loadAdminData();
        System.out.println("adminDataDto.getCustomers() = " + adminDataDto.getVehicle());
        return adminDataDto;
    }

    @RequestMapping(value = "/loadAdminBrands", method = RequestMethod.GET, headers = "Accept=*/*", produces = "application/json")
    public
    @ResponseBody
    ArrayList<CarBrandDto> loadBrands() {

        System.out.print("load brands run");
        ArrayList<CarBrandDto> loadCarBrands = (ArrayList<CarBrandDto>) carBrandsService.loadCarBrands();
        return loadCarBrands;
    }

    @RequestMapping(value = "/loadAdminModels", method = RequestMethod.POST)
    public
    @ResponseBody
    List<CarModelDataBean> getmodel(HttpServletRequest httpServletRequest) {
        String model = httpServletRequest.getParameter("carModel");
        System.out.println("model = " + model);
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


    @RequestMapping(value = "/saveVehicle",method = RequestMethod.POST)
    public void saveVehicle() {
        int new_brand_id = 0;
        int new_model_id = 0;

        String car_brand = httpServletRequest.getParameter("car_brand");
        System.out.println("car_brandhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh = " + car_brand);

        if (car_brand.equalsIgnoreCase("new_brand")) {
            String new_car_brand = httpServletRequest.getParameter("new_car_brand");
            CarBrandDto carBrandDto = new CarBrandDto();
            carBrandDto.setCarbrandname(new_car_brand);
            new_brand_id = carBrandsService.AddnewCarBrand(carBrandDto);
            System.out.println("iggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg = " + new_brand_id);
        }
        String car_model = httpServletRequest.getParameter("car_model");
        System.out.println("car_modelggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg = " + car_model);

        if (car_model.equalsIgnoreCase("new_model")) {
            String new_car_model = httpServletRequest.getParameter("new_car_model");
            CarModelDataBean carModelDataBean = new CarModelDataBean();
            System.out.println("new_brand_idhhjhjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj = " + new_brand_id);
            carModelDataBean.setId(new_brand_id);
            carModelDataBean.setName(new_car_model);
            new_model_id = carModelService.AddnewCarModel(carModelDataBean);
            System.out.println("imodellllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll = " + new_model_id);
        }


        String vehicleNo = httpServletRequest.getParameter("VehicleNo");
        System.out.println("vehicleNoaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa = " + vehicleNo);
        String gear_type = httpServletRequest.getParameter("gear_type");
        System.out.println("gear_typeaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa = " + gear_type);
        String fuel_type = httpServletRequest.getParameter("fuel_type");
        System.out.println("fuel_typeaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa = " + fuel_type);
        String doors = httpServletRequest.getParameter("doors");
        System.out.println("doorsaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa = " + doors);
        String luggege = httpServletRequest.getParameter("Luggege");
        System.out.println("luggegeaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa = " + luggege);
        String passenegers = httpServletRequest.getParameter("Passenegers");
        System.out.println("passenegersaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa = " + passenegers);
        String manufactureYear = httpServletRequest.getParameter("ManufactureYear");
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaamanufactureYear = " + manufactureYear);
        String airBags = httpServletRequest.getParameter("AirBags");
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaairBags = " + airBags);
        String acType = httpServletRequest.getParameter("AcType");
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaacType = " + acType);
        String engineCapacity = httpServletRequest.getParameter("EngineCapacity");
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaengineCapacity = " + engineCapacity);
        String wheelType = httpServletRequest.getParameter("WheelType");
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaawheelType = " + wheelType);
        String startType = httpServletRequest.getParameter("StartType");
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaastartType = " + startType);
        String Steering_Wheel_Type = httpServletRequest.getParameter("Steering_Wheel_Type");
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaSteering_Wheel_Type = " + Steering_Wheel_Type);
        String power_mirror = httpServletRequest.getParameter("Power_Mirror");
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaapower_mirror = " + power_mirror);
        String power_shutter = httpServletRequest.getParameter("Power_Shutter");
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaapower_shutter = " + power_shutter);
        String no_of_sheets = httpServletRequest.getParameter("No_of_Sheets");
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaano_of_sheets = " + no_of_sheets);


        String licence_date = httpServletRequest.getParameter("Licence_Date");
        System.out.println("licence_daterrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr = " + licence_date);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MMM-dd");
        SimpleDateFormat dateFormat1 = new SimpleDateFormat();
        Date date_licence_date = new Date();
        try {
            date_licence_date = dateFormat.parse(licence_date);
            System.out.println("date_licence_dateggggggggggggggggggggggggggggggggggggg = " + date_licence_date);
        } catch (ParseException e) {
            e.printStackTrace();
        }


        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaalicence_date = " + licence_date);
        String insurance_date = httpServletRequest.getParameter("Insurance_Date");
        Date date_insurance_date = new Date();
        try {
            date_insurance_date = dateFormat.parse(insurance_date);
            System.out.println("date_insurance_datehhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh = " + date_insurance_date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaainsurance_date = " + insurance_date);

        CarDto carDto = new CarDto();
        if (new_brand_id == 0 & new_model_id == 0) {

            carDto.setCar_brand_id(Integer.parseInt(car_brand));
            carDto.setCar_model_id(Integer.parseInt(car_brand));
        } else {
            carDto.setCar_brand_id(new_brand_id);
            carDto.setCar_model_id(new_model_id);
        }
        carDto.setAcType(acType);
        carDto.setAirBags(airBags);
        carDto.setFuel_type(fuel_type);
        carDto.setDoors(doors);
        carDto.setEngineCapacity(engineCapacity);
        carDto.setLuggege(luggege);
        carDto.setInsurance_date(date_insurance_date);
        carDto.setLicence_date(date_licence_date);
        carDto.setPassenegers(passenegers);
        carDto.setWheelType(wheelType);
        carDto.setGear_type(gear_type);
        carDto.setManufactureYear(manufactureYear);
        carDto.setVehicleNo(vehicleNo);
        carDto.setStartType(startType);
        carDto.setPower_shutter(power_shutter);
        carDto.setPower_mirror(power_mirror);
        carDto.setNo_of_sheets(no_of_sheets);
        carDto.setWheelType(wheelType);

        int i = carService.saveCar(carDto);


    }


}
