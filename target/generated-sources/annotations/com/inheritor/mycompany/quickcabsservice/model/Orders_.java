package com.inheritor.mycompany.quickcabsservice.model;

import com.inheritor.mycompany.quickcabsservice.model.Car;
import com.inheritor.mycompany.quickcabsservice.model.Customer;
import com.inheritor.mycompany.quickcabsservice.model.Payment;
import com.inheritor.mycompany.quickcabsservice.model.Vehiclehandover;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-09-30T20:00:10")
@StaticMetamodel(Orders.class)
public class Orders_ { 

    public static volatile SingularAttribute<Orders, Date> pickupDateTime;
    public static volatile ListAttribute<Orders, Vehiclehandover> vehiclehandoverList;
    public static volatile SingularAttribute<Orders, Customer> cuid;
    public static volatile SingularAttribute<Orders, Car> caid;
    public static volatile SingularAttribute<Orders, Integer> oid;
    public static volatile SingularAttribute<Orders, Date> handOverDateTime;
    public static volatile SingularAttribute<Orders, Date> orderDate;
    public static volatile SingularAttribute<Orders, Date> upateDate;
    public static volatile SingularAttribute<Orders, String> status;
    public static volatile ListAttribute<Orders, Payment> paymentList;

}