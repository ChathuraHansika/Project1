package com.inheritor.mycompany.quickcabsservice.daoimpl;

import com.inheritor.mycompany.quickcabsservice.dao.CountDao;
import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Chathura on 9/15/2018.
 */
@Repository
public class CountDaoImpl implements CountDao {
    @Autowired
    SessionFactory sessionFactory;

    @Override
    @Transactional
    public int getCountOrders() {
        int i = ((Long) sessionFactory.getCurrentSession().createSQLQuery("SELECT COUNT (*) from Car").uniqueResult()).intValue();
        return i;
    }

    @Override
    public int getCountCustomers() {
        return 0;
    }

    @Override
    public int getCountVehicle() {
        return 0;
    }
}
