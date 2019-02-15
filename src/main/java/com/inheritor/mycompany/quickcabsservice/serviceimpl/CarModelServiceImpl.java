/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.inheritor.mycompany.quickcabsservice.serviceimpl;

import com.inheritor.mycompany.quickcabsservice.dao.CarModelDao;
import com.inheritor.mycompany.quickcabsservice.dto.CarModelDataBean;
import com.inheritor.mycompany.quickcabsservice.dto.CarModelDto;
import com.inheritor.mycompany.quickcabsservice.service.CarModelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 *
 * @author Chathura
 */
@Service
public class CarModelServiceImpl implements CarModelService {

    @Autowired
    CarModelDao carModelDao;

    @Override
    public List<CarModelDataBean> getCarmodel(int carModel) {
        return carModelDao.getCarmodel(carModel);
    }

    @Override
    @Transactional
    public int AddnewCarModel(CarModelDataBean carModelDataBean) {
        return carModelDao.AddnewCarModel(carModelDataBean);
    }


}
