package com.inheritor.mycompany.quickcabsservice.model;

import com.inheritor.mycompany.quickcabsservice.model.Orders;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-09-30T20:00:10")
@StaticMetamodel(Vehiclehandover.class)
public class Vehiclehandover_ { 

    public static volatile SingularAttribute<Vehiclehandover, Integer> hoid;
    public static volatile SingularAttribute<Vehiclehandover, Date> handOverDateTime;
    public static volatile SingularAttribute<Vehiclehandover, Orders> oid;

}