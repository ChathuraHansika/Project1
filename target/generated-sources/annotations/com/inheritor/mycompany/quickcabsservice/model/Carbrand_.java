package com.inheritor.mycompany.quickcabsservice.model;

import com.inheritor.mycompany.quickcabsservice.model.Car;
import com.inheritor.mycompany.quickcabsservice.model.Carmodel;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-09-30T20:00:10")
@StaticMetamodel(Carbrand.class)
public class Carbrand_ { 

    public static volatile ListAttribute<Carbrand, Carmodel> carmodelList;
    public static volatile SingularAttribute<Carbrand, Integer> brandId;
    public static volatile ListAttribute<Carbrand, Car> carList;
    public static volatile SingularAttribute<Carbrand, String> brand;
    public static volatile SingularAttribute<Carbrand, Date> updatedDateTime;

}