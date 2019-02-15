/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.inheritor.mycompany.quickcabsservice.dto;

import com.inheritor.mycompany.quickcabsservice.model.Carmodel;

import java.util.List;

/**
 *
 * @author Chathura
 */
public class CarModelDto {
    
    private List<Carmodel>  carbrands;

    /**
     * @return the carbrands
     */
    public List<Carmodel> getCarbrands() {
        return carbrands;
    }

    /**
     * @param carbrands the carbrands to set
     */
    public void setCarbrands(List<Carmodel> carbrands) {
        this.carbrands = carbrands;
    }
    
    
    
}
