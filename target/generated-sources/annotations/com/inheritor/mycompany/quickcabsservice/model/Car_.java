package com.inheritor.mycompany.quickcabsservice.model;

import com.inheritor.mycompany.quickcabsservice.model.Carbrand;
import com.inheritor.mycompany.quickcabsservice.model.Carmodel;
import com.inheritor.mycompany.quickcabsservice.model.Orders;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-09-30T20:00:10")
@StaticMetamodel(Car.class)
public class Car_ { 

    public static volatile SingularAttribute<Car, String> steeringWheelType;
    public static volatile SingularAttribute<Car, String> aCType;
    public static volatile SingularAttribute<Car, String> passengers;
    public static volatile SingularAttribute<Car, Carmodel> modelId;
    public static volatile SingularAttribute<Car, String> imagePath;
    public static volatile SingularAttribute<Car, String> wheelType;
    public static volatile SingularAttribute<Car, String> powerShutter;
    public static volatile SingularAttribute<Car, String> startType;
    public static volatile SingularAttribute<Car, Date> updateTime;
    public static volatile SingularAttribute<Car, String> gearType;
    public static volatile SingularAttribute<Car, String> engineCapacity;
    public static volatile SingularAttribute<Car, Date> insuranceDate;
    public static volatile SingularAttribute<Car, String> doors;
    public static volatile SingularAttribute<Car, String> powerMirror;
    public static volatile SingularAttribute<Car, String> noOfSheets;
    public static volatile SingularAttribute<Car, String> fuelType;
    public static volatile SingularAttribute<Car, String> luggage;
    public static volatile SingularAttribute<Car, Integer> caid;
    public static volatile SingularAttribute<Car, Carbrand> brandId;
    public static volatile SingularAttribute<Car, String> vehicleNumber;
    public static volatile SingularAttribute<Car, String> airBags;
    public static volatile SingularAttribute<Car, String> manucfactureYear;
    public static volatile ListAttribute<Car, Orders> ordersList;
    public static volatile SingularAttribute<Car, Date> liceneDate;

}