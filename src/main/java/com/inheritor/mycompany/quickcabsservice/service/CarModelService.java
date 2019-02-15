/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.inheritor.mycompany.quickcabsservice.service;

import com.inheritor.mycompany.quickcabsservice.dto.CarModelDataBean;
import com.inheritor.mycompany.quickcabsservice.dto.CarModelDto;

import java.util.List;

/**
 *
 * @author Chathura
 */
public interface CarModelService {
    
    public List<CarModelDataBean> getCarmodel(int carModel);

    int  AddnewCarModel(CarModelDataBean carModelDataBean);
    
}
