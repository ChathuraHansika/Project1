package com.inheritor.mycompany.quickcabsservice.daoimpl;

import com.inheritor.mycompany.quickcabsservice.dao.AdminHomeDao;
import com.inheritor.mycompany.quickcabsservice.dto.AdminDataDto;
import com.inheritor.mycompany.quickcabsservice.model.Car;
import com.inheritor.mycompany.quickcabsservice.model.Customer;
import com.inheritor.mycompany.quickcabsservice.model.Orders;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Chathura on 9/12/2018.
 */
@Repository
public class AdminHomeDaoImpl implements AdminHomeDao {

    @Autowired
    SessionFactory sessionFactory;

    @Transactional
    @Override
    public AdminDataDto loadAdminData() {
        System.out.println("dao impl run");

        AdminDataDto adminDataDto=new AdminDataDto();
        //int i = ((Long) sessionFactory.getCurrentSession().createSQLQuery("SELECT COUNT (*) from Car").uniqueResult()).intValue();
        Long carcount = (Long) sessionFactory.getCurrentSession().createCriteria(Car.class)
                .setProjection(Projections.rowCount())
                .uniqueResult();

        System.out.println("carcount = " + carcount);

        adminDataDto.setVehicle(carcount);

        Long ordercount = (Long) sessionFactory.getCurrentSession().createCriteria(Orders.class)
                .setProjection(Projections.rowCount())
                .uniqueResult();
        System.out.println("ordercount = " + ordercount);

        adminDataDto.setOrders(ordercount);

        Long customercount = (Long) sessionFactory.getCurrentSession().createCriteria(Customer.class)
                .setProjection(Projections.rowCount())
                .uniqueResult();

        System.out.println("customercount = " + customercount);

        adminDataDto.setCustomers(customercount);

        return adminDataDto;
    }


}
