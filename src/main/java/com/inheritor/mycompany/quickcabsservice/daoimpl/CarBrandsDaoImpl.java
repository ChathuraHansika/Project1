/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.inheritor.mycompany.quickcabsservice.daoimpl;

import com.inheritor.mycompany.quickcabsservice.dao.CarBrandsDao;
import com.inheritor.mycompany.quickcabsservice.dto.CarBrandDto;
import com.inheritor.mycompany.quickcabsservice.model.Carbrand;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Chathura
 */
@Repository
public class CarBrandsDaoImpl implements CarBrandsDao {

    @Autowired
    SessionFactory sessionFactory;


    @Override


    public List<CarBrandDto> loadCarBrands() {
        System.out.println("\"load car brand run\" = " + "load car brand run");
        List<CarBrandDto> brandDtos = new ArrayList<>();
        CarBrandDto brandDtos1 = null;
        List<Carbrand> list = (List<Carbrand>) sessionFactory.getCurrentSession().createCriteria(Carbrand.class).list();
        if (list != null) {
            for (Carbrand b : list) {
                brandDtos1 = new CarBrandDto();
                brandDtos1.setId(b.getBrandId());
                System.out.println("brandDtos1.getId() = " + brandDtos1.getId());
                brandDtos1.setCarbrandname(b.getBrand());
                System.out.println("brandDtos1 = " + brandDtos1.getCarbrandname());

                brandDtos.add(brandDtos1);
            }

        }


        return brandDtos;
    }

    @Override
    public int AddnewCarBrand(CarBrandDto carBrandDto) {
        Carbrand carbrand = new Carbrand();
        carbrand.setBrand(carBrandDto.getCarbrandname());
        Serializable save = sessionFactory.getCurrentSession().save(carbrand);
        int s = Integer.parseInt(String.valueOf(save));
        return s;
    }


}
