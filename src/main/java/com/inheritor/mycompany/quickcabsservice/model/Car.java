/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.inheritor.mycompany.quickcabsservice.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Chathura
 */
@Entity
@Table(name = "car")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Car.findAll", query = "SELECT c FROM Car c")
    , @NamedQuery(name = "Car.findByCaid", query = "SELECT c FROM Car c WHERE c.caid = :caid")
    , @NamedQuery(name = "Car.findByVehicleNumber", query = "SELECT c FROM Car c WHERE c.vehicleNumber = :vehicleNumber")
    , @NamedQuery(name = "Car.findByGearType", query = "SELECT c FROM Car c WHERE c.gearType = :gearType")
    , @NamedQuery(name = "Car.findByFuelType", query = "SELECT c FROM Car c WHERE c.fuelType = :fuelType")
    , @NamedQuery(name = "Car.findByDoors", query = "SELECT c FROM Car c WHERE c.doors = :doors")
    , @NamedQuery(name = "Car.findByLuggage", query = "SELECT c FROM Car c WHERE c.luggage = :luggage")
    , @NamedQuery(name = "Car.findByPassengers", query = "SELECT c FROM Car c WHERE c.passengers = :passengers")
    , @NamedQuery(name = "Car.findByManucfactureYear", query = "SELECT c FROM Car c WHERE c.manucfactureYear = :manucfactureYear")
    , @NamedQuery(name = "Car.findByAirBags", query = "SELECT c FROM Car c WHERE c.airBags = :airBags")
    , @NamedQuery(name = "Car.findByACType", query = "SELECT c FROM Car c WHERE c.aCType = :aCType")
    , @NamedQuery(name = "Car.findByEngineCapacity", query = "SELECT c FROM Car c WHERE c.engineCapacity = :engineCapacity")
    , @NamedQuery(name = "Car.findByWheelType", query = "SELECT c FROM Car c WHERE c.wheelType = :wheelType")
    , @NamedQuery(name = "Car.findByStartType", query = "SELECT c FROM Car c WHERE c.startType = :startType")
    , @NamedQuery(name = "Car.findBySteeringWheelType", query = "SELECT c FROM Car c WHERE c.steeringWheelType = :steeringWheelType")
    , @NamedQuery(name = "Car.findByPowerMirror", query = "SELECT c FROM Car c WHERE c.powerMirror = :powerMirror")
    , @NamedQuery(name = "Car.findByPowerShutter", query = "SELECT c FROM Car c WHERE c.powerShutter = :powerShutter")
    , @NamedQuery(name = "Car.findByNoOfSheets", query = "SELECT c FROM Car c WHERE c.noOfSheets = :noOfSheets")
    , @NamedQuery(name = "Car.findByLiceneDate", query = "SELECT c FROM Car c WHERE c.liceneDate = :liceneDate")
    , @NamedQuery(name = "Car.findByInsuranceDate", query = "SELECT c FROM Car c WHERE c.insuranceDate = :insuranceDate")
    , @NamedQuery(name = "Car.findByImagePath", query = "SELECT c FROM Car c WHERE c.imagePath = :imagePath")
    , @NamedQuery(name = "Car.findByUpdateTime", query = "SELECT c FROM Car c WHERE c.updateTime = :updateTime")})
