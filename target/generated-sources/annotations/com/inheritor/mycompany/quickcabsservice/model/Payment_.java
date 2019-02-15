package com.inheritor.mycompany.quickcabsservice.model;

import com.inheritor.mycompany.quickcabsservice.model.Orders;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-09-30T20:00:10")
@StaticMetamodel(Payment.class)
public class Payment_ { 

    public static volatile SingularAttribute<Payment, Double> paymentValue;
    public static volatile SingularAttribute<Payment, Double> paymentBalance;
    public static volatile SingularAttribute<Payment, Integer> pid;
    public static volatile SingularAttribute<Payment, Date> paymentDateTime;
    public static volatile SingularAttribute<Payment, Orders> oid;
    public static volatile SingularAttribute<Payment, Double> paymentAmount;

}