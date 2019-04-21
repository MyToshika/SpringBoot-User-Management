/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.abeer.digiteach.service;

import com.abeer.digiteach.dao.UserDao;
import com.abeer.digiteach.model.UserModel;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Abeer
 */
@Service("userService")
public class UserServiceImp implements UserService {

    @Autowired
    private UserDao userDao;

    @Transactional
    @Override
    public void addUser(UserModel userModel) {
        userDao.addUser(userModel);
    }

    @Override
    @Transactional
    public UserModel getUser(String uid) {
        return userDao.getUser(uid); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    @Transactional
    public List<UserModel> getUserList() {
        return userDao.getUserList();
    }

    @Override
    @Transactional
    public UserModel getlogin(String username, String password) {
        return userDao.getlogin(username, password);

    }

    @Override
    @Transactional
    public void updateUser(UserModel userModel) {
        userDao.updateUser(userModel);
    }

    @Override
    @Transactional
    public UserModel getId(int id) {
        return userDao.getId(id);
    }

    @Override
    @Transactional
    public void editImage(UserModel userModel) {
        userDao.editImage(userModel);
    }

    @Override
    @Transactional
    public List<UserModel> getListOffemaleStudent() {
        return userDao.getListOffemaleStudent();
    }

    @Override
    @Transactional
    public List<UserModel> getListOfMaleStudent() {
        return userDao.getListOfMaleStudent();
    }
}
