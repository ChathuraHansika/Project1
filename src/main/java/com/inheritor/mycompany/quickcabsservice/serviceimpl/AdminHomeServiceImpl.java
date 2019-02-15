package com.inheritor.mycompany.quickcabsservice.serviceimpl;

import com.inheritor.mycompany.quickcabsservice.dao.AdminHomeDao;
import com.inheritor.mycompany.quickcabsservice.dto.AdminDataDto;
import com.inheritor.mycompany.quickcabsservice.service.AdminHomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Chathura on 9/12/2018.
 */
@Service
public class AdminHomeServiceImpl implements AdminHomeService {

    @Autowired
    AdminHomeDao adminHomeDao;


    public AdminDataDto loadAdminData(){
        return adminHomeDao.loadAdminData();
    }

}
