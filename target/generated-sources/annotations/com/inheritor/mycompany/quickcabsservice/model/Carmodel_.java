package com.inheritor.mycompany.quickcabsservice.model;

import com.inheritor.mycompany.quickcabsservice.model.Car;
import com.inheritor.mycompany.quickcabsservice.model.Carbrand;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-09-30T20:00:10")
@StaticMetamodel(Carmodel.class)
public class Carmodel_ { 

    public static volatile SingularAttribute<Carmodel, Integer> modelId;
    public static volatile SingularAttribute<Carmodel, Carbrand> brandId;
    public static volatile SingularAttribute<Carmodel, String> model;
    public static volatile ListAttribute<Carmodel, Car> carList;
    public static volatile SingularAttribute<Carmodel, Date> updatedDateTime;

}