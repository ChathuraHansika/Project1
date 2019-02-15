/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.inheritor.mycompany.quickcabsservice.serviceimpl;

import com.inheritor.mycompany.quickcabsservice.dao.CarBrandsDao;
import com.inheritor.mycompany.quickcabsservice.dto.CarBrandDto;
import com.inheritor.mycompany.quickcabsservice.service.CarBrandsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 *
 * @author Chathura
 */
@Service
public class CarBrandsImpl implements CarBrandsService {

    @Autowired
    CarBrandsDao carBrandsDao;

    @Override
    @Transactional
    public List<CarBrandDto>  loadCarBrands() {
        return carBrandsDao.loadCarBrands();
    }

    @Override
    @Transactional
    public int AddnewCarBrand(CarBrandDto carBrandDto) {
        return carBrandsDao.AddnewCarBrand(carBrandDto);
    }


}
