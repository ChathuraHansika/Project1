/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.inheritor.mycompany.quickcabsservice.dao;

import com.inheritor.mycompany.quickcabsservice.dto.CarBrandDto;

import java.util.List;

/**
 *
 * @author Chathura
 */
public interface CarBrandsDao {

    public List<CarBrandDto>  loadCarBrands();

    int  AddnewCarBrand(CarBrandDto carBrandDto);
}
