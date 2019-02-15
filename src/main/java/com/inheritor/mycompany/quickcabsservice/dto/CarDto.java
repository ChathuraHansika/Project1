package com.inheritor.mycompany.quickcabsservice.dto;

import java.util.Date;

/**
 * Created by Chathura on 10/4/2018.
 */
public class CarDto {

    private int car_brand_id;
    private int car_model_id;
    private String vehicleNo;
    private String gear_type;
    private String fuel_type;
    private String doors;
    private String luggege;
    private String passenegers;
    private String manufactureYear;
    private String airBags;
    private String acType;
    private String engineCapacity;
    private String wheelType;
    private String startType;
    private String Steering_Wheel_Type;
    private String power_mirror;
    private String power_shutter;
    private String no_of_sheets;
    private Date licence_date;
    private Date insurance_date;

    @Override
    public String toString() {
        return "CarDto{" +
                "car_brand_id=" + car_brand_id +
                ", car_model_id=" + car_model_id +
                ", vehicleNo='" + vehicleNo + '\'' +
                ", gear_type='" + gear_type + '\'' +
                ", fuel_type='" + fuel_type + '\'' +
                ", doors='" + doors + '\'' +
                ", luggege='" + luggege + '\'' +
                ", passenegers='" + passenegers + '\'' +
                ", manufactureYear='" + manufactureYear + '\'' +
                ", airBags='" + airBags + '\'' +
                ", acType='" + acType + '\'' +
                ", engineCapacity='" + engineCapacity + '\'' +
                ", wheelType='" + wheelType + '\'' +
                ", startType='" + startType + '\'' +
                ", Steering_Wheel_Type='" + Steering_Wheel_Type + '\'' +
                ", power_mirror='" + power_mirror + '\'' +
                ", power_shutter='" + power_shutter + '\'' +
                ", no_of_sheets='" + no_of_sheets + '\'' +
                ", licence_date=" + licence_date +
                ", insurance_date=" + insurance_date +
                '}';
    }

    public int getCar_brand_id() {
        return car_brand_id;
    }

    public void setCar_brand_id(int car_brand_id) {
        this.car_brand_id = car_brand_id;
    }

    public int getCar_model_id() {
        return car_model_id;
    }

    public void setCar_model_id(int car_model_id) {
        this.car_model_id = car_model_id;
    }

    public String getVehicleNo() {
        return vehicleNo;
    }

    public void setVehicleNo(String vehicleNo) {
        this.vehicleNo = vehicleNo;
    }

    public String getGear_type() {
        return gear_type;
    }

    public void setGear_type(String gear_type) {
        this.gear_type = gear_type;
    }

    public String getFuel_type() {
        return fuel_type;
    }

    public void setFuel_type(String fuel_type) {
        this.fuel_type = fuel_type;
    }

    public String getDoors() {
        return doors;
    }

    public void setDoors(String doors) {
        this.doors = doors;
    }

    public String getLuggege() {
        return luggege;
    }

    public void setLuggege(String luggege) {
        this.luggege = luggege;
    }

    public String getPassenegers() {
        return passenegers;
    }

    public void setPassenegers(String passenegers) {
        this.passenegers = passenegers;
    }

    public String getManufactureYear() {
        return manufactureYear;
    }

    public void setManufactureYear(String manufactureYear) {
        this.manufactureYear = manufactureYear;
    }

    public String getAirBags() {
        return airBags;
    }

    public void setAirBags(String airBags) {
        this.airBags = airBags;
    }

    public String getAcType() {
        return acType;
    }

    public void setAcType(String acType) {
        this.acType = acType;
    }

    public String getEngineCapacity() {
        return engineCapacity;
    }

    public void setEngineCapacity(String engineCapacity) {
        this.engineCapacity = engineCapacity;
    }

    public String getWheelType() {
        return wheelType;
    }

    public void setWheelType(String wheelType) {
        this.wheelType = wheelType;
    }

    public String getStartType() {
        return startType;
    }

    public void setStartType(String startType) {
        this.startType = startType;
    }

    public String getSteering_Wheel_Type() {
        return Steering_Wheel_Type;
    }

    public void setSteering_Wheel_Type(String steering_Wheel_Type) {
        Steering_Wheel_Type = steering_Wheel_Type;
    }

    public String getPower_mirror() {
        return power_mirror;
    }

    public void setPower_mirror(String power_mirror) {
        this.power_mirror = power_mirror;
    }

    public String getPower_shutter() {
        return power_shutter;
    }

    public void setPower_shutter(String power_shutter) {
        this.power_shutter = power_shutter;
    }

    public String getNo_of_sheets() {
        return no_of_sheets;
    }

    public void setNo_of_sheets(String no_of_sheets) {
        this.no_of_sheets = no_of_sheets;
    }

    public Date getLicence_date() {
        return licence_date;
    }

    public void setLicence_date(Date licence_date) {
        this.licence_date = licence_date;
    }

    public Date getInsurance_date() {
        return insurance_date;
    }

    public void setInsurance_date(Date insurance_date) {
        this.insurance_date = insurance_date;
    }
}