public class Car implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "CAID")
    private Integer caid;
    @Size(max = 100)
    @Column(name = "Vehicle_Number")
    private String vehicleNumber;
    @Size(max = 100)
    @Column(name = "Gear_Type")
    private String gearType;
    @Size(max = 100)
    @Column(name = "Fuel_Type")
    private String fuelType;
    @Size(max = 100)
    @Column(name = "Doors")
    private String doors;
    @Size(max = 100)
    @Column(name = "Luggage")
    private String luggage;
    @Size(max = 100)
    @Column(name = "Passengers")
    private String passengers;
    @Size(max = 100)
    @Column(name = "Manucfacture_Year")
    private String manucfactureYear;
    @Size(max = 100)
    @Column(name = "Air_Bags")
    private String airBags;
    @Size(max = 100)
    @Column(name = "AC_Type")
    private String aCType;
    @Size(max = 100)
    @Column(name = "Engine_Capacity")
    private String engineCapacity;
    @Size(max = 100)
    @Column(name = "Wheel_Type")
    private String wheelType;
    @Size(max = 100)
    @Column(name = "Start_Type")
    private String startType;
    @Size(max = 100)
    @Column(name = "Steering_Wheel_Type")
    private String steeringWheelType;
    @Size(max = 100)
    @Column(name = "Power_Mirror")
    private String powerMirror;
    @Size(max = 100)
    @Column(name = "Power_Shutter")
    private String powerShutter;
    @Size(max = 100)
    @Column(name = "No_Of_Sheets")
    private String noOfSheets;
    @Column(name = "Licene_Date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date liceneDate;
    @Column(name = "Insurance_Date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date insuranceDate;
    @Size(max = 200)
    @Column(name = "Image_Path")
    private String imagePath;
    @Column(name = "Update_Time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateTime;
    @JoinColumn(name = "BrandId", referencedColumnName = "BrandId")
    @ManyToOne
    private Carbrand brandId;
    @JoinColumn(name = "ModelId", referencedColumnName = "ModelId")
    @ManyToOne
    private Carmodel modelId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "caid")
    private List<Orders> ordersList;

    public Car() {
    }

    public Car(Integer caid) {
        this.caid = caid;
    }

    public Integer getCaid() {
        return caid;
    }

    public void setCaid(Integer caid) {
        this.caid = caid;
    }

    public String getVehicleNumber() {
        return vehicleNumber;
    }

    public void setVehicleNumber(String vehicleNumber) {
        this.vehicleNumber = vehicleNumber;
    }

    public String getGearType() {
        return gearType;
    }

    public void setGearType(String gearType) {
        this.gearType = gearType;
    }

    public String getFuelType() {
        return fuelType;
    }

    public void setFuelType(String fuelType) {
        this.fuelType = fuelType;
    }

    public String getDoors() {
        return doors;
    }

    public void setDoors(String doors) {
        this.doors = doors;
    }

    public String getLuggage() {
        return luggage;
    }

    public void setLuggage(String luggage) {
        this.luggage = luggage;
    }

    public String getPassengers() {
        return passengers;
    }

    public void setPassengers(String passengers) {
        this.passengers = passengers;
    }

    public String getManucfactureYear() {
        return manucfactureYear;
    }

    public void setManucfactureYear(String manucfactureYear) {
        this.manucfactureYear = manucfactureYear;
    }

    public String getAirBags() {
        return airBags;
    }

    public void setAirBags(String airBags) {
        this.airBags = airBags;
    }

    public String getACType() {
        return aCType;
    }

    public void setACType(String aCType) {
        this.aCType = aCType;
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

    public String getSteeringWheelType() {
        return steeringWheelType;
    }

    public void setSteeringWheelType(String steeringWheelType) {
        this.steeringWheelType = steeringWheelType;
    }

    public String getPowerMirror() {
        return powerMirror;
    }

    public void setPowerMirror(String powerMirror) {
        this.powerMirror = powerMirror;
    }

    public String getPowerShutter() {
        return powerShutter;
    }

    public void setPowerShutter(String powerShutter) {
        this.powerShutter = powerShutter;
    }

    public String getNoOfSheets() {
        return noOfSheets;
    }

    public void setNoOfSheets(String noOfSheets) {
        this.noOfSheets = noOfSheets;
    }

    public Date getLiceneDate() {
        return liceneDate;
    }

    public void setLiceneDate(Date liceneDate) {
        this.liceneDate = liceneDate;
    }

    public Date getInsuranceDate() {
        return insuranceDate;
    }

    public void setInsuranceDate(Date insuranceDate) {
        this.insuranceDate = insuranceDate;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Carbrand getBrandId() {
        return brandId;
    }

    public void setBrandId(Carbrand brandId) {
        this.brandId = brandId;
    }

    public Carmodel getModelId() {
        return modelId;
    }

    public void setModelId(Carmodel modelId) {
        this.modelId = modelId;
    }

    @XmlTransient
    public List<Orders> getOrdersList() {
        return ordersList;
    }

    public void setOrdersList(List<Orders> ordersList) {
        this.ordersList = ordersList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (caid != null ? caid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Car)) {
            return false;
        }
        Car other = (Car) object;
        if ((this.caid == null && other.caid != null) || (this.caid != null && !this.caid.equals(other.caid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.inheritor.mycompany.quickcabsservice.model.Car[ caid=" + caid + " ]";
    }
    
}
