package com.inheritor.mycompany.quickcabsservice.serviceimpl;

import com.inheritor.mycompany.quickcabsservice.dao.CarDao;
import com.inheritor.mycompany.quickcabsservice.dto.CarDto;
import com.inheritor.mycompany.quickcabsservice.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Chathura on 10/4/2018.
 */
@Service
public class CarServiceImpl implements CarService {


    @Autowired
    CarDao carDao;

    @Override
    @Transactional
    public int saveCar(CarDto carDto) {
        return carDao.saveCar(carDto);
    }
}
