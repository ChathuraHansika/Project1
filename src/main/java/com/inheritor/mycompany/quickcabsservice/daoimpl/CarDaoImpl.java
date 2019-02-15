package com.inheritor.mycompany.quickcabsservice.daoimpl;

import com.inheritor.mycompany.quickcabsservice.dao.CarDao;
import com.inheritor.mycompany.quickcabsservice.dto.CarDto;

import com.inheritor.mycompany.quickcabsservice.model.Car;
import com.inheritor.mycompany.quickcabsservice.model.Carbrand;
import com.inheritor.mycompany.quickcabsservice.model.Carmodel;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by Chathura on 10/4/2018.
 */
@Repository
public class CarDaoImpl implements CarDao {


    @Autowired
    SessionFactory sessionFactory;
    @Override
    public int saveCar(CarDto carDto) {
        Session session = sessionFactory.getCurrentSession();
        Car car=new Car();
        Carbrand carbrand= (Carbrand) session.createCriteria(Carbrand.class).add(Restrictions
                .eq("brandId",carDto.getCar_brand_id())).uniqueResult();
        car.setBrandId(carbrand);

        Carmodel carmodel= (Carmodel) session.createCriteria(Carmodel.class)
                .add(Restrictions.eq("modelId",carDto.getCar_model_id())).uniqueResult();
        car.setModelId(carmodel);

        car.setWheelType(carDto.getWheelType());
        car.setEngineCapacity(carDto.getEngineCapacity());
        car.setAirBags(carDto.getAirBags());
        car.setACType(carDto.getAcType());
        car.setDoors(carDto.getDoors());
        car.setFuelType(carDto.getFuel_type());
        car.setGearType(carDto.getGear_type());
        car.setInsuranceDate(carDto.getInsurance_date());
        car.setLiceneDate(carDto.getLicence_date());
        car.setLuggage(carDto.getLuggege());
        car.setManucfactureYear(carDto.getManufactureYear());
        car.setNoOfSheets(carDto.getNo_of_sheets());
        car.setPowerMirror(carDto.getPower_mirror());
        car.setPowerShutter(carDto.getPower_shutter());
        car.setWheelType(carDto.getWheelType());
        car.setVehicleNumber(carDto.getVehicleNo());
        car.setStartType(carDto.getStartType());
        car.setPassengers(carDto.getPassenegers());
        car.setSteeringWheelType(carDto.getSteering_Wheel_Type());

        session.save(car);

        return 0;
    }
}
