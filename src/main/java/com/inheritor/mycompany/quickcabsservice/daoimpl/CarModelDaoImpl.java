/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.inheritor.mycompany.quickcabsservice.daoimpl;

import com.inheritor.mycompany.quickcabsservice.dao.CarModelDao;
import com.inheritor.mycompany.quickcabsservice.dto.CarModelDataBean;
import com.inheritor.mycompany.quickcabsservice.dto.CarModelDto;
import com.inheritor.mycompany.quickcabsservice.model.Carbrand;
import com.inheritor.mycompany.quickcabsservice.model.Carmodel;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Chathura
 */
@Repository
public class CarModelDaoImpl implements CarModelDao {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<CarModelDataBean> getCarmodel(int carModel) {
        List<CarModelDataBean> data_list = new ArrayList<>();
        System.out.println("carModel = " + carModel);
        Session session = sessionFactory.getCurrentSession();

        Carbrand carbrand = (Carbrand) session.createCriteria(Carbrand.class, "brand")
                .createAlias("brand.carmodelList", "carmodelList")
                .add(Restrictions.eq("brand.brandId", carModel))
                .uniqueResult();

        if (carbrand != null) {
            List<Carmodel> carmodelList = carbrand.getCarmodelList();
            CarModelDataBean bean = null;
            for (Carmodel carmodel : carmodelList) {
                bean = new CarModelDataBean();
                bean.setId(carmodel.getModelId());
                bean.setName(carmodel.getModel());
                data_list.add(bean);
            }


        }
        return data_list;
    }

    @Override
    public int AddnewCarModel(CarModelDataBean carModelDataBean) {
        Carmodel carmodel = new Carmodel();
        Session currentSession = sessionFactory.getCurrentSession();
        System.out.println("carModelDataBeankkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk = " + carModelDataBean.getId());
        Carbrand carbrand = (Carbrand) currentSession.createCriteria(Carbrand.class)
                .add(Restrictions.eq("brandId", carModelDataBean.getId())).uniqueResult();
        carmodel.setBrandId(carbrand);
        carmodel.setModel(carModelDataBean.getName());
        int i = Integer.parseInt(String.valueOf(currentSession.save(carmodel)));
        return i;
    }

}
