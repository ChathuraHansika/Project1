/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.inheritor.mycompany.quickcabsservice.daoimpl;

import com.inheritor.mycompany.quickcabsservice.dao.OrderDao;
import com.inheritor.mycompany.quickcabsservice.dto.CheckDatesNotVehicleDto;
import com.inheritor.mycompany.quickcabsservice.dto.CustomerDto;
import com.inheritor.mycompany.quickcabsservice.dto.OrdersDto;
import com.inheritor.mycompany.quickcabsservice.model.Car;
import com.inheritor.mycompany.quickcabsservice.model.Carmodel;
import com.inheritor.mycompany.quickcabsservice.model.Customer;
import com.inheritor.mycompany.quickcabsservice.model.Orders;
import org.eclipse.persistence.exceptions.DescriptorException;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;


/**
 * @author Chathura
 */
@Repository
public class OrderDaoImpl implements OrderDao {

    @Autowired
    SessionFactory sessionFactory;


    @Override
    @Transactional
    public String addOrder(OrdersDto ordersDto, CustomerDto customerdto) {

        Orders orders = new Orders();
        Customer existing_customer = (Customer) sessionFactory.getCurrentSession().createCriteria(Customer.class)
                .add(Restrictions.eq("email", customerdto.getEmail())).uniqueResult();

        if (existing_customer == null) {
            Customer new_customer = new Customer();
            new_customer.setTitle(customerdto.getTitle());
            new_customer.setName(customerdto.getName());
            new_customer.setEmail(customerdto.getEmail());
            new_customer.setPhoneNumber(customerdto.getPhoneNumber());
            sessionFactory.getCurrentSession().save(new_customer);
            orders.setCuid(new_customer);


        } else {
            orders.setCuid(existing_customer);
        }
        orders.setHandOverDateTime(ordersDto.getHandOverDate());
        orders.setPickupDateTime(ordersDto.getPickupDate());
        Carmodel carmodel = (Carmodel) sessionFactory.getCurrentSession().createCriteria(Carmodel.class, "carmodel")
                .add(Restrictions.eq("carmodel.modelId", Integer.parseInt(ordersDto.getCarmodel()))).uniqueResult();
        //Tempory fix
        Car car = (Car) sessionFactory.getCurrentSession().createCriteria(Car.class, "car")
                .add(Restrictions.eq("car.modelId", carmodel)).uniqueResult();
        //Error not fix
        orders.setCaid(car);
        orders.setStatus("online");
        orders.setUpateDate(new Date());
        orders.setOrderDate(new Date());
        Serializable save = sessionFactory.getCurrentSession().save(orders);
        String order_number = String.valueOf(save);
        return order_number;
    }

    @Override
    @Transactional
    public CustomerDto findUser(String Email) {
        CustomerDto customerDto = new CustomerDto();
        Customer customer = (Customer) sessionFactory.getCurrentSession().createCriteria(Customer.class)
                .add(Restrictions.eq("email", Email)).uniqueResult();
        customerDto.setName(customer.getName());
        customerDto.setPhoneNumber(customer.getPhoneNumber());
        return customerDto;


    }

    @Override
    @Transactional
    public void checkVehicleNotDate(CheckDatesNotVehicleDto checkDatesNotVehicleDto) {
        Iterator order = sessionFactory.getCurrentSession().createCriteria(Orders.class, "order")
                .add(Restrictions.not(Restrictions.le("order.pickupDateTime", checkDatesNotVehicleDto.getBookingDate())))
                .add(Restrictions.not(Restrictions.ge("order.handOverDateTime", checkDatesNotVehicleDto.getHandOverDate())))
                .list()
                .iterator();
        while (order.hasNext()) {
            Orders orders = (Orders) order.next();
            System.out.println("order ============ >  " + orders);
        }
    }

    @Transactional
    public String checkDate() {


        // sessionFactory.getCurrentSession().createCriteria(Orders.class).add(Restrictions.eq("PickupDateTime",2014-01-01 12:00:00));
        return "";

    }


}
