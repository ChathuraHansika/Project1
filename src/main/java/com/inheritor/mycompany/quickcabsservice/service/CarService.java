package com.inheritor.mycompany.quickcabsservice.service;

import com.inheritor.mycompany.quickcabsservice.dto.CarDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Chathura on 10/4/2018.
 */


public interface CarService {
    int saveCar(CarDto carDto);
}
