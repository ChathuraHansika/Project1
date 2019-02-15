package com.inheritor.mycompany.quickcabsservice.dao;

import com.inheritor.mycompany.quickcabsservice.dto.CarDto;

/**
 * Created by Chathura on 10/4/2018.
 */
public interface CarDao {
    int saveCar(CarDto carDto);
}
